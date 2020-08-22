using System;
using System.Collections.Generic;
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
    }
}