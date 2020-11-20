using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using XemphimOnline.Model;
using XemphimOnline.DAO;
using System.Net.Http;
using System.Net.Http.Headers;

namespace XemphimOnline.Controllers
{
    public class HomeController : Controller
    {
        ModelOneMovie db = new ModelOneMovie();
        public ActionResult TrangChu()
        {
            List<PhanPhim> phim = new PhanPhimDAO().GetListPhanPhim();
            return View(phim);
        }
        public PartialViewResult DrTheLoai()
        {
            //Lấy từ api phương thức Get
            HttpClient client = new HttpClient();
            client.BaseAddress = new Uri("http://localhost:52181/");
            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            HttpResponseMessage response = client.GetAsync("api/TheLoais").Result;
            if (response.IsSuccessStatusCode)
            {
                var tl = response.Content.ReadAsAsync<IEnumerable<TheLoai>>().Result;
                return PartialView(tl);
            }
            else
            {
                return PartialView();
            }
            //List<TheLoai> tl = db.TheLoais.ToList();

        }
        public PartialViewResult DrQuocGia()
        {
            List<QuocGia> qg = db.QuocGias.ToList();
            return PartialView(qg);
        }
    }
}