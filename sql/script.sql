USE [master]
GO
/****** Object:  Database [sanitarycart]    Script Date: 10/12/2020 10:19:30 PM ******/
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
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 10/12/2020 10:19:30 PM ******/
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
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 10/12/2020 10:19:30 PM ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 10/12/2020 10:19:30 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 10/12/2020 10:19:30 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 10/12/2020 10:19:30 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 10/12/2020 10:19:30 PM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 10/12/2020 10:19:30 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 10/12/2020 10:19:30 PM ******/
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
/****** Object:  Table [dbo].[AttributeType]    Script Date: 10/12/2020 10:19:30 PM ******/
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
/****** Object:  Table [dbo].[Brand]    Script Date: 10/12/2020 10:19:30 PM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 10/12/2020 10:19:30 PM ******/
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
/****** Object:  Table [dbo].[Color]    Script Date: 10/12/2020 10:19:30 PM ******/
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
/****** Object:  Table [dbo].[GstRate]    Script Date: 10/12/2020 10:19:30 PM ******/
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
/****** Object:  Table [dbo].[Image]    Script Date: 10/12/2020 10:19:30 PM ******/
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
/****** Object:  Table [dbo].[Kind]    Script Date: 10/12/2020 10:19:30 PM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 10/12/2020 10:19:30 PM ******/
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
/****** Object:  Table [dbo].[ProductType]    Script Date: 10/12/2020 10:19:30 PM ******/
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
/****** Object:  Table [dbo].[Series.Brand]    Script Date: 10/12/2020 10:19:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Series.Brand](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Brand_Id_FK] [tinyint] NULL,
	[Category_Id_FK] [int] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_Series.Brand_IsActive]  DEFAULT ((1)),
 CONSTRAINT [PK_Series] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SeriesHolder.Category]    Script Date: 10/12/2020 10:19:30 PM ******/
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
/****** Object:  Table [dbo].[Size]    Script Date: 10/12/2020 10:19:30 PM ******/
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
/****** Object:  Table [dbo].[Type.Product.Quantity]    Script Date: 10/12/2020 10:19:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Type.Product.Quantity](
	[Product_Id_FK] [int] NOT NULL,
	[Quantity] [tinyint] NOT NULL,
	[Price] [decimal](7, 2) NOT NULL,
	[AtributeType] [tinyint] NOT NULL,
	[Value] [varchar](20) NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_Type.Product.Quantity_IsActive]  DEFAULT ((1)),
 CONSTRAINT [PK_Type.Product.Quantity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
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

INSERT [dbo].[AttributeType] ([Id], [Type]) VALUES (1, N'Color     ')
INSERT [dbo].[AttributeType] ([Id], [Type]) VALUES (2, N'Size      ')
INSERT [dbo].[AttributeType] ([Id], [Type]) VALUES (3, N'None      ')
INSERT [dbo].[AttributeType] ([Id], [Type]) VALUES (4, N'Type      ')
SET IDENTITY_INSERT [dbo].[AttributeType] OFF
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([Id], [Name], [ImagePath]) VALUES (1, N'Cera', N'/images/brand\6400f7a3-30e9-472c-8212-064a11d4333e.jpg')
INSERT [dbo].[Brand] ([Id], [Name], [ImagePath]) VALUES (2, N'Grafdoer', N'/images/brand\7440f95d-042f-493d-936b-342b15b5fe21.png')
INSERT [dbo].[Brand] ([Id], [Name], [ImagePath]) VALUES (3, N'Other', N'/images/brand\d93c66a4-9a89-4c53-9a3f-2342bc4d76ef.jpg')
INSERT [dbo].[Brand] ([Id], [Name], [ImagePath]) VALUES (4, N'Aquant', N'/images/brand\72d78873-6f5b-46bf-909b-d530bde283fe.png')
INSERT [dbo].[Brand] ([Id], [Name], [ImagePath]) VALUES (5, N'Kerovit', N'/images/brand\0f4608b2-8f01-49d1-8921-426de25dc656.jpg')
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
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (16, N'Kitchen Sink', NULL, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (17, N'One Piece EWC', 4, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (18, N'Two Piece EWC', 4, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (19, N'Lioa', 9, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (20, N'Devika Series', 9, N'/images/series\f71b43b2-ccfd-4ead-9676-6b17074f3dc2.jpg')
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (21, N'Devika Series', 9, N'/images/series\641a69e7-e0c9-4f52-801c-1714ae75c6a8.jpg')
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (22, N'Kimili', 9, N'/images/series\ff6c0c38-abb5-4ba1-989f-f822732a0de8.jpg')
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (23, N'Boomi', 9, N'/images/series\b8f98628-f29e-4a7e-a74e-ce830f7462a2.jpg')
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (24, N'Lioa', 9, N'/images/series\b4148e90-b7dc-43c3-8e07-1aaad7c76a42.jpg')
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (25, N'KaBoom', 9, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (26, N'KaBoom', 9, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (27, N'Kimili', 9, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (28, N'Kimili', 9, N'/images/series\ca05130b-6458-4fad-88c6-f66e1dd36c40.jpg')
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (29, N'KingLO', 16, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (30, N'Limoa', 16, N'/images/series\5b1e9740-6b62-49e6-91e0-e46c8b1eccd4.jpg')
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (31, N'Miloa', 16, N'/images/series\a692cd7b-ea27-47ff-b5e9-663e273fc3e9.jpg')
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (32, N'Miloa', 16, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (33, N'Miloa', 16, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (34, N'Pilp', 9, N'/images/series\ac348aa9-0691-44da-a730-8abcf3a6192a.jpg')
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (35, N'Devika', 9, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (36, N'Turbo Series', 9, N'/images/series\c56e851d-9b1e-4b9a-8402-c79b78d0464e.jpg')
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (37, N'Kimjin', 16, NULL)
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (38, N'Mikalo', 16, NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Color] ON 

INSERT [dbo].[Color] ([Id], [Title], [Category_Id_FK]) VALUES (1, N'Ivory', 1)
INSERT [dbo].[Color] ([Id], [Title], [Category_Id_FK]) VALUES (2, N'White', 1)
INSERT [dbo].[Color] ([Id], [Title], [Category_Id_FK]) VALUES (3, N'Red', 1)
INSERT [dbo].[Color] ([Id], [Title], [Category_Id_FK]) VALUES (4, N'Blue', 1)
SET IDENTITY_INSERT [dbo].[Color] OFF
SET IDENTITY_INSERT [dbo].[GstRate] ON 

INSERT [dbo].[GstRate] ([Id], [Percentage]) VALUES (1, 18)
INSERT [dbo].[GstRate] ([Id], [Percentage]) VALUES (2, 20)
SET IDENTITY_INSERT [dbo].[GstRate] OFF
SET IDENTITY_INSERT [dbo].[Image] ON 

INSERT [dbo].[Image] ([Id], [Path], [Product_Id_FK], [Type]) VALUES (1, N'E:\SanitaryControl\SanitaryControl\SanitaryCartControl\wwwroot/images/products\9cc16479-0473-4cbc-9010-2e1c782aa4b6.jpg', 3, 1)
INSERT [dbo].[Image] ([Id], [Path], [Product_Id_FK], [Type]) VALUES (2, N'E:\SanitaryControl\SanitaryControl\SanitaryCartControl\wwwroot/images/products\635d91c2-e52c-45a4-8732-24c430d32e56.jpg', 4, 1)
INSERT [dbo].[Image] ([Id], [Path], [Product_Id_FK], [Type]) VALUES (4, N'/images/products\e5fb1dd8-02e7-4a3a-b235-942ca4e39e13.jpg', 6, 1)
INSERT [dbo].[Image] ([Id], [Path], [Product_Id_FK], [Type]) VALUES (7, N'/images/products\a4c03624-1611-4c0f-b963-47a586ce41b1.jpg', 8, 3)
INSERT [dbo].[Image] ([Id], [Path], [Product_Id_FK], [Type]) VALUES (8, N'/images/products\436f9e39-ad56-4452-874f-db4c95355869.jpg', 5, 1)
INSERT [dbo].[Image] ([Id], [Path], [Product_Id_FK], [Type]) VALUES (1008, N'/images/products\32a697cb-dca6-4586-8585-79e871e3b778.jpg', 3, 1)
INSERT [dbo].[Image] ([Id], [Path], [Product_Id_FK], [Type]) VALUES (1009, N'/images/products\52f1430c-6be1-4bd7-a3c4-b5477be344e0.jpg', 3, 1)
INSERT [dbo].[Image] ([Id], [Path], [Product_Id_FK], [Type]) VALUES (1010, N'/images/products\948e308a-b212-4955-9cb8-893f4b86658a.jpg', 6, 1)
INSERT [dbo].[Image] ([Id], [Path], [Product_Id_FK], [Type]) VALUES (1011, N'/images/products\81c2f046-078d-4297-950e-a9df6bc7a613.jpg', 6, 1)
INSERT [dbo].[Image] ([Id], [Path], [Product_Id_FK], [Type]) VALUES (1012, N'/images/products\51489752-1d21-459a-80f8-92bb4cfd70fb.PNG', 9, 1)
INSERT [dbo].[Image] ([Id], [Path], [Product_Id_FK], [Type]) VALUES (1013, N'/images/products\ee6f4b2b-564f-401d-ae56-0e023caddf83.png', 9, 1)
INSERT [dbo].[Image] ([Id], [Path], [Product_Id_FK], [Type]) VALUES (1014, N'/images/products\1610ac17-fde1-4b3a-8c3b-89e154a61774.png', 9, 1)
INSERT [dbo].[Image] ([Id], [Path], [Product_Id_FK], [Type]) VALUES (1015, N'/images/products\6404c471-65de-40e3-8734-f967a1377b79.png', 9, 1)
SET IDENTITY_INSERT [dbo].[Image] OFF
SET IDENTITY_INSERT [dbo].[Kind] ON 

INSERT [dbo].[Kind] ([Id], [Kind], [Category_Id_FK]) VALUES (1, N'Stanish Finish', 16)
INSERT [dbo].[Kind] ([Id], [Kind], [Category_Id_FK]) VALUES (2, N'Glossy Finish', 16)
INSERT [dbo].[Kind] ([Id], [Kind], [Category_Id_FK]) VALUES (3, N'Brush Finish', 16)
SET IDENTITY_INSERT [dbo].[Kind] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Code], [Name], [Description], [DateAdded], [IsActive], [DateUpdated], [CategoryId], [Type], [Brand_Id_FK]) VALUES (3, N'D-12ABC', N'Kilosa', N'<p>It is goo and have sizze of <strong>12 X 67 X 89 mm</strong></p>', CAST(N'2020-11-20 16:44:52.207' AS DateTime), 1, CAST(N'2020-11-28 18:22:44.230' AS DateTime), 3, 1, 3)
INSERT [dbo].[Product] ([Id], [Code], [Name], [Description], [DateAdded], [IsActive], [DateUpdated], [CategoryId], [Type], [Brand_Id_FK]) VALUES (4, N'CDF-DDDAA', N'Olida', N'<p>It is Stunning</p>', CAST(N'2020-11-20 17:57:34.630' AS DateTime), 1, CAST(N'2020-11-26 02:21:50.490' AS DateTime), 2, 1, 3)
INSERT [dbo].[Product] ([Id], [Code], [Name], [Description], [DateAdded], [IsActive], [DateUpdated], [CategoryId], [Type], [Brand_Id_FK]) VALUES (5, N'CJI-99O', N'Jiklo', N'<p>It is good and under Boom</p>', CAST(N'2020-11-25 21:49:46.440' AS DateTime), 1, CAST(N'2020-11-28 14:00:28.833' AS DateTime), 7, 1, 1)
INSERT [dbo].[Product] ([Id], [Code], [Name], [Description], [DateAdded], [IsActive], [DateUpdated], [CategoryId], [Type], [Brand_Id_FK]) VALUES (6, N'MI-DDJ-685', N'Jikloda', N'<p>It is good.Yo!</p>', CAST(N'2020-11-25 21:55:25.183' AS DateTime), 1, CAST(N'2020-11-28 18:25:32.323' AS DateTime), 3, 1, 4)
INSERT [dbo].[Product] ([Id], [Code], [Name], [Description], [DateAdded], [IsActive], [DateUpdated], [CategoryId], [Type], [Brand_Id_FK]) VALUES (7, N'HY-66-JJ', N'Milano', N'<p>it is vivid and good</p>', CAST(N'2020-11-27 13:53:37.357' AS DateTime), 1, CAST(N'2020-12-10 17:06:37.537' AS DateTime), 10, 3, 1)
INSERT [dbo].[Product] ([Id], [Code], [Name], [Description], [DateAdded], [IsActive], [DateUpdated], [CategoryId], [Type], [Brand_Id_FK]) VALUES (8, N'GGTH-YRD533', N'Mika', N'<p><strong>SIze : 125 x 452 x 45 mm</strong></p><p><strong><em>It is <u>Killing</u></em></strong></p>', CAST(N'2020-11-27 15:13:10.667' AS DateTime), 1, CAST(N'2020-11-28 14:01:42.887' AS DateTime), 36, 3, 2)
INSERT [dbo].[Product] ([Id], [Code], [Name], [Description], [DateAdded], [IsActive], [DateUpdated], [CategoryId], [Type], [Brand_Id_FK]) VALUES (9, N'BDGDK-TUD-23', N'Mila', N'<p>It <strong>hsjsj </strong></p><p><strong><u>Size : </u></strong>89 mm x 67 mm x 90mm</p><p>Diameter : </p>', CAST(N'2020-12-10 17:04:44.867' AS DateTime), 1, CAST(N'2020-12-10 18:57:47.557' AS DateTime), 2, 1, 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
INSERT [dbo].[ProductType] ([Attribute_Id_FK], [Category_Id_FK]) VALUES (1, 1)
INSERT [dbo].[ProductType] ([Attribute_Id_FK], [Category_Id_FK]) VALUES (3, 9)
INSERT [dbo].[ProductType] ([Attribute_Id_FK], [Category_Id_FK]) VALUES (4, 16)
SET IDENTITY_INSERT [dbo].[Series.Brand] ON 

INSERT [dbo].[Series.Brand] ([Id], [Brand_Id_FK], [Category_Id_FK], [IsActive]) VALUES (1, 3, 19, 1)
INSERT [dbo].[Series.Brand] ([Id], [Brand_Id_FK], [Category_Id_FK], [IsActive]) VALUES (2, 1, 20, 1)
INSERT [dbo].[Series.Brand] ([Id], [Brand_Id_FK], [Category_Id_FK], [IsActive]) VALUES (3, 1, 21, 1)
INSERT [dbo].[Series.Brand] ([Id], [Brand_Id_FK], [Category_Id_FK], [IsActive]) VALUES (4, 1, 22, 1)
INSERT [dbo].[Series.Brand] ([Id], [Brand_Id_FK], [Category_Id_FK], [IsActive]) VALUES (5, 1, 23, 1)
INSERT [dbo].[Series.Brand] ([Id], [Brand_Id_FK], [Category_Id_FK], [IsActive]) VALUES (6, 1, 24, 1)
INSERT [dbo].[Series.Brand] ([Id], [Brand_Id_FK], [Category_Id_FK], [IsActive]) VALUES (7, 1, 25, 1)
INSERT [dbo].[Series.Brand] ([Id], [Brand_Id_FK], [Category_Id_FK], [IsActive]) VALUES (8, 1, 26, 1)
INSERT [dbo].[Series.Brand] ([Id], [Brand_Id_FK], [Category_Id_FK], [IsActive]) VALUES (9, 1, 27, 1)
INSERT [dbo].[Series.Brand] ([Id], [Brand_Id_FK], [Category_Id_FK], [IsActive]) VALUES (10, 1, 28, 1)
INSERT [dbo].[Series.Brand] ([Id], [Brand_Id_FK], [Category_Id_FK], [IsActive]) VALUES (11, 4, 29, 1)
INSERT [dbo].[Series.Brand] ([Id], [Brand_Id_FK], [Category_Id_FK], [IsActive]) VALUES (12, 5, 30, 1)
INSERT [dbo].[Series.Brand] ([Id], [Brand_Id_FK], [Category_Id_FK], [IsActive]) VALUES (13, 5, 31, 1)
INSERT [dbo].[Series.Brand] ([Id], [Brand_Id_FK], [Category_Id_FK], [IsActive]) VALUES (14, 5, 32, 1)
INSERT [dbo].[Series.Brand] ([Id], [Brand_Id_FK], [Category_Id_FK], [IsActive]) VALUES (15, 5, 33, 1)
INSERT [dbo].[Series.Brand] ([Id], [Brand_Id_FK], [Category_Id_FK], [IsActive]) VALUES (16, 1, 34, 1)
INSERT [dbo].[Series.Brand] ([Id], [Brand_Id_FK], [Category_Id_FK], [IsActive]) VALUES (17, 1, 35, 1)
INSERT [dbo].[Series.Brand] ([Id], [Brand_Id_FK], [Category_Id_FK], [IsActive]) VALUES (18, 2, 36, 1)
INSERT [dbo].[Series.Brand] ([Id], [Brand_Id_FK], [Category_Id_FK], [IsActive]) VALUES (19, 2, 37, 1)
INSERT [dbo].[Series.Brand] ([Id], [Brand_Id_FK], [Category_Id_FK], [IsActive]) VALUES (20, 2, 38, 1)
SET IDENTITY_INSERT [dbo].[Series.Brand] OFF
SET IDENTITY_INSERT [dbo].[SeriesHolder.Category] ON 

INSERT [dbo].[SeriesHolder.Category] ([Id], [CategoryId_Fk]) VALUES (1, 9)
INSERT [dbo].[SeriesHolder.Category] ([Id], [CategoryId_Fk]) VALUES (2, 16)
SET IDENTITY_INSERT [dbo].[SeriesHolder.Category] OFF
SET IDENTITY_INSERT [dbo].[Type.Product.Quantity] ON 

INSERT [dbo].[Type.Product.Quantity] ([Product_Id_FK], [Quantity], [Price], [AtributeType], [Value], [Id], [IsActive]) VALUES (3, 10, CAST(55.33 AS Decimal(7, 2)), 1, N'2', 1, 0)
INSERT [dbo].[Type.Product.Quantity] ([Product_Id_FK], [Quantity], [Price], [AtributeType], [Value], [Id], [IsActive]) VALUES (4, 25, CAST(463.99 AS Decimal(7, 2)), 1, N'White', 2, 0)
INSERT [dbo].[Type.Product.Quantity] ([Product_Id_FK], [Quantity], [Price], [AtributeType], [Value], [Id], [IsActive]) VALUES (4, 20, CAST(899.66 AS Decimal(7, 2)), 1, N'Ivory', 3, 0)
INSERT [dbo].[Type.Product.Quantity] ([Product_Id_FK], [Quantity], [Price], [AtributeType], [Value], [Id], [IsActive]) VALUES (5, 5, CAST(153.66 AS Decimal(7, 2)), 1, N'Ivory', 4, 0)
INSERT [dbo].[Type.Product.Quantity] ([Product_Id_FK], [Quantity], [Price], [AtributeType], [Value], [Id], [IsActive]) VALUES (5, 7, CAST(452.66 AS Decimal(7, 2)), 1, N'White', 5, 1)
INSERT [dbo].[Type.Product.Quantity] ([Product_Id_FK], [Quantity], [Price], [AtributeType], [Value], [Id], [IsActive]) VALUES (6, 4, CAST(1452.99 AS Decimal(7, 2)), 1, N'Ivory', 6, 1)
INSERT [dbo].[Type.Product.Quantity] ([Product_Id_FK], [Quantity], [Price], [AtributeType], [Value], [Id], [IsActive]) VALUES (4, 16, CAST(789.66 AS Decimal(7, 2)), 1, N'Red', 7, 0)
INSERT [dbo].[Type.Product.Quantity] ([Product_Id_FK], [Quantity], [Price], [AtributeType], [Value], [Id], [IsActive]) VALUES (6, 12, CAST(5896.00 AS Decimal(7, 2)), 1, N'White', 8, 1)
INSERT [dbo].[Type.Product.Quantity] ([Product_Id_FK], [Quantity], [Price], [AtributeType], [Value], [Id], [IsActive]) VALUES (3, 45, CAST(106.99 AS Decimal(7, 2)), 1, N'Ivory', 9, 0)
INSERT [dbo].[Type.Product.Quantity] ([Product_Id_FK], [Quantity], [Price], [AtributeType], [Value], [Id], [IsActive]) VALUES (7, 43, CAST(10.00 AS Decimal(7, 2)), 3, NULL, 10, 1)
INSERT [dbo].[Type.Product.Quantity] ([Product_Id_FK], [Quantity], [Price], [AtributeType], [Value], [Id], [IsActive]) VALUES (8, 5, CAST(465.33 AS Decimal(7, 2)), 3, NULL, 11, 1)
INSERT [dbo].[Type.Product.Quantity] ([Product_Id_FK], [Quantity], [Price], [AtributeType], [Value], [Id], [IsActive]) VALUES (6, 5, CAST(452.33 AS Decimal(7, 2)), 1, N'Red', 12, 1)
INSERT [dbo].[Type.Product.Quantity] ([Product_Id_FK], [Quantity], [Price], [AtributeType], [Value], [Id], [IsActive]) VALUES (3, 5, CAST(145.66 AS Decimal(7, 2)), 1, N'Red', 13, 1)
INSERT [dbo].[Type.Product.Quantity] ([Product_Id_FK], [Quantity], [Price], [AtributeType], [Value], [Id], [IsActive]) VALUES (3, 7, CAST(156.99 AS Decimal(7, 2)), 1, N'White', 14, 1)
INSERT [dbo].[Type.Product.Quantity] ([Product_Id_FK], [Quantity], [Price], [AtributeType], [Value], [Id], [IsActive]) VALUES (5, 5, CAST(145.66 AS Decimal(7, 2)), 1, N'Red', 15, 0)
INSERT [dbo].[Type.Product.Quantity] ([Product_Id_FK], [Quantity], [Price], [AtributeType], [Value], [Id], [IsActive]) VALUES (5, 7, CAST(146.99 AS Decimal(7, 2)), 1, N'Blue', 16, 1)
INSERT [dbo].[Type.Product.Quantity] ([Product_Id_FK], [Quantity], [Price], [AtributeType], [Value], [Id], [IsActive]) VALUES (6, 4, CAST(4523.66 AS Decimal(7, 2)), 1, N'Blue', 17, 1)
INSERT [dbo].[Type.Product.Quantity] ([Product_Id_FK], [Quantity], [Price], [AtributeType], [Value], [Id], [IsActive]) VALUES (9, 5, CAST(125.00 AS Decimal(7, 2)), 1, N'Ivory', 1013, 1)
INSERT [dbo].[Type.Product.Quantity] ([Product_Id_FK], [Quantity], [Price], [AtributeType], [Value], [Id], [IsActive]) VALUES (9, 10, CAST(12.33 AS Decimal(7, 2)), 1, N'White', 1014, 1)
SET IDENTITY_INSERT [dbo].[Type.Product.Quantity] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 10/12/2020 10:19:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 10/12/2020 10:19:30 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 10/12/2020 10:19:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 10/12/2020 10:19:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 10/12/2020 10:19:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [EmailIndex]    Script Date: 10/12/2020 10:19:30 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 10/12/2020 10:19:30 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Unique_Category_Type]    Script Date: 10/12/2020 10:19:30 PM ******/
ALTER TABLE [dbo].[ProductType] ADD  CONSTRAINT [Unique_Category_Type] UNIQUE NONCLUSTERED 
(
	[Category_Id_FK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Series.Brand]    Script Date: 10/12/2020 10:19:30 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Series.Brand] ON [dbo].[Series.Brand]
(
	[Category_Id_FK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
/****** Object:  StoredProcedure [dbo].[GetImmediateNode]    Script Date: 10/12/2020 10:19:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetRootPath]    Script Date: 10/12/2020 10:19:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetTypeImmediateResult]    Script Date: 10/12/2020 10:19:30 PM ******/
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
