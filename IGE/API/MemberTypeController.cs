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
        public IEnumerable<usp_MemberTypeSelect_Result> Get()
        {
            Entities db = new Entities();
            var result = db.usp_MemberTypeSelect(null);
            return result.AsEnumerable();
        }

        // GET api/<controller>/5
        public IEnumerable<usp_MemberTypeSelect_Result> Get(long id)
        {
            Entities db = new Entities();
            var result = db.usp_MemberTypeSelect(id);
            return result.AsEnumerable();
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