using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using IGE.Models;

namespace IGE.API.Member
{
    public class MemberController : ApiController
    {

        // GET api/<controller>
        public IEnumerable<usp_MemberSelect_Result> Get()
        {
            indgarmentsexpoEntities db = new indgarmentsexpoEntities();
            var result = db.usp_MemberSelect(null);
            return result.AsEnumerable();
        }

        // GET api/<controller>/5
        public IEnumerable<usp_MemberSelect_Result> Get(long id)
        {
            indgarmentsexpoEntities db = new indgarmentsexpoEntities();
            var result = db.usp_MemberSelect(id);
            return result.AsEnumerable();
        }

        // POST api/<controller>
        public Dictionary<string, string> Post(Models.Member member)
        {
            Dictionary<string, string> objDic = new Dictionary<string, string>();
            try
            {
                indgarmentsexpoEntities db = new indgarmentsexpoEntities();
                var data = db.usp_MemberInsert(member.mt_id, member.bt_id, member.mem_name, member.mem_companyname, member.mem_owner, member.mem_address1, member.mem_address2, member.mem_offaddress1, member.mem_offaddress2, member.city_id, member.sta_id, member.con_id, member.mem_pincode, member.mem_mobile, member.mem_phone, member.mem_offphone, member.mem_email, member.mem_webbsite, member.mem_gstno, member.mem_panno, member.mem_logo, DateTime.Now, DateTime.Now, member.mem_cid, member.mem_mid);
                var uid = data.Select(x => x.mem_id).SingleOrDefault();
                objDic.Add("status", "1");
                objDic.Add("uid", uid.ToString ());
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
        public string Delete(int id)
        {
            try
            {
                indgarmentsexpoEntities db = new indgarmentsexpoEntities();
                db.usp_MemberDelete(id);
                return "Member Deleted Successfully.";
            }
            catch (Exception ex)
            {
                return "Member Deleted Failed.";
            }


        }


    }
}