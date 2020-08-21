namespace XemphimOnline.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TheLoai")]
    public partial class TheLoai
    {
        [Key]
        public int MaTL { get; set; }

        [StringLength(200)]
        public string TenTL { get; set; }
    }
}
