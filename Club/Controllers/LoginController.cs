using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Club.Services;
using Club.Models;

namespace Club.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        public ActionResult Index()
        {
            return PartialView();
        }

        [HttpPost]
        public ActionResult Index(FormCollection collection)
        {
            Listas l = new Listas();
            Socio s;
            s = l.getPassword(Convert.ToString(collection["email"]));
            if (s == null) return Redirect("/login");
            if (s.pwd == Convert.ToString(collection["password"]))
            {
                Session["idSocio" + Session.SessionID]=s;
                s = (Socio)Session["idSocio" + Session.SessionID];
                
                return Redirect("/UserCalendar");
            }
            return View();
        }

        public ActionResult Login()
        {
            return Redirect("/UserCalendar");
        }
    }
}