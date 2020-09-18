using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;
using Newtonsoft.Json;
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
            if(string.Compare(Username,"a",true) == 0 && string.Compare(Password,"a",true) == 0)
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
        public JsonResult register(string Username, string Password)
        {
            return Json(JsonRequestBehavior.AllowGet);
        }

        public ActionResult viewlogin()
        {
            return PartialView("_ViewPartiallogin");
        }

        public ActionResult viewregister()
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