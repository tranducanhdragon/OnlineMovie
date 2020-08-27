using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using XemphimOnline.Areas.Admin.Model;
using XemphimOnline.DAO;

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
    }
}