USE [master]
GO
/****** Object:  Database [QLBH]    Script Date: 12/20/2022 11:29:06 PM ******/
CREATE DATABASE [QLBH]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLBH', FILENAME = N'D:\.Studio\SQL 2019\MSSQL15.MSSQLSERVER\MSSQL\DATA\QLBH.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLBH_log', FILENAME = N'D:\.Studio\SQL 2019\MSSQL15.MSSQLSERVER\MSSQL\DATA\QLBH_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QLBH] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLBH].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLBH] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLBH] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLBH] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLBH] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLBH] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLBH] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QLBH] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLBH] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLBH] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLBH] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLBH] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLBH] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLBH] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLBH] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLBH] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLBH] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLBH] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLBH] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLBH] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLBH] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLBH] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLBH] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLBH] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLBH] SET  MULTI_USER 
GO
ALTER DATABASE [QLBH] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLBH] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLBH] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLBH] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLBH] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLBH] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QLBH] SET QUERY_STORE = OFF
GO
USE [QLBH]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 12/20/2022 11:29:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[HoTen] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](max) NULL,
	[Email] [varchar](100) NULL,
	[SoDT] [char](10) NULL,
	[Role] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 12/20/2022 11:29:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](20) NULL,
	[Password] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 12/20/2022 11:29:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[ChiTiet] [nvarchar](50) NULL,
	[MaHD] [int] NOT NULL,
	[MaMH] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC,
	[MaMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 12/20/2022 11:29:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[CmtID] [int] IDENTITY(1,1) NOT NULL,
	[MaMH] [int] NOT NULL,
	[AccountID] [int] NOT NULL,
	[CmtMsg] [nvarchar](max) NULL,
	[CmtDate] [datetime] NULL,
	[ParentID] [int] NULL,
	[DanhGia] [int] NULL,
	[HoTen] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CmtID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 12/20/2022 11:29:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [int] IDENTITY(1,1) NOT NULL,
	[Ngay] [datetime] NULL,
	[SoLuong] [int] NULL,
	[TongTien] [float] NULL,
	[ChiTiet] [nvarchar](max) NULL,
	[MaPT] [int] NOT NULL,
	[AccountID] [int] NOT NULL,
	[VoucherID] [int] NULL,
	[TinhTrang] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhuyenMai]    Script Date: 12/20/2022 11:29:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhuyenMai](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[GiaGiam] [int] NOT NULL,
	[Loai] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiMH]    Script Date: 12/20/2022 11:29:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiMH](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MatHang]    Script Date: 12/20/2022 11:29:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MatHang](
	[MaMH] [int] IDENTITY(1,1) NOT NULL,
	[DonGia] [float] NOT NULL,
	[TenMH] [nvarchar](50) NOT NULL,
	[MoTa] [nvarchar](max) NULL,
	[HinhChinh] [nvarchar](max) NULL,
	[Hinh1] [nvarchar](max) NULL,
	[Hinh2] [nvarchar](max) NULL,
	[Hinh3] [nvarchar](max) NULL,
	[Hinh4] [nvarchar](max) NULL,
	[Size] [char](5) NULL,
	[SoLuong] [int] NULL,
	[MaLoai] [int] NOT NULL,
	[MaKH] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhuongThucThanhToan]    Script Date: 12/20/2022 11:29:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhuongThucThanhToan](
	[MaPT] [int] IDENTITY(1,1) NOT NULL,
	[TenPT] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Voucher]    Script Date: 12/20/2022 11:29:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voucher](
	[VoucherID] [int] IDENTITY(1,1) NOT NULL,
	[MaVoucher] [varchar](50) NOT NULL,
	[TenDot] [nvarchar](50) NOT NULL,
	[SoTienGiam] [float] NOT NULL,
	[LoaiGiamGia] [nvarchar](10) NOT NULL,
	[TinhTrang] [varchar](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([AccountID], [Username], [Password], [HoTen], [DiaChi], [Email], [SoDT], [Role]) VALUES (1, N'SangNee', N'123456', N'PhamCaoSang', N'330', N'kt@gamil.com', N'012391    ', N'User')
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [HoTen], [DiaChi], [Email], [SoDT], [Role]) VALUES (2, N'admin', N'admin', N'AdminBC', NULL, NULL, NULL, N'Admin')
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [HoTen], [DiaChi], [Email], [SoDT], [Role]) VALUES (3, N'SangNeee', N'123456', N'Pham Cao Sang', N'330 BH', N'sangpham170101@gmail.com', N'0582754857', N'User')
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [HoTen], [DiaChi], [Email], [SoDT], [Role]) VALUES (4, N'test1', N'test123', N'QuocTien', N'828 su van hanh', N'19dh110691@st.huflit.edu,vn', N'0123456789', N'User')
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [HoTen], [DiaChi], [Email], [SoDT], [Role]) VALUES (6, N'test2', N'test12', N'QuocTien', N'828 su van hanh', N'19dh110691@st.huflit.edu,vn', N'0123456789', N'User')
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [HoTen], [DiaChi], [Email], [SoDT], [Role]) VALUES (9, N'test3', N'test12', N'QuocTien', N'828 su van hanh', N'19dh110691@st.huflit.edu,vn', N'0123456789', N'User')
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [HoTen], [DiaChi], [Email], [SoDT], [Role]) VALUES (12, N'test4', N'test12', N'QuocTien', N'828 su van hanh', N'19dh110691@st.huflit.edu,vn', N'0123456789', N'User')
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [HoTen], [DiaChi], [Email], [SoDT], [Role]) VALUES (29, N'SangNa', N'123456', N'Pham Cao Sang', NULL, N'kt_windy09@yahoo.com', N'0582754857', N'User')
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [HoTen], [DiaChi], [Email], [SoDT], [Role]) VALUES (30, N'SangNaa', N'123456', N'Pham Cao Sang', NULL, N'kt_windy09@yahoo.com', N'0582754857', N'User')
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [HoTen], [DiaChi], [Email], [SoDT], [Role]) VALUES (31, N'SangNaaaaa', N'123456', N'Pham Cao Sang', NULL, N'kt_windy09@yahoo.com', N'0582754857', N'User')
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [HoTen], [DiaChi], [Email], [SoDT], [Role]) VALUES (32, N'SangNae', N'123456', N'Pham Cao Sang', NULL, N'kt_windy09@yahoo.com', N'0582754857', N'User')
INSERT [dbo].[Account] ([AccountID], [Username], [Password], [HoTen], [DiaChi], [Email], [SoDT], [Role]) VALUES (33, N'SangNea', N'123456', N'Pham Cao Sang', NULL, N'kt_windy09@yahoo.com', N'0582754857', N'User')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([AdminID], [Username], [Password]) VALUES (1, N'admin', N'admin')
SET IDENTITY_INSERT [dbo].[Admin] OFF
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([CmtID], [MaMH], [AccountID], [CmtMsg], [CmtDate], [ParentID], [DanhGia], [HoTen]) VALUES (19, 7, 3, N'Nhuc Nach', CAST(N'2022-11-20T05:48:22.787' AS DateTime), NULL, 2, N'Pham Cao Sang')
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([MaHD], [Ngay], [SoLuong], [TongTien], [ChiTiet], [MaPT], [AccountID], [VoucherID], [TinhTrang]) VALUES (2, CAST(N'2022-11-11T20:55:40.343' AS DateTime), 2, 342000, N'7:2:3', 1, 1, NULL, 1)
INSERT [dbo].[HoaDon] ([MaHD], [Ngay], [SoLuong], [TongTien], [ChiTiet], [MaPT], [AccountID], [VoucherID], [TinhTrang]) VALUES (3, CAST(N'2022-11-13T21:14:31.270' AS DateTime), 1, 171000, N'7:1', 1, 1, NULL, 1)
INSERT [dbo].[HoaDon] ([MaHD], [Ngay], [SoLuong], [TongTien], [ChiTiet], [MaPT], [AccountID], [VoucherID], [TinhTrang]) VALUES (11, CAST(N'2022-12-12T04:10:31.557' AS DateTime), 3, 250500, N'7:2-4:1', 2, 1, NULL, 2)
INSERT [dbo].[HoaDon] ([MaHD], [Ngay], [SoLuong], [TongTien], [ChiTiet], [MaPT], [AccountID], [VoucherID], [TinhTrang]) VALUES (12, CAST(N'2022-12-13T22:29:10.250' AS DateTime), 2, 247500, N'7:2', 1, 1, NULL, 2)
INSERT [dbo].[HoaDon] ([MaHD], [Ngay], [SoLuong], [TongTien], [ChiTiet], [MaPT], [AccountID], [VoucherID], [TinhTrang]) VALUES (13, CAST(N'2022-12-13T22:36:41.913' AS DateTime), 1, 119250, N'7:1', 2, 1, NULL, 0)
INSERT [dbo].[HoaDon] ([MaHD], [Ngay], [SoLuong], [TongTien], [ChiTiet], [MaPT], [AccountID], [VoucherID], [TinhTrang]) VALUES (16, CAST(N'2022-12-13T23:06:20.293' AS DateTime), 1, 119250, N'7:1', 2, 1, 4, 2)
INSERT [dbo].[HoaDon] ([MaHD], [Ngay], [SoLuong], [TongTien], [ChiTiet], [MaPT], [AccountID], [VoucherID], [TinhTrang]) VALUES (17, CAST(N'2022-12-13T23:09:47.587' AS DateTime), 1, 128.25, N'7:1', 2, 1, NULL, 2)
INSERT [dbo].[HoaDon] ([MaHD], [Ngay], [SoLuong], [TongTien], [ChiTiet], [MaPT], [AccountID], [VoucherID], [TinhTrang]) VALUES (18, CAST(N'2022-12-13T23:11:13.440' AS DateTime), 1, 128.25, N'7:1', 2, 1, NULL, 2)
INSERT [dbo].[HoaDon] ([MaHD], [Ngay], [SoLuong], [TongTien], [ChiTiet], [MaPT], [AccountID], [VoucherID], [TinhTrang]) VALUES (20, CAST(N'2022-12-13T23:38:14.370' AS DateTime), 3, 346275, N'7:3', 2, 1, 3, 2)
INSERT [dbo].[HoaDon] ([MaHD], [Ngay], [SoLuong], [TongTien], [ChiTiet], [MaPT], [AccountID], [VoucherID], [TinhTrang]) VALUES (30, CAST(N'2022-12-20T05:52:59.117' AS DateTime), 1, 79000, N'53:1', 2, 1, NULL, 2)
INSERT [dbo].[HoaDon] ([MaHD], [Ngay], [SoLuong], [TongTien], [ChiTiet], [MaPT], [AccountID], [VoucherID], [TinhTrang]) VALUES (31, CAST(N'2022-12-20T06:06:10.733' AS DateTime), 1, 76000, N'55:1', 2, 1, 4, 2)
INSERT [dbo].[HoaDon] ([MaHD], [Ngay], [SoLuong], [TongTien], [ChiTiet], [MaPT], [AccountID], [VoucherID], [TinhTrang]) VALUES (32, CAST(N'2022-12-20T06:55:53.387' AS DateTime), 1, 4000, N'4:1', 2, 1, NULL, 0)
INSERT [dbo].[HoaDon] ([MaHD], [Ngay], [SoLuong], [TongTien], [ChiTiet], [MaPT], [AccountID], [VoucherID], [TinhTrang]) VALUES (33, CAST(N'2022-12-20T06:56:56.157' AS DateTime), 4, 513000, N'7:4', 2, 1, NULL, 2)
INSERT [dbo].[HoaDon] ([MaHD], [Ngay], [SoLuong], [TongTien], [ChiTiet], [MaPT], [AccountID], [VoucherID], [TinhTrang]) VALUES (34, CAST(N'2022-12-20T06:57:43.830' AS DateTime), 2, 17000, N'3:2', 2, 1, 4, 2)
INSERT [dbo].[HoaDon] ([MaHD], [Ngay], [SoLuong], [TongTien], [ChiTiet], [MaPT], [AccountID], [VoucherID], [TinhTrang]) VALUES (35, CAST(N'2022-12-20T06:58:06.347' AS DateTime), 6, 15000, N'4:6', 2, 1, 4, 2)
INSERT [dbo].[HoaDon] ([MaHD], [Ngay], [SoLuong], [TongTien], [ChiTiet], [MaPT], [AccountID], [VoucherID], [TinhTrang]) VALUES (36, CAST(N'2022-12-20T07:02:25.700' AS DateTime), 1, 69000, N'54:1', 2, 1, NULL, 2)
INSERT [dbo].[HoaDon] ([MaHD], [Ngay], [SoLuong], [TongTien], [ChiTiet], [MaPT], [AccountID], [VoucherID], [TinhTrang]) VALUES (37, CAST(N'2022-12-20T07:15:49.147' AS DateTime), 5, 45000, N'2:5', 1, 1, 4, 2)
INSERT [dbo].[HoaDon] ([MaHD], [Ngay], [SoLuong], [TongTien], [ChiTiet], [MaPT], [AccountID], [VoucherID], [TinhTrang]) VALUES (38, CAST(N'2022-12-20T07:39:59.853' AS DateTime), 4, 7000, N'4:4', 2, 1, 4, 2)
INSERT [dbo].[HoaDon] ([MaHD], [Ngay], [SoLuong], [TongTien], [ChiTiet], [MaPT], [AccountID], [VoucherID], [TinhTrang]) VALUES (39, CAST(N'2022-12-20T07:42:17.820' AS DateTime), 7, 359775, N'7:1-54:1-52:2-69:3', 1, 1, 3, 2)
INSERT [dbo].[HoaDon] ([MaHD], [Ngay], [SoLuong], [TongTien], [ChiTiet], [MaPT], [AccountID], [VoucherID], [TinhTrang]) VALUES (40, CAST(N'2022-12-20T22:57:20.293' AS DateTime), 1, 69000, N'53:1', 2, 1, 6, 2)
INSERT [dbo].[HoaDon] ([MaHD], [Ngay], [SoLuong], [TongTien], [ChiTiet], [MaPT], [AccountID], [VoucherID], [TinhTrang]) VALUES (41, CAST(N'2022-12-20T22:58:18.233' AS DateTime), 1, 3000, N'3:1', 2, 1, 1, 2)
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
GO
SET IDENTITY_INSERT [dbo].[KhuyenMai] ON 

INSERT [dbo].[KhuyenMai] ([MaKH], [GiaGiam], [Loai]) VALUES (1, 10, N'phantram')
INSERT [dbo].[KhuyenMai] ([MaKH], [GiaGiam], [Loai]) VALUES (2, 20, N'phantram')
INSERT [dbo].[KhuyenMai] ([MaKH], [GiaGiam], [Loai]) VALUES (3, 25, N'phantram')
INSERT [dbo].[KhuyenMai] ([MaKH], [GiaGiam], [Loai]) VALUES (4, 30, N'phantram')
INSERT [dbo].[KhuyenMai] ([MaKH], [GiaGiam], [Loai]) VALUES (5, 50, N'phantram')
INSERT [dbo].[KhuyenMai] ([MaKH], [GiaGiam], [Loai]) VALUES (6, 10000, N'nghin')
INSERT [dbo].[KhuyenMai] ([MaKH], [GiaGiam], [Loai]) VALUES (7, 20000, N'nghin')
INSERT [dbo].[KhuyenMai] ([MaKH], [GiaGiam], [Loai]) VALUES (8, 30000, N'nghin')
SET IDENTITY_INSERT [dbo].[KhuyenMai] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiMH] ON 

INSERT [dbo].[LoaiMH] ([MaLoai], [TenLoai]) VALUES (1, N'Gà')
INSERT [dbo].[LoaiMH] ([MaLoai], [TenLoai]) VALUES (2, N'Nước')
INSERT [dbo].[LoaiMH] ([MaLoai], [TenLoai]) VALUES (3, N'Hamburger')
INSERT [dbo].[LoaiMH] ([MaLoai], [TenLoai]) VALUES (4, N'Khoai')
INSERT [dbo].[LoaiMH] ([MaLoai], [TenLoai]) VALUES (5, N'Khác')
INSERT [dbo].[LoaiMH] ([MaLoai], [TenLoai]) VALUES (6, N'Combo')
INSERT [dbo].[LoaiMH] ([MaLoai], [TenLoai]) VALUES (7, N'Kem')
SET IDENTITY_INSERT [dbo].[LoaiMH] OFF
GO
SET IDENTITY_INSERT [dbo].[MatHang] ON 

INSERT [dbo].[MatHang] ([MaMH], [DonGia], [TenMH], [MoTa], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Size], [SoLuong], [MaLoai], [MaKH]) VALUES (6, 15000, N'Khoai Chien Tay', N'Khoaine', N'/Content/Images/Food/KhoaiTayChien.png', N'/Content/Images/Food/KhoaiTayChien.png', N'/Content/Images/Food/KhoaiTayChien.png', N'/Content/Images/Food/KhoaiTayChien.png', N'/Content/Images/Food/KhoaiTayChien.png', N'XL   ', 196, 4, 2)
INSERT [dbo].[MatHang] ([MaMH], [DonGia], [TenMH], [MoTa], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Size], [SoLuong], [MaLoai], [MaKH]) VALUES (7, 171000, N'Couple Set 1', N'02 Gà chiên \n 01 Hamburger \n 01 Khoai tây chiên \n 02 Pepsi (M)', N'/Content/Images/Food/couple set 1.png', N'/Content/Images/Food/couple set 1.png', N'/Content/Images/Food/couple set 1.png', N'/Content/Images/Food/couple set 1.png', N'/Content/Images/Food/couple set 1.png', N'XL   ', -28, 6, 3)
INSERT [dbo].[MatHang] ([MaMH], [DonGia], [TenMH], [MoTa], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Size], [SoLuong], [MaLoai], [MaKH]) VALUES (52, 99000, N'Combo Burger Double Double', N'1 Burger Double Double \n 1 Khoai tây chiên (M) \n 01 Khoai tây chiên \n 1 Pepsi (M)', N'/Content/Images/Food/comboDOUBLEthit.png', NULL, NULL, NULL, NULL, N'XL   ', 68, 6, 3)
INSERT [dbo].[MatHang] ([MaMH], [DonGia], [TenMH], [MoTa], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Size], [SoLuong], [MaLoai], [MaKH]) VALUES (53, 79000, N'Combo Burger Tôm', N'1 Burger Tôm \n 1 Khoai tây chiên (M) \n 1 Pepsi (M)', N'/Content/Images/Food/comboburgerTOM.png', NULL, NULL, NULL, NULL, N'XL   ', 78, 6, NULL)
INSERT [dbo].[MatHang] ([MaMH], [DonGia], [TenMH], [MoTa], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Size], [SoLuong], [MaLoai], [MaKH]) VALUES (54, 69000, N'Combo Burger Phô Mai', N'1 Burger Phô Mai \n 1 Khoai tây chiên (M) \n 1 Pepsi (M)', N'/Content/Images/Food/comboBURGERPHOMAI.png', NULL, NULL, NULL, NULL, N'XL   ', 78, 6, NULL)
INSERT [dbo].[MatHang] ([MaMH], [DonGia], [TenMH], [MoTa], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Size], [SoLuong], [MaLoai], [MaKH]) VALUES (55, 76000, N'Combo Burger Gà Thượng Hạng', N'1 Burger Gà Thượng Hạng \n 1 Khoai tây chiên (M) \n 1 Pepsi (M)', N'/Content/Images/Food/comboburgerGATHUONGHANG.png', NULL, NULL, NULL, NULL, N'XL   ', 79, 6, NULL)
INSERT [dbo].[MatHang] ([MaMH], [DonGia], [TenMH], [MoTa], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Size], [SoLuong], [MaLoai], [MaKH]) VALUES (56, 106000, N'Combo Burger Mozzarella', N'1 Burger Mozzarella \n 1 Khoai tây chiên (M) \n 1 Pepsi (M)', N'/Content/Images/Food/combo_mozzarella.png', NULL, NULL, NULL, NULL, N'XL   ', 50, 6, NULL)
INSERT [dbo].[MatHang] ([MaMH], [DonGia], [TenMH], [MoTa], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Size], [SoLuong], [MaLoai], [MaKH]) VALUES (57, 77000, N'Combo Burger Bulgogi', N'1 Burger Bulgogi \n 1 Khoai tây chiên (M) \n 1 Pepsi (M)', N'/Content/Images/Food/combo_bulgogi_4.png', NULL, NULL, NULL, NULL, N'XL   ', 80, 6, NULL)
INSERT [dbo].[MatHang] ([MaMH], [DonGia], [TenMH], [MoTa], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Size], [SoLuong], [MaLoai], [MaKH]) VALUES (58, 69000, N'Combo Burger Bò Teriyaki', N'1 Burger Bò Teriyaki \n 1 Khoai tây chiên (M) \n 1 Pepsi (M)', N'/Content/Images/Food/combo_beef-teriyaki.png', NULL, NULL, NULL, NULL, N'XL   ', 80, 6, NULL)
INSERT [dbo].[MatHang] ([MaMH], [DonGia], [TenMH], [MoTa], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Size], [SoLuong], [MaLoai], [MaKH]) VALUES (59, 39000, N'Gà Tuyết Vàng', N'1 miếng', N'/Content/Images/Food/Gatuyetvang(1mieng).png', NULL, NULL, NULL, NULL, N'XL   ', 40, 1, NULL)
INSERT [dbo].[MatHang] ([MaMH], [DonGia], [TenMH], [MoTa], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Size], [SoLuong], [MaLoai], [MaKH]) VALUES (60, 115000, N'Gà Tuyết Vàng', N'3 miếng', N'/Content/Images/Food/Gatuyetvang(3mieng).png', NULL, NULL, NULL, NULL, N'XL   ', 30, 1, NULL)
INSERT [dbo].[MatHang] ([MaMH], [DonGia], [TenMH], [MoTa], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Size], [SoLuong], [MaLoai], [MaKH]) VALUES (61, 35000, N'Gà Rán', N'1 miếng', N'/Content/Images/Food/garan(1mieng).png', NULL, NULL, NULL, NULL, N'XL   ', 35, 1, NULL)
INSERT [dbo].[MatHang] ([MaMH], [DonGia], [TenMH], [MoTa], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Size], [SoLuong], [MaLoai], [MaKH]) VALUES (62, 101000, N'Gà Rán', N'3 miếng', N'/Content/Images/Food/garan(3mieng).png', NULL, NULL, NULL, NULL, N'XL   ', 30, 1, NULL)
INSERT [dbo].[MatHang] ([MaMH], [DonGia], [TenMH], [MoTa], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Size], [SoLuong], [MaLoai], [MaKH]) VALUES (63, 40000, N'Gà Sốt HS', N'1 miếng', N'/Content/Images/Food/gasotHS(1mieng).png', NULL, NULL, NULL, NULL, N'XL   ', 50, 1, NULL)
INSERT [dbo].[MatHang] ([MaMH], [DonGia], [TenMH], [MoTa], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Size], [SoLuong], [MaLoai], [MaKH]) VALUES (64, 112000, N'Gà Sốt HS', N'3 miếng', N'/Content/Images/Food/gasotHS(3mieng).png', NULL, NULL, NULL, NULL, N'XL   ', 40, 1, NULL)
INSERT [dbo].[MatHang] ([MaMH], [DonGia], [TenMH], [MoTa], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Size], [SoLuong], [MaLoai], [MaKH]) VALUES (65, 40000, N'Gà Sốt Đậu', N'1 miếng', N'/Content/Images/Food/gasotdau(1mieng).png', NULL, NULL, NULL, NULL, N'XL   ', 50, 1, NULL)
INSERT [dbo].[MatHang] ([MaMH], [DonGia], [TenMH], [MoTa], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Size], [SoLuong], [MaLoai], [MaKH]) VALUES (66, 112000, N'Gà Sốt Đậu', N'3 miếng', N'/Content/Images/Food/gasotdau(3mieng).png', NULL, NULL, NULL, NULL, N'XL   ', 36, 1, NULL)
INSERT [dbo].[MatHang] ([MaMH], [DonGia], [TenMH], [MoTa], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Size], [SoLuong], [MaLoai], [MaKH]) VALUES (67, 40000, N'Gà Sốt Pho Mai', N'1 miếng', N'/Content/Images/Food/gasotphomai(1mieng).png', NULL, NULL, NULL, NULL, N'XL   ', 60, 1, NULL)
INSERT [dbo].[MatHang] ([MaMH], [DonGia], [TenMH], [MoTa], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Size], [SoLuong], [MaLoai], [MaKH]) VALUES (68, 112000, N'Gà Sốt Pho Mai', N'3 miếng', N'/Content/Images/Food/gasotphomai(3mieng).png', NULL, NULL, NULL, NULL, N'XL   ', 40, 1, NULL)
INSERT [dbo].[MatHang] ([MaMH], [DonGia], [TenMH], [MoTa], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Size], [SoLuong], [MaLoai], [MaKH]) VALUES (69, 18000, N'Pepsi', N'L', N'/Content/Images/Food/nuocPEPSI(L).png', NULL, NULL, NULL, NULL, N'L    ', 197, 2, NULL)
INSERT [dbo].[MatHang] ([MaMH], [DonGia], [TenMH], [MoTa], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Size], [SoLuong], [MaLoai], [MaKH]) VALUES (70, 28000, N'Pepsi', N'M', N'/Content/Images/Food/nuocPEPSI(L).png', NULL, NULL, NULL, NULL, N'M    ', 200, 2, NULL)
INSERT [dbo].[MatHang] ([MaMH], [DonGia], [TenMH], [MoTa], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Size], [SoLuong], [MaLoai], [MaKH]) VALUES (71, 18000, N'Mirinda', N'L', N'/Content/Images/Food/nuocMIRINDA(L).png', NULL, NULL, NULL, NULL, N'L    ', 200, 2, NULL)
INSERT [dbo].[MatHang] ([MaMH], [DonGia], [TenMH], [MoTa], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Size], [SoLuong], [MaLoai], [MaKH]) VALUES (72, 28000, N'Mirinda', N'M', N'/Content/Images/Food/nuocMIRINDA(L).png', NULL, NULL, NULL, NULL, N'M    ', 200, 2, NULL)
INSERT [dbo].[MatHang] ([MaMH], [DonGia], [TenMH], [MoTa], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Size], [SoLuong], [MaLoai], [MaKH]) VALUES (73, 27000, N'Nước Cam', N'L', N'/Content/Images/Food/nuocCAM.png', NULL, NULL, NULL, NULL, N'L    ', 200, 2, NULL)
INSERT [dbo].[MatHang] ([MaMH], [DonGia], [TenMH], [MoTa], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Size], [SoLuong], [MaLoai], [MaKH]) VALUES (74, 18000, N'7 UP', N'L', N'/Content/Images/Food/Nuoc7UP(L).png', NULL, NULL, NULL, NULL, N'L    ', 200, 2, NULL)
INSERT [dbo].[MatHang] ([MaMH], [DonGia], [TenMH], [MoTa], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Size], [SoLuong], [MaLoai], [MaKH]) VALUES (75, 28000, N'7 UP', N'M', N'/Content/Images/Food/Nuoc7UP(L).png', NULL, NULL, NULL, NULL, N'M    ', 200, 2, NULL)
INSERT [dbo].[MatHang] ([MaMH], [DonGia], [TenMH], [MoTa], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Size], [SoLuong], [MaLoai], [MaKH]) VALUES (76, 25000, N'nuoc7UPDUADUA', N'L', N'/Content/Images/Food/nuoc7UPDUADUA.png', NULL, NULL, NULL, NULL, N'L    ', 200, 2, NULL)
INSERT [dbo].[MatHang] ([MaMH], [DonGia], [TenMH], [MoTa], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Size], [SoLuong], [MaLoai], [MaKH]) VALUES (77, 25000, N'nuoc7UPDUALUADAO', N'L', N'/Content/Images/Food/nuoc7UPDUALUADAO.png', NULL, NULL, NULL, NULL, N'L    ', 200, 2, NULL)
INSERT [dbo].[MatHang] ([MaMH], [DonGia], [TenMH], [MoTa], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Size], [SoLuong], [MaLoai], [MaKH]) VALUES (78, 48000, N'Burger Tôm', N'', N'/Content/Images/Food/burgerTOM.png', NULL, NULL, NULL, NULL, N'L    ', 150, 3, NULL)
INSERT [dbo].[MatHang] ([MaMH], [DonGia], [TenMH], [MoTa], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Size], [SoLuong], [MaLoai], [MaKH]) VALUES (79, 43000, N'Burger Phô Mai', N'', N'/Content/Images/Food/burgerPHOMAI.png', NULL, NULL, NULL, NULL, N'L    ', 150, 3, NULL)
INSERT [dbo].[MatHang] ([MaMH], [DonGia], [TenMH], [MoTa], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Size], [SoLuong], [MaLoai], [MaKH]) VALUES (80, 48000, N'Burger Gà Thượng Hạng', N'', N'/Content/Images/Food/burgerGATHUONGHANG.png', NULL, NULL, NULL, NULL, N'L    ', 150, 3, NULL)
INSERT [dbo].[MatHang] ([MaMH], [DonGia], [TenMH], [MoTa], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Size], [SoLuong], [MaLoai], [MaKH]) VALUES (81, 40000, N'Burger Cá', N'', N'/Content/Images/Food/burgerCA.png', NULL, NULL, NULL, NULL, N'L    ', 150, 3, NULL)
INSERT [dbo].[MatHang] ([MaMH], [DonGia], [TenMH], [MoTa], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Size], [SoLuong], [MaLoai], [MaKH]) VALUES (82, 85000, N'Burger Mozzarella', N'', N'/Content/Images/Food/burger_mozzarella-burger.png', NULL, NULL, NULL, NULL, N'L    ', 150, 3, NULL)
INSERT [dbo].[MatHang] ([MaMH], [DonGia], [TenMH], [MoTa], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Size], [SoLuong], [MaLoai], [MaKH]) VALUES (83, 70000, N'Burger Double Double', N'', N'/Content/Images/Food/burger_ddouble-burger.png', NULL, NULL, NULL, NULL, N'L    ', 150, 3, NULL)
INSERT [dbo].[MatHang] ([MaMH], [DonGia], [TenMH], [MoTa], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Size], [SoLuong], [MaLoai], [MaKH]) VALUES (84, 46000, N'Burger Bulgogi', N'', N'/Content/Images/Food/burger_bulgogi-burger.png', NULL, NULL, NULL, NULL, N'L    ', 150, 3, NULL)
INSERT [dbo].[MatHang] ([MaMH], [DonGia], [TenMH], [MoTa], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Size], [SoLuong], [MaLoai], [MaKH]) VALUES (85, 43000, N'Burger Bò Teriyaki', N'', N'/Content/Images/Food/burger_beef-teriyaki-burger.png', NULL, NULL, NULL, NULL, N'L    ', 150, 3, NULL)
INSERT [dbo].[MatHang] ([MaMH], [DonGia], [TenMH], [MoTa], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Size], [SoLuong], [MaLoai], [MaKH]) VALUES (86, 39000, N'Khoai Tây Lắc', N'L', N'/Content/Images/Food/khoaitaylac.png', NULL, NULL, NULL, NULL, N'L    ', 200, 4, NULL)
INSERT [dbo].[MatHang] ([MaMH], [DonGia], [TenMH], [MoTa], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Size], [SoLuong], [MaLoai], [MaKH]) VALUES (87, 29000, N'Khoai Tây Chiên', N'M', N'/Content/Images/Food/khoaitaichien(M).png', NULL, NULL, NULL, NULL, N'L    ', 200, 4, NULL)
INSERT [dbo].[MatHang] ([MaMH], [DonGia], [TenMH], [MoTa], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Size], [SoLuong], [MaLoai], [MaKH]) VALUES (88, 35000, N'Phô Mai Que', N'L', N'/Content/Images/Food/phomaique.png', NULL, NULL, NULL, NULL, N'L    ', 200, 5, NULL)
INSERT [dbo].[MatHang] ([MaMH], [DonGia], [TenMH], [MoTa], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Size], [SoLuong], [MaLoai], [MaKH]) VALUES (89, 31000, N'Gà Xiên Que', N'1 que', N'/Content/Images/Food/gaxienque.png', NULL, NULL, NULL, NULL, N'M    ', 100, 4, NULL)
INSERT [dbo].[MatHang] ([MaMH], [DonGia], [TenMH], [MoTa], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Size], [SoLuong], [MaLoai], [MaKH]) VALUES (90, 50000, N'Phô Mai Que', N'2 que', N'/Content/Images/Food/gaxienque(2que).png', NULL, NULL, NULL, NULL, N'L    ', 100, 5, NULL)
INSERT [dbo].[MatHang] ([MaMH], [DonGia], [TenMH], [MoTa], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Size], [SoLuong], [MaLoai], [MaKH]) VALUES (91, 20000, N'Bánh Táo', N'L', N'/Content/Images/Food/banhtao.png', NULL, NULL, NULL, NULL, N'L    ', 70, 5, NULL)
INSERT [dbo].[MatHang] ([MaMH], [DonGia], [TenMH], [MoTa], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Size], [SoLuong], [MaLoai], [MaKH]) VALUES (92, 28000, N'Mực Rán', N'3 miếng', N'/Content/Images/Food/mucran(3mieng).png', NULL, NULL, NULL, NULL, N'M    ', 100, 5, NULL)
INSERT [dbo].[MatHang] ([MaMH], [DonGia], [TenMH], [MoTa], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Size], [SoLuong], [MaLoai], [MaKH]) VALUES (93, 28000, N'Mực Rán', N'3 miếng', N'/Content/Images/Food/mucran(3mieng).png', NULL, NULL, NULL, NULL, N'L    ', 200, 5, NULL)
INSERT [dbo].[MatHang] ([MaMH], [DonGia], [TenMH], [MoTa], [HinhChinh], [Hinh1], [Hinh2], [Hinh3], [Hinh4], [Size], [SoLuong], [MaLoai], [MaKH]) VALUES (94, 43000, N'Gà Lăc', N'M', N'/Content/Images/Food/galac.png', NULL, NULL, NULL, NULL, N'M    ', 200, 5, NULL)
SET IDENTITY_INSERT [dbo].[MatHang] OFF
GO
SET IDENTITY_INSERT [dbo].[PhuongThucThanhToan] ON 

INSERT [dbo].[PhuongThucThanhToan] ([MaPT], [TenPT]) VALUES (1, N'Thanh Toan Truc Tiep')
INSERT [dbo].[PhuongThucThanhToan] ([MaPT], [TenPT]) VALUES (2, N'COD')
INSERT [dbo].[PhuongThucThanhToan] ([MaPT], [TenPT]) VALUES (3, N'Thanh toán trực tiếp')
SET IDENTITY_INSERT [dbo].[PhuongThucThanhToan] OFF
GO
SET IDENTITY_INSERT [dbo].[Voucher] ON 

INSERT [dbo].[Voucher] ([VoucherID], [MaVoucher], [TenDot], [SoTienGiam], [LoaiGiamGia], [TinhTrang]) VALUES (1, N'FDAWelcome', N'Welcome', 10000, N'tructiep', N'Y')
INSERT [dbo].[Voucher] ([VoucherID], [MaVoucher], [TenDot], [SoTienGiam], [LoaiGiamGia], [TinhTrang]) VALUES (2, N'WelcomeNewUser', N'Chao Mung Nguoi Dung Moi', 15000, N'tructiep', N'Y')
INSERT [dbo].[Voucher] ([VoucherID], [MaVoucher], [TenDot], [SoTienGiam], [LoaiGiamGia], [TinhTrang]) VALUES (3, N'FDAEvent', N'Event Mua Dong', 10, N'phantram', N'Y')
INSERT [dbo].[Voucher] ([VoucherID], [MaVoucher], [TenDot], [SoTienGiam], [LoaiGiamGia], [TinhTrang]) VALUES (4, N'FDAWinter', N'Event Mua Dong', 9000, N'tructiep', N'Y')
INSERT [dbo].[Voucher] ([VoucherID], [MaVoucher], [TenDot], [SoTienGiam], [LoaiGiamGia], [TinhTrang]) VALUES (5, N'FDAWinter1', N'Hoi gi', 10000, N'tructiep', N'Z')
INSERT [dbo].[Voucher] ([VoucherID], [MaVoucher], [TenDot], [SoTienGiam], [LoaiGiamGia], [TinhTrang]) VALUES (6, N'WelcomeSangPhem', N'Welcome new user', 10000, N'tructiep', N'X')
INSERT [dbo].[Voucher] ([VoucherID], [MaVoucher], [TenDot], [SoTienGiam], [LoaiGiamGia], [TinhTrang]) VALUES (7, N'WelcomeSangPheem', N'Welcome new user', 10000, N'tructiep', N'Y')
INSERT [dbo].[Voucher] ([VoucherID], [MaVoucher], [TenDot], [SoTienGiam], [LoaiGiamGia], [TinhTrang]) VALUES (8, N'WelcomeSangPheeem', N'Welcome new user', 10000, N'tructiep', N'Y')
INSERT [dbo].[Voucher] ([VoucherID], [MaVoucher], [TenDot], [SoTienGiam], [LoaiGiamGia], [TinhTrang]) VALUES (9, N'WelcomeSangPheeeemm', N'Welcome new user', 10000, N'tructiep', N'Y')
INSERT [dbo].[Voucher] ([VoucherID], [MaVoucher], [TenDot], [SoTienGiam], [LoaiGiamGia], [TinhTrang]) VALUES (10, N'WelcomeSangNa', N'Welcome new user', 10000, N'tructiep', N'Y')
INSERT [dbo].[Voucher] ([VoucherID], [MaVoucher], [TenDot], [SoTienGiam], [LoaiGiamGia], [TinhTrang]) VALUES (11, N'WelcomeSangNaa', N'Welcome new user', 10000, N'tructiep', N'Y')
INSERT [dbo].[Voucher] ([VoucherID], [MaVoucher], [TenDot], [SoTienGiam], [LoaiGiamGia], [TinhTrang]) VALUES (12, N'WelcomeSangNaaaaa', N'Welcome new user', 10000, N'tructiep', N'Y')
INSERT [dbo].[Voucher] ([VoucherID], [MaVoucher], [TenDot], [SoTienGiam], [LoaiGiamGia], [TinhTrang]) VALUES (13, N'WelcomeSangNae', N'Welcome new user', 10000, N'tructiep', N'Y')
INSERT [dbo].[Voucher] ([VoucherID], [MaVoucher], [TenDot], [SoTienGiam], [LoaiGiamGia], [TinhTrang]) VALUES (14, N'WelcomeSangNea', N'Welcome new user', 10000, N'tructiep', N'Y')
SET IDENTITY_INSERT [dbo].[Voucher] OFF
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD FOREIGN KEY([MaMH])
REFERENCES [dbo].[MatHang] ([MaMH])
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD FOREIGN KEY([MaMH])
REFERENCES [dbo].[MatHang] ([MaMH])
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD FOREIGN KEY([MaMH])
REFERENCES [dbo].[MatHang] ([MaMH])
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD FOREIGN KEY([MaMH])
REFERENCES [dbo].[MatHang] ([MaMH])
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD FOREIGN KEY([MaMH])
REFERENCES [dbo].[MatHang] ([MaMH])
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD FOREIGN KEY([MaMH])
REFERENCES [dbo].[MatHang] ([MaMH])
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD FOREIGN KEY([MaPT])
REFERENCES [dbo].[PhuongThucThanhToan] ([MaPT])
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD FOREIGN KEY([MaPT])
REFERENCES [dbo].[PhuongThucThanhToan] ([MaPT])
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD FOREIGN KEY([MaPT])
REFERENCES [dbo].[PhuongThucThanhToan] ([MaPT])
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD FOREIGN KEY([VoucherID])
REFERENCES [dbo].[Voucher] ([VoucherID])
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD FOREIGN KEY([VoucherID])
REFERENCES [dbo].[Voucher] ([VoucherID])
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD FOREIGN KEY([VoucherID])
REFERENCES [dbo].[Voucher] ([VoucherID])
GO
ALTER TABLE [dbo].[MatHang]  WITH CHECK ADD FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhuyenMai] ([MaKH])
GO
ALTER TABLE [dbo].[MatHang]  WITH CHECK ADD FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhuyenMai] ([MaKH])
GO
ALTER TABLE [dbo].[MatHang]  WITH CHECK ADD FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhuyenMai] ([MaKH])
GO
ALTER TABLE [dbo].[MatHang]  WITH CHECK ADD FOREIGN KEY([MaLoai])
REFERENCES [dbo].[LoaiMH] ([MaLoai])
GO
ALTER TABLE [dbo].[MatHang]  WITH CHECK ADD FOREIGN KEY([MaLoai])
REFERENCES [dbo].[LoaiMH] ([MaLoai])
GO
ALTER TABLE [dbo].[MatHang]  WITH CHECK ADD FOREIGN KEY([MaLoai])
REFERENCES [dbo].[LoaiMH] ([MaLoai])
GO
/****** Object:  StoredProcedure [dbo].[sp_ChinhSuaKhuyenMai]    Script Date: 12/20/2022 11:29:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ChinhSuaKhuyenMai]
	@makm int,
	@giagiam int,
	@loai nvarchar(10)
as
begin	
	if(@makm is null or @giagiam is null or @loai is null)
	begin 		
		Raiserror(N'Vui lòng nhập thông tin đầy đủ và chính xác',16,1)		
		return
	end 
	if not exists(select * from KhuyenMai where  MaKH = @makm) 
	begin 
		raiserror (N'ID k tồn tại',16,1)		
		return 
	end
	SET XACT_ABORT ON
	begin transaction 
	begin try
		update KhuyenMai set	GiaGiam = @giagiam,
								Loai = @loai
		where  MaKH = @makm
	commit
	end try
	begin catch 
		declare @ErrMsg varchar(max) 
		rollback 
		select @ErrMsg = 'Loi' + ERROR_MESSAGE()
		raiserror (@ErrMSG, 16,1)
	end catch
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ChinhSuaLoaiMH]    Script Date: 12/20/2022 11:29:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ChinhSuaLoaiMH]
	@maloai int,
	@tenloai nvarchar(20)

as
begin	
	if(@tenloai is null)
	begin 		
		Raiserror(N'Vui lòng nhập thông tin đầy đủ và chính xác',16,1)		
		return
	end 
	if not exists(select * from LoaiMH where  MaLoai = @maloai) 
	begin 
		raiserror (N'ID k tồn tại',16,1)		
		return 
	end

	if exists(select * from LoaiMH where TenLoai = @tenloai and MaLoai = @maloai)
	begin
	raiserror (N'Vui lòng xem lại thông tin',16,1)		
		return 
	end

	SET XACT_ABORT ON
	begin transaction 
	begin try
		update LoaiMH set TenLoai = @tenloai				  
		where  MaLoai = @maloai
	commit
	end try
	begin catch 
		declare @ErrMsg varchar(max) 
		rollback 
		select @ErrMsg = 'Loi' + ERROR_MESSAGE()
		raiserror (@ErrMSG, 16,1)
	end catch
end

exec sp_ChinhSuaLoaiMH 10,'Gà'

-------------------------------Xóa LoaiMH--------------------------
GO
/****** Object:  StoredProcedure [dbo].[sp_ChinhSuaMatHang]    Script Date: 12/20/2022 11:29:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ChinhSuaMatHang]
	@mamh int,
	@dongia float,
	@tenmh nvarchar(50),
	@mota nvarchar(MAX),
	@hinhchinh nvarchar(MAX),
	@hinh1 nvarchar(MAX),
	@hinh2 nvarchar(MAX),
	@hinh3 nvarchar(MAX),
	@hinh4 nvarchar(MAX),
	@size char(5),
	@soluong int,
	@maloai int,
	@makh int
as
begin	
	if(@dongia is null or @tenmh is null or @maloai is null)
	begin 		
		Raiserror(N'Vui lòng nhập thông tin đầy đủ và chính xác',16,1)		
		return
	end 

		if not exists(select * from MatHang where  MaMH = @mamh) 
	begin 
		raiserror (N'ID mặt hàng không tồn tại',16,1)		
		return 
	end

		if not exists(select * from LoaiMH where  MaLoai = @maloai) 
	begin 
		raiserror (N'ID mã loại không tồn tại',16,1)		
		return 
	end

	SET XACT_ABORT ON
	begin transaction 
	begin try
		update MatHang set DonGia    = @dongia,
						   TenMH     = @tenmh,
						   MoTa      = @mota,
						   HinhChinh = @hinhchinh,
						   Hinh1     = @hinh1,
						   Hinh2     = @hinh2,
						   Hinh3     = @hinh3,
						   Hinh4     = @hinh4,
						   Size      = @size,
						   SoLuong   = @soluong,
						   MaLoai    = @maloai,
						   MaKH      = @makh				
				where  MaMH = @mamh
	commit
	end try
	begin catch 
		declare @ErrMsg varchar(max) 
		rollback 
		select @ErrMsg = 'Loi' + ERROR_MESSAGE()
		raiserror (@ErrMSG, 16,1)
	end catch
end

exec sp_ChinhSuaMatHang 8,456,Khoai,abcdef,NULL,NULL,null,null,null,S,15,7,null

-------------------------------Xóa MATHANG---------------------

GO
/****** Object:  StoredProcedure [dbo].[sp_ChinhSuaPttt]    Script Date: 12/20/2022 11:29:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ChinhSuaPttt]
	@mapt int,
	@tenpt nvarchar(20)

as
begin	

	if(@tenpt is null)
	begin 		
		Raiserror(N'Vui lòng nhập thông tin đầy đủ',16,1)		
		return
	end 

	if not exists(select * from PhuongThucThanhToan where  MaPT = @mapt) 
	begin 
		raiserror (N'ID k tồn tại',16,1)		
		return 
	end

	if exists(select * from PhuongThucThanhToan where TenPT = @tenpt and MaPT = @mapt)
	begin
	raiserror (N'Vui lòng xem lại thông tin',16,1)		
		return 
	end

	SET XACT_ABORT ON
	begin transaction 
	begin try
		update PhuongThucThanhToan set TenPT = @tenpt				  
		where  MaPT = @mapt
	commit
	end try
	begin catch 
		declare @ErrMsg varchar(max) 
		rollback 
		select @ErrMsg = 'Loi' + ERROR_MESSAGE()
		raiserror (@ErrMSG, 16,1)
	end catch
end

exec sp_ChinhSuaPttt 4,'Gà'
select * from PhuongThucThanhToan

-------------------------------xóa PTTT---------------------

GO
/****** Object:  StoredProcedure [dbo].[sp_ChinhSuaVoucher]    Script Date: 12/20/2022 11:29:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ChinhSuaVoucher]
	@voucherid int,
	@mavoucher varchar(50),
	@tendot nvarchar(50),
	@sotiengiam float,
	@loaigiamgia nvarchar(10),
	@tinhtrang varchar(5)
as
begin	
	if(@mavoucher is null or @tendot is null or @sotiengiam is null or @loaigiamgia is null or @tinhtrang is null)
	begin 		
		Raiserror(N'Vui lòng nhập thông tin đầy đủ và chính xác',16,1)		
		return
	end 
	if not exists(select * from Voucher where  VoucherID = @voucherid) 
	begin 
		raiserror (N'ID k tồn tại',16,1)		
		return 
	end
	SET XACT_ABORT ON
	begin transaction 
	begin try
		update Voucher set	MaVoucher = @mavoucher,
							TenDot = @tendot,
							SoTienGiam = @sotiengiam,
							LoaiGiamGia = @loaigiamgia,
							TinhTrang = @tinhtrang
		
		where  VoucherID = @voucherid
	commit
	end try
	begin catch 
		declare @ErrMsg varchar(max) 
		rollback 
		select @ErrMsg = 'Loi' + ERROR_MESSAGE()
		raiserror (@ErrMSG, 16,1)
	end catch
end

drop proc sp_ChinhSuaVoucher
Select * from Voucher
exec sp_ChinhSuaVoucher 2, N'WelcomeNewUser', N'Chao Mung Nguoi Dung Moi', '15000', N'tructiep', 'Y'

-------------------------------Xóa Voucher--------------------------
GO
/****** Object:  StoredProcedure [dbo].[sp_CommentKhongHopLe]    Script Date: 12/20/2022 11:29:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_CommentKhongHopLe]
as
begin
	select * from Comments
	where	CmtMsg like '%rác%'
	or		CmtMsg like '%tệ%'
	or		CmtMsg like '%chó%'
	or		CmtMsg like '%đm%'
	or		CmtMsg like '%vl%'
	or		CmtMsg like '%vc%'
	or		CmtMsg like '%mẹ%'
	or		CmtMsg like '%chết%'
	or		CmtMsg like '%râm%'
end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAccount_Username]    Script Date: 12/20/2022 11:29:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_GetAccount_Username]
	@hoten nvarchar(50)
	as
	begin
	select Account.HoTen,Account.Username,Account.Password
	from Account
	where HoTen = @hoten 
	group by Account.HoTen,Account.Username,Account.Password
	end
	exec sp_GetAccount_Username QuocTien
-------------------------------TRIGGER------------------------------------
-------------------------------PASSWORD KHONG DC RONG---------------------
GO
/****** Object:  StoredProcedure [dbo].[sp_LayMatHangTheoKhuyenMai]    Script Date: 12/20/2022 11:29:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_LayMatHangTheoKhuyenMai] @loaikm nvarchar(20)
as
begin
	declare loaikm cursor
	scroll
	for 
		select MH.TenMH, MH.DonGia, MH.MoTa, MH.SoLuong, MH.Size, KM.GiaGiam
		from MatHang MH, KhuyenMai KM
		where KM.Loai = @loaikm
		and MH.MaKH = KM.MaKH

	open loaikm
	declare @tenmh nvarchar(50), @dongia float, @mota nvarchar(max), @soluong int, @size char(5), @khuyenmai int
	declare @i int
	set @i = 1

	fetch next from loaikm
	into @tenmh, @dongia, @mota, @soluong, @size, @khuyenmai

	while @@FETCH_STATUS = 0
	begin
		if(@loaikm like 'phantram')
		begin
			print CAST(@i as nvarchar(10)) + ': Ten Mat Hang: ' + @tenmh + ' Don Gia: ' + CAST (@dongia as nvarchar(10))
					+ ' Mo Ta: ' + @mota + ' So Luong: ' + CAST (@soluong as nvarchar(10)) + ' Size: ' + @size
					+ ' Khuyen Mai: ' +  CAST (@khuyenmai as nvarchar(10)) + '%'
			FETCH NEXT FROM loaikm
			into @tenmh, @dongia, @mota, @soluong, @size, @khuyenmai
			set @i = @i + 1
		end
		if(@loaikm like 'nghin')
		begin
			print CAST(@i as nvarchar(10)) + ': Ten Mat Hang: ' + @tenmh + ' Don Gia: ' + CAST (@dongia as nvarchar(10))
					+ ' Mo Ta: ' + @mota + ' So Luong: ' + CAST (@soluong as nvarchar(10)) + ' Size: ' + @size
					+ ' Khuyen Mai: ' +  CAST (@khuyenmai as nvarchar(10)) + ' VND'
			FETCH NEXT FROM loaikm
			into @tenmh, @dongia, @mota, @soluong, @size, @khuyenmai
			set @i = @i + 1
		end
	end

	close loaikm
	deallocate loaikm
end
GO
/****** Object:  StoredProcedure [dbo].[sp_LayMatHangTheoLoai]    Script Date: 12/20/2022 11:29:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_LayMatHangTheoLoai] @tenloai nvarchar(20)
as
begin
	declare loaimh cursor
	scroll
	for 
		select MH.TenMH, MH.DonGia, MH.MoTa, MH.SoLuong, MH.Size 
		from MatHang MH, LoaiMH l
		where l.MaLoai in (select MaLoai from LoaiMH where TenLoai = @tenloai)
		and MH.MaLoai = l.MaLoai

	open loaimh
	declare @tenmh nvarchar(50), @dongia float, @mota nvarchar(max), @soluong int, @size char(5)
	declare @i int
	set @i = 1

	fetch next from loaimh
	into @tenmh, @dongia, @mota, @soluong, @size

	while @@FETCH_STATUS = 0
	begin
		print CAST(@i as nvarchar(10)) + ': Ten Mat Hang: ' + @tenmh + ' Don Gia: ' + CAST (@dongia as nvarchar(10))
					+ ' Mo Ta: ' + @mota + ' So Luong: ' + CAST (@soluong as nvarchar(10)) + ' Size: ' + @size
		FETCH NEXT FROM loaimh
		into @tenmh, @dongia, @mota, @soluong, @size
		set @i = @i + 1
	end

	close loaimh
	deallocate loaimh
end
GO
/****** Object:  StoredProcedure [dbo].[sp_MatHangCoSoLuongThap]    Script Date: 12/20/2022 11:29:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_MatHangCoSoLuongThap]
as
begin
	select * from MatHang
	where SoLuong < 10
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemAccount]    Script Date: 12/20/2022 11:29:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ThemAccount]
	@username varchar(50) , 
	@password varchar(50) , 
	@hoten nvarchar(50), 
	@diachi nvarchar(MAX),
	@email varchar(100),
	@sdt char(10),
	@role nvarchar(20)
as
begin 
	if(@username is null or @password is null or @hoten is null)
	begin 
		raiserror('Yêu cầu nhập thông tin đầy đủ',16,1)
		return 
	end
	if exists (select * from Account where Username = @username )
	begin 
		raiserror('Usernam trùng, nhập lại thông tin',16,1)
		return 
	end
	SET XACT_ABORT ON
	begin tran
	begin try 
			declare @accountid int = 1
			set @accountid = @accountid + 1 
	if  not exists (SELECT * FROM Account WHERE Username =  @username) OR
		not exists (SELECT * FROM Account WHERE Password = @password) OR
		not exists (SELECT * FROM Account WHERE HoTen	 = @hoten) OR
		not exists (SELECT * FROM Account WHERE DiaChi	 = @diachi) OR
		not exists (SELECT * FROM Account WHERE Email	 = @email) OR
		not exists (SELECT * FROM Account WHERE SoDT	 = @sdt) OR
		not exists (SELECT * FROM Account WHERE Role     = @role) 

		INSERT INTO Account VALUES (@username,@password,@hoten,@diachi,@email,@sdt,@role)
		else 
			print('Không hợp lệ')
		commit
	end try
	begin catch
		declare @ErrMsg varchar(max) 
		rollback 
		select @ErrMsg = 'Lỗi ' + ERROR_MESSAGE()
		raiserror (@ErrMSG, 16,1)
	end catch
end 
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemKhuyenMai]    Script Date: 12/20/2022 11:29:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ThemKhuyenMai]
	@giagiam int,
	@loai nvarchar(10)
as
begin
	declare @makm int = 1
	While exists(
		SELECT * 
		FROM KhuyenMai
		Where MaKH = @makm
	)
	set @makm = @makm + 1 
	if  not exists (SELECT * FROM KhuyenMai WHERE GiaGiam	 = @giagiam)   OR
		not exists (SELECT * FROM KhuyenMai WHERE Loai	 = @loai)
		INSERT INTO KhuyenMai (GiaGiam, Loai)
		VALUES (@giagiam, @loai)
	else
		print 'Xem Lai Du Lieu Nhap'
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemLoaiMH]    Script Date: 12/20/2022 11:29:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ThemLoaiMH]
	@tenloai nvarchar(20)
as
begin
	declare @maloai int = 1
	While exists(
		SELECT * 
		FROM LoaiMH
		Where MaLoai = @maloai
	)
	set @maloai = @maloai + 1 
	if not exists (SELECT * FROM LoaiMH WHERE TenLoai = @tenloai) 

		INSERT INTO LoaiMH VALUES (@tenloai)
	else
		print 'Đã tồn tại'
end

exec sp_ThemLoaiMH N'Gà'

-------------------------------Sửa LoaiMH--------------------------

GO
/****** Object:  StoredProcedure [dbo].[sp_ThemMatHang]    Script Date: 12/20/2022 11:29:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ThemMatHang]
	@dongia float,
	@tenmh nvarchar(50),
	@mota nvarchar(MAX),
	@hinhchinh nvarchar(MAX),
	@hinh1 nvarchar(MAX),
	@hinh2 nvarchar(MAX),
	@hinh3 nvarchar(MAX),
	@hinh4 nvarchar(MAX),
	@size char(5),
	@soluong int,
	@maloai int,
	@makh int
as
begin
	declare @mamh int = 1
	While exists(
		SELECT * 
		FROM MatHang
		Where  MaMH = @mamh
	)
	set @mamh = @mamh + 1 
	
	if not exists(select * from LoaiMH where MaLoai = @maloai)
	begin
	raiserror (N'Vui lòng xem lại thông tin',16,1)		
		return 
	end

	if  not exists (SELECT * FROM MatHang WHERE DonGia	 = @dongia)   OR
		not exists (SELECT * FROM MatHang WHERE TenMH	 = @tenmh)	  OR
		not exists (SELECT * FROM MatHang WHERE MoTa	 = @mota)	  OR
		not exists (SELECT * FROM MatHang WHERE HinhChinh= @hinhchinh)OR
		not exists (SELECT * FROM MatHang WHERE Hinh1	 = @hinh1)    OR
		not exists (SELECT * FROM MatHang WHERE Hinh2	 = @hinh2)    OR
		not exists (SELECT * FROM MatHang WHERE Hinh3	 = @hinh3)    OR
		not exists (SELECT * FROM MatHang WHERE Hinh4	 = @hinh4)    OR
		not exists (SELECT * FROM MatHang WHERE Size	 = @size)     OR
		not exists (SELECT * FROM MatHang WHERE SoLuong	 = @soluong)  OR
		not exists (SELECT * FROM MatHang WHERE MaLoai	 = @maloai)   OR
		not exists (SELECT * FROM MatHang WHERE MaKH	 = @makh) 
		INSERT INTO MatHang VALUES (@dongia,@tenmh,@mota,@hinhchinh,@hinh1,@hinh2,@hinh3,@hinh4,@size,@soluong,@maloai,@makh)
	else
		print 'khong hop le'
end

exec sp_ThemMatHang 123,'Khoai','abc','~/Content/Images/add.png','~/Content/Images/add.png','~/Content/Images/add.png','~/Content/Images/add.png','~/Content/Images/add.png','M',12,1,NULL
exec sp_ThemMatHang 123,'Khoai','abc','~/Content/Images/add.png','~/Content/Images/add.png','~/Content/Images/add.png','~/Content/Images/add.png','~/Content/Images/add.png','M',12,6,NULL

select * from MatHAng
select * from LoaiMH

-------------------------------Sửa MATHANG---------------------

GO
/****** Object:  StoredProcedure [dbo].[sp_ThemPttt]    Script Date: 12/20/2022 11:29:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ThemPttt]
	@tenpt nvarchar(50)
as
begin
	declare @mapt int = 1
	While exists(
		SELECT * 
		FROM PhuongThucThanhToan
		Where MaPT = @mapt
	)
	set @mapt = @mapt + 1 

	if exists (select * from PhuongThucThanhToan where TenPT = @tenpt)
	begin
		raiserror ('Phương thức này đã tồn tại',16,1)		
		return
	end

	if not exists (SELECT * FROM PhuongThucThanhToan WHERE TenPT = @tenpt) 

	INSERT INTO PhuongThucThanhToan VALUES (@tenpt)
end
exec sp_ThemPttt 'CODDD'
select * from PhuongThucThanhToan

-------------------------------sửa PTTT---------------------
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemVoucher]    Script Date: 12/20/2022 11:29:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ThemVoucher]
	@mavoucher varchar(50),
	@tendot nvarchar(50),
	@sotiengiam float,
	@loaigiamgia nvarchar(10),
	@tinhtrang varchar(5)
as
begin
	declare @voucherid int = 1
	While exists(
		SELECT * 
		FROM Voucher
		Where VoucherID = @voucherid
	)
	set @voucherid = @voucherid + 1 
	if  not exists (SELECT * FROM Voucher WHERE MaVoucher	 = @mavoucher)   OR
		not exists (SELECT * FROM Voucher WHERE TenDot	 = @tendot)	  OR
		not exists (SELECT * FROM Voucher WHERE SoTienGiam	 = @sotiengiam)	  OR
		not exists (SELECT * FROM Voucher WHERE LoaiGiamGia = @loaigiamgia)OR
		not exists (SELECT * FROM Voucher WHERE TinhTrang = @tinhtrang)
		INSERT INTO Voucher (MaVoucher, TenDot, SoTienGiam, LoaiGiamGia, TinhTrang)
		VALUES (@mavoucher, @tendot, @sotiengiam, @loaigiamgia,@tinhtrang)
	else
		print 'Ma Voucher ' +@mavoucher+N' Đã tồn tại'
end
GO
/****** Object:  StoredProcedure [dbo].[sp_VoucherTheoTenDot]    Script Date: 12/20/2022 11:29:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_VoucherTheoTenDot] @tendot nvarchar(50)
as
begin
	select * from Voucher
	where TenDot = @tendot
end
GO
/****** Object:  StoredProcedure [dbo].[sp_XemChiTietDonHang]    Script Date: 12/20/2022 11:29:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_XemChiTietDonHang] @mahd int
as
begin
	declare @i int, @flag int, @chitiet nvarchar(max)
	set @chitiet = (select ChiTiet from HoaDon where MaHD = @mahd)
	---print @chitiet
	while patindex('%[0-9]%', @chitiet) > 0
	begin
		set @chitiet = stuff(@chitiet, patindex('%[0-9]%', @chitiet), 1, '')
	end
	---print @chitiet
	set @flag = (select LEN(REPLACE(@chitiet, '0', '')))
	---print @flag

	select HD.MaHD, Ngay, HD.SoLuong, TongTien, Chitiet, PT.TenPT, A.UserName, VoucherID, TinhTrang into #XemChiTietHoaDon
	from HoaDon HD, Account A, MatHang MH, PhuongThucThanhToan PT
	Where HD.AccountID = A.AccountID
	and HD.MaPT = PT.MaPT
	and HD.MaHD = @mahd

	declare @mathang nvarchar(max)
	set @i = 1
	while (@i <= @flag + 1)
	begin
		set @mathang = 'MatHang' + CAST(@i as nvarchar(max))
		---print @mathang
			select MaHD, Ngay, MH.DonGia, HD.SoLuong, REVERSE(PARSENAME(REPLACE(REVERSE(ChiTiet), ':', '.') , @i)) AS [MaMatHang], MH.TenMH
			from HoaDon HD, MatHang MH where MaHD = @mahd and REVERSE(PARSENAME(REPLACE(REVERSE(ChiTiet), ':', '.') , @i)) = MH.MaMH
		set @i = @i + 1
	end

	Select * from #XemChiTietHoaDon
end
GO
/****** Object:  StoredProcedure [dbo].[sp_XoaAccount]    Script Date: 12/20/2022 11:29:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_XoaAccount] 
	@accountid int
as
begin 
	if not exists (select * from Account where AccountID = @accountid)
	begin
		raiserror ('Account này không tồn tại',16,1)		
		return
	end
	SET XACT_ABORT ON
	begin transaction
	begin try
		delete from Account  where AccountID = @accountid
	commit
	end try
	begin catch 
		declare @ErrMsg varchar(max) 
		rollback 
		select @ErrMsg = 'Loi' + ERROR_MESSAGE()
		raiserror (@ErrMSG, 16,1)
	end catch	
end
exec sp_XoaAccount 6

-------------------------------LoaiMH-------------------------------
-------------------------------Thêm LoaiMH--------------------------
GO
/****** Object:  StoredProcedure [dbo].[sp_XoaComment]    Script Date: 12/20/2022 11:29:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_XoaComment]
	@cmtid int
as
begin 
	if not exists (select * from Comments where CmtID = @cmtid)
	begin
		raiserror ('ID này không tồn tại',16,1)		
		return
	end
	SET XACT_ABORT ON
	begin transaction
	begin try
		delete from Comments  where CmtID = @cmtid
	commit
	end try
	begin catch 
		declare @ErrMsg varchar(max) 
		rollback 
		select @ErrMsg = 'Loi' + ERROR_MESSAGE()
		raiserror (@ErrMSG, 16,1)
	end catch	
end

-----------------------------Truy Xuat Thong tin---------------------------------
-----------------------------Xem Chi Tiet Hoa Don--------------------------------
---Cau 1 Cursor
DECLARE c_DocThongTin CURSOR
SCROLL
FOR
	SELECT DG.ma_docgia, ho + ' ' + tenlot + ' ' + ten AS HoTen, DK.isbn, TS.TuaSach, DK.ngaygio_dk
	FROM DocGia DG, DangKy DK, DauSach DS, TuaSach TS
	WHERE DG.ma_docgia = DK.ma_docgia
	AND DS.isbn = DK.isbn
	AND DS.ma_tuasach = TS.ma_tuasach

	OPEN c_DocThongTin

	DECLARE @ma_docgia int, @hoten nvarchar(31), @isbn int, @TuaSach nvarchar(63), @ngaygio_dk smalldatetime
	DECLARE @i int
	SET @i = 1

	FETCH NEXT FROM c_DocThongTin
	INTO @ma_docgia, @hoten, @isbn, @TuaSach, @ngaygio_dk

	WHILE @@FETCH_STATUS = 0
	BEGIN
		PRINT CAST(@i AS nvarchar(10)) + ': Ma Doc Gia: ' + CAST (@ma_docgia AS NVARCHAR(10)) +
			' Ho Ten: ' + @hoten + 'isbn: ' + CAST(@isbn AS NVARCHAR(15)) +
			' Tua Sach: ' + @TuaSach + ' Ngay dang ky: ' + CAST(@ngaygio_dk AS NVARCHAR(15))

		FETCH NEXT FROM c_DocThongTin
		INTO @ma_docgia, @hoten, @isbn, @TuaSach, @ngaygio_dk

		SET @i = @i + 1
	END

CLOSE c_DocThongTin
DEALLOCATE c_DocThongTin



-----------------------------Lay ra nhung mat hang theo loai-----------------------------
GO
/****** Object:  StoredProcedure [dbo].[sp_XoaKhuyenMai]    Script Date: 12/20/2022 11:29:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_XoaKhuyenMai]
	@makm int
as
begin 
	if not exists (select * from KhuyenMai where MaKH = @makm)
	begin
		raiserror ('ID này không tồn tại',16,1)		
		return
	end
	SET XACT_ABORT ON
	begin transaction
	begin try
		delete from KhuyenMai  where MaKH = @makm
	commit
	end try
	begin catch 
		declare @ErrMsg varchar(max) 
		rollback 
		select @ErrMsg = 'Loi' + ERROR_MESSAGE()
		raiserror (@ErrMSG, 16,1)
	end catch	
end
GO
/****** Object:  StoredProcedure [dbo].[sp_XoaLoaiMH]    Script Date: 12/20/2022 11:29:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_XoaLoaiMH]
	@maloai int
as
begin 
	if not exists (select * from LoaiMH where MaLoai = @maloai)
	begin
		raiserror ('LoaiMH này không tồn tại',16,1)		
		return
	end
	SET XACT_ABORT ON
	begin transaction
	begin try
		delete from LoaiMH  where MaLoai = @maloai
	commit
	end try
	begin catch 
		declare @ErrMsg varchar(max) 
		rollback 
		select @ErrMsg = 'Loi' + ERROR_MESSAGE()
		raiserror (@ErrMSG, 16,1)
	end catch	
end
exec sp_XoaLoaiMH 7
select * from LoaiMH
-------------------------------MATHANG--------------------------
-------------------------------Thêm MATHANG---------------------
GO
/****** Object:  StoredProcedure [dbo].[sp_XoaMatHang]    Script Date: 12/20/2022 11:29:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_XoaMatHang]
	@mamh int
as
begin 
	if not exists (select * from MatHang where MaMH = @mamh)
	begin
		raiserror ('Mặt hàng này không tồn tại',16,1)		
		return
	end
	SET XACT_ABORT ON
	begin transaction
	begin try
		delete from MatHang  where MaMH = @mamh
	commit
	end try
	begin catch 
		declare @ErrMsg varchar(max) 
		rollback 
		select @ErrMsg = 'Loi' + ERROR_MESSAGE()
		raiserror (@ErrMSG, 16,1)
	end catch	
end
exec sp_XoaMatHang 8


------------------------------- PTTT---------------------
-------------------------------Thêm PTTT-----------------

GO
/****** Object:  StoredProcedure [dbo].[sp_XoaPttt]    Script Date: 12/20/2022 11:29:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_XoaPttt]
	@mapt int
as
begin 
	if not exists (select * from PhuongThucThanhToan where MaPT = @mapt)
	begin
		raiserror ('Phương thức này không tồn tại',16,1)		
		return
	end
	SET XACT_ABORT ON
	begin transaction
	begin try
		delete from PhuongThucThanhToan  where MaPT = @mapt
	commit
	end try
	begin catch 
		declare @ErrMsg varchar(max) 
		rollback 
		select @ErrMsg = 'Loi' + ERROR_MESSAGE()
		raiserror (@ErrMSG, 16,1)
	end catch	
end

exec sp_XoaPttt 4
select * from PhuongThucThanhToan


-------------------------------Account thong qua hoten--------------------
GO
/****** Object:  StoredProcedure [dbo].[sp_XoaVoucher]    Script Date: 12/20/2022 11:29:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_XoaVoucher]
	@voucherid int
as
begin 
	if not exists (select * from Voucher where VoucherID = @voucherid)
	begin
		raiserror ('VoucherID này không tồn tại',16,1)		
		return
	end
	SET XACT_ABORT ON
	begin transaction
	begin try
		delete from Voucher  where VoucherID = @voucherid
	commit
	end try
	begin catch 
		declare @ErrMsg varchar(max) 
		rollback 
		select @ErrMsg = 'Loi' + ERROR_MESSAGE()
		raiserror (@ErrMSG, 16,1)
	end catch	
end
exec sp_XoaLoaiMH 7
select * from LoaiMH




-------------------------------Khuyen Mai-------------------------------
-----------------------------Them Khuyen Mai----------------------------
GO
USE [master]
GO
ALTER DATABASE [QLBH] SET  READ_WRITE 
GO
