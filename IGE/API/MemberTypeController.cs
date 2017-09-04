using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Mvc;
using IGE.Models;
using Newtonsoft.Json;


namespace IGE.API
{
    public class MemberTypeController : ApiController
    {
      


        // GET api/<controller>
        public  string Get()
        
        {
            List<Models.MemberType> Membertypes = new List<MemberType>();
            indgarmentsexpoEntities objEntities = new indgarmentsexpoEntities();
            Membertypes = objEntities.MemberTypes.ToList();
            string json = "[";
            foreach (var member in Membertypes)
            {
                json = json + "{\"mt_id\":" + member.mt_id + ",\"mt_name\":\"" + member.mt_name + "\"},";
            }
            json = json.Substring(0, (json.Length - 1)) + "]";
            return json;
        }

        // GET api/<controller>/5
        public string Get(int id)
        {
            Models.MemberType Membertypes = new Models.MemberType();
            indgarmentsexpoEntities objEntities = new indgarmentsexpoEntities();
            Membertypes=objEntities.MemberTypes.Where(x=>x.mt_id==id).SingleOrDefault();
            string json ="[";
            json = json + "{\"md_id\":" + Membertypes.mt_id + ",\"mt_name\":\"" + Membertypes.mt_name + "\"}";
            json = json + "]";
            return json;
        }

        // POST api/<controller>
        public void Post([FromBody]string member)
        {
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