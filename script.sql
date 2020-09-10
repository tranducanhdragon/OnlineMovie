USE [master]
GO
/****** Object:  Database [OneMovie]    Script Date: 9/10/2020 2:22:39 PM ******/
CREATE DATABASE [OneMovie]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OneMovie', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\OneMovie.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OneMovie_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\OneMovie_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [OneMovie] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OneMovie].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OneMovie] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OneMovie] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OneMovie] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OneMovie] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OneMovie] SET ARITHABORT OFF 
GO
ALTER DATABASE [OneMovie] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OneMovie] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OneMovie] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OneMovie] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OneMovie] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OneMovie] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OneMovie] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OneMovie] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OneMovie] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OneMovie] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OneMovie] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OneMovie] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OneMovie] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OneMovie] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OneMovie] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OneMovie] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OneMovie] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OneMovie] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OneMovie] SET  MULTI_USER 
GO
ALTER DATABASE [OneMovie] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OneMovie] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OneMovie] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OneMovie] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OneMovie] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OneMovie] SET QUERY_STORE = OFF
GO
USE [OneMovie]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [OneMovie]
GO
/****** Object:  Table [dbo].[BinhLuan]    Script Date: 9/10/2020 2:22:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BinhLuan](
	[TaiKhoan] [nchar](50) NULL,
	[MaPhim] [int] NULL,
	[ThoiGian] [datetime] NULL,
	[NoiDung] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BoPhim]    Script Date: 9/10/2020 2:22:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BoPhim](
	[MaBP] [int] IDENTITY(1,1) NOT NULL,
	[TenBP] [nvarchar](max) NULL,
	[PhimBo] [int] NULL,
	[MaDD] [int] NULL,
 CONSTRAINT [PK_BoPhim] PRIMARY KEY CLUSTERED 
(
	[MaBP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DaoDien]    Script Date: 9/10/2020 2:22:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DaoDien](
	[MaDD] [int] IDENTITY(1,1) NOT NULL,
	[TenDD] [nvarchar](200) NULL,
 CONSTRAINT [PK_DaoDien] PRIMARY KEY CLUSTERED 
(
	[MaDD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DienVien]    Script Date: 9/10/2020 2:22:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DienVien](
	[MaDV] [int] IDENTITY(1,1) NOT NULL,
	[TenDV] [nvarchar](200) NULL,
 CONSTRAINT [PK_DienVien] PRIMARY KEY CLUSTERED 
(
	[MaDV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DienVien_PhanPhim]    Script Date: 9/10/2020 2:22:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DienVien_PhanPhim](
	[MaDV] [int] NULL,
	[MaPP] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GoiVip]    Script Date: 9/10/2020 2:22:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GoiVip](
	[IDGoi] [int] NOT NULL,
	[TenGoi] [nvarchar](200) NULL,
	[ThoiGian] [int] NULL,
	[GiaTien] [bigint] NULL,
 CONSTRAINT [PK_GoiVip] PRIMARY KEY CLUSTERED 
(
	[IDGoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LichSuXem]    Script Date: 9/10/2020 2:22:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LichSuXem](
	[TaiKhoan] [nchar](50) NULL,
	[MaPhim] [int] NULL,
	[ThoiGian] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LuuPhim]    Script Date: 9/10/2020 2:22:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LuuPhim](
	[TaiKhoan] [nchar](50) NULL,
	[MaPhim] [int] NULL,
	[ThoiGian] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MuaVip]    Script Date: 9/10/2020 2:22:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MuaVip](
	[TaiKhoan] [nchar](50) NULL,
	[IDGoi] [int] NULL,
	[NgayMua] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NSX]    Script Date: 9/10/2020 2:22:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NSX](
	[MaNSX] [int] IDENTITY(1,1) NOT NULL,
	[TenNSX] [nvarchar](200) NULL,
 CONSTRAINT [PK_NSX] PRIMARY KEY CLUSTERED 
(
	[MaNSX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NSX_BoPhim]    Script Date: 9/10/2020 2:22:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NSX_BoPhim](
	[MaNSX] [int] NULL,
	[MaBP] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanPhim]    Script Date: 9/10/2020 2:22:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanPhim](
	[MaPhim] [nvarchar](max) NOT NULL,
	[TenPhim] [nvarchar](max) NULL,
	[ThoiLuong] [nvarchar](100) NULL,
	[Tap] [int] NULL,
	[NamXB] [datetime] NULL,
	[DanhGia] [int] NULL,
	[LuotXem] [bigint] NULL,
	[LinkAnh] [nvarchar](max) NULL,
	[PhimVip] [int] NULL,
	[MaBP] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuocGia]    Script Date: 9/10/2020 2:22:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuocGia](
	[MaQG] [int] IDENTITY(1,1) NOT NULL,
	[TenQG] [nvarchar](200) NULL,
 CONSTRAINT [PK_QuocGia] PRIMARY KEY CLUSTERED 
(
	[MaQG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuocGia_BoPhim]    Script Date: 9/10/2020 2:22:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuocGia_BoPhim](
	[MaQG] [int] NULL,
	[MaBP] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 9/10/2020 2:22:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[TaiKhoan] [nchar](50) NOT NULL,
	[MatKhau] [nchar](50) NULL,
	[LoaiTK] [int] NULL,
	[VIPTime] [datetime] NULL,
 CONSTRAINT [PK_TaiKhoanUser] PRIMARY KEY CLUSTERED 
(
	[TaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TheLoai]    Script Date: 9/10/2020 2:22:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheLoai](
	[MaTL] [int] IDENTITY(1,1) NOT NULL,
	[TenTL] [nvarchar](200) NULL,
 CONSTRAINT [PK_TheLoai] PRIMARY KEY CLUSTERED 
(
	[MaTL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TheLoai_BoPhim]    Script Date: 9/10/2020 2:22:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheLoai_BoPhim](
	[MaTL] [int] NULL,
	[MaBP] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThongTinKhachHang]    Script Date: 9/10/2020 2:22:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongTinKhachHang](
	[HoTen] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[NgaySinh] [datetime] NULL,
	[TaiKhoan] [nchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[BinhLuan] ADD  CONSTRAINT [DF_BinhLuan_ThoiGian]  DEFAULT (getdate()) FOR [ThoiGian]
GO
ALTER TABLE [dbo].[LichSuXem] ADD  CONSTRAINT [DF_LichSuXem_ThoiGian]  DEFAULT (getdate()) FOR [ThoiGian]
GO
ALTER TABLE [dbo].[LuuPhim] ADD  CONSTRAINT [DF_LuuPhim_ThoiGian]  DEFAULT (getdate()) FOR [ThoiGian]
GO
ALTER TABLE [dbo].[MuaVip] ADD  CONSTRAINT [DF_MuaVip_NgayMua]  DEFAULT (getdate()) FOR [NgayMua]
GO
ALTER TABLE [dbo].[PhanPhim] ADD  CONSTRAINT [DF_PhanPhim_Tap]  DEFAULT ((1)) FOR [Tap]
GO
ALTER TABLE [dbo].[PhanPhim] ADD  CONSTRAINT [DF_PhanPhim_DanhGia]  DEFAULT ((3)) FOR [DanhGia]
GO
ALTER TABLE [dbo].[PhanPhim] ADD  CONSTRAINT [DF_PhanPhim_LuotXem]  DEFAULT ((0)) FOR [LuotXem]
GO
ALTER TABLE [dbo].[PhanPhim] ADD  CONSTRAINT [DF_PhanPhim_PhimVip]  DEFAULT ((0)) FOR [PhimVip]
GO
ALTER TABLE [dbo].[BinhLuan]  WITH CHECK ADD  CONSTRAINT [FK_BinhLuan_TaiKhoan] FOREIGN KEY([TaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([TaiKhoan])
GO
ALTER TABLE [dbo].[BinhLuan] CHECK CONSTRAINT [FK_BinhLuan_TaiKhoan]
GO
ALTER TABLE [dbo].[BoPhim]  WITH CHECK ADD  CONSTRAINT [FK_BoPhim_DaoDien] FOREIGN KEY([MaDD])
REFERENCES [dbo].[DaoDien] ([MaDD])
GO
ALTER TABLE [dbo].[BoPhim] CHECK CONSTRAINT [FK_BoPhim_DaoDien]
GO
ALTER TABLE [dbo].[DienVien_PhanPhim]  WITH CHECK ADD  CONSTRAINT [FK_DienVien_PhanPhim_DienVien] FOREIGN KEY([MaDV])
REFERENCES [dbo].[DienVien] ([MaDV])
GO
ALTER TABLE [dbo].[DienVien_PhanPhim] CHECK CONSTRAINT [FK_DienVien_PhanPhim_DienVien]
GO
ALTER TABLE [dbo].[LichSuXem]  WITH CHECK ADD  CONSTRAINT [FK_LichSuXem_TaiKhoan] FOREIGN KEY([TaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([TaiKhoan])
GO
ALTER TABLE [dbo].[LichSuXem] CHECK CONSTRAINT [FK_LichSuXem_TaiKhoan]
GO
ALTER TABLE [dbo].[LuuPhim]  WITH CHECK ADD  CONSTRAINT [FK_LuuPhim_TaiKhoan] FOREIGN KEY([TaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([TaiKhoan])
GO
ALTER TABLE [dbo].[LuuPhim] CHECK CONSTRAINT [FK_LuuPhim_TaiKhoan]
GO
ALTER TABLE [dbo].[MuaVip]  WITH CHECK ADD  CONSTRAINT [FK_MuaVip_GoiVip] FOREIGN KEY([IDGoi])
REFERENCES [dbo].[GoiVip] ([IDGoi])
GO
ALTER TABLE [dbo].[MuaVip] CHECK CONSTRAINT [FK_MuaVip_GoiVip]
GO
ALTER TABLE [dbo].[MuaVip]  WITH CHECK ADD  CONSTRAINT [FK_MuaVip_TaiKhoan] FOREIGN KEY([TaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([TaiKhoan])
GO
ALTER TABLE [dbo].[MuaVip] CHECK CONSTRAINT [FK_MuaVip_TaiKhoan]
GO
ALTER TABLE [dbo].[NSX_BoPhim]  WITH CHECK ADD  CONSTRAINT [FK_NSX_BoPhim_BoPhim] FOREIGN KEY([MaBP])
REFERENCES [dbo].[BoPhim] ([MaBP])
GO
ALTER TABLE [dbo].[NSX_BoPhim] CHECK CONSTRAINT [FK_NSX_BoPhim_BoPhim]
GO
ALTER TABLE [dbo].[NSX_BoPhim]  WITH CHECK ADD  CONSTRAINT [FK_NSX_BoPhim_NSX] FOREIGN KEY([MaNSX])
REFERENCES [dbo].[NSX] ([MaNSX])
GO
ALTER TABLE [dbo].[NSX_BoPhim] CHECK CONSTRAINT [FK_NSX_BoPhim_NSX]
GO
ALTER TABLE [dbo].[PhanPhim]  WITH CHECK ADD  CONSTRAINT [FK_PhanPhim_BoPhim] FOREIGN KEY([MaBP])
REFERENCES [dbo].[BoPhim] ([MaBP])
GO
ALTER TABLE [dbo].[PhanPhim] CHECK CONSTRAINT [FK_PhanPhim_BoPhim]
GO
ALTER TABLE [dbo].[QuocGia_BoPhim]  WITH CHECK ADD  CONSTRAINT [FK_QuocGia_BoPhim_BoPhim] FOREIGN KEY([MaBP])
REFERENCES [dbo].[BoPhim] ([MaBP])
GO
ALTER TABLE [dbo].[QuocGia_BoPhim] CHECK CONSTRAINT [FK_QuocGia_BoPhim_BoPhim]
GO
ALTER TABLE [dbo].[QuocGia_BoPhim]  WITH CHECK ADD  CONSTRAINT [FK_QuocGia_BoPhim_QuocGia] FOREIGN KEY([MaQG])
REFERENCES [dbo].[QuocGia] ([MaQG])
GO
ALTER TABLE [dbo].[QuocGia_BoPhim] CHECK CONSTRAINT [FK_QuocGia_BoPhim_QuocGia]
GO
ALTER TABLE [dbo].[TheLoai_BoPhim]  WITH CHECK ADD  CONSTRAINT [FK_TheLoai_BoPhim_BoPhim] FOREIGN KEY([MaBP])
REFERENCES [dbo].[BoPhim] ([MaBP])
GO
ALTER TABLE [dbo].[TheLoai_BoPhim] CHECK CONSTRAINT [FK_TheLoai_BoPhim_BoPhim]
GO
ALTER TABLE [dbo].[TheLoai_BoPhim]  WITH CHECK ADD  CONSTRAINT [FK_TheLoai_BoPhim_TheLoai] FOREIGN KEY([MaTL])
REFERENCES [dbo].[TheLoai] ([MaTL])
GO
ALTER TABLE [dbo].[TheLoai_BoPhim] CHECK CONSTRAINT [FK_TheLoai_BoPhim_TheLoai]
GO
ALTER TABLE [dbo].[ThongTinKhachHang]  WITH CHECK ADD  CONSTRAINT [FK_ThongTinKhachHang_TaiKhoan] FOREIGN KEY([TaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([TaiKhoan])
GO
ALTER TABLE [dbo].[ThongTinKhachHang] CHECK CONSTRAINT [FK_ThongTinKhachHang_TaiKhoan]
GO
/****** Object:  StoredProcedure [dbo].[ThemBoPhim]    Script Date: 9/10/2020 2:22:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ThemBoPhim](
	@tenbp nvarchar(max),@phimbo int,@tendd nvarchar(200),@maqg nchar(100),
	@matl nchar(100), @manxb nchar(100), @maBP int output
)as begin
	if not exists(select TenDD from DaoDien where TenDD like @tendd)
	begin
		insert into DaoDien(TenDD) values (@tendd)
	end
	--nếu thêm vào 1 phim mới, tạo 1 bản ghi mới và khi đó maBP của phim đó sẽ đc thêm
	if not exists(select TenBP from BoPhim where TenBP like @tenbp)
	begin
		insert into BoPhim(TenBP,PhimBo,MaDD) values (@tenbp,@phimbo,(
			select MaDD from DaoDien where TenDD = @tendd
		))
	end
	set @maBP = (select MaBP from BoPhim where TenBP like @tenbp)
	-- có nhiều mã quốc gia, cắt từng tên theo dấu ','
	set @maqg = @maqg + ','
	while (CHARINDEX(',',@maqg) > 0)
	begin
		
		declare @ma nvarchar(500)
		set @ma = LEFT(@maqg,CHARINDEX(',',@maqg)-1)	
		if not exists(select * from QuocGia_BoPhim where MaQG = cast(@ma as int) and MaBP = @maBP)
		begin
			insert into QuocGia_BoPhim(MaBP,MaQG) values (@maBP,@ma)
		end
		set @maqg = stuff(@maqg,1,CHARINDEX(',',@maqg),'')
	end 
	-- có nhiều mã thể loại, cắt từng tên theo dấu ','
	set @matl = @matl + ','
	while (CHARINDEX(',',@matl) > 0)
	begin
		
		declare @ma1 nvarchar(500)
		set @ma1 = LEFT(@matl,CHARINDEX(',',@matl)-1)
		if not exists(select * from TheLoai_BoPhim where MaBP = @maBP and MaTL = cast(@ma1 as int))
		begin
			insert into TheLoai_BoPhim(MaBP,MaTL) values (@maBP,@ma1)
		end
		set @matl = stuff(@matl,1,CHARINDEX(',',@matl),'')
	end 
	-- có nhiều mã nhà xuất bản, cắt từng tên theo dấu ','
	set @manxb = @manxb + ','
	while (CHARINDEX(',',@manxb) > 0)
	begin
		
		declare @ma2 nvarchar(500)
		set @ma2 = LEFT(@manxb,CHARINDEX(',',@manxb)-1)
		if not exists(select * from NSX_BoPhim where MaBP = @maBP and MaNSX = cast(@ma2 as int))
		begin
			insert into NSX_BoPhim(MaBP,MaNSX) values (@maBP,@ma2)
		end
		set @manxb = stuff(@manxb,1,CHARINDEX(',',@manxb),'')
	end 
end
GO
/****** Object:  StoredProcedure [dbo].[ThemPhanPhim]    Script Date: 9/10/2020 2:22:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ThemPhanPhim](
	@MaPhim nvarchar(max),
	@TenPhim nvarchar(max),
	@ThoiLuong nvarchar(max),
	@Tap int,
	@NamXB datetime,
	@LinkAnh nvarchar(max),
	@PhimVip int,
	@MaBP int
)
as begin
	if not exists(select * from PhanPhim where MaPhim like @MaPhim or TenPhim like @TenPhim)
	begin
		insert into PhanPhim(MaPhim,TenPhim,ThoiLuong,Tap,NamXB,LinkAnh,PhimVip,MaBP) values(@MaPhim,@TenPhim,@ThoiLuong,@Tap,@NamXB,@LinkAnh,@PhimVip,@MaBP);
	end
end
GO
USE [master]
GO
ALTER DATABASE [OneMovie] SET  READ_WRITE 
GO
