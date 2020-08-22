using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using XemphimOnline.DAO;
using XemphimOnline.Model;

namespace XemphimOnline.Controllers
{
    public class MovieController : Controller
    {
        // GET: Movie
    
        public ActionResult ChiTietPhim(string id)
        {
            PhanPhim p = new PhanPhimDAO().GetPhanPhim(id);
            return View(p);
        }
    }
}