using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using IGE.Models;

namespace IGE.API
{
    public class StateController : ApiController
    {
        // GET api/<controller>
        public IEnumerable<usp_StatesSelect_Result > Get()
        {
            indgarmentsexpoEntities db = new indgarmentsexpoEntities();
            var result = db.usp_StatesSelect(null);
            return result.AsEnumerable();
        }

        // GET api/<controller>/5
        public IEnumerable<usp_StatesSelect_Result> Get(long id)
        {
            indgarmentsexpoEntities db = new indgarmentsexpoEntities();
            var result = db.usp_StatesSelect(id);
            return result.AsEnumerable();
        }

        // POST api/<controller>
        public void Post([FromBody]string value)
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