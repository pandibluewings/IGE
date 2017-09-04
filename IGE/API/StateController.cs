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
        public string Get()
        {
            List<State> States = new List<State>();
            indgarmentsexpoEntities objEntities = new indgarmentsexpoEntities();
            States = objEntities.States.ToList();
            string json = "[";
            foreach (var state in States)
            {
                json = json + "{\"sta_id\":" + state.sta_id + ",\"sta_name\":\"" + state.sta_name + "\"},";
            }
            json = json.Substring(0,(json.Length-1)) + "]";
            return json;
        }

        // GET api/<controller>/5
        public string Get(int id)
        {
            return "value";
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