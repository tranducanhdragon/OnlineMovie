namespace XemphimOnline.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TaiKhoan")]
    public partial class TaiKhoan
    {
        [Key]
        [Column("TaiKhoan")]
        [StringLength(50)]
        public string TaiKhoan1 { get; set; }

        [StringLength(50)]
        public string MatKhau { get; set; }

        public int? LoaiTK { get; set; }
    }
}
