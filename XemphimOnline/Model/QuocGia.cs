namespace XemphimOnline.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("QuocGia")]
    public partial class QuocGia
    {
        [Key]
        public int MaQG { get; set; }

        [StringLength(200)]
        public string TenQG { get; set; }
    }
}
