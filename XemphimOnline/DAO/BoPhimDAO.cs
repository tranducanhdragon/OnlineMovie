using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using XemphimOnline.Model;

namespace XemphimOnline.DAO
{
    public class BoPhimDAO
    {
        ModelOneMovie db = null;
        public BoPhimDAO()
        {
            db = new ModelOneMovie();
        }
        public void ThemBoPhim(string tenbp, int phimbo, string tendd, string maqg, string matl, string manxb)
        {
            Object[] para = new SqlParameter[]
            {
                new SqlParameter("@tenbp", tenbp),
                new SqlParameter("@phimbo", phimbo),
                new SqlParameter("@tendd", tendd),
                new SqlParameter("@maqg", maqg),
                new SqlParameter("@matl", matl),
                new SqlParameter("@manxb", manxb)
            };
            db.Database.ExecuteSqlCommand("ThemBoPhim @tenbp, @phimbo, @tendd, @maqg, @matl, @manxb", para);
        }
    }
}