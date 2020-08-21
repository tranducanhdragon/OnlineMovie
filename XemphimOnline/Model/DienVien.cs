namespace XemphimOnline.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DienVien")]
    public partial class DienVien
    {
        [Key]
        public int MaDV { get; set; }

        [StringLength(200)]
        public string TenDV { get; set; }
    }
}
