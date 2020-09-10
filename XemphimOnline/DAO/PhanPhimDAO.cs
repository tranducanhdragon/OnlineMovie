using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using XemphimOnline.Model;

namespace XemphimOnline.DAO
{
    public class PhanPhimDAO
    {
        ModelOneMovie db = null;
        public PhanPhimDAO()
        {
            db = new ModelOneMovie();
        }
        public List<PhanPhim> GetListPhanPhim()
        {
            return db.PhanPhims.ToList();
        }
        public PhanPhim GetPhanPhim(string MaPhim)
        {
            return db.PhanPhims.Find(MaPhim);
        }
        public void ThemPhanPhim(string MP,string TP,string TLg,int Tap,DateTime NamXB,string LkA,int PV,int MaBP)
        {
            Object[] para = new SqlParameter[]
            {
                new SqlParameter("@MaPhim", MP),
                new SqlParameter("@TenPhim", TP),
                new SqlParameter("@ThoiLuong", TLg),
                new SqlParameter("@Tap", Tap),
                new SqlParameter("@NamXB",NamXB ),
                new SqlParameter("@LinkAnh", LkA),
                new SqlParameter("@PhimVip", PV),
                new SqlParameter("@MaBP", MaBP)
            };
            db.Database.ExecuteSqlCommand("ThemPhanPhim @MaPhim,@TenPhim,@ThoiLuong,@Tap,@NamXB,@LinkAnh,@PhimVip,@MaBP", para);
        }
    }
}