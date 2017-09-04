using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using IGE.Models;

namespace IGE.API
{
    public class CountryController : ApiController
    {
        // GET api/<controller>
        public string Get()
        {
            List<Country> Countries = new List<Country>();
            indgarmentsexpoEntities objEntities = new indgarmentsexpoEntities();
            Countries = objEntities.Countries.ToList();
            string json = "[";
            foreach (var country in Countries)
            {
                json = json + "{\"con_id\":" + country.con_id + ",\"con_name\":\"" + country.con_name + "\"}";
            }
            json = json + "]";
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