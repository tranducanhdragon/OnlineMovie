using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using XemphimOnline.Model;

namespace XemphimOnline.DAO
{
    public class TaiKhoanDAO
    {
        ModelOneMovie db = null;
        public TaiKhoanDAO()
        {
            db = new ModelOneMovie();
        }
        public bool CheckLogin(string username, string pass)
        {
            var ck = from tk in db.TaiKhoans where tk.TaiKhoan1 == username && tk.MatKhau == pass select tk;
            if (ck.Any())
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }    
}