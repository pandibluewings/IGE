//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace IGE.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class BusinessType
    {
        public BusinessType()
        {
            this.Members = new HashSet<Member>();
        }
    
        public long bt_id { get; set; }
        public string bt_name { get; set; }
        public Nullable<System.DateTime> bt_cdate { get; set; }
        public Nullable<System.DateTime> bt_mdate { get; set; }
        public Nullable<long> bt_cid { get; set; }
        public Nullable<long> bt_mid { get; set; }
    
        public virtual user user { get; set; }
        public virtual user user1 { get; set; }
        public virtual ICollection<Member> Members { get; set; }
    }
}