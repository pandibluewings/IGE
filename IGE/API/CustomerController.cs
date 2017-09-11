using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using IGE.Models;
namespace IGE.API
{
    public class CustomerController : ApiController
    {
        // GET api/customer
        public IEnumerable<usp_CustomerSelect_Result> Get()
        {
            Entities db = new Entities();
            var result = db.usp_CustomerSelect(null);
            return result.AsEnumerable();
        }

        // GET api/customer/5
        public IEnumerable<usp_CustomerSelect_Result> Get(long id)
        {
            Entities db = new Entities();
            var result = db.usp_CustomerSelect(id);
            return result.AsEnumerable();
        }

        // POST api/customer
        public Dictionary<string, string> Post(Models.Customer customer)
        {
            Dictionary<string, string> objDic = new Dictionary<string, string>();
            try
            {
                Entities db = new Entities();
                var data = db.usp_CustomerInsert(customer.cust_code, customer.cust_type, customer.cust_name, customer.cust_brand, customer.cust_contactperson, customer.cust_address1, customer.cust_address2, customer.cust_address3, customer.cust_city, customer.cust_district, customer.cust_state,
                    customer.cust_pincode, customer.cust_mobile, customer.cust_phone, customer.cust_mobile2, customer.cust_email, customer.cust_webbsite, customer.cust_gstno);
                var uid = data.Select(x => x.cust_id).SingleOrDefault();
                objDic.Add("status", "1");
                objDic.Add("uid", uid.ToString());
                objDic.Add("message", "Customer added successfully.");
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

        // PUT api/customer/5
        public Dictionary<string, string> Put(Models.Customer customer)
        {
            Dictionary<string, string> objDic = new Dictionary<string, string>();
            try
            {
                Entities db = new Entities();
                var data = db.usp_CustomerUpdate(customer.cust_id, customer.cust_code, customer.cust_type, customer.cust_name, customer.cust_brand, customer.cust_contactperson, customer.cust_address1, customer.cust_address2, customer.cust_address3, customer.cust_city, customer.cust_district, customer.cust_state,
                    customer.cust_pincode, customer.cust_mobile, customer.cust_phone, customer.cust_mobile2, customer.cust_email, customer.cust_webbsite, customer.cust_gstno);
                var uid = data.Select(x => x.cust_id).SingleOrDefault();
                objDic.Add("status", "1");
                objDic.Add("uid", uid.ToString());
                objDic.Add("message", "Customer updated successfully.");
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

        // DELETE api/customer/5
        public Dictionary<string, string> Delete(long id)
        {
            Dictionary<string, string> objDic = new Dictionary<string, string>();
            try
            {
                Entities db = new Entities();
                db.usp_CustomerDelete(id);
                objDic.Add("status", "1");
                objDic.Add("uid", id.ToString());
                objDic.Add("message", "Customer deleted successfully.");
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
    }
}
