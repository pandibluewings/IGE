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
    
    public partial class Country
    {
        public Country()
        {
            this.Cities = new HashSet<City>();
            this.Companies = new HashSet<Company>();
            this.Members = new HashSet<Member>();
            this.States = new HashSet<State>();
        }
    
        public long con_id { get; set; }
        public string con_name { get; set; }
    
        public virtual ICollection<City> Cities { get; set; }
        public virtual ICollection<Company> Companies { get; set; }
        public virtual ICollection<Member> Members { get; set; }
        public virtual ICollection<State> States { get; set; }
    }
}
