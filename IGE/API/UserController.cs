using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using IGE.Models;
namespace IGE.API
{
    public class UserController : ApiController
    {
        // GET api/<controller>
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/<controller>/5
        public string Get(int id)
        {
            return "value";
        }

        public Dictionary<string, string> Post(Models.SignUpModel member)
        {
            Dictionary<string, string> objDic = new Dictionary<string, string>();
            try
            {
                indgarmentsexpoEntities db = new indgarmentsexpoEntities();
                var data = db.usp_MemberInsert(0, 0, member.name, "", "", "", "", "", "", 0, 0, 0, "121321",member.phone, member.phone, member.phone, member.email, "", "", "", "", DateTime.Now, DateTime.Now, 1, 1);
                var uid = data.Select(x => x.mem_id).SingleOrDefault();
                var datas = db.usp_usersInsert(member.user_name,member.password,"","",member.email,member.phone,2,1);
                var uids = datas.Select(x => x.users_id).SingleOrDefault();
                objDic.Add("status", "1");
                objDic.Add("uid", uids.ToString());
                objDic.Add("message", "1");
                return objDic;
            }
            catch (Exception ex)
            {
                objDic.Add("status", "0");
                objDic.Add("uid", "0");
                objDic.Add("message", ex.Message);
                return objDic;
            }

        }

        // PUT api/<controller>/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/<controller>/5
        public void Delete(int id)
        {
        }
    }
}