using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace IGE.Controllers
{
    public class AdminController : Controller
    {
        //
        // GET: /Admin/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Member()
        {
            return View();
        }
        public ActionResult MemberList()
        {
            return View();
        }
        public ActionResult CustomerList()
        {
            return View();
        }

        public ActionResult Customer()
        {
            return View();
        }
    }
}
