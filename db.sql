USE [master]
GO
/****** Object:  Database [SHOPQANAM12]    Script Date: 1/16/2025 2:58:27 PM ******/
CREATE DATABASE [SHOPQANAM12]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SHOPQANAM12', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SHOPQANAM12.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SHOPQANAM12_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SHOPQANAM12_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SHOPQANAM12] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SHOPQANAM12].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SHOPQANAM12] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SHOPQANAM12] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SHOPQANAM12] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SHOPQANAM12] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SHOPQANAM12] SET ARITHABORT OFF 
GO
ALTER DATABASE [SHOPQANAM12] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SHOPQANAM12] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SHOPQANAM12] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SHOPQANAM12] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SHOPQANAM12] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SHOPQANAM12] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SHOPQANAM12] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SHOPQANAM12] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SHOPQANAM12] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SHOPQANAM12] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SHOPQANAM12] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SHOPQANAM12] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SHOPQANAM12] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SHOPQANAM12] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SHOPQANAM12] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SHOPQANAM12] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SHOPQANAM12] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SHOPQANAM12] SET RECOVERY FULL 
GO
ALTER DATABASE [SHOPQANAM12] SET  MULTI_USER 
GO
ALTER DATABASE [SHOPQANAM12] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SHOPQANAM12] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SHOPQANAM12] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SHOPQANAM12] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SHOPQANAM12] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SHOPQANAM12] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SHOPQANAM12', N'ON'
GO
ALTER DATABASE [SHOPQANAM12] SET QUERY_STORE = OFF
GO
USE [SHOPQANAM12]
GO
/****** Object:  Table [dbo].[gio_hang]    Script Date: 1/16/2025 2:58:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gio_hang](
	[id_gio_hang] [int] IDENTITY(1,1) NOT NULL,
	[ma_gh] [nvarchar](50) NULL,
	[id_khach_hang] [int] NULL,
	[id_san_pham_ct] [int] NULL,
	[nguoi_nhan] [nvarchar](50) NULL,
	[sdt_gh] [varchar](20) NULL,
	[email_gh] [nvarchar](50) NULL,
	[noi_nhan] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_gio_hang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hoa_don]    Script Date: 1/16/2025 2:58:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoa_don](
	[id_hoa_don] [int] IDENTITY(1,1) NOT NULL,
	[ma_hd] [nvarchar](50) NOT NULL,
	[id_khach_hang] [int] NULL,
	[id_nhan_vien] [int] NULL,
	[id_thanh_toan] [int] NULL,
	[ten_nguoi_nhan] [nvarchar](max) NULL,
	[id_loai_hoa_don] [int] NULL,
	[id_voucher] [int] NULL,
	[tong_tien] [decimal](10, 2) NULL,
	[ngay_tao] [date] NOT NULL,
	[thanh_pho] [nvarchar](250) NULL,
	[diachi] [nvarchar](250) NULL,
	[phi_van_chuyen] [int] NULL,
	[email] [nvarchar](50) NULL,
	[sdt] [varchar](20) NULL,
	[id_trang_thai_don_hang] [int] NULL,
	[trang_thai] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_hoa_don] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hoa_don_ct]    Script Date: 1/16/2025 2:58:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoa_don_ct](
	[id_hoa_don_ct] [int] IDENTITY(1,1) NOT NULL,
	[ma_hdct] [nvarchar](50) NOT NULL,
	[id_san_pham_ct] [int] NOT NULL,
	[id_hoa_don] [int] NOT NULL,
	[soluong] [int] NULL,
	[don_gia] [decimal](10, 2) NULL,
	[thanh_tien] [decimal](10, 2) NULL,
	[trang_thai] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_hoa_don_ct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[khach_hang]    Script Date: 1/16/2025 2:58:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[khach_hang](
	[id_khach_hang] [int] IDENTITY(1,1) NOT NULL,
	[ma_kh] [nvarchar](50) NULL,
	[ten_kh] [nvarchar](255) NULL,
	[ngay_sinh] [date] NULL,
	[gioi_tinh] [nvarchar](10) NULL,
	[sdt] [nvarchar](20) NULL,
	[dia_chi] [nvarchar](255) NULL,
	[email] [nvarchar](50) NULL,
	[mat_khau] [nvarchar](50) NULL,
	[anh_dai_dien] [nvarchar](max) NULL,
	[trang_thai] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_khach_hang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[loai_hoa_don]    Script Date: 1/16/2025 2:58:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[loai_hoa_don](
	[id_loai_hoa_don] [int] IDENTITY(1,1) NOT NULL,
	[loai] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_loai_hoa_don] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mau_sac]    Script Date: 1/16/2025 2:58:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mau_sac](
	[id_mau_sac] [int] IDENTITY(1,1) NOT NULL,
	[ten_mau_sac] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_mau_sac] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nhan_vien]    Script Date: 1/16/2025 2:58:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nhan_vien](
	[id_nhan_vien] [int] IDENTITY(1,1) NOT NULL,
	[ma_nv] [nvarchar](50) NOT NULL,
	[ten_nv] [nvarchar](255) NOT NULL,
	[ngay_sinh] [date] NOT NULL,
	[gioi_tinh] [nvarchar](10) NOT NULL,
	[sdt] [nvarchar](20) NOT NULL,
	[dia_chi] [nvarchar](255) NOT NULL,
	[email] [nvarchar](50) NULL,
	[mat_khau] [nvarchar](50) NULL,
	[anh_dai_dien] [nvarchar](max) NULL,
	[chuc_vu] [nvarchar](50) NOT NULL,
	[trang_thai] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_nhan_vien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[san_pham]    Script Date: 1/16/2025 2:58:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[san_pham](
	[id_san_pham] [int] IDENTITY(1,1) NOT NULL,
	[ma_sp] [nvarchar](50) NOT NULL,
	[anh_sp] [nvarchar](max) NULL,
	[ten_sp] [nvarchar](250) NOT NULL,
	[gia] [decimal](10, 2) NULL,
	[loai] [nvarchar](250) NOT NULL,
	[trang_thai] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_san_pham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[san_pham_ct]    Script Date: 1/16/2025 2:58:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[san_pham_ct](
	[id_san_pham_ct] [int] IDENTITY(1,1) NOT NULL,
	[ma_spct] [nvarchar](50) NOT NULL,
	[id_san_pham] [int] NOT NULL,
	[id_mau_sac] [int] NOT NULL,
	[id_thuong_hieu] [int] NULL,
	[size] [nvarchar](10) NOT NULL,
	[so_luong_ton] [int] NOT NULL,
	[gia_ban] [decimal](10, 2) NOT NULL,
	[trang_thai] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_san_pham_ct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[thanh_toan]    Script Date: 1/16/2025 2:58:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[thanh_toan](
	[id_thanh_toan] [int] IDENTITY(1,1) NOT NULL,
	[loai] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_thanh_toan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[thuong_hieu]    Script Date: 1/16/2025 2:58:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[thuong_hieu](
	[id_thuong_hieu] [int] IDENTITY(1,1) NOT NULL,
	[ten_thuong_hieu] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_thuong_hieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trang_thai_don_hang]    Script Date: 1/16/2025 2:58:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trang_thai_don_hang](
	[id_trang_thai_don_hang] [int] IDENTITY(1,1) NOT NULL,
	[loaitt] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_trang_thai_don_hang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRANGCHU]    Script Date: 1/16/2025 2:58:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRANGCHU](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[description] [nvarchar](255) NULL,
	[price] [float] NULL,
	[image_url] [varchar](255) NULL,
	[discount] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[voucher]    Script Date: 1/16/2025 2:58:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[voucher](
	[id_voucher] [int] IDENTITY(1,1) NOT NULL,
	[ma] [nvarchar](50) NOT NULL,
	[ten] [nvarchar](255) NOT NULL,
	[ngay_bat_dau] [date] NOT NULL,
	[ngay_ket_thuc] [date] NOT NULL,
	[gia_tri] [decimal](10, 2) NOT NULL,
	[trang_thai] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_voucher] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[gio_hang] ON 

INSERT [dbo].[gio_hang] ([id_gio_hang], [ma_gh], [id_khach_hang], [id_san_pham_ct], [nguoi_nhan], [sdt_gh], [email_gh], [noi_nhan]) VALUES (1, N'GH001', 1, NULL, N'Nguyễn Phi Hùng', N'0123456789', N'hungpn@gmail.com', N'Hà Nội')
INSERT [dbo].[gio_hang] ([id_gio_hang], [ma_gh], [id_khach_hang], [id_san_pham_ct], [nguoi_nhan], [sdt_gh], [email_gh], [noi_nhan]) VALUES (2, N'GH002', 2, NULL, N'Trần Văn Minh', N'0987654321', N'minhtv@gmail.com', N'Hà Nội')
INSERT [dbo].[gio_hang] ([id_gio_hang], [ma_gh], [id_khach_hang], [id_san_pham_ct], [nguoi_nhan], [sdt_gh], [email_gh], [noi_nhan]) VALUES (3, N'GH20250116143358', 22, 4, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[gio_hang] OFF
GO
SET IDENTITY_INSERT [dbo].[hoa_don] ON 

INSERT [dbo].[hoa_don] ([id_hoa_don], [ma_hd], [id_khach_hang], [id_nhan_vien], [id_thanh_toan], [ten_nguoi_nhan], [id_loai_hoa_don], [id_voucher], [tong_tien], [ngay_tao], [thanh_pho], [diachi], [phi_van_chuyen], [email], [sdt], [id_trang_thai_don_hang], [trang_thai]) VALUES (1, N'HD001', 1, 1, 1, NULL, 1, 1, CAST(750000.00 AS Decimal(10, 2)), CAST(N'2024-01-01' AS Date), NULL, N'Hà Nội', NULL, N'hungpn@gmail.com', N'0123456789', NULL, 0)
INSERT [dbo].[hoa_don] ([id_hoa_don], [ma_hd], [id_khach_hang], [id_nhan_vien], [id_thanh_toan], [ten_nguoi_nhan], [id_loai_hoa_don], [id_voucher], [tong_tien], [ngay_tao], [thanh_pho], [diachi], [phi_van_chuyen], [email], [sdt], [id_trang_thai_don_hang], [trang_thai]) VALUES (2, N'HD002', 2, 1, 2, NULL, 2, 2, CAST(1250000.00 AS Decimal(10, 2)), CAST(N'2024-01-02' AS Date), NULL, N'Hà Nội', NULL, N'minhtv@gmail.com', N'0987654321', NULL, 0)
INSERT [dbo].[hoa_don] ([id_hoa_don], [ma_hd], [id_khach_hang], [id_nhan_vien], [id_thanh_toan], [ten_nguoi_nhan], [id_loai_hoa_don], [id_voucher], [tong_tien], [ngay_tao], [thanh_pho], [diachi], [phi_van_chuyen], [email], [sdt], [id_trang_thai_don_hang], [trang_thai]) VALUES (3, N'HD003', 3, 2, 1, NULL, 1, 2, CAST(550000.00 AS Decimal(10, 2)), CAST(N'2024-01-03' AS Date), NULL, N'Hà Nội', NULL, N'lanpt@gmail.com', N'112233', NULL, 0)
INSERT [dbo].[hoa_don] ([id_hoa_don], [ma_hd], [id_khach_hang], [id_nhan_vien], [id_thanh_toan], [ten_nguoi_nhan], [id_loai_hoa_don], [id_voucher], [tong_tien], [ngay_tao], [thanh_pho], [diachi], [phi_van_chuyen], [email], [sdt], [id_trang_thai_don_hang], [trang_thai]) VALUES (4, N'HD20250116143430', NULL, 3, 2, NULL, 1, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(N'2025-01-16' AS Date), NULL, N'...', NULL, N'...', N'...', 1, 0)
SET IDENTITY_INSERT [dbo].[hoa_don] OFF
GO
SET IDENTITY_INSERT [dbo].[khach_hang] ON 

INSERT [dbo].[khach_hang] ([id_khach_hang], [ma_kh], [ten_kh], [ngay_sinh], [gioi_tinh], [sdt], [dia_chi], [email], [mat_khau], [anh_dai_dien], [trang_thai]) VALUES (1, N'KH001', N'Nguyễn Phi Hùng', CAST(N'2005-05-08' AS Date), N'Nam', N'0123456789', N'Hà Nội', N'hungpn@gmail.com', N'123456', N'1003.jpg', 0)
INSERT [dbo].[khach_hang] ([id_khach_hang], [ma_kh], [ten_kh], [ngay_sinh], [gioi_tinh], [sdt], [dia_chi], [email], [mat_khau], [anh_dai_dien], [trang_thai]) VALUES (2, N'KH002', N'Trần Văn Minh', CAST(N'2002-11-12' AS Date), N'Nam', N'0987654321', N'Hà Nội', N'minhtv@gmail.com', N'123456', N'1003.jpg', 1)
INSERT [dbo].[khach_hang] ([id_khach_hang], [ma_kh], [ten_kh], [ngay_sinh], [gioi_tinh], [sdt], [dia_chi], [email], [mat_khau], [anh_dai_dien], [trang_thai]) VALUES (3, N'KH003', N'Phạm Thị Lan', CAST(N'2000-03-22' AS Date), N'Nữ', N'0981122334', N'Hà Nội', N'lanpt@gmail.com', N'112233', N'1003.jpg', 1)
INSERT [dbo].[khach_hang] ([id_khach_hang], [ma_kh], [ten_kh], [ngay_sinh], [gioi_tinh], [sdt], [dia_chi], [email], [mat_khau], [anh_dai_dien], [trang_thai]) VALUES (4, N'KH004', N'Lê Anh Tuấn', CAST(N'1998-07-15' AS Date), N'Nam', N'0974455667', N'Hải Phòng', N'tuanla@gmail.com', N'334455', N'1003.jpg', 1)
INSERT [dbo].[khach_hang] ([id_khach_hang], [ma_kh], [ten_kh], [ngay_sinh], [gioi_tinh], [sdt], [dia_chi], [email], [mat_khau], [anh_dai_dien], [trang_thai]) VALUES (5, N'KH005', N'Nguyễn Thị Hoa', CAST(N'2001-09-09' AS Date), N'Nữ', N'0912233445', N'Hà Nội', N'hoant@gmail.com', N'556677', N'1003.jpg', 1)
INSERT [dbo].[khach_hang] ([id_khach_hang], [ma_kh], [ten_kh], [ngay_sinh], [gioi_tinh], [sdt], [dia_chi], [email], [mat_khau], [anh_dai_dien], [trang_thai]) VALUES (6, N'KH006', N'Bùi Văn Phong', CAST(N'1999-06-30' AS Date), N'Nam', N'0933344556', N'Hà Nội', N'phongbv@gmail.com', N'778899', N'1003.jpg', 1)
INSERT [dbo].[khach_hang] ([id_khach_hang], [ma_kh], [ten_kh], [ngay_sinh], [gioi_tinh], [sdt], [dia_chi], [email], [mat_khau], [anh_dai_dien], [trang_thai]) VALUES (7, N'KH007', N'Vũ Thị Hồng', CAST(N'2003-04-18' AS Date), N'Nữ', N'0909988776', N'Hà Nội', N'hongvt@gmail.com', N'998877', N'1003.jpg', 1)
INSERT [dbo].[khach_hang] ([id_khach_hang], [ma_kh], [ten_kh], [ngay_sinh], [gioi_tinh], [sdt], [dia_chi], [email], [mat_khau], [anh_dai_dien], [trang_thai]) VALUES (8, N'KH008', N'Trương Công Bình', CAST(N'1997-12-25' AS Date), N'Nam', N'0916677889', N'Hà Nội', N'binhtc@gmail.com', N'123456', N'1003.jpg', 1)
INSERT [dbo].[khach_hang] ([id_khach_hang], [ma_kh], [ten_kh], [ngay_sinh], [gioi_tinh], [sdt], [dia_chi], [email], [mat_khau], [anh_dai_dien], [trang_thai]) VALUES (9, N'KH009', N'Hoàng Thị Mai', CAST(N'1996-05-03' AS Date), N'Nữ', N'0923345566', N'Hà Nội', N'maihn@gmail.com', N'789456', N'1003.jpg', 1)
INSERT [dbo].[khach_hang] ([id_khach_hang], [ma_kh], [ten_kh], [ngay_sinh], [gioi_tinh], [sdt], [dia_chi], [email], [mat_khau], [anh_dai_dien], [trang_thai]) VALUES (10, N'KH010', N'Đỗ Quang Huy', CAST(N'2000-01-10' AS Date), N'Nam', N'0907766554', N'Vĩnh Phúc', N'huydq@gmail.com', N'456123', N'1003.jpg', 1)
INSERT [dbo].[khach_hang] ([id_khach_hang], [ma_kh], [ten_kh], [ngay_sinh], [gioi_tinh], [sdt], [dia_chi], [email], [mat_khau], [anh_dai_dien], [trang_thai]) VALUES (11, N'KH011', N'Tạ Thị Thanh', CAST(N'2002-08-22' AS Date), N'Nữ', N'0945566778', N'Hà Nội', N'thanhtt@gmail.com', N'147258', N'1003.jpg', 1)
INSERT [dbo].[khach_hang] ([id_khach_hang], [ma_kh], [ten_kh], [ngay_sinh], [gioi_tinh], [sdt], [dia_chi], [email], [mat_khau], [anh_dai_dien], [trang_thai]) VALUES (12, N'KH012', N'Nguyễn Văn Khoa', CAST(N'2001-02-14' AS Date), N'Nam', N'0956677889', N'Hà Nội', N'khoanv@gmail.com', N'123456', N'1003.jpg', 1)
INSERT [dbo].[khach_hang] ([id_khach_hang], [ma_kh], [ten_kh], [ngay_sinh], [gioi_tinh], [sdt], [dia_chi], [email], [mat_khau], [anh_dai_dien], [trang_thai]) VALUES (13, N'KH013', N'Lê Thị Nhung', CAST(N'1999-06-19' AS Date), N'Nữ', N'0935566777', N'Nam Định', N'nhunglt@gmail.com', N'123456', N'1003.jpg', 1)
INSERT [dbo].[khach_hang] ([id_khach_hang], [ma_kh], [ten_kh], [ngay_sinh], [gioi_tinh], [sdt], [dia_chi], [email], [mat_khau], [anh_dai_dien], [trang_thai]) VALUES (14, N'KH014', N'Phan Văn Khải', CAST(N'2003-11-07' AS Date), N'Nam', N'0921122334', N'Hà Nội', N'khaipv@gmail.com', N'123456', N'1003.jpg', 1)
INSERT [dbo].[khach_hang] ([id_khach_hang], [ma_kh], [ten_kh], [ngay_sinh], [gioi_tinh], [sdt], [dia_chi], [email], [mat_khau], [anh_dai_dien], [trang_thai]) VALUES (15, N'KH015', N'Hoàng Văn Quân', CAST(N'1995-03-21' AS Date), N'Nam', N'0911122335', N'Hà Nội', N'quanhv@gmail.com', N'123456', N'1003.jpg', 1)
INSERT [dbo].[khach_hang] ([id_khach_hang], [ma_kh], [ten_kh], [ngay_sinh], [gioi_tinh], [sdt], [dia_chi], [email], [mat_khau], [anh_dai_dien], [trang_thai]) VALUES (16, N'KH016', N'Trần Phan Thành', CAST(N'2006-06-04' AS Date), N'Nam', N'0973856292', N'Hà Nội', N'thanhp@gmail.com', N'123456', N'1003.jpg', 0)
INSERT [dbo].[khach_hang] ([id_khach_hang], [ma_kh], [ten_kh], [ngay_sinh], [gioi_tinh], [sdt], [dia_chi], [email], [mat_khau], [anh_dai_dien], [trang_thai]) VALUES (17, N'KH017', N'Nguyễn Ngọc Linh', CAST(N'2005-03-15' AS Date), N'Nữ', N'0966006883', N'Hà Nội', N'linhnn@gmail.com', N'123456', N'1003.jpg', 0)
INSERT [dbo].[khach_hang] ([id_khach_hang], [ma_kh], [ten_kh], [ngay_sinh], [gioi_tinh], [sdt], [dia_chi], [email], [mat_khau], [anh_dai_dien], [trang_thai]) VALUES (18, N'KH018', N'Nguyễn Đạo Minh', CAST(N'2004-05-24' AS Date), N'Nam', N'0953242554', N'Hà Nội', N'minhnd@gmail.com', N'123456', N'1003.jpg', 0)
INSERT [dbo].[khach_hang] ([id_khach_hang], [ma_kh], [ten_kh], [ngay_sinh], [gioi_tinh], [sdt], [dia_chi], [email], [mat_khau], [anh_dai_dien], [trang_thai]) VALUES (19, N'KH019', N'Nguyễn Minh Sang', CAST(N'2006-04-16' AS Date), N'Nam', N'0978638573', N'Hà Nội', N'sangnm@gmail.com', N'123456', N'1003.jpg', 0)
INSERT [dbo].[khach_hang] ([id_khach_hang], [ma_kh], [ten_kh], [ngay_sinh], [gioi_tinh], [sdt], [dia_chi], [email], [mat_khau], [anh_dai_dien], [trang_thai]) VALUES (20, N'KH020', N'Nguyễn Tiến Đạt', CAST(N'2004-07-04' AS Date), N'Nam', N'0997937598', N'Hà Nội', N'datnt@gmail.com', N'123456', N'1003.jpg', 0)
INSERT [dbo].[khach_hang] ([id_khach_hang], [ma_kh], [ten_kh], [ngay_sinh], [gioi_tinh], [sdt], [dia_chi], [email], [mat_khau], [anh_dai_dien], [trang_thai]) VALUES (21, N'KH021', N'Khách lẻ', CAST(N'1900-01-01' AS Date), N'', N'', N'', N'', N'', N'', 0)
INSERT [dbo].[khach_hang] ([id_khach_hang], [ma_kh], [ten_kh], [ngay_sinh], [gioi_tinh], [sdt], [dia_chi], [email], [mat_khau], [anh_dai_dien], [trang_thai]) VALUES (22, N'KH022', N'duyanh123', CAST(N'2025-01-27' AS Date), N'Nam', N'0384332927', N'Bắc Giang', N'anhddph36324@fpt.edu.vn', N'123456', NULL, 0)
SET IDENTITY_INSERT [dbo].[khach_hang] OFF
GO
SET IDENTITY_INSERT [dbo].[loai_hoa_don] ON 

INSERT [dbo].[loai_hoa_don] ([id_loai_hoa_don], [loai]) VALUES (1, N'Tại quầy')
INSERT [dbo].[loai_hoa_don] ([id_loai_hoa_don], [loai]) VALUES (2, N'Trực tuyến')
SET IDENTITY_INSERT [dbo].[loai_hoa_don] OFF
GO
SET IDENTITY_INSERT [dbo].[mau_sac] ON 

INSERT [dbo].[mau_sac] ([id_mau_sac], [ten_mau_sac]) VALUES (1, N'Đỏ')
INSERT [dbo].[mau_sac] ([id_mau_sac], [ten_mau_sac]) VALUES (2, N'Xanh Lam')
INSERT [dbo].[mau_sac] ([id_mau_sac], [ten_mau_sac]) VALUES (3, N'Cam')
INSERT [dbo].[mau_sac] ([id_mau_sac], [ten_mau_sac]) VALUES (4, N'Vàng')
INSERT [dbo].[mau_sac] ([id_mau_sac], [ten_mau_sac]) VALUES (5, N'Trắng')
INSERT [dbo].[mau_sac] ([id_mau_sac], [ten_mau_sac]) VALUES (6, N'Xám')
INSERT [dbo].[mau_sac] ([id_mau_sac], [ten_mau_sac]) VALUES (7, N'Đen')
SET IDENTITY_INSERT [dbo].[mau_sac] OFF
GO
SET IDENTITY_INSERT [dbo].[nhan_vien] ON 

INSERT [dbo].[nhan_vien] ([id_nhan_vien], [ma_nv], [ten_nv], [ngay_sinh], [gioi_tinh], [sdt], [dia_chi], [email], [mat_khau], [anh_dai_dien], [chuc_vu], [trang_thai]) VALUES (1, N'NV001', N'Bùi Tất Tùng', CAST(N'2004-01-01' AS Date), N'Nam', N'0973526218', N'Hà Nội', N'tungbtph36245@fpt.edu.vn', N'123456', N'1003.jpg', N'Nhân viên', 1)
INSERT [dbo].[nhan_vien] ([id_nhan_vien], [ma_nv], [ten_nv], [ngay_sinh], [gioi_tinh], [sdt], [dia_chi], [email], [mat_khau], [anh_dai_dien], [chuc_vu], [trang_thai]) VALUES (2, N'NV002', N'Nguyễn Tùng Lâm', CAST(N'2004-01-01' AS Date), N'Nam', N'0971135591', N'Hà Nội', N'lamntph36293@fpt.edu.vn', N'123456', N'1003.jpg', N'Nhân viên', 0)
INSERT [dbo].[nhan_vien] ([id_nhan_vien], [ma_nv], [ten_nv], [ngay_sinh], [gioi_tinh], [sdt], [dia_chi], [email], [mat_khau], [anh_dai_dien], [chuc_vu], [trang_thai]) VALUES (3, N'NV003', N'Dương Duy Anh', CAST(N'2004-01-01' AS Date), N'Nam', N'0384332927', N'Hà Nội', N'anhddph36324@fpt.edu.vn', N'123456', N'1003.jpg', N'Nhân viên', 0)
INSERT [dbo].[nhan_vien] ([id_nhan_vien], [ma_nv], [ten_nv], [ngay_sinh], [gioi_tinh], [sdt], [dia_chi], [email], [mat_khau], [anh_dai_dien], [chuc_vu], [trang_thai]) VALUES (4, N'NV004', N'Trần Đức Long', CAST(N'2004-01-01' AS Date), N'Nam', N'0966006883', N'Hà Nội', N'longtd37031@fpt.edu.vn', N'123456', N'1003.jpg', N'Nhân viên', 1)
INSERT [dbo].[nhan_vien] ([id_nhan_vien], [ma_nv], [ten_nv], [ngay_sinh], [gioi_tinh], [sdt], [dia_chi], [email], [mat_khau], [anh_dai_dien], [chuc_vu], [trang_thai]) VALUES (5, N'NV005', N'Nguyễn Mạnh Hùng', CAST(N'2004-01-01' AS Date), N'Nam', N'0332017755', N'Hà Nội', N'hungnmph38702@fpt.edu.vn', N'123456', N'1003.jpg', N'Nhân viên', 1)
INSERT [dbo].[nhan_vien] ([id_nhan_vien], [ma_nv], [ten_nv], [ngay_sinh], [gioi_tinh], [sdt], [dia_chi], [email], [mat_khau], [anh_dai_dien], [chuc_vu], [trang_thai]) VALUES (6, N'NV006', N'Tạ Minh Kha', CAST(N'2004-11-23' AS Date), N'Nam', N'0972629593', N'Hà Nội', N'khatmph37131@fpt.edu.vn', N'123456', N'1003.jpg', N'Quản lí', 0)
SET IDENTITY_INSERT [dbo].[nhan_vien] OFF
GO
SET IDENTITY_INSERT [dbo].[san_pham] ON 

INSERT [dbo].[san_pham] ([id_san_pham], [ma_sp], [anh_sp], [ten_sp], [gia], [loai], [trang_thai]) VALUES (1, N'SP001', N'https://media.routine.vn/1600x1200/prod/media/10F21TSSA001_DARK-GREY_1_ao-the-thao-nam-1-mekr.jpg', N'Áo Thun Chạy Bộ Graphic Dot', CAST(120000.00 AS Decimal(10, 2)), N'Áo Thun', 1)
INSERT [dbo].[san_pham] ([id_san_pham], [ma_sp], [anh_sp], [ten_sp], [gia], [loai], [trang_thai]) VALUES (2, N'SP002', N'https://media3.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/January2024/thumb23CMAW.TT004.1.jpg', N'Áo Thun Thể Thao Jacquard Seamless', CAST(120000.00 AS Decimal(10, 2)), N'Áo Thun', 0)
INSERT [dbo].[san_pham] ([id_san_pham], [ma_sp], [anh_sp], [ten_sp], [gia], [loai], [trang_thai]) VALUES (3, N'SP003', N'http://supersports.com.vn/cdn/shop/files/DD8318-010-1_1200x1200.jpg?v=1682505335', N'Áo Thun Thể Thao Nike', CAST(120000.00 AS Decimal(10, 2)), N'Áo Thun', 1)
INSERT [dbo].[san_pham] ([id_san_pham], [ma_sp], [anh_sp], [ten_sp], [gia], [loai], [trang_thai]) VALUES (4, N'SP004', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lrzcob3cw3a11d', N'Áo Sơ Mi Premium Dobby', CAST(120000.00 AS Decimal(10, 2)), N'Áo Sơ Mi', 1)
INSERT [dbo].[san_pham] ([id_san_pham], [ma_sp], [anh_sp], [ten_sp], [gia], [loai], [trang_thai]) VALUES (5, N'SP005', N'https://media3.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/March2024/mceclip3_47.jpg', N'Áo Sơ Mi Essentials Cotton', CAST(120000.00 AS Decimal(10, 2)), N'Áo Sơ Mi', 0)
INSERT [dbo].[san_pham] ([id_san_pham], [ma_sp], [anh_sp], [ten_sp], [gia], [loai], [trang_thai]) VALUES (6, N'SP006', N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lwdtorngzumz30', N'Áo Sơ Mi Premium Poplin', CAST(120000.00 AS Decimal(10, 2)), N'Áo Sơ Mi', 1)
INSERT [dbo].[san_pham] ([id_san_pham], [ma_sp], [anh_sp], [ten_sp], [gia], [loai], [trang_thai]) VALUES (7, N'SP007', N'https://product.hstatic.net/200000472743/product/6_6d7f55fa2a9f45c0a4f28f012e943a01_master.jpg', N'Áo Tanktop Thể Thao Melange', CAST(120000.00 AS Decimal(10, 2)), N'Áo Tanktop', 1)
INSERT [dbo].[san_pham] ([id_san_pham], [ma_sp], [anh_sp], [ten_sp], [gia], [loai], [trang_thai]) VALUES (8, N'SP008', N'https://media3.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/September2023/ATT.TT.A.7.jpg', N'Áo Tanktop Thể Thao Nike', CAST(120000.00 AS Decimal(10, 2)), N'Áo Tanktop', 1)
INSERT [dbo].[san_pham] ([id_san_pham], [ma_sp], [anh_sp], [ten_sp], [gia], [loai], [trang_thai]) VALUES (9, N'SP009', N'https://media.routine.vn/1600x1200/prod/media/10F21TSSA001_DARK-GREY_1_ao-the-thao-nam-1-mekr.jpg', N'Áo Chạy Bộ Advanced', CAST(120000.00 AS Decimal(10, 2)), N'Áo Tanktop', 0)
INSERT [dbo].[san_pham] ([id_san_pham], [ma_sp], [anh_sp], [ten_sp], [gia], [loai], [trang_thai]) VALUES (10, N'SP010', N'https://cdn.vuahanghieu.com/unsafe/0x900/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/product/2024/05/ao-polo-nam-lacoste-heritage-regular-fit-badge-cotton-pique-ph2027-wtu-mau-do-size-2-665943331e9fa-31052024102539.jpg', N'Áo Polo Pique Cotton', CAST(120000.00 AS Decimal(10, 2)), N'Áo Polo', 1)
INSERT [dbo].[san_pham] ([id_san_pham], [ma_sp], [anh_sp], [ten_sp], [gia], [loai], [trang_thai]) VALUES (11, N'SP011', N'https://mcdn.coolmate.me/image/May2022/ao-polo-nam-excool-mat-me_222.jpg', N'Áo Polo Excool', CAST(120000.00 AS Decimal(10, 2)), N'Áo Polo', 1)
INSERT [dbo].[san_pham] ([id_san_pham], [ma_sp], [anh_sp], [ten_sp], [gia], [loai], [trang_thai]) VALUES (12, N'SP012', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/b3229657ee5e4d919952acdf010a01cb_9366/Ao_polo_AEROREADY_Designed_To_Move_trang_GM2154_01_laydown.jpg', N'Áo Polo Adidas', CAST(120000.00 AS Decimal(10, 2)), N'Áo Polo', 0)
INSERT [dbo].[san_pham] ([id_san_pham], [ma_sp], [anh_sp], [ten_sp], [gia], [loai], [trang_thai]) VALUES (13, N'SP013', N'https://savani.vn/images/image/2022/11/01/large/ao-phao-nam-MPG001-3-G3032-1.jpg', N'Áo Phao Ultrawarm', CAST(120000.00 AS Decimal(10, 2)), N'Áo Khoác', 0)
INSERT [dbo].[san_pham] ([id_san_pham], [ma_sp], [anh_sp], [ten_sp], [gia], [loai], [trang_thai]) VALUES (14, N'SP014', N'https://thantisocialclub.vn/data/upload/media/7eff9d4ba603655d3c12-1655990717.jpg', N'Áo Hoodie Essential', CAST(120000.00 AS Decimal(10, 2)), N'Áo Khoác', 1)
INSERT [dbo].[san_pham] ([id_san_pham], [ma_sp], [anh_sp], [ten_sp], [gia], [loai], [trang_thai]) VALUES (15, N'SP015', N'https://bizweb.dktcdn.net/thumb/1024x1024/100/423/517/products/1521470594aokhoacthethaonamdry.jpg?v=1622000869737', N'Áo Khoác Thể Thao Nam', CAST(120000.00 AS Decimal(10, 2)), N'Áo Khoác', 1)
INSERT [dbo].[san_pham] ([id_san_pham], [ma_sp], [anh_sp], [ten_sp], [gia], [loai], [trang_thai]) VALUES (16, N'SP016', N'https://teddyclothing.store/wp-content/uploads/2024/03/id-006596a_d4f80098d0d746699311704ff3f45f71.jpg', N'Quần shorts', CAST(120000.00 AS Decimal(10, 2)), N'Quần Shorts', 0)
INSERT [dbo].[san_pham] ([id_san_pham], [ma_sp], [anh_sp], [ten_sp], [gia], [loai], [trang_thai]) VALUES (17, N'SP017', N'https://product.hstatic.net/200000268347/product/cpk21-1149-bla-2_035b4a6606784369bae24393bedec5ff_master.jpg', N'Quần dài', CAST(120000.00 AS Decimal(10, 2)), N'Quần Dài', 0)
INSERT [dbo].[san_pham] ([id_san_pham], [ma_sp], [anh_sp], [ten_sp], [gia], [loai], [trang_thai]) VALUES (18, N'SP018', N'https://product.hstatic.net/1000362402/product/assq009-1-1_15eadc97ba594790bd3ac815c2a24b41_50750d0d0a2f4857b64bb0cc15080fbd_master.jpg', N'Quần bơi', CAST(120000.00 AS Decimal(10, 2)), N'Quần Bơi', 1)
SET IDENTITY_INSERT [dbo].[san_pham] OFF
GO
SET IDENTITY_INSERT [dbo].[san_pham_ct] ON 

INSERT [dbo].[san_pham_ct] ([id_san_pham_ct], [ma_spct], [id_san_pham], [id_mau_sac], [id_thuong_hieu], [size], [so_luong_ton], [gia_ban], [trang_thai]) VALUES (1, N'SPCT0035', 2, 2, 2, N'XL', 100, CAST(150000.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[san_pham_ct] ([id_san_pham_ct], [ma_spct], [id_san_pham], [id_mau_sac], [id_thuong_hieu], [size], [so_luong_ton], [gia_ban], [trang_thai]) VALUES (2, N'SPCT002', 1, 5, 2, N'XXL', 100, CAST(150000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[san_pham_ct] ([id_san_pham_ct], [ma_spct], [id_san_pham], [id_mau_sac], [id_thuong_hieu], [size], [so_luong_ton], [gia_ban], [trang_thai]) VALUES (3, N'SPCT003', 1, 3, 2, N'M', 100, CAST(150000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[san_pham_ct] ([id_san_pham_ct], [ma_spct], [id_san_pham], [id_mau_sac], [id_thuong_hieu], [size], [so_luong_ton], [gia_ban], [trang_thai]) VALUES (4, N'SPCT004', 2, 1, 4, N'XL', 100, CAST(150000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[san_pham_ct] ([id_san_pham_ct], [ma_spct], [id_san_pham], [id_mau_sac], [id_thuong_hieu], [size], [so_luong_ton], [gia_ban], [trang_thai]) VALUES (5, N'SPCT005', 2, 1, 4, N'XL', 100, CAST(150000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[san_pham_ct] ([id_san_pham_ct], [ma_spct], [id_san_pham], [id_mau_sac], [id_thuong_hieu], [size], [so_luong_ton], [gia_ban], [trang_thai]) VALUES (6, N'SPCT006', 2, 6, 4, N'XL', 100, CAST(150000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[san_pham_ct] ([id_san_pham_ct], [ma_spct], [id_san_pham], [id_mau_sac], [id_thuong_hieu], [size], [so_luong_ton], [gia_ban], [trang_thai]) VALUES (7, N'SPCT007', 3, 2, 7, N'XL', 100, CAST(150000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[san_pham_ct] ([id_san_pham_ct], [ma_spct], [id_san_pham], [id_mau_sac], [id_thuong_hieu], [size], [so_luong_ton], [gia_ban], [trang_thai]) VALUES (8, N'SPCT008', 3, 2, 7, N'XL', 100, CAST(150000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[san_pham_ct] ([id_san_pham_ct], [ma_spct], [id_san_pham], [id_mau_sac], [id_thuong_hieu], [size], [so_luong_ton], [gia_ban], [trang_thai]) VALUES (9, N'SPCT009', 3, 1, 7, N'XL', 100, CAST(150000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[san_pham_ct] ([id_san_pham_ct], [ma_spct], [id_san_pham], [id_mau_sac], [id_thuong_hieu], [size], [so_luong_ton], [gia_ban], [trang_thai]) VALUES (10, N'SPCT010', 4, 4, 2, N'XL', 100, CAST(150000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[san_pham_ct] ([id_san_pham_ct], [ma_spct], [id_san_pham], [id_mau_sac], [id_thuong_hieu], [size], [so_luong_ton], [gia_ban], [trang_thai]) VALUES (11, N'SPCT011', 4, 6, 2, N'XL', 100, CAST(150000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[san_pham_ct] ([id_san_pham_ct], [ma_spct], [id_san_pham], [id_mau_sac], [id_thuong_hieu], [size], [so_luong_ton], [gia_ban], [trang_thai]) VALUES (12, N'SPCT012', 4, 5, 2, N'XL', 100, CAST(150000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[san_pham_ct] ([id_san_pham_ct], [ma_spct], [id_san_pham], [id_mau_sac], [id_thuong_hieu], [size], [so_luong_ton], [gia_ban], [trang_thai]) VALUES (13, N'SPCT013', 5, 3, 1, N'XL', 100, CAST(150000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[san_pham_ct] ([id_san_pham_ct], [ma_spct], [id_san_pham], [id_mau_sac], [id_thuong_hieu], [size], [so_luong_ton], [gia_ban], [trang_thai]) VALUES (14, N'SPCT014', 5, 1, 1, N'XL', 100, CAST(150000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[san_pham_ct] ([id_san_pham_ct], [ma_spct], [id_san_pham], [id_mau_sac], [id_thuong_hieu], [size], [so_luong_ton], [gia_ban], [trang_thai]) VALUES (15, N'SPCT015', 5, 6, 1, N'XL', 100, CAST(150000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[san_pham_ct] ([id_san_pham_ct], [ma_spct], [id_san_pham], [id_mau_sac], [id_thuong_hieu], [size], [so_luong_ton], [gia_ban], [trang_thai]) VALUES (16, N'SPCT016', 6, 2, 9, N'XL', 100, CAST(150000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[san_pham_ct] ([id_san_pham_ct], [ma_spct], [id_san_pham], [id_mau_sac], [id_thuong_hieu], [size], [so_luong_ton], [gia_ban], [trang_thai]) VALUES (17, N'SPCT017', 6, 3, 9, N'XL', 100, CAST(150000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[san_pham_ct] ([id_san_pham_ct], [ma_spct], [id_san_pham], [id_mau_sac], [id_thuong_hieu], [size], [so_luong_ton], [gia_ban], [trang_thai]) VALUES (18, N'SPCT018', 6, 1, 9, N'XL', 100, CAST(150000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[san_pham_ct] ([id_san_pham_ct], [ma_spct], [id_san_pham], [id_mau_sac], [id_thuong_hieu], [size], [so_luong_ton], [gia_ban], [trang_thai]) VALUES (19, N'SPCT019', 7, 2, 3, N'XL', 100, CAST(150000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[san_pham_ct] ([id_san_pham_ct], [ma_spct], [id_san_pham], [id_mau_sac], [id_thuong_hieu], [size], [so_luong_ton], [gia_ban], [trang_thai]) VALUES (20, N'SPCT020', 7, 4, 3, N'XL', 100, CAST(150000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[san_pham_ct] ([id_san_pham_ct], [ma_spct], [id_san_pham], [id_mau_sac], [id_thuong_hieu], [size], [so_luong_ton], [gia_ban], [trang_thai]) VALUES (21, N'SPCT021', 7, 1, 3, N'XL', 100, CAST(150000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[san_pham_ct] ([id_san_pham_ct], [ma_spct], [id_san_pham], [id_mau_sac], [id_thuong_hieu], [size], [so_luong_ton], [gia_ban], [trang_thai]) VALUES (22, N'SPCT022', 8, 6, 7, N'XL', 100, CAST(150000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[san_pham_ct] ([id_san_pham_ct], [ma_spct], [id_san_pham], [id_mau_sac], [id_thuong_hieu], [size], [so_luong_ton], [gia_ban], [trang_thai]) VALUES (23, N'SPCT023', 8, 3, 7, N'XL', 100, CAST(150000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[san_pham_ct] ([id_san_pham_ct], [ma_spct], [id_san_pham], [id_mau_sac], [id_thuong_hieu], [size], [so_luong_ton], [gia_ban], [trang_thai]) VALUES (24, N'SPCT024', 8, 5, 7, N'XL', 100, CAST(150000.00 AS Decimal(10, 2)), 0)
SET IDENTITY_INSERT [dbo].[san_pham_ct] OFF
GO
SET IDENTITY_INSERT [dbo].[thanh_toan] ON 

INSERT [dbo].[thanh_toan] ([id_thanh_toan], [loai]) VALUES (1, N'Đã thanh toán')
INSERT [dbo].[thanh_toan] ([id_thanh_toan], [loai]) VALUES (2, N'Chưa thanh toán')
SET IDENTITY_INSERT [dbo].[thanh_toan] OFF
GO
SET IDENTITY_INSERT [dbo].[thuong_hieu] ON 

INSERT [dbo].[thuong_hieu] ([id_thuong_hieu], [ten_thuong_hieu]) VALUES (1, N'OWEN')
INSERT [dbo].[thuong_hieu] ([id_thuong_hieu], [ten_thuong_hieu]) VALUES (2, N'COOLMATE')
INSERT [dbo].[thuong_hieu] ([id_thuong_hieu], [ten_thuong_hieu]) VALUES (3, N'4MEN')
INSERT [dbo].[thuong_hieu] ([id_thuong_hieu], [ten_thuong_hieu]) VALUES (4, N'PEDRO')
INSERT [dbo].[thuong_hieu] ([id_thuong_hieu], [ten_thuong_hieu]) VALUES (5, N'KRIK')
INSERT [dbo].[thuong_hieu] ([id_thuong_hieu], [ten_thuong_hieu]) VALUES (6, N'UNIQLO')
INSERT [dbo].[thuong_hieu] ([id_thuong_hieu], [ten_thuong_hieu]) VALUES (7, N'NIKE')
INSERT [dbo].[thuong_hieu] ([id_thuong_hieu], [ten_thuong_hieu]) VALUES (8, N'ADIDAS')
INSERT [dbo].[thuong_hieu] ([id_thuong_hieu], [ten_thuong_hieu]) VALUES (9, N'TOPSHOP')
INSERT [dbo].[thuong_hieu] ([id_thuong_hieu], [ten_thuong_hieu]) VALUES (10, N'MAY10')
SET IDENTITY_INSERT [dbo].[thuong_hieu] OFF
GO
SET IDENTITY_INSERT [dbo].[trang_thai_don_hang] ON 

INSERT [dbo].[trang_thai_don_hang] ([id_trang_thai_don_hang], [loaitt]) VALUES (1, N'Chờ xác nhận')
INSERT [dbo].[trang_thai_don_hang] ([id_trang_thai_don_hang], [loaitt]) VALUES (2, N'Đã xác nhận')
INSERT [dbo].[trang_thai_don_hang] ([id_trang_thai_don_hang], [loaitt]) VALUES (3, N'Đang giao hàng')
INSERT [dbo].[trang_thai_don_hang] ([id_trang_thai_don_hang], [loaitt]) VALUES (4, N'Đã giao hàng')
INSERT [dbo].[trang_thai_don_hang] ([id_trang_thai_don_hang], [loaitt]) VALUES (5, N'Thành công')
INSERT [dbo].[trang_thai_don_hang] ([id_trang_thai_don_hang], [loaitt]) VALUES (6, N'Hủy đơn hàng')
SET IDENTITY_INSERT [dbo].[trang_thai_don_hang] OFF
GO
SET IDENTITY_INSERT [dbo].[TRANGCHU] ON 

INSERT [dbo].[TRANGCHU] ([id], [name], [description], [price], [image_url], [discount]) VALUES (1, N'Áo Thun', N'Áo thun thời trang', 200000, N'/images/thun1.jfif', 10)
INSERT [dbo].[TRANGCHU] ([id], [name], [description], [price], [image_url], [discount]) VALUES (2, N'Áo thun 2', N'Áo thun thời trang', 180000, N'/images/thun2.jfif', 5)
INSERT [dbo].[TRANGCHU] ([id], [name], [description], [price], [image_url], [discount]) VALUES (3, N'Áo Thun 3', N'Áo thun thời trang', 200000, N'/images/thun3.jfif', 8)
INSERT [dbo].[TRANGCHU] ([id], [name], [description], [price], [image_url], [discount]) VALUES (4, N'Áo Thun', N'Áo thun thời trang', 200000, N'/images/thun1.jfif', 10)
INSERT [dbo].[TRANGCHU] ([id], [name], [description], [price], [image_url], [discount]) VALUES (5, N'Áo thun 2', N'Áo thun thời trang', 180000, N'/images/thun2.jfif', 5)
INSERT [dbo].[TRANGCHU] ([id], [name], [description], [price], [image_url], [discount]) VALUES (6, N'Áo Thun 3', N'Áo thun thời trang', 200000, N'/images/thun3.jfif', 8)
SET IDENTITY_INSERT [dbo].[TRANGCHU] OFF
GO
SET IDENTITY_INSERT [dbo].[voucher] ON 

INSERT [dbo].[voucher] ([id_voucher], [ma], [ten], [ngay_bat_dau], [ngay_ket_thuc], [gia_tri], [trang_thai]) VALUES (1, N'VC001', N'Giảm giá 50K', CAST(N'2024-10-10' AS Date), CAST(N'2025-05-10' AS Date), CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[voucher] ([id_voucher], [ma], [ten], [ngay_bat_dau], [ngay_ket_thuc], [gia_tri], [trang_thai]) VALUES (2, N'VC002', N'Giảm giá 25K', CAST(N'2024-10-10' AS Date), CAST(N'2025-01-10' AS Date), CAST(25000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[voucher] ([id_voucher], [ma], [ten], [ngay_bat_dau], [ngay_ket_thuc], [gia_tri], [trang_thai]) VALUES (3, N'VC003', N'Giảm giá 20K', CAST(N'2024-10-10' AS Date), CAST(N'2025-01-10' AS Date), CAST(20000.00 AS Decimal(10, 2)), 1)
SET IDENTITY_INSERT [dbo].[voucher] OFF
GO
ALTER TABLE [dbo].[gio_hang]  WITH CHECK ADD FOREIGN KEY([id_khach_hang])
REFERENCES [dbo].[khach_hang] ([id_khach_hang])
GO
ALTER TABLE [dbo].[gio_hang]  WITH CHECK ADD FOREIGN KEY([id_san_pham_ct])
REFERENCES [dbo].[san_pham_ct] ([id_san_pham_ct])
GO
ALTER TABLE [dbo].[hoa_don]  WITH CHECK ADD FOREIGN KEY([id_khach_hang])
REFERENCES [dbo].[khach_hang] ([id_khach_hang])
GO
ALTER TABLE [dbo].[hoa_don]  WITH CHECK ADD FOREIGN KEY([id_loai_hoa_don])
REFERENCES [dbo].[loai_hoa_don] ([id_loai_hoa_don])
GO
ALTER TABLE [dbo].[hoa_don]  WITH CHECK ADD FOREIGN KEY([id_nhan_vien])
REFERENCES [dbo].[nhan_vien] ([id_nhan_vien])
GO
ALTER TABLE [dbo].[hoa_don]  WITH CHECK ADD FOREIGN KEY([id_thanh_toan])
REFERENCES [dbo].[thanh_toan] ([id_thanh_toan])
GO
ALTER TABLE [dbo].[hoa_don]  WITH CHECK ADD FOREIGN KEY([id_trang_thai_don_hang])
REFERENCES [dbo].[trang_thai_don_hang] ([id_trang_thai_don_hang])
GO
ALTER TABLE [dbo].[hoa_don]  WITH CHECK ADD FOREIGN KEY([id_voucher])
REFERENCES [dbo].[voucher] ([id_voucher])
GO
ALTER TABLE [dbo].[hoa_don_ct]  WITH CHECK ADD FOREIGN KEY([id_hoa_don])
REFERENCES [dbo].[hoa_don] ([id_hoa_don])
GO
ALTER TABLE [dbo].[hoa_don_ct]  WITH CHECK ADD FOREIGN KEY([id_san_pham_ct])
REFERENCES [dbo].[san_pham_ct] ([id_san_pham_ct])
GO
ALTER TABLE [dbo].[san_pham_ct]  WITH CHECK ADD FOREIGN KEY([id_mau_sac])
REFERENCES [dbo].[mau_sac] ([id_mau_sac])
GO
ALTER TABLE [dbo].[san_pham_ct]  WITH CHECK ADD FOREIGN KEY([id_san_pham])
REFERENCES [dbo].[san_pham] ([id_san_pham])
GO
ALTER TABLE [dbo].[san_pham_ct]  WITH CHECK ADD FOREIGN KEY([id_thuong_hieu])
REFERENCES [dbo].[thuong_hieu] ([id_thuong_hieu])
GO
USE [master]
GO
ALTER DATABASE [SHOPQANAM12] SET  READ_WRITE 
GO
