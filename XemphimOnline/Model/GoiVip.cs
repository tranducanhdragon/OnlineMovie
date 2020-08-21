namespace XemphimOnline.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("GoiVip")]
    public partial class GoiVip
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int IDGoi { get; set; }

        [StringLength(200)]
        public string TenGoi { get; set; }

        public int? ThoiGian { get; set; }

        public long? GiaTien { get; set; }
    }
}
