using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Runtime.CompilerServices;
using System.Web;
using System.Web.Mvc;
using XemphimOnline.Areas.Admin.Model;
using XemphimOnline.DAO;
using XemphimOnline.Model;

namespace XemphimOnline.Areas.Admin.Controllers
{
    public class AdminHomeController : Controller
    {
        // GET: Admin/AdminHome
        public ActionResult AdminTrangChu()
        {
            return View();
        }
        [HttpGet]
        public ActionResult TaoBoPhim()
        {
            return View();
        }
        [HttpPost]
        public ActionResult TaoBoPhim(String TenBP, int MaPB, string TenDD, string MaQG, string MaTL, string MaNSX)
        {
            //Lấy parent là shared folder
            var parent = "0AAPLCg2Lzbh2Uk9PVA";
            int maBP=0;
            string BoPhimId = null;
            GoogleDriveFileRepository.CreateFolder(TenBP, ref BoPhimId, parent);           
            ViewBag.BPid = BoPhimId;
            //Lưu xuống csdl
            new BoPhimDAO().ThemBoPhim(TenBP, MaPB, TenDD, MaQG, MaTL, MaNSX,ref maBP);
            ViewBag.maBP = maBP;
            return View("TaoPhanPhim");
        }
        [HttpGet]
        public ActionResult TaoPhanPhim()
        {
            return View();
        }
        [HttpPost]
        public ActionResult TaoPhanPhim(GoogleDriveFiles BoPhimId, String TenPhanPhim)
        {
            string PhanPhimId = null;
            GoogleDriveFileRepository.CreateFolder(TenPhanPhim, ref PhanPhimId, BoPhimId.Id);
            ViewBag.BPid = PhanPhimId;
            return View("TaoPhanPhim");
        }
        [HttpPost]
        public ActionResult TaiLenPhim(GoogleDriveFiles BoPhimId, HttpPostedFileBase[] files,string TP,string TLg,int Tap,DateTime NamXB,HttpPostedFileBase LkA,int PV,int maBP)
        {
            string videoID = null;
            //Lưu vào Drive
            GoogleDriveFileRepository.FileUploadInFolder(BoPhimId.Id, files,ref videoID);
            //Lưu vào csdl
            string _LkAName = null;
            if (LkA.ContentLength > 0)
            {
                _LkAName = Path.GetFileName(LkA.FileName);
                string _pathLkA = Path.Combine(Server.MapPath("~/LkA_File"), _LkAName);
                LkA.SaveAs(_pathLkA);
            }
            new PhanPhimDAO().ThemPhanPhim(videoID,TP,TLg,Tap,NamXB,_LkAName,PV,maBP);
            return View("TaoPhanPhim");
        }
        public JsonResult ListTenBP(string bp)
        {
            var dt = new BoPhimDAO().ListTenBoPhim(bp);
            return Json(new
            {
                data = dt,
                status = true
            }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult ListMaPB(string mpb)
        {
            var db = new ModelOneMovie();
            var dt = db.BoPhims.Where(x=>x.PhimBo.ToString().Contains(mpb)).Select(x=>new { x.PhimBo,x.TenBP}).ToList();
            return Json(new
            {
                data = dt,
                status = true
            }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult ListTenDD(string dd)
        {
            var db = new ModelOneMovie();
            var dt = db.DaoDiens.Where(x => x.TenDD.Contains(dd)).Select(x => x.TenDD).ToList();
            return Json(new
            {
                data = dt,
                status = true
            }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult ListMaQG(string mqg)
        {
            //Lấy mã qg sau dấu phẩy cuối cùng
            string[] token = mqg.Split(',');
            string last = token[token.Length - 1];
            var db = new ModelOneMovie();
            var dt = db.QuocGias.Where(x => x.MaQG.ToString().Contains(last)).Select(x => new { x.MaQG, x.TenQG}).ToList();
            return Json(new
            {
                data = dt,
                status = true
            }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult ListMaTL(string mtl)
        {
            string[] token = mtl.Split(',');
            string last = token[token.Length - 1];
            var db = new ModelOneMovie();
            var dt = db.TheLoais.Where(x => x.MaTL.ToString().Contains(last)).Select(x => new { x.MaTL, x.TenTL}).ToList();
            return Json(new
            {
                data = dt,
                status = true
            }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult ListMaNSX(string mnsx)
        {
            string[] token = mnsx.Split(',');
            string last = token[token.Length - 1];
            var db = new ModelOneMovie();
            var dt = db.NSXes.Where(x => x.MaNSX.ToString().Contains(last)).Select(x => new { x.MaNSX, x.TenNSX}).ToList();
            return Json(new
            {
                data = dt,
                status = true
            }, JsonRequestBehavior.AllowGet);
        }
    }
}