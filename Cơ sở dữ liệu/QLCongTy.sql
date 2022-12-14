USE [master]
GO
/****** Object:  Database [QLCongTy]    Script Date: 10/11/2022 10:49:29 SA ******/
CREATE DATABASE [QLCongTy]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLCongTy', FILENAME = N'D:\SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QLCongTy.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLCongTy_log', FILENAME = N'D:\SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QLCongTy_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QLCongTy] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLCongTy].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLCongTy] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLCongTy] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLCongTy] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLCongTy] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLCongTy] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLCongTy] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLCongTy] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLCongTy] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLCongTy] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLCongTy] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLCongTy] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLCongTy] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLCongTy] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLCongTy] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLCongTy] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLCongTy] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLCongTy] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLCongTy] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLCongTy] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLCongTy] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLCongTy] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLCongTy] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLCongTy] SET RECOVERY FULL 
GO
ALTER DATABASE [QLCongTy] SET  MULTI_USER 
GO
ALTER DATABASE [QLCongTy] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLCongTy] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLCongTy] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLCongTy] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLCongTy] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLCongTy] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLCongTy', N'ON'
GO
ALTER DATABASE [QLCongTy] SET QUERY_STORE = OFF
GO
USE [QLCongTy]
GO
/****** Object:  Table [dbo].[CongViec]    Script Date: 10/11/2022 10:49:29 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CongViec](
	[MaCV] [char](10) NOT NULL,
	[TenCV] [varchar](50) NULL,
	[MucLuongToiThieu] [numeric](6, 0) NULL,
	[MucLuongToiDa] [numeric](6, 0) NULL,
 CONSTRAINT [PK_CongViec] PRIMARY KEY CLUSTERED 
(
	[MaCV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeAn]    Script Date: 10/11/2022 10:49:29 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeAn](
	[MaDA] [char](6) NOT NULL,
	[TenDA] [varchar](20) NULL,
	[DiaDiem] [varchar](20) NULL,
	[Phong] [char](4) NULL,
 CONSTRAINT [PK_DeAn] PRIMARY KEY CLUSTERED 
(
	[MaDA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GhiNhoCongViec]    Script Date: 10/11/2022 10:49:29 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GhiNhoCongViec](
	[MaNV] [char](6) NOT NULL,
	[NgayBD] [date] NOT NULL,
	[NgayKT] [date] NULL,
	[MaNghe] [char](10) NOT NULL,
	[MaPhong] [char](4) NULL,
 CONSTRAINT [PK_GhiNhoCongViec] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC,
	[NgayBD] ASC,
	[MaNghe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 10/11/2022 10:49:29 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [char](6) NOT NULL,
	[HoNV] [varchar](20) NULL,
	[TenNV] [varchar](20) NULL,
	[Email] [varchar](20) NULL,
	[Phone] [varchar](20) NULL,
	[NgayLam] [date] NULL,
	[MaCV] [char](10) NULL,
	[Luong] [numeric](8, 2) NULL,
	[MucHoaHong] [numeric](2, 2) NULL,
	[MaQuanLy] [char](6) NULL,
	[MaPhong] [char](4) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanCong]    Script Date: 10/11/2022 10:49:29 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanCong](
	[MaNV] [char](6) NOT NULL,
	[SoDA] [char](6) NOT NULL,
	[ThoiGianBD] [date] NOT NULL,
	[ThoiGianKT] [date] NOT NULL,
 CONSTRAINT [PK_PhanCong] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC,
	[SoDA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhongBan]    Script Date: 10/11/2022 10:49:29 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhongBan](
	[MaPhong] [char](4) NOT NULL,
	[TenPhong] [varchar](30) NOT NULL,
	[MaTruongPhong] [char](6) NULL,
	[DiaDiem] [varchar](30) NULL,
 CONSTRAINT [PK_PhongBan] PRIMARY KEY CLUSTERED 
(
	[MaPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThanNhan]    Script Date: 10/11/2022 10:49:29 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThanNhan](
	[MaNV] [char](6) NOT NULL,
	[TenTN] [varchar](20) NOT NULL,
	[QuanHe] [varchar](10) NULL,
 CONSTRAINT [PK_ThanNhan] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC,
	[TenTN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CongViec] ([MaCV], [TenCV], [MucLuongToiThieu], [MucLuongToiDa]) VALUES (N'AD_ACCOUNT', N'Pbulic Accountant', CAST(4200 AS Numeric(6, 0)), CAST(9000 AS Numeric(6, 0)))
INSERT [dbo].[CongViec] ([MaCV], [TenCV], [MucLuongToiThieu], [MucLuongToiDa]) VALUES (N'AD_ASST   ', N'Administration Assistant', CAST(3000 AS Numeric(6, 0)), CAST(6000 AS Numeric(6, 0)))
INSERT [dbo].[CongViec] ([MaCV], [TenCV], [MucLuongToiThieu], [MucLuongToiDa]) VALUES (N'AD_MGR    ', N'Accounting Manager', CAST(8200 AS Numeric(6, 0)), CAST(16000 AS Numeric(6, 0)))
INSERT [dbo].[CongViec] ([MaCV], [TenCV], [MucLuongToiThieu], [MucLuongToiDa]) VALUES (N'AD_PRES   ', N'Presindet', CAST(20000 AS Numeric(6, 0)), CAST(40000 AS Numeric(6, 0)))
INSERT [dbo].[CongViec] ([MaCV], [TenCV], [MucLuongToiThieu], [MucLuongToiDa]) VALUES (N'AD_VP     ', N'Administration Vice Presindet', CAST(15000 AS Numeric(6, 0)), CAST(30000 AS Numeric(6, 0)))
INSERT [dbo].[CongViec] ([MaCV], [TenCV], [MucLuongToiThieu], [MucLuongToiDa]) VALUES (N'IT_PROG   ', N'Programmer', CAST(4000 AS Numeric(6, 0)), CAST(10000 AS Numeric(6, 0)))
INSERT [dbo].[CongViec] ([MaCV], [TenCV], [MucLuongToiThieu], [MucLuongToiDa]) VALUES (N'MK_MAN    ', N'Makerting Manager', CAST(9000 AS Numeric(6, 0)), CAST(15000 AS Numeric(6, 0)))
INSERT [dbo].[CongViec] ([MaCV], [TenCV], [MucLuongToiThieu], [MucLuongToiDa]) VALUES (N'MK_REP    ', N'Makerting Representative', CAST(4000 AS Numeric(6, 0)), CAST(9000 AS Numeric(6, 0)))
INSERT [dbo].[CongViec] ([MaCV], [TenCV], [MucLuongToiThieu], [MucLuongToiDa]) VALUES (N'SA_MAN    ', N'Sales Manager', CAST(10000 AS Numeric(6, 0)), CAST(20000 AS Numeric(6, 0)))
INSERT [dbo].[CongViec] ([MaCV], [TenCV], [MucLuongToiThieu], [MucLuongToiDa]) VALUES (N'SA_REP    ', N'Sales Representative', CAST(6000 AS Numeric(6, 0)), CAST(12000 AS Numeric(6, 0)))
INSERT [dbo].[CongViec] ([MaCV], [TenCV], [MucLuongToiThieu], [MucLuongToiDa]) VALUES (N'ST_CLERK  ', N'Stock Clerk', CAST(2000 AS Numeric(6, 0)), CAST(5000 AS Numeric(6, 0)))
INSERT [dbo].[CongViec] ([MaCV], [TenCV], [MucLuongToiThieu], [MucLuongToiDa]) VALUES (N'ST_MAN    ', N'Stock Manager', CAST(5500 AS Numeric(6, 0)), CAST(8500 AS Numeric(6, 0)))
GO
INSERT [dbo].[DeAn] ([MaDA], [TenDA], [DiaDiem], [Phong]) VALUES (N'1001  ', N'cloud 2015', N'Japan', N'60  ')
INSERT [dbo].[DeAn] ([MaDA], [TenDA], [DiaDiem], [Phong]) VALUES (N'1251  ', N'Summer cooler', N'New York', N'80  ')
INSERT [dbo].[DeAn] ([MaDA], [TenDA], [DiaDiem], [Phong]) VALUES (N'1812  ', N'Smart Data 2016', N'Viet Nam', N'60  ')
GO
INSERT [dbo].[GhiNhoCongViec] ([MaNV], [NgayBD], [NgayKT], [MaNghe], [MaPhong]) VALUES (N'101   ', CAST(N'1989-09-21' AS Date), CAST(N'1993-10-27' AS Date), N'AD_ACCOUNT', NULL)
INSERT [dbo].[GhiNhoCongViec] ([MaNV], [NgayBD], [NgayKT], [MaNghe], [MaPhong]) VALUES (N'101   ', CAST(N'1993-10-28' AS Date), CAST(N'1997-03-15' AS Date), N'AD_MGR    ', NULL)
INSERT [dbo].[GhiNhoCongViec] ([MaNV], [NgayBD], [NgayKT], [MaNghe], [MaPhong]) VALUES (N'124   ', CAST(N'1999-01-01' AS Date), CAST(N'1999-12-31' AS Date), N'ST_CLERK  ', NULL)
INSERT [dbo].[GhiNhoCongViec] ([MaNV], [NgayBD], [NgayKT], [MaNghe], [MaPhong]) VALUES (N'144   ', CAST(N'1998-03-24' AS Date), CAST(N'1999-12-31' AS Date), N'ST_CLERK  ', NULL)
INSERT [dbo].[GhiNhoCongViec] ([MaNV], [NgayBD], [NgayKT], [MaNghe], [MaPhong]) VALUES (N'176   ', CAST(N'1998-03-24' AS Date), CAST(N'1999-12-31' AS Date), N'SA_REP    ', NULL)
INSERT [dbo].[GhiNhoCongViec] ([MaNV], [NgayBD], [NgayKT], [MaNghe], [MaPhong]) VALUES (N'176   ', CAST(N'1999-01-01' AS Date), CAST(N'1999-12-31' AS Date), N'ST_MAN    ', NULL)
INSERT [dbo].[GhiNhoCongViec] ([MaNV], [NgayBD], [NgayKT], [MaNghe], [MaPhong]) VALUES (N'200   ', CAST(N'1994-01-06' AS Date), CAST(N'1999-12-31' AS Date), N'AD_ACCOUNT', NULL)
INSERT [dbo].[GhiNhoCongViec] ([MaNV], [NgayBD], [NgayKT], [MaNghe], [MaPhong]) VALUES (N'201   ', CAST(N'1996-02-17' AS Date), CAST(N'1999-12-19' AS Date), N'MK_REP    ', NULL)
INSERT [dbo].[GhiNhoCongViec] ([MaNV], [NgayBD], [NgayKT], [MaNghe], [MaPhong]) VALUES (N'202   ', CAST(N'1993-01-13' AS Date), CAST(N'1998-06-24' AS Date), N'IT_PROG   ', NULL)
GO
INSERT [dbo].[NhanVien] ([MaNV], [HoNV], [TenNV], [Email], [Phone], [NgayLam], [MaCV], [Luong], [MucHoaHong], [MaQuanLy], [MaPhong]) VALUES (N'100   ', N'Steven', N'Lan', NULL, NULL, CAST(N'1987-06-17' AS Date), N'AD_PRES   ', CAST(24000.00 AS Numeric(8, 2)), NULL, NULL, N'90  ')
INSERT [dbo].[NhanVien] ([MaNV], [HoNV], [TenNV], [Email], [Phone], [NgayLam], [MaCV], [Luong], [MucHoaHong], [MaQuanLy], [MaPhong]) VALUES (N'101   ', N'Neena', N'Kochhar', NULL, NULL, CAST(N'1989-09-21' AS Date), N'AD_VP     ', CAST(17000.00 AS Numeric(8, 2)), NULL, N'100   ', N'90  ')
INSERT [dbo].[NhanVien] ([MaNV], [HoNV], [TenNV], [Email], [Phone], [NgayLam], [MaCV], [Luong], [MucHoaHong], [MaQuanLy], [MaPhong]) VALUES (N'103   ', N'Alexander', N'Hunold', NULL, NULL, CAST(N'1990-01-03' AS Date), N'IT_PROG   ', CAST(9000.00 AS Numeric(8, 2)), NULL, NULL, N'60  ')
INSERT [dbo].[NhanVien] ([MaNV], [HoNV], [TenNV], [Email], [Phone], [NgayLam], [MaCV], [Luong], [MucHoaHong], [MaQuanLy], [MaPhong]) VALUES (N'104   ', N'Bruce', N'Ernst', NULL, NULL, CAST(N'1991-05-21' AS Date), N'IT_PROG   ', CAST(6000.00 AS Numeric(8, 2)), NULL, N'103   ', N'60  ')
INSERT [dbo].[NhanVien] ([MaNV], [HoNV], [TenNV], [Email], [Phone], [NgayLam], [MaCV], [Luong], [MucHoaHong], [MaQuanLy], [MaPhong]) VALUES (N'107   ', N'Diana', N'Lorentz', NULL, NULL, CAST(N'1999-02-07' AS Date), N'IT_PROG   ', CAST(4200.00 AS Numeric(8, 2)), NULL, N'103   ', N'60  ')
INSERT [dbo].[NhanVien] ([MaNV], [HoNV], [TenNV], [Email], [Phone], [NgayLam], [MaCV], [Luong], [MucHoaHong], [MaQuanLy], [MaPhong]) VALUES (N'124   ', N'Kevin', N'Mourgos', NULL, NULL, CAST(N'1999-11-16' AS Date), N'ST_MAN    ', CAST(5800.00 AS Numeric(8, 2)), NULL, N'100   ', N'50  ')
INSERT [dbo].[NhanVien] ([MaNV], [HoNV], [TenNV], [Email], [Phone], [NgayLam], [MaCV], [Luong], [MucHoaHong], [MaQuanLy], [MaPhong]) VALUES (N'141   ', N'Trenna', N'Rajs', NULL, NULL, CAST(N'1995-11-17' AS Date), N'ST_CLERK  ', CAST(3500.00 AS Numeric(8, 2)), NULL, N'124   ', N'50  ')
INSERT [dbo].[NhanVien] ([MaNV], [HoNV], [TenNV], [Email], [Phone], [NgayLam], [MaCV], [Luong], [MucHoaHong], [MaQuanLy], [MaPhong]) VALUES (N'142   ', N'Curtis', N'Davies', NULL, NULL, CAST(N'1997-01-29' AS Date), N'ST_CLERK  ', CAST(3100.00 AS Numeric(8, 2)), NULL, N'124   ', N'50  ')
INSERT [dbo].[NhanVien] ([MaNV], [HoNV], [TenNV], [Email], [Phone], [NgayLam], [MaCV], [Luong], [MucHoaHong], [MaQuanLy], [MaPhong]) VALUES (N'143   ', N'Randall', N'Matos', NULL, NULL, CAST(N'1998-03-15' AS Date), N'ST_CLERK  ', CAST(2600.00 AS Numeric(8, 2)), NULL, N'124   ', N'50  ')
INSERT [dbo].[NhanVien] ([MaNV], [HoNV], [TenNV], [Email], [Phone], [NgayLam], [MaCV], [Luong], [MucHoaHong], [MaQuanLy], [MaPhong]) VALUES (N'144   ', N'Peter', N'Vargas', NULL, NULL, CAST(N'1998-09-07' AS Date), N'ST_CLERK  ', CAST(2500.00 AS Numeric(8, 2)), NULL, N'124   ', N'50  ')
INSERT [dbo].[NhanVien] ([MaNV], [HoNV], [TenNV], [Email], [Phone], [NgayLam], [MaCV], [Luong], [MucHoaHong], [MaQuanLy], [MaPhong]) VALUES (N'149   ', N'Eleni', N'Zotkey', NULL, NULL, CAST(N'2000-09-01' AS Date), N'SA_MAN    ', CAST(10500.00 AS Numeric(8, 2)), CAST(0.20 AS Numeric(2, 2)), N'100   ', N'80  ')
INSERT [dbo].[NhanVien] ([MaNV], [HoNV], [TenNV], [Email], [Phone], [NgayLam], [MaCV], [Luong], [MucHoaHong], [MaQuanLy], [MaPhong]) VALUES (N'174   ', N'Ellen', N'Abel', NULL, NULL, CAST(N'1996-11-05' AS Date), N'SA_REP    ', CAST(11000.00 AS Numeric(8, 2)), CAST(0.30 AS Numeric(2, 2)), N'149   ', N'80  ')
INSERT [dbo].[NhanVien] ([MaNV], [HoNV], [TenNV], [Email], [Phone], [NgayLam], [MaCV], [Luong], [MucHoaHong], [MaQuanLy], [MaPhong]) VALUES (N'176   ', N'Jonathon', N'Taylor', NULL, NULL, CAST(N'1998-03-24' AS Date), N'SA_REP    ', CAST(8600.00 AS Numeric(8, 2)), CAST(0.20 AS Numeric(2, 2)), N'149   ', N'80  ')
INSERT [dbo].[NhanVien] ([MaNV], [HoNV], [TenNV], [Email], [Phone], [NgayLam], [MaCV], [Luong], [MucHoaHong], [MaQuanLy], [MaPhong]) VALUES (N'178   ', N'Kimberly', N'Grant', NULL, NULL, CAST(N'1998-05-24' AS Date), N'SA_REP    ', CAST(7000.00 AS Numeric(8, 2)), CAST(0.15 AS Numeric(2, 2)), N'149   ', NULL)
INSERT [dbo].[NhanVien] ([MaNV], [HoNV], [TenNV], [Email], [Phone], [NgayLam], [MaCV], [Luong], [MucHoaHong], [MaQuanLy], [MaPhong]) VALUES (N'200   ', N'Jennifer', N'Whalen', NULL, NULL, CAST(N'1987-09-17' AS Date), N'AD_ASST   ', CAST(4400.00 AS Numeric(8, 2)), NULL, N'101   ', N'10  ')
INSERT [dbo].[NhanVien] ([MaNV], [HoNV], [TenNV], [Email], [Phone], [NgayLam], [MaCV], [Luong], [MucHoaHong], [MaQuanLy], [MaPhong]) VALUES (N'201   ', N'Michael', N'Hartstein', NULL, NULL, CAST(N'1996-02-17' AS Date), N'MK_MAN    ', CAST(13000.00 AS Numeric(8, 2)), NULL, N'100   ', N'20  ')
INSERT [dbo].[NhanVien] ([MaNV], [HoNV], [TenNV], [Email], [Phone], [NgayLam], [MaCV], [Luong], [MucHoaHong], [MaQuanLy], [MaPhong]) VALUES (N'202   ', N'Pat', N'Fay', NULL, NULL, CAST(N'1997-08-17' AS Date), N'MK_REP    ', CAST(6000.00 AS Numeric(8, 2)), NULL, N'201   ', N'20  ')
INSERT [dbo].[NhanVien] ([MaNV], [HoNV], [TenNV], [Email], [Phone], [NgayLam], [MaCV], [Luong], [MucHoaHong], [MaQuanLy], [MaPhong]) VALUES (N'203   ', N'William', N'Gietz', NULL, NULL, CAST(N'1994-06-17' AS Date), N'AD_ACCOUNT', CAST(8300.00 AS Numeric(8, 2)), NULL, N'205   ', N'110 ')
INSERT [dbo].[NhanVien] ([MaNV], [HoNV], [TenNV], [Email], [Phone], [NgayLam], [MaCV], [Luong], [MucHoaHong], [MaQuanLy], [MaPhong]) VALUES (N'205   ', N'Shelley', N'Higgins', NULL, NULL, CAST(N'1994-06-17' AS Date), N'AD_MGR    ', CAST(12000.00 AS Numeric(8, 2)), NULL, N'101   ', N'110 ')
GO
INSERT [dbo].[PhanCong] ([MaNV], [SoDA], [ThoiGianBD], [ThoiGianKT]) VALUES (N'103   ', N'1001  ', CAST(N'2015-02-14' AS Date), CAST(N'2015-07-14' AS Date))
INSERT [dbo].[PhanCong] ([MaNV], [SoDA], [ThoiGianBD], [ThoiGianKT]) VALUES (N'103   ', N'1812  ', CAST(N'2016-02-04' AS Date), CAST(N'2016-09-04' AS Date))
INSERT [dbo].[PhanCong] ([MaNV], [SoDA], [ThoiGianBD], [ThoiGianKT]) VALUES (N'104   ', N'1001  ', CAST(N'2015-03-14' AS Date), CAST(N'2015-05-14' AS Date))
INSERT [dbo].[PhanCong] ([MaNV], [SoDA], [ThoiGianBD], [ThoiGianKT]) VALUES (N'107   ', N'1001  ', CAST(N'2015-02-14' AS Date), CAST(N'2015-07-14' AS Date))
INSERT [dbo].[PhanCong] ([MaNV], [SoDA], [ThoiGianBD], [ThoiGianKT]) VALUES (N'149   ', N'1251  ', CAST(N'2015-04-24' AS Date), CAST(N'2015-08-24' AS Date))
GO
INSERT [dbo].[PhongBan] ([MaPhong], [TenPhong], [MaTruongPhong], [DiaDiem]) VALUES (N'10  ', N'Administration', N'200   ', N'Null')
INSERT [dbo].[PhongBan] ([MaPhong], [TenPhong], [MaTruongPhong], [DiaDiem]) VALUES (N'110 ', N'Accounting', N'205   ', N'Null')
INSERT [dbo].[PhongBan] ([MaPhong], [TenPhong], [MaTruongPhong], [DiaDiem]) VALUES (N'20  ', N'Marketing', N'201   ', N'Null')
INSERT [dbo].[PhongBan] ([MaPhong], [TenPhong], [MaTruongPhong], [DiaDiem]) VALUES (N'50  ', N'Shipping', N'124   ', N'Null')
INSERT [dbo].[PhongBan] ([MaPhong], [TenPhong], [MaTruongPhong], [DiaDiem]) VALUES (N'60  ', N'IT', N'103   ', N'Null')
INSERT [dbo].[PhongBan] ([MaPhong], [TenPhong], [MaTruongPhong], [DiaDiem]) VALUES (N'80  ', N'Sales', N'149   ', N'Null')
INSERT [dbo].[PhongBan] ([MaPhong], [TenPhong], [MaTruongPhong], [DiaDiem]) VALUES (N'90  ', N'Executive', N'100   ', N'Null')
GO
INSERT [dbo].[ThanNhan] ([MaNV], [TenTN], [QuanHe]) VALUES (N'103   ', N'Anna', N'daughter')
INSERT [dbo].[ThanNhan] ([MaNV], [TenTN], [QuanHe]) VALUES (N'103   ', N'Tom', N'son')
INSERT [dbo].[ThanNhan] ([MaNV], [TenTN], [QuanHe]) VALUES (N'176   ', N'Maria', N'daughter')
GO
ALTER TABLE [dbo].[DeAn]  WITH CHECK ADD  CONSTRAINT [FK_DeAn_PhongBan] FOREIGN KEY([Phong])
REFERENCES [dbo].[PhongBan] ([MaPhong])
GO
ALTER TABLE [dbo].[DeAn] CHECK CONSTRAINT [FK_DeAn_PhongBan]
GO
ALTER TABLE [dbo].[GhiNhoCongViec]  WITH CHECK ADD  CONSTRAINT [FK_GhiNhoCongViec_CongViec] FOREIGN KEY([MaNghe])
REFERENCES [dbo].[CongViec] ([MaCV])
GO
ALTER TABLE [dbo].[GhiNhoCongViec] CHECK CONSTRAINT [FK_GhiNhoCongViec_CongViec]
GO
ALTER TABLE [dbo].[GhiNhoCongViec]  WITH CHECK ADD  CONSTRAINT [FK_GhiNhoCongViec_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[GhiNhoCongViec] CHECK CONSTRAINT [FK_GhiNhoCongViec_NhanVien]
GO
ALTER TABLE [dbo].[GhiNhoCongViec]  WITH CHECK ADD  CONSTRAINT [FK_GhiNhoCongViec_PhongBan] FOREIGN KEY([MaPhong])
REFERENCES [dbo].[PhongBan] ([MaPhong])
GO
ALTER TABLE [dbo].[GhiNhoCongViec] CHECK CONSTRAINT [FK_GhiNhoCongViec_PhongBan]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_CongViec] FOREIGN KEY([MaCV])
REFERENCES [dbo].[CongViec] ([MaCV])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_CongViec]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_NhanVien] FOREIGN KEY([MaQuanLy])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_NhanVien]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_PhongBan] FOREIGN KEY([MaPhong])
REFERENCES [dbo].[PhongBan] ([MaPhong])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_PhongBan]
GO
ALTER TABLE [dbo].[PhanCong]  WITH CHECK ADD  CONSTRAINT [FK_PhanCong_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[PhanCong] CHECK CONSTRAINT [FK_PhanCong_NhanVien]
GO
ALTER TABLE [dbo].[PhongBan]  WITH NOCHECK ADD  CONSTRAINT [FK_PhongBan_NhanVien] FOREIGN KEY([MaTruongPhong])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[PhongBan] CHECK CONSTRAINT [FK_PhongBan_NhanVien]
GO
ALTER TABLE [dbo].[ThanNhan]  WITH CHECK ADD  CONSTRAINT [FK_ThanNhan_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[ThanNhan] CHECK CONSTRAINT [FK_ThanNhan_NhanVien]
GO
USE [master]
GO
ALTER DATABASE [QLCongTy] SET  READ_WRITE 
GO
