namespace XemphimOnline.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("NSX")]
    public partial class NSX
    {
        [Key]
        public int MaNSX { get; set; }

        [StringLength(200)]
        public string TenNSX { get; set; }
    }
}
