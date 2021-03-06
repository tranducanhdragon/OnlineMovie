USE [OneMovie]
GO
/****** Object:  Table [dbo].[BinhLuan]    Script Date: 9/23/2020 10:28:51 AM ******/
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
/****** Object:  Table [dbo].[BoPhim]    Script Date: 9/23/2020 10:28:51 AM ******/
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
/****** Object:  Table [dbo].[DanhGia]    Script Date: 9/23/2020 10:28:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhGia](
	[TaiKhoan] [nchar](50) NULL,
	[MaPhim] [nvarchar](max) NULL,
	[SoDiem] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DaoDien]    Script Date: 9/23/2020 10:28:51 AM ******/
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
/****** Object:  Table [dbo].[DienVien]    Script Date: 9/23/2020 10:28:51 AM ******/
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
/****** Object:  Table [dbo].[DienVien_PhanPhim]    Script Date: 9/23/2020 10:28:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DienVien_PhanPhim](
	[MaDV] [int] NULL,
	[MaPP] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GoiVip]    Script Date: 9/23/2020 10:28:51 AM ******/
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
/****** Object:  Table [dbo].[LichSuXem]    Script Date: 9/23/2020 10:28:51 AM ******/
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
/****** Object:  Table [dbo].[LuuPhim]    Script Date: 9/23/2020 10:28:51 AM ******/
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
/****** Object:  Table [dbo].[MuaVip]    Script Date: 9/23/2020 10:28:51 AM ******/
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
/****** Object:  Table [dbo].[NSX]    Script Date: 9/23/2020 10:28:51 AM ******/
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
/****** Object:  Table [dbo].[NSX_BoPhim]    Script Date: 9/23/2020 10:28:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NSX_BoPhim](
	[MaNSX] [int] NULL,
	[MaBP] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanHoi]    Script Date: 9/23/2020 10:28:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanHoi](
	[TaiKhoan] [nchar](50) NULL,
	[NoiDung] [nvarchar](max) NULL,
	[ThoiGian] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanPhim]    Script Date: 9/23/2020 10:28:51 AM ******/
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
/****** Object:  Table [dbo].[QuocGia]    Script Date: 9/23/2020 10:28:51 AM ******/
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
/****** Object:  Table [dbo].[QuocGia_BoPhim]    Script Date: 9/23/2020 10:28:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuocGia_BoPhim](
	[MaQG] [int] NULL,
	[MaBP] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 9/23/2020 10:28:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[TaiKhoan] [nchar](50) NOT NULL,
	[MatKhau] [nchar](50) NULL,
	[LoaiTK] [int] NULL,
 CONSTRAINT [PK_TaiKhoanUser] PRIMARY KEY CLUSTERED 
(
	[TaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TheLoai]    Script Date: 9/23/2020 10:28:51 AM ******/
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
/****** Object:  Table [dbo].[TheLoai_BoPhim]    Script Date: 9/23/2020 10:28:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheLoai_BoPhim](
	[MaTL] [int] NULL,
	[MaBP] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThongTinKhachHang]    Script Date: 9/23/2020 10:28:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongTinKhachHang](
	[HoTen] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[NgaySinh] [datetime] NULL,
	[TaiKhoan] [nchar](50) NULL,
	[SDT] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BoPhim] ON 

INSERT [dbo].[BoPhim] ([MaBP], [TenBP], [PhimBo], [MaDD]) VALUES (1, N'Harry Potter', 1, 1)
INSERT [dbo].[BoPhim] ([MaBP], [TenBP], [PhimBo], [MaDD]) VALUES (2, N'Doctor Strange', 0, 2)
INSERT [dbo].[BoPhim] ([MaBP], [TenBP], [PhimBo], [MaDD]) VALUES (3, N'CoCo', 0, 3)
INSERT [dbo].[BoPhim] ([MaBP], [TenBP], [PhimBo], [MaDD]) VALUES (4, N'Titanic', 0, 4)
INSERT [dbo].[BoPhim] ([MaBP], [TenBP], [PhimBo], [MaDD]) VALUES (5, N'World War Z', 0, 5)
SET IDENTITY_INSERT [dbo].[BoPhim] OFF
GO
SET IDENTITY_INSERT [dbo].[DaoDien] ON 

INSERT [dbo].[DaoDien] ([MaDD], [TenDD]) VALUES (1, N'J. K. Rowling')
INSERT [dbo].[DaoDien] ([MaDD], [TenDD]) VALUES (2, N'Sam Raimi')
INSERT [dbo].[DaoDien] ([MaDD], [TenDD]) VALUES (3, N'Adrian Molina')
INSERT [dbo].[DaoDien] ([MaDD], [TenDD]) VALUES (4, N'James Cameron')
INSERT [dbo].[DaoDien] ([MaDD], [TenDD]) VALUES (5, N'Marc Forster')
SET IDENTITY_INSERT [dbo].[DaoDien] OFF
GO
SET IDENTITY_INSERT [dbo].[DienVien] ON 

INSERT [dbo].[DienVien] ([MaDV], [TenDV]) VALUES (1, N'Daniel Radcliffe')
INSERT [dbo].[DienVien] ([MaDV], [TenDV]) VALUES (2, N'Rupert Grint')
INSERT [dbo].[DienVien] ([MaDV], [TenDV]) VALUES (3, N'Emma Watson')
INSERT [dbo].[DienVien] ([MaDV], [TenDV]) VALUES (4, N'Benedict Cumberbatch')
INSERT [dbo].[DienVien] ([MaDV], [TenDV]) VALUES (5, N'Leonardo DiCaprio')
INSERT [dbo].[DienVien] ([MaDV], [TenDV]) VALUES (6, N'Kate Winslet')
INSERT [dbo].[DienVien] ([MaDV], [TenDV]) VALUES (7, N'Brad Pitt')
SET IDENTITY_INSERT [dbo].[DienVien] OFF
GO
INSERT [dbo].[DienVien_PhanPhim] ([MaDV], [MaPP]) VALUES (1, N'18zG0QywU40O8NJ-3nSjSKLWP5CRf9KG4')
INSERT [dbo].[DienVien_PhanPhim] ([MaDV], [MaPP]) VALUES (2, N'18zG0QywU40O8NJ-3nSjSKLWP5CRf9KG4')
INSERT [dbo].[DienVien_PhanPhim] ([MaDV], [MaPP]) VALUES (3, N'18zG0QywU40O8NJ-3nSjSKLWP5CRf9KG4')
INSERT [dbo].[DienVien_PhanPhim] ([MaDV], [MaPP]) VALUES (1, N'1fEQBeg_EUcyVdfUw1r5-NMqoo0H0L79D')
INSERT [dbo].[DienVien_PhanPhim] ([MaDV], [MaPP]) VALUES (2, N'1fEQBeg_EUcyVdfUw1r5-NMqoo0H0L79D')
INSERT [dbo].[DienVien_PhanPhim] ([MaDV], [MaPP]) VALUES (3, N'1fEQBeg_EUcyVdfUw1r5-NMqoo0H0L79D')
INSERT [dbo].[DienVien_PhanPhim] ([MaDV], [MaPP]) VALUES (1, N'1a1u4VbiD6AfVFRzStFF2rU0xHk5uL-_u')
INSERT [dbo].[DienVien_PhanPhim] ([MaDV], [MaPP]) VALUES (2, N'1a1u4VbiD6AfVFRzStFF2rU0xHk5uL-_u')
INSERT [dbo].[DienVien_PhanPhim] ([MaDV], [MaPP]) VALUES (3, N'1a1u4VbiD6AfVFRzStFF2rU0xHk5uL-_u')
INSERT [dbo].[DienVien_PhanPhim] ([MaDV], [MaPP]) VALUES (1, N'1rUfioMB6Xk5uQf1QooYIk_qGCM8Pu8Pv')
INSERT [dbo].[DienVien_PhanPhim] ([MaDV], [MaPP]) VALUES (2, N'1rUfioMB6Xk5uQf1QooYIk_qGCM8Pu8Pv')
INSERT [dbo].[DienVien_PhanPhim] ([MaDV], [MaPP]) VALUES (3, N'1rUfioMB6Xk5uQf1QooYIk_qGCM8Pu8Pv')
INSERT [dbo].[DienVien_PhanPhim] ([MaDV], [MaPP]) VALUES (1, N'1byZv5KLxObxK-5IRaXOwBSNZ9g5c0pH1')
INSERT [dbo].[DienVien_PhanPhim] ([MaDV], [MaPP]) VALUES (2, N'1byZv5KLxObxK-5IRaXOwBSNZ9g5c0pH1')
INSERT [dbo].[DienVien_PhanPhim] ([MaDV], [MaPP]) VALUES (3, N'1byZv5KLxObxK-5IRaXOwBSNZ9g5c0pH1')
INSERT [dbo].[DienVien_PhanPhim] ([MaDV], [MaPP]) VALUES (4, N'1xS6IzfFZZst0eltx2XpNQ6fuZEMgAfr2')
INSERT [dbo].[DienVien_PhanPhim] ([MaDV], [MaPP]) VALUES (5, N'1SrAEmq_hnjk9-jr0BdgOQNzk8PTm6I05')
INSERT [dbo].[DienVien_PhanPhim] ([MaDV], [MaPP]) VALUES (6, N'1SrAEmq_hnjk9-jr0BdgOQNzk8PTm6I05')
INSERT [dbo].[DienVien_PhanPhim] ([MaDV], [MaPP]) VALUES (7, N'109sIMTKAqJXv3bs1FjQoV9X6a4scfBcP')
INSERT [dbo].[DienVien_PhanPhim] ([MaDV], [MaPP]) VALUES (1, N'1TCw48uMd7wBTpBw8LrWrmzVyNOUev4ww')
INSERT [dbo].[DienVien_PhanPhim] ([MaDV], [MaPP]) VALUES (2, N'1TCw48uMd7wBTpBw8LrWrmzVyNOUev4ww')
INSERT [dbo].[DienVien_PhanPhim] ([MaDV], [MaPP]) VALUES (3, N'1TCw48uMd7wBTpBw8LrWrmzVyNOUev4ww')
INSERT [dbo].[DienVien_PhanPhim] ([MaDV], [MaPP]) VALUES (1, N'1cMT-0APPmmrsFlo3zZSm33qGFfrV-YQF')
INSERT [dbo].[DienVien_PhanPhim] ([MaDV], [MaPP]) VALUES (2, N'1cMT-0APPmmrsFlo3zZSm33qGFfrV-YQF')
INSERT [dbo].[DienVien_PhanPhim] ([MaDV], [MaPP]) VALUES (3, N'1cMT-0APPmmrsFlo3zZSm33qGFfrV-YQF')
INSERT [dbo].[DienVien_PhanPhim] ([MaDV], [MaPP]) VALUES (1, N'1OPWOJnZ8nluA-RtJ7VH4u8N3_I5SLoMu')
INSERT [dbo].[DienVien_PhanPhim] ([MaDV], [MaPP]) VALUES (2, N'1OPWOJnZ8nluA-RtJ7VH4u8N3_I5SLoMu')
INSERT [dbo].[DienVien_PhanPhim] ([MaDV], [MaPP]) VALUES (3, N'1OPWOJnZ8nluA-RtJ7VH4u8N3_I5SLoMu')
GO
SET IDENTITY_INSERT [dbo].[NSX] ON 

INSERT [dbo].[NSX] ([MaNSX], [TenNSX]) VALUES (1, N'Heyday Films')
INSERT [dbo].[NSX] ([MaNSX], [TenNSX]) VALUES (2, N'Marvel Studios')
INSERT [dbo].[NSX] ([MaNSX], [TenNSX]) VALUES (3, N'Walt Disney')
INSERT [dbo].[NSX] ([MaNSX], [TenNSX]) VALUES (4, N'Pixar')
INSERT [dbo].[NSX] ([MaNSX], [TenNSX]) VALUES (5, N'20th Century Studios')
INSERT [dbo].[NSX] ([MaNSX], [TenNSX]) VALUES (6, N'‎Plan B Entertainment')
SET IDENTITY_INSERT [dbo].[NSX] OFF
GO
INSERT [dbo].[NSX_BoPhim] ([MaNSX], [MaBP]) VALUES (1, 1)
INSERT [dbo].[NSX_BoPhim] ([MaNSX], [MaBP]) VALUES (2, 2)
INSERT [dbo].[NSX_BoPhim] ([MaNSX], [MaBP]) VALUES (3, 3)
INSERT [dbo].[NSX_BoPhim] ([MaNSX], [MaBP]) VALUES (4, 3)
INSERT [dbo].[NSX_BoPhim] ([MaNSX], [MaBP]) VALUES (5, 4)
INSERT [dbo].[NSX_BoPhim] ([MaNSX], [MaBP]) VALUES (6, 4)
GO
INSERT [dbo].[PhanPhim] ([MaPhim], [TenPhim], [ThoiLuong], [Tap], [NamXB], [DanhGia], [LuotXem], [LinkAnh], [PhimVip], [MaBP]) VALUES (N'18zG0QywU40O8NJ-3nSjSKLWP5CRf9KG4', N'Harry Potter And The Sorcerers Stone', N'2 giờ 38 phút', 1, CAST(N'2001-01-01T00:00:00.000' AS DateTime), 5, 0, NULL, 0, 1)
INSERT [dbo].[PhanPhim] ([MaPhim], [TenPhim], [ThoiLuong], [Tap], [NamXB], [DanhGia], [LuotXem], [LinkAnh], [PhimVip], [MaBP]) VALUES (N'1fEQBeg_EUcyVdfUw1r5-NMqoo0H0L79D', N'Harry Potter and the Chamber of Secrets', N'2 giờ 54 phút', 2, CAST(N'2002-01-01T00:00:00.000' AS DateTime), 5, 0, NULL, 0, 1)
INSERT [dbo].[PhanPhim] ([MaPhim], [TenPhim], [ThoiLuong], [Tap], [NamXB], [DanhGia], [LuotXem], [LinkAnh], [PhimVip], [MaBP]) VALUES (N'1a1u4VbiD6AfVFRzStFF2rU0xHk5uL-_u', N'Harry Potter and the Prisoner of Azkaban', N'2 giờ 21 phút', 3, CAST(N'2004-01-01T00:00:00.000' AS DateTime), 5, 0, NULL, 0, 1)
INSERT [dbo].[PhanPhim] ([MaPhim], [TenPhim], [ThoiLuong], [Tap], [NamXB], [DanhGia], [LuotXem], [LinkAnh], [PhimVip], [MaBP]) VALUES (N'1rUfioMB6Xk5uQf1QooYIk_qGCM8Pu8Pv', N'Harry Potter and the Goblet of Fire', N'2 giờ 37 phút', 4, CAST(N'2005-01-01T00:00:00.000' AS DateTime), 5, 0, NULL, 0, 1)
INSERT [dbo].[PhanPhim] ([MaPhim], [TenPhim], [ThoiLuong], [Tap], [NamXB], [DanhGia], [LuotXem], [LinkAnh], [PhimVip], [MaBP]) VALUES (N'1byZv5KLxObxK-5IRaXOwBSNZ9g5c0pH1', N'Harry Potter and the Order of the Phoenix', N'2 giờ 18 phút', 5, CAST(N'2007-01-01T00:00:00.000' AS DateTime), 5, 0, NULL, 0, 1)
INSERT [dbo].[PhanPhim] ([MaPhim], [TenPhim], [ThoiLuong], [Tap], [NamXB], [DanhGia], [LuotXem], [LinkAnh], [PhimVip], [MaBP]) VALUES (N'1TCw48uMd7wBTpBw8LrWrmzVyNOUev4ww', N'Harry Potter and the Half Blood Prince', N'2 giờ 33 phút', 6, CAST(N'2009-01-01T00:00:00.000' AS DateTime), 5, 0, NULL, 0, 1)
INSERT [dbo].[PhanPhim] ([MaPhim], [TenPhim], [ThoiLuong], [Tap], [NamXB], [DanhGia], [LuotXem], [LinkAnh], [PhimVip], [MaBP]) VALUES (N'1cMT-0APPmmrsFlo3zZSm33qGFfrV-YQF', N'Harry Potter and the Deathly Hallows Part 1', N'2 giờ 26 phút', 7, CAST(N'2010-01-01T00:00:00.000' AS DateTime), 5, 0, NULL, 0, 1)
INSERT [dbo].[PhanPhim] ([MaPhim], [TenPhim], [ThoiLuong], [Tap], [NamXB], [DanhGia], [LuotXem], [LinkAnh], [PhimVip], [MaBP]) VALUES (N'1OPWOJnZ8nluA-RtJ7VH4u8N3_I5SLoMu', N'Harry Potter and the Deathly Hallows Part 2', N'2 giờ 10 phút', 8, CAST(N'2011-01-01T00:00:00.000' AS DateTime), 5, 0, NULL, 0, 1)
INSERT [dbo].[PhanPhim] ([MaPhim], [TenPhim], [ThoiLuong], [Tap], [NamXB], [DanhGia], [LuotXem], [LinkAnh], [PhimVip], [MaBP]) VALUES (N'1xS6IzfFZZst0eltx2XpNQ6fuZEMgAfr2', N'Doctor Strange', N'1 giờ 55 phút', 1, CAST(N'2016-01-01T00:00:00.000' AS DateTime), 4, 0, NULL, 0, 2)
INSERT [dbo].[PhanPhim] ([MaPhim], [TenPhim], [ThoiLuong], [Tap], [NamXB], [DanhGia], [LuotXem], [LinkAnh], [PhimVip], [MaBP]) VALUES (N'1gaVk4rTrmi-IGu8NhGy_0VChS5vmB0Wl', N'CoCo - Sự hội ngộ diệu kỳ', N'1 giờ 45 phút', 1, CAST(N'2017-01-01T00:00:00.000' AS DateTime), 5, 0, NULL, 0, 3)
INSERT [dbo].[PhanPhim] ([MaPhim], [TenPhim], [ThoiLuong], [Tap], [NamXB], [DanhGia], [LuotXem], [LinkAnh], [PhimVip], [MaBP]) VALUES (N'1SrAEmq_hnjk9-jr0BdgOQNzk8PTm6I05', N'Titanic', N'3 giờ 15 phút', 1, CAST(N'1997-01-01T00:00:00.000' AS DateTime), 5, 0, NULL, 0, 4)
INSERT [dbo].[PhanPhim] ([MaPhim], [TenPhim], [ThoiLuong], [Tap], [NamXB], [DanhGia], [LuotXem], [LinkAnh], [PhimVip], [MaBP]) VALUES (N'109sIMTKAqJXv3bs1FjQoV9X6a4scfBcP', N'World War Z', N'2 giờ 03 phút', 1, CAST(N'2013-01-01T00:00:00.000' AS DateTime), 4, 0, NULL, 0, 5)
GO
SET IDENTITY_INSERT [dbo].[QuocGia] ON 

INSERT [dbo].[QuocGia] ([MaQG], [TenQG]) VALUES (1, N'Anh')
INSERT [dbo].[QuocGia] ([MaQG], [TenQG]) VALUES (2, N'Hoa Kỳ - Mỹ')
INSERT [dbo].[QuocGia] ([MaQG], [TenQG]) VALUES (3, N'Việt Nam')
INSERT [dbo].[QuocGia] ([MaQG], [TenQG]) VALUES (4, N'Nhật Bản')
INSERT [dbo].[QuocGia] ([MaQG], [TenQG]) VALUES (5, N'Pháp')
INSERT [dbo].[QuocGia] ([MaQG], [TenQG]) VALUES (6, N'Hàn Quốc')
INSERT [dbo].[QuocGia] ([MaQG], [TenQG]) VALUES (7, N'Trung Quốc')
INSERT [dbo].[QuocGia] ([MaQG], [TenQG]) VALUES (8, N'Ấn Độ')
INSERT [dbo].[QuocGia] ([MaQG], [TenQG]) VALUES (9, N'Hồng Không')
INSERT [dbo].[QuocGia] ([MaQG], [TenQG]) VALUES (10, N'Đài Loan')
SET IDENTITY_INSERT [dbo].[QuocGia] OFF
GO
INSERT [dbo].[QuocGia_BoPhim] ([MaQG], [MaBP]) VALUES (1, 1)
INSERT [dbo].[QuocGia_BoPhim] ([MaQG], [MaBP]) VALUES (2, 1)
INSERT [dbo].[QuocGia_BoPhim] ([MaQG], [MaBP]) VALUES (2, 2)
INSERT [dbo].[QuocGia_BoPhim] ([MaQG], [MaBP]) VALUES (1, 3)
INSERT [dbo].[QuocGia_BoPhim] ([MaQG], [MaBP]) VALUES (1, 4)
INSERT [dbo].[QuocGia_BoPhim] ([MaQG], [MaBP]) VALUES (1, 5)
GO
SET IDENTITY_INSERT [dbo].[TheLoai] ON 

INSERT [dbo].[TheLoai] ([MaTL], [TenTL]) VALUES (1, N'Khoa học viễn tưởng')
INSERT [dbo].[TheLoai] ([MaTL], [TenTL]) VALUES (2, N'Tiểu thuyết - Kịch')
INSERT [dbo].[TheLoai] ([MaTL], [TenTL]) VALUES (3, N'Hài hước')
INSERT [dbo].[TheLoai] ([MaTL], [TenTL]) VALUES (4, N'Kinh Dị')
INSERT [dbo].[TheLoai] ([MaTL], [TenTL]) VALUES (5, N'Cổ trang')
INSERT [dbo].[TheLoai] ([MaTL], [TenTL]) VALUES (6, N'Hành Động')
INSERT [dbo].[TheLoai] ([MaTL], [TenTL]) VALUES (7, N'Tình Cảm')
INSERT [dbo].[TheLoai] ([MaTL], [TenTL]) VALUES (8, N'Lịch sử')
INSERT [dbo].[TheLoai] ([MaTL], [TenTL]) VALUES (9, N'Hoạt hình')
INSERT [dbo].[TheLoai] ([MaTL], [TenTL]) VALUES (10, N'Gia Đình')
INSERT [dbo].[TheLoai] ([MaTL], [TenTL]) VALUES (11, N'Võ thuật')
INSERT [dbo].[TheLoai] ([MaTL], [TenTL]) VALUES (12, N'Chiến tranh')
INSERT [dbo].[TheLoai] ([MaTL], [TenTL]) VALUES (13, N'Hình sự')
INSERT [dbo].[TheLoai] ([MaTL], [TenTL]) VALUES (14, N'Bí ẩn - Siêu nhiên')
INSERT [dbo].[TheLoai] ([MaTL], [TenTL]) VALUES (15, N'Người lớn (18+)')
SET IDENTITY_INSERT [dbo].[TheLoai] OFF
GO
INSERT [dbo].[TheLoai_BoPhim] ([MaTL], [MaBP]) VALUES (1, 1)
INSERT [dbo].[TheLoai_BoPhim] ([MaTL], [MaBP]) VALUES (2, 1)
INSERT [dbo].[TheLoai_BoPhim] ([MaTL], [MaBP]) VALUES (3, 1)
INSERT [dbo].[TheLoai_BoPhim] ([MaTL], [MaBP]) VALUES (4, 1)
INSERT [dbo].[TheLoai_BoPhim] ([MaTL], [MaBP]) VALUES (5, 1)
INSERT [dbo].[TheLoai_BoPhim] ([MaTL], [MaBP]) VALUES (1, 2)
INSERT [dbo].[TheLoai_BoPhim] ([MaTL], [MaBP]) VALUES (6, 2)
INSERT [dbo].[TheLoai_BoPhim] ([MaTL], [MaBP]) VALUES (11, 2)
INSERT [dbo].[TheLoai_BoPhim] ([MaTL], [MaBP]) VALUES (14, 2)
INSERT [dbo].[TheLoai_BoPhim] ([MaTL], [MaBP]) VALUES (9, 3)
INSERT [dbo].[TheLoai_BoPhim] ([MaTL], [MaBP]) VALUES (14, 3)
INSERT [dbo].[TheLoai_BoPhim] ([MaTL], [MaBP]) VALUES (10, 3)
INSERT [dbo].[TheLoai_BoPhim] ([MaTL], [MaBP]) VALUES (7, 3)
INSERT [dbo].[TheLoai_BoPhim] ([MaTL], [MaBP]) VALUES (2, 4)
INSERT [dbo].[TheLoai_BoPhim] ([MaTL], [MaBP]) VALUES (7, 4)
INSERT [dbo].[TheLoai_BoPhim] ([MaTL], [MaBP]) VALUES (8, 4)
INSERT [dbo].[TheLoai_BoPhim] ([MaTL], [MaBP]) VALUES (15, 4)
INSERT [dbo].[TheLoai_BoPhim] ([MaTL], [MaBP]) VALUES (1, 4)
INSERT [dbo].[TheLoai_BoPhim] ([MaTL], [MaBP]) VALUES (4, 4)
INSERT [dbo].[TheLoai_BoPhim] ([MaTL], [MaBP]) VALUES (6, 4)
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
ALTER TABLE [dbo].[DanhGia]  WITH CHECK ADD  CONSTRAINT [FK_DanhGia_TaiKhoan] FOREIGN KEY([TaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([TaiKhoan])
GO
ALTER TABLE [dbo].[DanhGia] CHECK CONSTRAINT [FK_DanhGia_TaiKhoan]
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
ALTER TABLE [dbo].[PhanHoi]  WITH CHECK ADD  CONSTRAINT [FK_PhanHoi_TaiKhoan] FOREIGN KEY([TaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([TaiKhoan])
GO
ALTER TABLE [dbo].[PhanHoi] CHECK CONSTRAINT [FK_PhanHoi_TaiKhoan]
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
/****** Object:  StoredProcedure [dbo].[ThemBoPhim]    Script Date: 9/23/2020 10:28:52 AM ******/
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
/****** Object:  StoredProcedure [dbo].[ThemPhanPhim]    Script Date: 9/23/2020 10:28:52 AM ******/
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
