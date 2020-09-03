using System;
using System.Collections.Generic;
using System.Linq;
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
        public ActionResult TaoBoPhim(String TenBP, int PhimBo, string TenDD, string MaQG, string MaTL, string MaNXB)
        {
            //Lấy parent là shared folder
            var parent = new List<string> { "0AAPLCg2Lzbh2Uk9PVA"};
            string BoPhimId = null;
            GoogleDriveFileRepository.CreateFolder(TenBP, ref BoPhimId, parent);
            ViewBag.BPid = BoPhimId;
            //Lưu xuống csdl
            new BoPhimDAO().ThemBoPhim(TenBP, PhimBo, TenDD, MaQG, MaTL, MaNXB);
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
            var parent = new List<string> { BoPhimId.Id };
            string PhanPhimId = null;
            GoogleDriveFileRepository.CreateFolder(TenPhanPhim, ref PhanPhimId, parent);
            ViewBag.BPid = PhanPhimId;
            return View("TaoPhanPhim");
        }
        [HttpPost]
        public ActionResult TaiLenPhim(GoogleDriveFiles BoPhimId, HttpPostedFileBase[] files)
        {
            GoogleDriveFileRepository.FileUploadInFolder(BoPhimId.Id, files);
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