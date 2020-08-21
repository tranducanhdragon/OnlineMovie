namespace XemphimOnline.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("BoPhim")]
    public partial class BoPhim
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public BoPhim()
        {
            PhanPhims = new HashSet<PhanPhim>();
        }

        [Key]
        public int MaBP { get; set; }

        public string TenBP { get; set; }

        public int? PhimBo { get; set; }

        public int? MaDD { get; set; }

        public virtual DaoDien DaoDien { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PhanPhim> PhanPhims { get; set; }
    }
}
