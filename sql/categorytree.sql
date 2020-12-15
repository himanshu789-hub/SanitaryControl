USE [master]
GO
/****** Object:  Database [sanitarycart]    Script Date: 15/12/2020 1:05:18 PM ******/
CREATE DATABASE [sanitarycart]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'sanitarycart', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\sanitarycart.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
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
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 15/12/2020 1:05:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 15/12/2020 1:05:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 15/12/2020 1:05:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 15/12/2020 1:05:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 15/12/2020 1:05:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 15/12/2020 1:05:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 15/12/2020 1:05:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[ImagePath] [nvarchar](max) NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 15/12/2020 1:05:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AttributeType]    Script Date: 15/12/2020 1:05:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AttributeType](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Type] [char](10) NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 15/12/2020 1:05:19 PM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 15/12/2020 1:05:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Titlle] [varchar](50) NOT NULL,
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
/****** Object:  Table [dbo].[Color]    Script Date: 15/12/2020 1:05:19 PM ******/
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
/****** Object:  Table [dbo].[Grade]    Script Date: 15/12/2020 1:05:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Grade](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Grade] [char](4) NOT NULL,
	[Category_Id_FK] [int] NOT NULL,
 CONSTRAINT [PK_SteelQuality] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GstRate]    Script Date: 15/12/2020 1:05:19 PM ******/
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
/****** Object:  Table [dbo].[Image]    Script Date: 15/12/2020 1:05:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Image](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Path] [varchar](330) NOT NULL,
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
/****** Object:  Table [dbo].[Kind]    Script Date: 15/12/2020 1:05:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Kind](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Kind] [varchar](30) NOT NULL,
	[Category_Id_FK] [int] NOT NULL,
 CONSTRAINT [PK_Kind] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Material]    Script Date: 15/12/2020 1:05:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Material](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[Category_Id_FK] [int] NOT NULL,
 CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product]    Script Date: 15/12/2020 1:05:19 PM ******/
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
	[Description] [varchar](800) NOT NULL,
	[DateAdded] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DateUpdated] [datetime] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Type] [tinyint] NOT NULL,
	[Brand_Id_FK] [tinyint] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 15/12/2020 1:05:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[Attribute_Id_FK] [tinyint] NOT NULL,
	[Category_Id_FK] [int] NOT NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[Attribute_Id_FK] ASC,
	[Category_Id_FK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Series.Brand]    Script Date: 15/12/2020 1:05:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Series.Brand](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Brand_Id_FK] [tinyint] NULL,
	[Category_Id_FK] [int] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Series] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SeriesHolder.Category]    Script Date: 15/12/2020 1:05:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SeriesHolder.Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId_Fk] [int] NOT NULL,
 CONSTRAINT [PK_SeriesHolder.Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Size]    Script Date: 15/12/2020 1:05:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Size] [nchar](10) NOT NULL,
	[Category_Id_FK] [int] NOT NULL,
 CONSTRAINT [PK_Size] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Type.Product.Quantity]    Script Date: 15/12/2020 1:05:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type.Product.Quantity](
	[Product_Id_FK] [int] NOT NULL,
	[Quantity] [tinyint] NOT NULL,
	[Price] [decimal](7, 2) NOT NULL,
	[AtributeType] [tinyint] NOT NULL,
	[Value] [nvarchar](50) NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Type.Product.Quantity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201123111121_initial', N'5.0.0')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'c87f2208-62b6-4e5b-8472-8b341a507128', N'Manager', N'MANAGER', N'ed592f46-d892-4b3d-b854-3b1f91e9de75')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'f79c8ae0-a139-4393-a337-235b098abb98', N'Administration', N'ADMINISTRATION', N'68fb6354-b2c2-405a-9c1a-0bcb59bee866')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'9adb1cd9-d4ef-43d0-be15-40a195418ef3', N'c87f2208-62b6-4e5b-8472-8b341a507128')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e9c4aea8-e173-4de1-9c3b-eac1300a89fa', N'c87f2208-62b6-4e5b-8472-8b341a507128')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'245b42c3-f2a5-4210-af7a-b36c84cbb433', N'f79c8ae0-a139-4393-a337-235b098abb98')
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [ImagePath], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'245b42c3-f2a5-4210-af7a-b36c84cbb433', N'Naresh', N'Lalwani', N'/images/site/administration.svg', N'nl12@gecart.com', N'NL12@GECART.COM', NULL, NULL, 0, N'AQAAAAEAACcQAAAAEBDNnLWBTEt5mvSmBAPVo19H0sAnZZQOLyImtMj9lFPdwjU37rJ4Fx3rS+NRgg7/xg==', N'RFMP6ZBK5KN6TU6LHUGMV442DJASNXLI', N'84b38d88-b82c-4a02-889e-f0e847f4c36b', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [ImagePath], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'9adb1cd9-d4ef-43d0-be15-40a195418ef3', N'Xvb', N'Abv', N'/images/site/manager.svg', N'nl12@gecant.com', N'NL12@GECANT.COM', NULL, NULL, 0, N'AQAAAAEAACcQAAAAEA7ke0altRkXWrF09JbsZecRH7XyIK292DBwl3TUAlna0dFT3pJp7gZh4/BQfunX9g==', N'JNYJEDKPTDUX5JOS7EVH7BODF2VLWDSV', N'5fea3a6f-b136-48ba-a14d-262acf10b7d7', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [ImagePath], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'e9c4aea8-e173-4de1-9c3b-eac1300a89fa', N'Nim', N'Kim', N'/images/site/manager.svg', N'nl12@gecayt.com', N'NL12@GECAYT.COM', NULL, NULL, 0, N'AQAAAAEAACcQAAAAEN6oedoCpnysrttEM9YCYtvpNxB+IWrn+jdBWsINKt33PLHoexZy8XmUuCD/ECnFRQ==', N'YT37MY7DNZJU4YYXFY7PGZIBHH543UDW', N'b4502cc4-1d0b-4d2d-a262-581516ff10ce', NULL, 0, 0, NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[AttributeType] ON 

INSERT [dbo].[AttributeType] ([Id], [Type]) VALUES (1, N'Type      ')
INSERT [dbo].[AttributeType] ([Id], [Type]) VALUES (2, N'Size      ')
INSERT [dbo].[AttributeType] ([Id], [Type]) VALUES (3, N'Color     ')
INSERT [dbo].[AttributeType] ([Id], [Type]) VALUES (4, N'Grade     ')
INSERT [dbo].[AttributeType] ([Id], [Type]) VALUES (5, N'None      ')
INSERT [dbo].[AttributeType] ([Id], [Type]) VALUES (7, N'Material  ')
SET IDENTITY_INSERT [dbo].[AttributeType] OFF
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([Id], [Name], [ImagePath]) VALUES (6, N'Grafdoer', N'/images/brand\f25c909e-9337-4895-8e9e-15c6390839bf.png')
SET IDENTITY_INSERT [dbo].[Brand] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (1, N'Faucets', NULL, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (2, N'Showers', NULL, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (3, N'Sanitaryware', NULL, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (4, N'Accessories', NULL, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (5, N'Kitchen Sinks', NULL, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (6, N'Flushing System', NULL, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (7, N'Diverters', NULL, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (8, N'PVC Pipe Fittings', NULL, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (9, N'Rain Shower', 2, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (10, N'Square Shower', 9, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (11, N'Round Shower', 9, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (12, N'Ceiling Shower', 2, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (13, N'Square Shower', 12, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (14, N'Round Shower', 12, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (15, N'Body Shower', 2, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (16, N'Square Shower', 15, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (17, N'Round Shower', 15, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (18, N'Multiflow Shower', 2, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (19, N'Over Head Shower', 2, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (20, N'Over Head Shower With Arms', 19, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (21, N'Over Head Shower Without Arms', 19, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (22, N'Round Showers', 20, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (23, N'Square Showers', 20, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (24, N'Round Showers', 21, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (25, N'Square Showers', 21, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (26, N'Telephonic Shower', 2, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (27, N'Round Showers', 26, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (28, N'Square Showers', 26, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (29, N'Multiflow Showers', 26, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (30, N'Health Faucet', 2, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (31, N'Jet Spray', 2, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (32, N'Shower Arm', 2, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (33, N'Round Showers', 32, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (34, N'Square Showers', 32, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (35, N'Shower Tube', 2, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (36, N'Pan', 3, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (37, N'Orissa Pan', 36, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (38, N'C.T.  Pan', 36, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (39, N'Urinal', 3, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (40, N'Flat Back Urinal ', 39, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (41, N'Squatting Urinal', 39, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (42, N'Float Back Urinal', 40, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (43, N'Large Urinal', 40, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (44, N'Corner Urinal', 40, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (45, N'EWC', 3, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (46, N'Floor Mount EWC', 45, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (47, N'Wall Hung EWC', 45, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (48, N'Plain EWC', 46, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (49, N'Anglo Indian EWC', 46, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (50, N'Wall Hung Closet', 3, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (51, N'One Piece Closet', 3, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (52, N'Wall Hung Basin', 3, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (53, N'Wall Hung Stand Basin', 52, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (54, N'Wall Hung Half Pedestal Basin', 52, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (55, N'Table Top Wash Basin', 3, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (56, N'Plain Wash Basin', 55, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (57, N'Designer Wash Basin', 55, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (58, N'Wash Basin With Pedestal ', 3, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (59, N'Plain Wash Basin', 58, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (60, N'Designer Wash Basin', 58, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (61, N'Wooden Wash Basin', 58, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (62, N'One Piece Wash Basin', 3, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (63, N'Plain Wash Basin', 62, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (64, N'Designer Wash Basin', 62, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (65, N'Ceramic Sink', 3, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (66, N'Individual Items', 4, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (67, N'Shelf', 66, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (68, N'Soap Dish Holder', 66, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (69, N'Soap Dispenser With Holder', 66, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (70, N'Tumbler Holder', 66, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (71, N'Towel Holder', 66, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (72, N'Hook', 66, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (73, N'Drainers', 66, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (74, N'Allieds', 66, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (75, N'Corner Shelf', 67, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (76, N'Center Shelf', 67, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (77, N'Double Bowl', 68, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (78, N'Single Bowl', 68, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (79, N'Towel Rack', 71, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (80, N'Towel Rod', 71, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (81, N'Towel Ring', 71, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (82, N'Bath Sets', 4, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (83, N'Single Bowl Sink', 5, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (84, N'Double Bowl Sink', 5, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (85, N'Single Bowl Sink With Drainer Board', 5, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (86, N'Double Bowl Sink With Drainer Board', 5, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (87, N'Stop Cock ', 6, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (88, N'Flush Cock', 6, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (89, N'Flush Valve', 6, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (90, N'Conceated Body', 6, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (91, N'Conceated Sets', 6, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (92, N'Cistern', 6, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (93, N'Concealed Cistern', 92, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (94, N'PVC Cistern', 92, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (95, N'Thermo Hi-Flow Multi Box', 7, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (96, N'Hi-Flow Multi Box', 7, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (97, N'Multi Box ', 7, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (98, N'Concealed Body Diverter ', 95, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (99, N'Exposed Parts Diverter', 95, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (100, N'Concealed Body Diverter ', 96, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (101, N'Exposed Parts Diverter', 96, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (102, N'High Flow Single Lever Mixer And Diverter', 97, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (103, N'Single Lever Mixer and Diverter', 97, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (104, N'Plumbing', 8, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (105, N'Sewage', 8, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (106, N'Agriculture', 8, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (107, N'UPVC Pipe and Fittings', 104, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (108, N'CPVC Pipe and Fittings', 104, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (109, N'S.W.R Pipe and Fittings', 105, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (110, N'Drainage Pipes', 105, NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Color] ON 

INSERT [dbo].[Color] ([Id], [Title], [Category_Id_FK]) VALUES (12, N'White', 3)
INSERT [dbo].[Color] ([Id], [Title], [Category_Id_FK]) VALUES (13, N'Ivory', 3)
SET IDENTITY_INSERT [dbo].[Color] OFF
SET IDENTITY_INSERT [dbo].[Grade] ON 

INSERT [dbo].[Grade] ([Id], [Grade], [Category_Id_FK]) VALUES (2, N'202 ', 72)
INSERT [dbo].[Grade] ([Id], [Grade], [Category_Id_FK]) VALUES (3, N'204 ', 72)
INSERT [dbo].[Grade] ([Id], [Grade], [Category_Id_FK]) VALUES (4, N'304 ', 72)
INSERT [dbo].[Grade] ([Id], [Grade], [Category_Id_FK]) VALUES (5, N'202 ', 73)
INSERT [dbo].[Grade] ([Id], [Grade], [Category_Id_FK]) VALUES (7, N'204 ', 73)
INSERT [dbo].[Grade] ([Id], [Grade], [Category_Id_FK]) VALUES (8, N'304 ', 73)
INSERT [dbo].[Grade] ([Id], [Grade], [Category_Id_FK]) VALUES (9, N'202 ', 74)
INSERT [dbo].[Grade] ([Id], [Grade], [Category_Id_FK]) VALUES (11, N'204 ', 74)
INSERT [dbo].[Grade] ([Id], [Grade], [Category_Id_FK]) VALUES (12, N'304 ', 74)
SET IDENTITY_INSERT [dbo].[Grade] OFF
SET IDENTITY_INSERT [dbo].[GstRate] ON 

INSERT [dbo].[GstRate] ([Id], [Percentage]) VALUES (1, 18)
INSERT [dbo].[GstRate] ([Id], [Percentage]) VALUES (2, 20)
SET IDENTITY_INSERT [dbo].[GstRate] OFF
SET IDENTITY_INSERT [dbo].[Kind] ON 

INSERT [dbo].[Kind] ([Id], [Kind], [Category_Id_FK]) VALUES (1, N'Glossy Finish', 5)
INSERT [dbo].[Kind] ([Id], [Kind], [Category_Id_FK]) VALUES (2, N'Matte Finish', 5)
INSERT [dbo].[Kind] ([Id], [Kind], [Category_Id_FK]) VALUES (4, N'Brass Body', 2)
INSERT [dbo].[Kind] ([Id], [Kind], [Category_Id_FK]) VALUES (5, N'ABS Body', 2)
INSERT [dbo].[Kind] ([Id], [Kind], [Category_Id_FK]) VALUES (6, N'Brass Arm', 32)
INSERT [dbo].[Kind] ([Id], [Kind], [Category_Id_FK]) VALUES (7, N'S.S Arm', 32)
SET IDENTITY_INSERT [dbo].[Kind] OFF
SET IDENTITY_INSERT [dbo].[Material] ON 

INSERT [dbo].[Material] ([Id], [Title], [Category_Id_FK]) VALUES (1, N'Glass', 67)
INSERT [dbo].[Material] ([Id], [Title], [Category_Id_FK]) VALUES (2, N'PVC (Acrylic)', 67)
INSERT [dbo].[Material] ([Id], [Title], [Category_Id_FK]) VALUES (3, N'Unbreakable', 67)
INSERT [dbo].[Material] ([Id], [Title], [Category_Id_FK]) VALUES (4, N'Unbreakable', 4)
INSERT [dbo].[Material] ([Id], [Title], [Category_Id_FK]) VALUES (5, N'Brass', 4)
INSERT [dbo].[Material] ([Id], [Title], [Category_Id_FK]) VALUES (6, N'Acrylic', 4)
SET IDENTITY_INSERT [dbo].[Material] OFF
INSERT [dbo].[ProductType] ([Attribute_Id_FK], [Category_Id_FK]) VALUES (1, 2)
INSERT [dbo].[ProductType] ([Attribute_Id_FK], [Category_Id_FK]) VALUES (3, 3)
INSERT [dbo].[ProductType] ([Attribute_Id_FK], [Category_Id_FK]) VALUES (7, 4)
INSERT [dbo].[ProductType] ([Attribute_Id_FK], [Category_Id_FK]) VALUES (1, 5)
INSERT [dbo].[ProductType] ([Attribute_Id_FK], [Category_Id_FK]) VALUES (5, 6)
INSERT [dbo].[ProductType] ([Attribute_Id_FK], [Category_Id_FK]) VALUES (5, 7)
INSERT [dbo].[ProductType] ([Attribute_Id_FK], [Category_Id_FK]) VALUES (1, 32)
INSERT [dbo].[ProductType] ([Attribute_Id_FK], [Category_Id_FK]) VALUES (3, 67)
INSERT [dbo].[ProductType] ([Attribute_Id_FK], [Category_Id_FK]) VALUES (4, 72)
INSERT [dbo].[ProductType] ([Attribute_Id_FK], [Category_Id_FK]) VALUES (4, 73)
INSERT [dbo].[ProductType] ([Attribute_Id_FK], [Category_Id_FK]) VALUES (4, 74)
INSERT [dbo].[ProductType] ([Attribute_Id_FK], [Category_Id_FK]) VALUES (2, 104)
INSERT [dbo].[ProductType] ([Attribute_Id_FK], [Category_Id_FK]) VALUES (2, 105)
INSERT [dbo].[ProductType] ([Attribute_Id_FK], [Category_Id_FK]) VALUES (2, 106)
SET IDENTITY_INSERT [dbo].[SeriesHolder.Category] ON 

INSERT [dbo].[SeriesHolder.Category] ([Id], [CategoryId_Fk]) VALUES (1, 1)
INSERT [dbo].[SeriesHolder.Category] ([Id], [CategoryId_Fk]) VALUES (2, 2)
INSERT [dbo].[SeriesHolder.Category] ([Id], [CategoryId_Fk]) VALUES (3, 3)
INSERT [dbo].[SeriesHolder.Category] ([Id], [CategoryId_Fk]) VALUES (4, 4)
INSERT [dbo].[SeriesHolder.Category] ([Id], [CategoryId_Fk]) VALUES (5, 5)
INSERT [dbo].[SeriesHolder.Category] ([Id], [CategoryId_Fk]) VALUES (6, 6)
INSERT [dbo].[SeriesHolder.Category] ([Id], [CategoryId_Fk]) VALUES (7, 7)
INSERT [dbo].[SeriesHolder.Category] ([Id], [CategoryId_Fk]) VALUES (8, 8)
SET IDENTITY_INSERT [dbo].[SeriesHolder.Category] OFF
SET IDENTITY_INSERT [dbo].[Size] ON 

INSERT [dbo].[Size] ([Id], [Size], [Category_Id_FK]) VALUES (2, N'½ ″       ', 104)
INSERT [dbo].[Size] ([Id], [Size], [Category_Id_FK]) VALUES (4, N'1 ″       ', 104)
INSERT [dbo].[Size] ([Id], [Size], [Category_Id_FK]) VALUES (6, N'1½ ″      ', 104)
INSERT [dbo].[Size] ([Id], [Size], [Category_Id_FK]) VALUES (7, N'2 ″       ', 104)
INSERT [dbo].[Size] ([Id], [Size], [Category_Id_FK]) VALUES (8, N'75 mm     ', 105)
INSERT [dbo].[Size] ([Id], [Size], [Category_Id_FK]) VALUES (9, N'110 mm    ', 105)
INSERT [dbo].[Size] ([Id], [Size], [Category_Id_FK]) VALUES (10, N'40 mm     ', 106)
INSERT [dbo].[Size] ([Id], [Size], [Category_Id_FK]) VALUES (12, N'50 mm     ', 106)
INSERT [dbo].[Size] ([Id], [Size], [Category_Id_FK]) VALUES (13, N'63 mm     ', 106)
INSERT [dbo].[Size] ([Id], [Size], [Category_Id_FK]) VALUES (14, N'75 mm     ', 106)
INSERT [dbo].[Size] ([Id], [Size], [Category_Id_FK]) VALUES (15, N'90 mm     ', 106)
INSERT [dbo].[Size] ([Id], [Size], [Category_Id_FK]) VALUES (16, N'110 mm    ', 106)
INSERT [dbo].[Size] ([Id], [Size], [Category_Id_FK]) VALUES (17, N'125 mm    ', 106)
INSERT [dbo].[Size] ([Id], [Size], [Category_Id_FK]) VALUES (18, N'140 mm    ', 106)
INSERT [dbo].[Size] ([Id], [Size], [Category_Id_FK]) VALUES (19, N'160 mm    ', 106)
INSERT [dbo].[Size] ([Id], [Size], [Category_Id_FK]) VALUES (20, N'180 mm    ', 106)
INSERT [dbo].[Size] ([Id], [Size], [Category_Id_FK]) VALUES (22, N'200 mm    ', 106)
SET IDENTITY_INSERT [dbo].[Size] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 15/12/2020 1:05:19 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 15/12/2020 1:05:19 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 15/12/2020 1:05:19 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 15/12/2020 1:05:19 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 15/12/2020 1:05:19 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [EmailIndex]    Script Date: 15/12/2020 1:05:19 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 15/12/2020 1:05:19 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Unique_Category_Type]    Script Date: 15/12/2020 1:05:19 PM ******/
ALTER TABLE [dbo].[ProductType] ADD  CONSTRAINT [Unique_Category_Type] UNIQUE NONCLUSTERED 
(
	[Category_Id_FK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Series.Brand]    Script Date: 15/12/2020 1:05:19 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Series.Brand] ON [dbo].[Series.Brand]
(
	[Category_Id_FK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Series.Brand] ADD  CONSTRAINT [DF_Series.Brand_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Type.Product.Quantity] ADD  CONSTRAINT [DF_Type.Product.Quantity_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
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
ALTER TABLE [dbo].[Grade]  WITH CHECK ADD  CONSTRAINT [FK_SteelQuality_Category] FOREIGN KEY([Category_Id_FK])
REFERENCES [dbo].[Category] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Grade] CHECK CONSTRAINT [FK_SteelQuality_Category]
GO
ALTER TABLE [dbo].[Image]  WITH CHECK ADD  CONSTRAINT [FK_Image_AttributeType] FOREIGN KEY([Type])
REFERENCES [dbo].[AttributeType] ([Id])
GO
ALTER TABLE [dbo].[Image] CHECK CONSTRAINT [FK_Image_AttributeType]
GO
ALTER TABLE [dbo].[Image]  WITH CHECK ADD  CONSTRAINT [FK_Image_Product] FOREIGN KEY([Product_Id_FK])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[Image] CHECK CONSTRAINT [FK_Image_Product]
GO
ALTER TABLE [dbo].[Kind]  WITH CHECK ADD  CONSTRAINT [FK_Kind_Category] FOREIGN KEY([Category_Id_FK])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Kind] CHECK CONSTRAINT [FK_Kind_Category]
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Material_Category] FOREIGN KEY([Category_Id_FK])
REFERENCES [dbo].[Category] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Material_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_AttributeType] FOREIGN KEY([Type])
REFERENCES [dbo].[AttributeType] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_AttributeType]
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
ALTER TABLE [dbo].[ProductType]  WITH CHECK ADD  CONSTRAINT [FK_ProductType_AttributeType] FOREIGN KEY([Attribute_Id_FK])
REFERENCES [dbo].[AttributeType] ([Id])
GO
ALTER TABLE [dbo].[ProductType] CHECK CONSTRAINT [FK_ProductType_AttributeType]
GO
ALTER TABLE [dbo].[ProductType]  WITH CHECK ADD  CONSTRAINT [FK_ProductType_Category] FOREIGN KEY([Category_Id_FK])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[ProductType] CHECK CONSTRAINT [FK_ProductType_Category]
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
ALTER TABLE [dbo].[SeriesHolder.Category]  WITH CHECK ADD  CONSTRAINT [FK_SeriesHolder.Category_Category] FOREIGN KEY([CategoryId_Fk])
REFERENCES [dbo].[Category] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[SeriesHolder.Category] CHECK CONSTRAINT [FK_SeriesHolder.Category_Category]
GO
ALTER TABLE [dbo].[Size]  WITH CHECK ADD  CONSTRAINT [FK_Size_Category] FOREIGN KEY([Category_Id_FK])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Size] CHECK CONSTRAINT [FK_Size_Category]
GO
ALTER TABLE [dbo].[Type.Product.Quantity]  WITH CHECK ADD  CONSTRAINT [FK_Type.Product.Quantity_Product] FOREIGN KEY([Product_Id_FK])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[Type.Product.Quantity] CHECK CONSTRAINT [FK_Type.Product.Quantity_Product]
GO
ALTER TABLE [dbo].[Type.Product.Quantity]  WITH CHECK ADD  CONSTRAINT [FK_Type.Product.Quantity_Table_1] FOREIGN KEY([AtributeType])
REFERENCES [dbo].[AttributeType] ([Id])
GO
ALTER TABLE [dbo].[Type.Product.Quantity] CHECK CONSTRAINT [FK_Type.Product.Quantity_Table_1]
GO
ALTER TABLE [dbo].[Type.Product.Quantity]  WITH CHECK ADD  CONSTRAINT [CK_Color.Product.Quantity] CHECK  (([Price]>(0)))
GO
ALTER TABLE [dbo].[Type.Product.Quantity] CHECK CONSTRAINT [CK_Color.Product.Quantity]
GO
/****** Object:  StoredProcedure [dbo].[GetImmediateNode]    Script Date: 15/12/2020 1:05:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetImmediateNode] @Id int
AS
WITH GetRootCTE
AS
(
  select 
        t.*
    from  [dbo].[Category] t
    where t.id = @Id
    union all 
    select 
        t2.*
    from GetRootCTE
    join [dbo].[Category] t2 on GetRootCTE.parentId = t2.id
)
SELECT  * INTO #temp FROM GetRootCTE;
DECLARE @CurrentID int,@MINId int,@flag bit
set @CurrentID = (SELECT TOP 1 Id FROM #temp);
set @MINId = (SELECT TOP 1 Id From #temp ORDER BY Id ASC);
set @flag = 1;
WHILE(@CurrentId>=@MINId)
BEGIN 
  IF(SELECT TOP 1 A.Category_Id_FK FROM [sanitarycart].[dbo].[ProductType] as A WHERE A.Category_Id_FK=@CurrentID)>0
      BEGIN
	  SELECT TOP 1 * FROM Category WHERE Id=@CurrentId;
	  BREAK;
	  END
  else if(@CurrentId=@MINId)
  BREAK;
  else
  set @CurrentID = (SELECT TOP 1 Id from #temp WHERE Id<@CurrentID);
END



GO
/****** Object:  StoredProcedure [dbo].[GetRootPath]    Script Date: 15/12/2020 1:05:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetRootPath] @Id int
AS
WITH GetPathCTE
AS
( 
  select 
        t.*
    from  [dbo].[Category] t
    where t.id = @Id
    union all 
    select 
        t2.*
    from GetPathCTE
    inner join [dbo].[Category] AS t2 on GetPathCTE.ParentId = t2.Id
)
SELECT * from GetPathCTE;
GO
/****** Object:  StoredProcedure [dbo].[GetTypeImmediateResult]    Script Date: 15/12/2020 1:05:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTypeImmediateResult] @Id int,
    @ResultId INT OUTPUT 
AS
BEGIN
WITH GETIdPath(Id,ParentId)
AS
(SELECT Id, ParentId
    FROM [sanitarycart].[dbo].[Category] 
    WHERE id = @Id 
  UNION ALL
  SELECT cp.id, cp.ParentId
    FROM [sanitarycart].[dbo].[Category] AS cp INNER JOIN GETIdPath AS c ON c.ParentId=cp.Id
)
SELECT Id INTO #temp FROM GETIdPath;
set @ResultId = -1;
DECLARE @CurrentID int,@MINId int,@flag bit
set @CurrentID = (SELECT TOP 1 Id FROM #temp);
set @MINId = (SELECT TOP 1 Id From #temp ORDER BY Id ASC);
set @flag = 1;
WHILE(@CurrentId>=@MINId)
BEGIN 
  IF(SELECT TOP 1 A.Category_Id_FK FROM [sanitarycart].[dbo].[ProductType] as A WHERE A.Category_Id_FK=@CurrentID)>0
      BEGIN
	  set @ResultId =  @CURRENTId;
	  BREAK;
	  END
  else if(@CurrentId=@MINId)
  BREAK;
  else
  set @CurrentID = (SELECT TOP 1 Id from #temp WHERE Id<@CurrentID);
END
END
GO
USE [master]
GO
ALTER DATABASE [sanitarycart] SET  READ_WRITE 
GO
