using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using IGE.Models;

namespace IGE.API
{
    public class CityController : ApiController
    {
        // GET api/<controller>
        public IEnumerable<usp_CitySelect_Result> Get()
        {
            Entities db = new Entities();
            var result = db.usp_CitySelect(null, null, null);
            return result.AsEnumerable();
        }

        // GET api/<controller>/5
        public IEnumerable<usp_CitySelect_Result> Get(long stateid)
        {
            Entities db = new Entities();
            var result = db.usp_CitySelect(null, stateid, null);
            return result.AsEnumerable();
        }
        public IEnumerable<usp_CitySelect_Result> Get(long stateid, long countryid)
        {
            Entities db = new Entities();
            var result = db.usp_CitySelect(null, stateid, countryid);
            return result.AsEnumerable();
        }
        public IEnumerable<usp_CitySelect_Result> Get(long cityid, long stateid, long countryid)
        {
            Entities db = new Entities();
            var result = db.usp_CitySelect(cityid, stateid, countryid);
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