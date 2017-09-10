using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using IGE.Models;

namespace IGE.API
{
    public class BusinessTypeController : ApiController
    {

        // GET api/<controller>
        public IEnumerable<usp_BusinessTypeSelect_Result> Get()
        {
            //var  result = from li in db.BusinessTypes  
            //                                 select new dtoBusinessType
            //                               {

            //                                   				bt_id = li.bt_id,
            //                                   bt_cdate = li.bt_cdate,
            //                                   bt_cid = li.bt_cid,
            //                                   bt_mid=li.bt_mid ,
            //                                   bt_name = li.bt_name,
            //                                   bt_mdate = li.bt_mdate

            //                               };


            //return result.AsEnumerable ();

            indgarmentsexpoEntities db = new indgarmentsexpoEntities();
            var result = db.usp_BusinessTypeSelect(null);
            return result.AsEnumerable();


        }

        // GET api/<controller>/5
        public IEnumerable<usp_BusinessTypeSelect_Result> Get(long id)
        {
            indgarmentsexpoEntities db = new indgarmentsexpoEntities();
            var result = db.usp_BusinessTypeSelect(id);
            return result.AsEnumerable();
        }

        // POST api/<controller>
        public string  Post(BusinessType objBusinessType)
        {
            try
            {
                indgarmentsexpoEntities db = new indgarmentsexpoEntities();
                var data = db.usp_BusinessTypeInsert(objBusinessType.bt_name, objBusinessType.bt_cdate, objBusinessType.bt_mdate, objBusinessType.bt_cid, objBusinessType.bt_mid);
                return data.ToString ();
            }
            catch (Exception ex)
            {
                return null;
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