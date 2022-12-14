Create database CSDLDe2
Go

USE [CSDLDe2]
GO

CREATE TABLE [dbo].[CongTrinh](
	[MaCT] [nvarchar](10) NOT NULL,
	[TenCT] [nvarchar](20) NULL,
	[DiaDiem] [nvarchar](30) NULL,
	[NgayCapQD] [datetime] NULL,
 CONSTRAINT [PK_CongTrinh] PRIMARY KEY CLUSTERED 
(
	[MaCT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 06/01/2020 7:42:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [nvarchar](15) NOT NULL,
	[HoTen] [nvarchar](30) NULL,
	[NgaySinh] [datetime] NULL,
	[Phai] [nvarchar](10) NULL,
	[MaPB] [nchar](10) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhanCong]    Script Date: 06/01/2020 7:42:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanCong](
	[MaCT] [nvarchar](10) NOT NULL,
	[MaNV] [nvarchar](15) NOT NULL,
	[SLNgayCong] [smallint] NULL,
	[NgayThamGia] [datetime] NOT NULL,
 CONSTRAINT [PK_PhanCong_1] PRIMARY KEY CLUSTERED 
(
	[MaCT] ASC,
	[MaNV] ASC,
	[NgayThamGia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhongBan]    Script Date: 06/01/2020 7:42:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhongBan](
	[MaPB] [nchar](10) NOT NULL,
	[TenPB] [nvarchar](30) NULL,
 CONSTRAINT [PK_PhongBan] PRIMARY KEY CLUSTERED 
(
	[MaPB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[CongTrinh] ([MaCT], [TenCT], [DiaDiem], [NgayCapQD]) VALUES (N'CT001', N'Xử lý nước', N'Đồng Nai', CAST(N'2015-03-26T00:00:00.000' AS DateTime))
INSERT [dbo].[CongTrinh] ([MaCT], [TenCT], [DiaDiem], [NgayCapQD]) VALUES (N'CT002', N'Xử lý rác', N'Nha Trang', CAST(N'2016-01-14T00:00:00.000' AS DateTime))
INSERT [dbo].[CongTrinh] ([MaCT], [TenCT], [DiaDiem], [NgayCapQD]) VALUES (N'CT003', N'Bảo trì nhà máy bia', N'Vũng Tàu', CAST(N'2017-02-05T00:00:00.000' AS DateTime))
INSERT [dbo].[CongTrinh] ([MaCT], [TenCT], [DiaDiem], [NgayCapQD]) VALUES (N'CT004', N'Nhà công cộng Q1', N'Tp HCM', CAST(N'2017-05-20T00:00:00.000' AS DateTime))
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [Phai], [MaPB]) VALUES (N'001', N'Hồ Ca', CAST(N'1987-01-21T00:00:00.000' AS DateTime), N'Nữ', N'KT01      ')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [Phai], [MaPB]) VALUES (N'002', N'Đỗ Mười', CAST(N'1990-08-19T00:00:00.000' AS DateTime), N'Nam', N'NS01      ')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [Phai], [MaPB]) VALUES (N'003', N'Lê Hào', CAST(N'1988-04-12T00:00:00.000' AS DateTime), N'Nam', N'KD01      ')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [Phai], [MaPB]) VALUES (N'004', N'Phan Nam', CAST(N'1991-03-08T00:00:00.000' AS DateTime), N'Nam', N'KT01      ')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [Phai], [MaPB]) VALUES (N'005', N'Hồ Đắc Đạt', CAST(N'1990-03-10T00:00:00.000' AS DateTime), N'Nam', N'KD01      ')
INSERT [dbo].[PhanCong] ([MaCT], [MaNV], [SLNgayCong], [NgayThamGia]) VALUES (N'CT001', N'002', 2, CAST(N'2016-02-03T00:00:00.000' AS DateTime))
INSERT [dbo].[PhanCong] ([MaCT], [MaNV], [SLNgayCong], [NgayThamGia]) VALUES (N'CT001', N'003', 4, CAST(N'2016-03-02T00:00:00.000' AS DateTime))
INSERT [dbo].[PhanCong] ([MaCT], [MaNV], [SLNgayCong], [NgayThamGia]) VALUES (N'CT001', N'004', 6, CAST(N'2016-03-02T00:00:00.000' AS DateTime))
INSERT [dbo].[PhanCong] ([MaCT], [MaNV], [SLNgayCong], [NgayThamGia]) VALUES (N'CT002', N'001', 6, CAST(N'2017-02-05T00:00:00.000' AS DateTime))
INSERT [dbo].[PhanCong] ([MaCT], [MaNV], [SLNgayCong], [NgayThamGia]) VALUES (N'CT002', N'004', 4, CAST(N'2017-02-05T00:00:00.000' AS DateTime))
INSERT [dbo].[PhanCong] ([MaCT], [MaNV], [SLNgayCong], [NgayThamGia]) VALUES (N'CT003', N'001', 4, CAST(N'2017-02-05T00:00:00.000' AS DateTime))
INSERT [dbo].[PhanCong] ([MaCT], [MaNV], [SLNgayCong], [NgayThamGia]) VALUES (N'CT003', N'002', 4, CAST(N'2017-02-05T00:00:00.000' AS DateTime))
INSERT [dbo].[PhanCong] ([MaCT], [MaNV], [SLNgayCong], [NgayThamGia]) VALUES (N'CT003', N'003', 9, CAST(N'2017-02-05T00:00:00.000' AS DateTime))
INSERT [dbo].[PhanCong] ([MaCT], [MaNV], [SLNgayCong], [NgayThamGia]) VALUES (N'CT003', N'004', 8, CAST(N'2017-02-05T00:00:00.000' AS DateTime))
INSERT [dbo].[PhanCong] ([MaCT], [MaNV], [SLNgayCong], [NgayThamGia]) VALUES (N'CT004', N'001', 9, CAST(N'2018-04-03T00:00:00.000' AS DateTime))
INSERT [dbo].[PhanCong] ([MaCT], [MaNV], [SLNgayCong], [NgayThamGia]) VALUES (N'CT004', N'002', 8, CAST(N'2018-04-03T00:00:00.000' AS DateTime))
INSERT [dbo].[PhanCong] ([MaCT], [MaNV], [SLNgayCong], [NgayThamGia]) VALUES (N'CT004', N'005', 6, CAST(N'2018-04-03T00:00:00.000' AS DateTime))
INSERT [dbo].[PhongBan] ([MaPB], [TenPB]) VALUES (N'KD01      ', N'Kinh doanh')
INSERT [dbo].[PhongBan] ([MaPB], [TenPB]) VALUES (N'KT01      ', N'Kế toán')
INSERT [dbo].[PhongBan] ([MaPB], [TenPB]) VALUES (N'NS01      ', N'Nhân sự')
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_PhongBan] FOREIGN KEY([MaPB])
REFERENCES [dbo].[PhongBan] ([MaPB])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_PhongBan]
GO
ALTER TABLE [dbo].[PhanCong]  WITH CHECK ADD  CONSTRAINT [FK_PhanCong_CongTrinh] FOREIGN KEY([MaCT])
REFERENCES [dbo].[CongTrinh] ([MaCT])
GO
ALTER TABLE [dbo].[PhanCong] CHECK CONSTRAINT [FK_PhanCong_CongTrinh]
GO
ALTER TABLE [dbo].[PhanCong]  WITH CHECK ADD  CONSTRAINT [FK_PhanCong_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[PhanCong] CHECK CONSTRAINT [FK_PhanCong_NhanVien]
GO
USE [master]
GO
