namespace XemphimOnline.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PhanPhim")]
    public partial class PhanPhim
    {
        [Key]
        public string MaPhim { get; set; }

        public string TenPhim { get; set; }

        [StringLength(100)]
        public string ThoiLuong { get; set; }

        public int? Tap { get; set; }

        public DateTime? NamXB { get; set; }

        public int? DanhGia { get; set; }

        public long? LuotXem { get; set; }

        public string LinkAnh { get; set; }

        public int? PhimVip { get; set; }

        public int? MaBP { get; set; }

        public virtual BoPhim BoPhim { get; set; }
    }
}
