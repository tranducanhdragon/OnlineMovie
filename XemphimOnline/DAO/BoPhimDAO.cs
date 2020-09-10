using System;
using System.Collections.Generic;
using System.Data;
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
        public void ThemBoPhim(string tenbp, int phimbo, string tendd, string maqg, string matl, string manxb,ref int maBP)
        {
            SqlParameter[] para = new SqlParameter[]
            {
                new SqlParameter("@tenbp", tenbp),
                new SqlParameter("@phimbo", phimbo),
                new SqlParameter("@tendd", tendd),
                new SqlParameter("@maqg", maqg),
                new SqlParameter("@matl", matl),
                new SqlParameter("@manxb", manxb),
                new SqlParameter("@maBP", maBP),
            };
            para[6].Direction = ParameterDirection.Output;
            db.Database.ExecuteSqlCommand("ThemBoPhim @tenbp,@phimbo,@tendd,@maqg,@matl,@manxb,@maBP out", para);
            maBP = Int32.Parse(para[6].Value.ToString());
        }
        public List<string> ListTenBoPhim(string keyword)
        {
            return db.BoPhims.Where(x => x.TenBP.Contains(keyword)).Select(x => x.TenBP).ToList();
        }
    }
}