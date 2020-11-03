USE [master]
GO
/****** Object:  Database [sanitarycart]    Script Date: 03/11/2020 12:39:27 PM ******/
CREATE DATABASE [sanitarycart]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'sanitarycart', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\sanitarycart.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'sanitarycart_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\sanitarycart_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [sanitarycart] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [sanitarycart].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [sanitarycart] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [sanitarycart] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [sanitarycart] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [sanitarycart] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [sanitarycart] SET ARITHABORT OFF 
GO
ALTER DATABASE [sanitarycart] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [sanitarycart] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [sanitarycart] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [sanitarycart] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [sanitarycart] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [sanitarycart] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [sanitarycart] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [sanitarycart] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [sanitarycart] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [sanitarycart] SET  DISABLE_BROKER 
GO
ALTER DATABASE [sanitarycart] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [sanitarycart] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [sanitarycart] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [sanitarycart] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [sanitarycart] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [sanitarycart] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [sanitarycart] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [sanitarycart] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [sanitarycart] SET  MULTI_USER 
GO
ALTER DATABASE [sanitarycart] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [sanitarycart] SET DB_CHAINING OFF 
GO
ALTER DATABASE [sanitarycart] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [sanitarycart] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [sanitarycart] SET DELAYED_DURABILITY = DISABLED 
GO
USE [sanitarycart]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 03/11/2020 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Brand](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[ImagePath] [varchar](310) NOT NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 03/11/2020 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Titlle] [varchar](25) NOT NULL,
	[ParentId] [int] NULL,
	[ImagePath] [varchar](310) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Color]    Script Date: 03/11/2020 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Color](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](20) NOT NULL,
	[Category_Id_FK] [int] NOT NULL,
 CONSTRAINT [PK_Color] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Color.Product.Quantity]    Script Date: 03/11/2020 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Color.Product.Quantity](
	[Product_Id_FK] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [tinyint] NOT NULL,
	[Type] [tinyint] NOT NULL,
	[Color] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Color.Product.Quantity_1] PRIMARY KEY CLUSTERED 
(
	[Product_Id_FK] ASC,
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GstRate]    Script Date: 03/11/2020 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GstRate](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Percentage] [tinyint] NOT NULL,
 CONSTRAINT [PK_GstRate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Image]    Script Date: 03/11/2020 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Image](
	[Id] [int] NOT NULL,
	[Path] [varchar](110) NOT NULL,
	[Product_Id_FK] [int] NOT NULL,
	[Type] [tinyint] NOT NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Kind]    Script Date: 03/11/2020 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Kind](
	[Id] [tinyint] NOT NULL,
	[Kind] [varchar](10) NOT NULL,
	[Category_Id_FK] [int] NOT NULL,
 CONSTRAINT [PK_Kind] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Kind.Product.Quantity]    Script Date: 03/11/2020 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Kind.Product.Quantity](
	[Product_Id_FK] [int] NOT NULL,
	[Type] [tinyint] NOT NULL,
	[Kind] [varchar](20) NOT NULL,
	[Quantity] [tinyint] NOT NULL,
 CONSTRAINT [PK_Kind.Product.Quantity] PRIMARY KEY CLUSTERED 
(
	[Product_Id_FK] ASC,
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product]    Script Date: 03/11/2020 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](20) NOT NULL,
	[Name] [varchar](80) NOT NULL,
	[Price] [decimal](7, 2) NOT NULL,
	[Description] [varchar](800) NOT NULL,
	[DateAdded] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DateUpdated] [datetime] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Type] [tinyint] NOT NULL,
	[Brand_Id_FK] [tinyint] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 03/11/2020 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductType](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](30) NOT NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Series.Brand]    Script Date: 03/11/2020 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Series.Brand](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Brand_Id_FK] [tinyint] NULL,
	[Category_Id_FK] [int] NULL,
 CONSTRAINT [PK_Series] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Size]    Script Date: 03/11/2020 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Size](
	[Id] [tinyint] NOT NULL,
	[Size] [char](4) NOT NULL,
	[Category_Id_FK] [int] NOT NULL,
 CONSTRAINT [PK_Size] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Size.Product.Quantity]    Script Date: 03/11/2020 12:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Size.Product.Quantity](
	[Size] [varchar](20) NOT NULL,
	[Product_Id_FK] [int] NOT NULL,
	[Type] [tinyint] NOT NULL,
	[Quantity] [tinyint] NOT NULL,
 CONSTRAINT [PK_Size.Product_Type] PRIMARY KEY CLUSTERED 
(
	[Product_Id_FK] ASC,
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([Id], [Name], [ImagePath]) VALUES (1, N'Cera', N'images//cera.jpg')
INSERT [dbo].[Brand] ([Id], [Name], [ImagePath]) VALUES (2, N'Grafdoer', N'images//grafdoer.jpg')
INSERT [dbo].[Brand] ([Id], [Name], [ImagePath]) VALUES (3, N'Other', N'images//nobrand.jpg')
SET IDENTITY_INSERT [dbo].[Brand] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (1, N'Sanitary Ware', NULL, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (2, N'One Piece Toilet', 1, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (3, N'Wall Hung Toilet', 1, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (4, N'EWC', 1, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (5, N'Pan Toilet', 1, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (6, N'Marble Basin', 1, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (7, N'Basin With Pedestal', 1, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (8, N'Wash Basin', 1, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (9, N'Faucet', NULL, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (10, N'Diana', 9, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (11, N'Mist', 9, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (12, N'Diana', 9, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (13, N'Crayon', 9, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (14, N'Diane', 9, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (15, N'Quadro', 9, NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[GstRate] ON 

INSERT [dbo].[GstRate] ([Id], [Percentage]) VALUES (1, 18)
INSERT [dbo].[GstRate] ([Id], [Percentage]) VALUES (2, 20)
SET IDENTITY_INSERT [dbo].[GstRate] OFF
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_Category] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_Category]
GO
ALTER TABLE [dbo].[Color]  WITH CHECK ADD  CONSTRAINT [FK_Color_Category] FOREIGN KEY([Category_Id_FK])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Color] CHECK CONSTRAINT [FK_Color_Category]
GO
ALTER TABLE [dbo].[Color.Product.Quantity]  WITH CHECK ADD  CONSTRAINT [FK_Color.Product.Quantity_Product.Type] FOREIGN KEY([Product_Id_FK], [Type])
REFERENCES [dbo].[Product] ([Id], [Type])
GO
ALTER TABLE [dbo].[Color.Product.Quantity] CHECK CONSTRAINT [FK_Color.Product.Quantity_Product.Type]
GO
ALTER TABLE [dbo].[Image]  WITH CHECK ADD  CONSTRAINT [FK_Image_Image] FOREIGN KEY([Product_Id_FK], [Type])
REFERENCES [dbo].[Product] ([Id], [Type])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Image] CHECK CONSTRAINT [FK_Image_Image]
GO
ALTER TABLE [dbo].[Kind]  WITH CHECK ADD  CONSTRAINT [FK_Kind_Category] FOREIGN KEY([Category_Id_FK])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Kind] CHECK CONSTRAINT [FK_Kind_Category]
GO
ALTER TABLE [dbo].[Kind.Product.Quantity]  WITH CHECK ADD  CONSTRAINT [FK_Kind.Product.Quantity_Product] FOREIGN KEY([Product_Id_FK], [Type])
REFERENCES [dbo].[Product] ([Id], [Type])
GO
ALTER TABLE [dbo].[Kind.Product.Quantity] CHECK CONSTRAINT [FK_Kind.Product.Quantity_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Brand] FOREIGN KEY([Brand_Id_FK])
REFERENCES [dbo].[Brand] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Brand]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductType] FOREIGN KEY([Type])
REFERENCES [dbo].[ProductType] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductType]
GO
ALTER TABLE [dbo].[Series.Brand]  WITH CHECK ADD  CONSTRAINT [FK_Series.Brand_Category] FOREIGN KEY([Category_Id_FK])
REFERENCES [dbo].[Category] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Series.Brand] CHECK CONSTRAINT [FK_Series.Brand_Category]
GO
ALTER TABLE [dbo].[Series.Brand]  WITH CHECK ADD  CONSTRAINT [FK_Series_Brand] FOREIGN KEY([Brand_Id_FK])
REFERENCES [dbo].[Brand] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Series.Brand] CHECK CONSTRAINT [FK_Series_Brand]
GO
ALTER TABLE [dbo].[Size]  WITH CHECK ADD  CONSTRAINT [FK_Size_Category] FOREIGN KEY([Category_Id_FK])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Size] CHECK CONSTRAINT [FK_Size_Category]
GO
ALTER TABLE [dbo].[Size.Product.Quantity]  WITH CHECK ADD  CONSTRAINT [FK_Size.Product.Quantity_Product] FOREIGN KEY([Product_Id_FK], [Type])
REFERENCES [dbo].[Product] ([Id], [Type])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Size.Product.Quantity] CHECK CONSTRAINT [FK_Size.Product.Quantity_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [CK_Product_Price] CHECK  (([Price]>(0)))
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [CK_Product_Price]
GO
ALTER TABLE [dbo].[Size.Product.Quantity]  WITH CHECK ADD  CONSTRAINT [CK_Size.Product_Type] CHECK  (([Quantity]>(0)))
GO
ALTER TABLE [dbo].[Size.Product.Quantity] CHECK CONSTRAINT [CK_Size.Product_Type]
GO
USE [master]
GO
ALTER DATABASE [sanitarycart] SET  READ_WRITE 
GO
