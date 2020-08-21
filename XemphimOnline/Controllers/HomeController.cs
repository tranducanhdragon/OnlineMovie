using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using XemphimOnline.Model;

namespace XemphimOnline.Controllers
{
    public class HomeController : Controller
    {
        ModelOneMovie db = new ModelOneMovie();
        public ActionResult TrangChu()
        {
            return View();
        }
        public PartialViewResult DrTheLoai()
        {           
            List<TheLoai> tl = db.TheLoais.ToList();
            return PartialView(tl);
        }
        public PartialViewResult DrQuocGia()
        {
            List<QuocGia> qg = db.QuocGias.ToList();
            return PartialView(qg);
        }
    }
}