USE [master]
GO
/****** Object:  Database [DTDD]    Script Date: 10/14/2016 10:36:02 PM ******/
CREATE DATABASE [DTDD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DTDD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\DTDD.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DTDD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\DTDD_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DTDD] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DTDD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DTDD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DTDD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DTDD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DTDD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DTDD] SET ARITHABORT OFF 
GO
ALTER DATABASE [DTDD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DTDD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DTDD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DTDD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DTDD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DTDD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DTDD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DTDD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DTDD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DTDD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DTDD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DTDD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DTDD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DTDD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DTDD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DTDD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DTDD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DTDD] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DTDD] SET  MULTI_USER 
GO
ALTER DATABASE [DTDD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DTDD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DTDD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DTDD] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DTDD] SET DELAYED_DURABILITY = DISABLED 
GO
USE [DTDD]
GO
/****** Object:  User [NT AUTHORITY\SYSTEM]    Script Date: 10/14/2016 10:36:02 PM ******/
CREATE USER [NT AUTHORITY\SYSTEM] FOR LOGIN [NT AUTHORITY\SYSTEM] WITH DEFAULT_SCHEMA=[db_owner]
GO
ALTER ROLE [db_owner] ADD MEMBER [NT AUTHORITY\SYSTEM]
GO
/****** Object:  Table [dbo].[cthoadon]    Script Date: 10/14/2016 10:36:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cthoadon](
	[mahd] [nchar](128) NOT NULL,
	[masp] [nchar](128) NOT NULL,
	[soluong] [int] NOT NULL,
	[thanhtien] [int] NOT NULL,
	[tinhtrang] [int] NOT NULL,
 CONSTRAINT [PK_cthoadon] PRIMARY KEY CLUSTERED 
(
	[mahd] ASC,
	[masp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[danhgia]    Script Date: 10/14/2016 10:36:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[danhgia](
	[manb] [nchar](64) NOT NULL,
	[manm] [nchar](64) NOT NULL,
	[rating] [int] NOT NULL,
 CONSTRAINT [PK_danhgia] PRIMARY KEY CLUSTERED 
(
	[manb] ASC,
	[manm] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[giohang]    Script Date: 10/14/2016 10:36:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[giohang](
	[manm] [nchar](64) NOT NULL,
	[masp] [nchar](128) NOT NULL,
	[soluong] [int] NOT NULL,
 CONSTRAINT [PK_giohang_1] PRIMARY KEY CLUSTERED 
(
	[manm] ASC,
	[masp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[hoadon]    Script Date: 10/14/2016 10:36:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoadon](
	[mahd] [nchar](128) NOT NULL,
	[manm] [nchar](64) NOT NULL,
	[ngay] [date] NOT NULL,
	[tinhtrang] [int] NOT NULL,
	[thanhtien] [int] NOT NULL,
 CONSTRAINT [PK_hoadon] PRIMARY KEY CLUSTERED 
(
	[mahd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[hoadonsp]    Script Date: 10/14/2016 10:36:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoadonsp](
	[mahd] [nchar](128) NOT NULL,
	[masp] [nchar](128) NOT NULL,
	[ngay] [date] NOT NULL,
	[giatri] [int] NOT NULL,
 CONSTRAINT [PK_hoadonsp] PRIMARY KEY CLUSTERED 
(
	[mahd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[hoadontk]    Script Date: 10/14/2016 10:36:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoadontk](
	[mahd] [nchar](128) NOT NULL,
	[manb] [nchar](64) NOT NULL,
	[ngay] [date] NOT NULL,
	[giatri] [int] NOT NULL,
 CONSTRAINT [PK_hoadontk] PRIMARY KEY CLUSTERED 
(
	[mahd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[nguoiban]    Script Date: 10/14/2016 10:36:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nguoiban](
	[maso] [nchar](64) NOT NULL,
	[hoten] [nvarchar](256) NOT NULL,
	[matkhau] [nchar](64) NOT NULL,
	[gtinh] [int] NOT NULL,
	[ngsinh] [date] NOT NULL,
	[dchi] [nvarchar](256) NULL,
	[email] [nvarchar](256) NOT NULL,
	[sdt] [nchar](16) NOT NULL,
	[tinhtrang] [int] NOT NULL,
	[rating] [int] NULL,
	[taikhoan] [int] NOT NULL,
 CONSTRAINT [PK_nguoiban] PRIMARY KEY CLUSTERED 
(
	[maso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[nguoimua]    Script Date: 10/14/2016 10:36:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nguoimua](
	[maso] [nchar](64) NOT NULL,
	[hoten] [nvarchar](256) NOT NULL,
	[matkhau] [nchar](64) NOT NULL,
	[gtinh] [int] NOT NULL,
	[ngsinh] [date] NOT NULL,
	[dchi] [nvarchar](256) NULL,
	[email] [nvarchar](256) NULL,
	[sdt] [nchar](16) NULL,
 CONSTRAINT [PK_nguoimua] PRIMARY KEY CLUSTERED 
(
	[maso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sanpham]    Script Date: 10/14/2016 10:36:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sanpham](
	[masp] [nchar](128) NOT NULL,
	[tensp] [nvarchar](64) NOT NULL,
	[math] [nvarchar](64) NOT NULL,
	[gia] [int] NULL,
	[hinh] [image] NOT NULL,
	[loai] [nvarchar](64) NULL,
	[kco] [nvarchar](64) NULL,
	[pgiai] [nvarchar](64) NULL,
	[hdh] [nvarchar](64) NULL,
	[cpu] [nvarchar](64) NULL,
	[ram] [nvarchar](64) NULL,
	[bnho] [nvarchar](64) NULL,
	[camera] [nvarchar](50) NULL,
	[pin] [int] NULL,
	[tinhtrang] [int] NOT NULL,
	[manb] [nchar](64) NOT NULL,
	[soluong] [int] NOT NULL,
 CONSTRAINT [PK_sanpham_1] PRIMARY KEY CLUSTERED 
(
	[masp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[cthoadon]  WITH CHECK ADD  CONSTRAINT [FK_cthoadon_hoadon] FOREIGN KEY([mahd])
REFERENCES [dbo].[hoadon] ([mahd])
GO
ALTER TABLE [dbo].[cthoadon] CHECK CONSTRAINT [FK_cthoadon_hoadon]
GO
ALTER TABLE [dbo].[cthoadon]  WITH CHECK ADD  CONSTRAINT [FK_cthoadon_sanpham] FOREIGN KEY([masp])
REFERENCES [dbo].[sanpham] ([masp])
GO
ALTER TABLE [dbo].[cthoadon] CHECK CONSTRAINT [FK_cthoadon_sanpham]
GO
ALTER TABLE [dbo].[danhgia]  WITH CHECK ADD  CONSTRAINT [FK_danhgia_nguoiban] FOREIGN KEY([manb])
REFERENCES [dbo].[nguoiban] ([maso])
GO
ALTER TABLE [dbo].[danhgia] CHECK CONSTRAINT [FK_danhgia_nguoiban]
GO
ALTER TABLE [dbo].[danhgia]  WITH CHECK ADD  CONSTRAINT [FK_danhgia_nguoimua] FOREIGN KEY([manm])
REFERENCES [dbo].[nguoimua] ([maso])
GO
ALTER TABLE [dbo].[danhgia] CHECK CONSTRAINT [FK_danhgia_nguoimua]
GO
ALTER TABLE [dbo].[giohang]  WITH CHECK ADD  CONSTRAINT [FK_giohang_nguoimua] FOREIGN KEY([manm])
REFERENCES [dbo].[nguoimua] ([maso])
GO
ALTER TABLE [dbo].[giohang] CHECK CONSTRAINT [FK_giohang_nguoimua]
GO
ALTER TABLE [dbo].[giohang]  WITH CHECK ADD  CONSTRAINT [FK_giohang_sanpham] FOREIGN KEY([masp])
REFERENCES [dbo].[sanpham] ([masp])
GO
ALTER TABLE [dbo].[giohang] CHECK CONSTRAINT [FK_giohang_sanpham]
GO
ALTER TABLE [dbo].[hoadonsp]  WITH CHECK ADD  CONSTRAINT [FK_hoadonsp_sanpham] FOREIGN KEY([masp])
REFERENCES [dbo].[sanpham] ([masp])
GO
ALTER TABLE [dbo].[hoadonsp] CHECK CONSTRAINT [FK_hoadonsp_sanpham]
GO
ALTER TABLE [dbo].[hoadontk]  WITH CHECK ADD  CONSTRAINT [FK_hoadontk_nguoiban] FOREIGN KEY([manb])
REFERENCES [dbo].[nguoiban] ([maso])
GO
ALTER TABLE [dbo].[hoadontk] CHECK CONSTRAINT [FK_hoadontk_nguoiban]
GO
ALTER TABLE [dbo].[sanpham]  WITH CHECK ADD  CONSTRAINT [FK_sanpham_nguoiban] FOREIGN KEY([manb])
REFERENCES [dbo].[nguoiban] ([maso])
GO
ALTER TABLE [dbo].[sanpham] CHECK CONSTRAINT [FK_sanpham_nguoiban]
GO
USE [master]
GO
ALTER DATABASE [DTDD] SET  READ_WRITE 
GO
