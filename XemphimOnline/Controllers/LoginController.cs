using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;
using Newtonsoft.Json;
using XemphimOnline.DAO;

namespace XemphimOnline.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public JsonResult Index(string Username,string Password)
        {
            string pw = MD5Hash(Password);
            if(new TaiKhoanDAO().CheckLogin(Username, Password))
            {
                string result = "true";
                return Json(result, JsonRequestBehavior.AllowGet);
            }
            else
            {
                string result = "fail";
                return Json(result, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpPost]
        public JsonResult Register(string Username, string Password)
        {
            return Json(JsonRequestBehavior.AllowGet);
        }

        public ActionResult Viewlogin()
        {
            return PartialView("_ViewPartiallogin");
        }

        public ActionResult Viewregister()
        {
            return PartialView("_ViewPartialRegister");
        }
        public string MD5Hash(string s)
        {
            //tạo MD5
            MD5 m = MD5.Create();
            //chuyen kieu chuoi thanh kieu byte
            byte[] inputbytes = Encoding.ASCII.GetBytes(s);
            //ma hoa chuoi
            byte[] hash = m.ComputeHash(inputbytes);
            //lam viec voi chuoi
            StringBuilder sb = new StringBuilder();
            for(int i=0;i< hash.Length;i++)
            {
                sb.Append(hash[i].ToString("X2"));
            }
            return sb.ToString();
        }
    }
}