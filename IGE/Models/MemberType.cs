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
    
    public partial class MemberType
    {
        public MemberType()
        {
            this.Members = new HashSet<Member>();
        }
    
        public long mt_id { get; set; }
        public string mt_name { get; set; }
        public Nullable<System.DateTime> mt_cdate { get; set; }
        public Nullable<System.DateTime> mt_mdate { get; set; }
        public Nullable<long> mt_cid { get; set; }
        public Nullable<long> mt_mid { get; set; }
    
        public virtual ICollection<Member> Members { get; set; }
        public virtual user user { get; set; }
        public virtual user user1 { get; set; }
    }
}
