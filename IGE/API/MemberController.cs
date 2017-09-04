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
        public string Get()
        {
            List<Models.Member> Members = new List<Models.Member>();
            indgarmentsexpoEntities objEntities = new indgarmentsexpoEntities();
            Members = objEntities.Members.ToList();
            string json = "[";
            foreach (var member in Members)
            {
                json = json + "{\"mem_id\":" + member.mem_id + ",\"mem_name\":\"" + member.mem_name + "\"}";
            }
            json = json + "]";
            return json; ;
          
        }

        // GET api/<controller>/5
        public string Get(long id)
        {
            Models.Member Member = new Models.Member();
            indgarmentsexpoEntities objEntities = new indgarmentsexpoEntities();
            Member = objEntities.Members.Where(x=>x.mem_id==id).SingleOrDefault();
            string json = "[";
            json = json + "{\"mem_id\":" + Member.mem_id + ",\"mem_name\":\"" + Member.mem_name + "\"}";
            json = json + "]";
            return json; ;
        }

        // POST api/<controller>
        public string Post(Models.Member member)
        {
            try
            {
                indgarmentsexpoEntities objEntities = new indgarmentsexpoEntities();
                objEntities.usp_MemberInsert(member.mt_id, member.bt_id, member.mem_name, member.mem_companyname, member.mem_owner, member.mem_address1, member.mem_address2, member.mem_offaddress1, member.mem_offaddress2, member.city_id, member.sta_id, member.con_id, member.mem_pincode, member.mem_mobile, member.mem_phone, member.mem_offphone, member.mem_email, member.mem_webbsite, member.mem_gstno, member.mem_panno, member.mem_logo, DateTime.Now, DateTime.Now, member.mem_cid, member.mem_mid);
                return "Member record Inserted Successfully.";
                          
            }
            catch(Exception ex)
            {
                return "Member record Insertion Failed.";    
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
                indgarmentsexpoEntities objEntities = new indgarmentsexpoEntities();
                objEntities.usp_MemberDelete(id);
                return "Member Deleted Successfully.";
            }
            catch(Exception ex)
            {
                return "Member Deleted Failed.";
            }
          
            
        }

       
    }
}