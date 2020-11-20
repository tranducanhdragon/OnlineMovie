namespace XemphimOnline.Model
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class ModelOneMovie : DbContext
    {
        public ModelOneMovie()
            : base("name=ModelOneMovie")
        {
            base.Configuration.ProxyCreationEnabled = false;
        }

        public virtual DbSet<BoPhim> BoPhims { get; set; }
        public virtual DbSet<DaoDien> DaoDiens { get; set; }
        public virtual DbSet<DienVien> DienViens { get; set; }
        public virtual DbSet<GoiVip> GoiVips { get; set; }
        public virtual DbSet<NSX> NSXes { get; set; }
        public virtual DbSet<QuocGia> QuocGias { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<TaiKhoan> TaiKhoans { get; set; }
        public virtual DbSet<TheLoai> TheLoais { get; set; }
        public virtual DbSet<PhanPhim> PhanPhims { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<TaiKhoan>()
                .Property(e => e.TaiKhoan1)
                .IsFixedLength();

            modelBuilder.Entity<TaiKhoan>()
                .Property(e => e.MatKhau)
                .IsFixedLength();
        }
    }
}
