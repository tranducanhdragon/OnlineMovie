using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace XemphimOnline
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "Trang Chu",
                url: "TrangChu",
                defaults: new { controller = "Home", action = "TrangChu" }
            );
            routes.MapRoute(
                name: "Chi Tiết Phim",
                url: "ChiTietPhim",
                defaults: new { controller = "Movie", action = "ChiTietPhim" }
            );


            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "TrangChu", id = UrlParameter.Optional }
            );
        }
    }
}
