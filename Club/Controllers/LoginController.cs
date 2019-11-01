using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Club.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        public ActionResult Index()
        {
            return PartialView();
        }

        public ActionResult Login()
        {
            return Redirect("/UserCalendar");
        }
    }
}