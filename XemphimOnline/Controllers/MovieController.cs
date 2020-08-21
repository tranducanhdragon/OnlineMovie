using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace XemphimOnline.Controllers
{
    public class MovieController : Controller
    {
        // GET: Movie
    
        public ActionResult ChiTietPhim()
        {
            return View();
        }
    }
}