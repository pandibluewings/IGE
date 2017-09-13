using IGE.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Formatting;
using System.Net.Mail;
using System.Net.Mime;
using System.Text;
using System.Web.Http;

namespace IGE.API
{
    public class LoginController : ApiController
    {
        // GET api/login
        [HttpGet]
        public Dictionary<string, string> Login(string Email, string Password)
        {
            Entities db = new Entities();
            //string Email = Params.Get("Email");
            //string Password = Params.Get("Password");
            Dictionary<string, string> objDic = new Dictionary<string, string>();

            try
            {
                var data = from li in db.users where li.users_email == Email & li.users_password == Password select li;

                if (data.Count() > 0)
                {
                    foreach (var item in data)
                    {
                        objDic.Add("LoginStatus", "1");
                        objDic.Add("Email", item.users_email);
                        objDic.Add("Name", item.users_name);
                        objDic.Add("UserType", item.ut_id.ToString());
                        objDic.Add("UserID", item.users_id.ToString());
                        break;
                    }

                }
                else
                {
                    objDic.Add("LoginStatus", "0");
                    objDic.Add("IsAdmin", "0");
                    objDic.Add("UserID", "0");
                    objDic.Add("Email", Email);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return objDic;
        }
        [HttpPost]
        public Dictionary<string, string> UpdateUserPassword(FormDataCollection Params)
        {
            Entities db = new Entities();
            string Email = Params.Get("Email");
            string CurrentPassword = Params.Get("CurrentPassword");
            string NewPassword = Params.Get("NewPassword");
            Dictionary<string, string> objDic = new Dictionary<string, string>();
            if (!tblUserMailExists(Email))
            {
                objDic.Add("Status", "0");
                objDic.Add("Message", "Your email not exist");
              
            }

            if (!tblUserMailPasswordExists(Email, CurrentPassword))
            {
                objDic.Add("Status", "0");
                objDic.Add("Message", "Wrong Password");             
            }

            try
            {
                var User = (from li in db.users where li.users_email  == Email select li).SingleOrDefault();
                User.users_password = NewPassword;
                db.Entry(User).Property(x => x.users_password).IsModified = true;
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!tblUserMailExists(Email))
                {
                    objDic.Add("Status", "0");
                    objDic.Add("Message", "Your email not exist");
                }
                else
                {
                    throw;
                }
            }

            return objDic ;
        }
        [HttpPost]
        public Dictionary<string, string> ResetPassword(FormDataCollection Params)
        {
            Entities db = new Entities();
            string Email = Params.Get("Email");
            string UpdateURI = Params.Get("UpdateURI");
            Dictionary<string, string> objDic = new Dictionary<string, string>();

            if (!tblUserMailExists(Email))
            {
                objDic.Add("Status", "0");
                objDic.Add("Message", "Your email not exist");
            }

            try
            {
                string Name = "", Password = ""; ;
                var User = (from li in db.users where li.users_email  == Email select li);
                foreach (var li in User)
                {
                    Name = li.users_name ;
                    Password = li.users_password;
                }

                SmtpClient client = new SmtpClient();
                client.Port = 587;
                client.Host = "smtp.gmail.com";
                client.EnableSsl = true;
                client.Timeout = 10000;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.UseDefaultCredentials = false;
                client.Credentials = new System.Net.NetworkCredential("pandi.bluewings@gmail.com", "9600339421");
                string BodyContent = "<html><head><title></title></head><body><br><br>";
                BodyContent += " <div style='border-top:3px solid #800080'> &nbsp;</div>";
                BodyContent += "<span style='font-family:Arial; font-size:10pt'> Hello <strong>" + Name + "</strong> !<br><br/>";
                BodyContent += "your passwrod has been recovered.your password for " + Email + " is<strong> " + Password + "</strong> <br><br> ";
                BodyContent += " Please login with below link: <br> <strong> " + UpdateURI + " </strong> <br><br>";
                BodyContent += "</span></body></html> ";

                //<img src='http://www.florist.com.au/images/misc/f2ca_logo.png'/> String BodyContent = "<h1>    Hello <strong>" + Name + " !</strong> </h1> <br> Please login with below link: <br> <strong>" + UpdateURI + "</strong>"; ;

                MailMessage mm = new MailMessage("pandi.bluewings@gmail.com", Email, "IGE - Your password has been recovered", "");
                mm.IsBodyHtml = true;
                var htmlView = AlternateView.CreateAlternateViewFromString(BodyContent, null, MediaTypeNames.Text.Html);
                //This does the trick
                htmlView.ContentType.CharSet = Encoding.UTF8.WebName;
                mm.AlternateViews.Add(htmlView);
                mm.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.UseDefaultCredentials = false;
                client.EnableSsl = true;
                client.Send(mm);
                objDic.Add("Status", "1");
                objDic.Add("Message", "Recovery email sent to your email.");
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!tblUserMailExists(Email))
                {
                    objDic.Add("Status", "0");
                    objDic.Add("Message", "Your email not exist");
                }
                else
                {
                    throw;
                }
            }

            return objDic ;
        }
        private bool tblUserMailExists(string Email)
        {
            Entities db = new Entities();
            return db.users.Count(e => e.users_email  == Email ) > 0;
        }
        private bool tblUserPhoneExists(string phone)
        {
            Entities db = new Entities();
            return db.users.Count(e => e.users_phone == phone ) > 0;
        }
        private bool tblUserMailPasswordExists(string Email, string Password)
        {
            Entities db = new Entities();
            return db.users.Count(e => e.users_email == Email && e.users_password == Password ) > 0;
        }

        private bool tblUserPhonePasswordExists(string Phone, string Password)
        {
            Entities db = new Entities();
            return db.users.Count(e => e.users_phone  == Phone  && e.users_password == Password) > 0;
        }
    }
}
