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
    
    public partial class UserType
    {
        public UserType()
        {
            this.users = new HashSet<user>();
        }
    
        public long ut_id { get; set; }
        public string ut_code { get; set; }
        public string ut_name { get; set; }
        public Nullable<long> com_id { get; set; }
    
        public virtual Company Company { get; set; }
        public virtual ICollection<user> users { get; set; }
    }
}
