USE [sanitarycart]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 25/02/2021 4:38:45 PM ******/
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
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 25/02/2021 4:38:45 PM ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 25/02/2021 4:38:45 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 25/02/2021 4:38:45 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 25/02/2021 4:38:45 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 25/02/2021 4:38:45 PM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 25/02/2021 4:38:45 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 25/02/2021 4:38:45 PM ******/
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
/****** Object:  Table [dbo].[AttributeType]    Script Date: 25/02/2021 4:38:45 PM ******/
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
/****** Object:  Table [dbo].[Brand]    Script Date: 25/02/2021 4:38:45 PM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 25/02/2021 4:38:45 PM ******/
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
/****** Object:  Table [dbo].[Color]    Script Date: 25/02/2021 4:38:45 PM ******/
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
/****** Object:  Table [dbo].[Grade]    Script Date: 25/02/2021 4:38:45 PM ******/
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
/****** Object:  Table [dbo].[GstRate]    Script Date: 25/02/2021 4:38:45 PM ******/
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
/****** Object:  Table [dbo].[Image]    Script Date: 25/02/2021 4:38:45 PM ******/
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
/****** Object:  Table [dbo].[Kind]    Script Date: 25/02/2021 4:38:45 PM ******/
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
/****** Object:  Table [dbo].[Material]    Script Date: 25/02/2021 4:38:45 PM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 25/02/2021 4:38:45 PM ******/
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
/****** Object:  Table [dbo].[ProductType]    Script Date: 25/02/2021 4:38:45 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [Unique_Category_Type] UNIQUE NONCLUSTERED 
(
	[Category_Id_FK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Series.Brand]    Script Date: 25/02/2021 4:38:45 PM ******/
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
/****** Object:  Table [dbo].[SeriesHolder.Category]    Script Date: 25/02/2021 4:38:45 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_SeriesHolder.Category] UNIQUE NONCLUSTERED 
(
	[CategoryId_Fk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Size]    Script Date: 25/02/2021 4:38:45 PM ******/
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
/****** Object:  Table [dbo].[Type.Product.Quantity]    Script Date: 25/02/2021 4:38:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type.Product.Quantity](
	[Product_Id_FK] [int] NOT NULL,
	[Quantity] [tinyint] NULL,
	[Price] [decimal](7, 2) NOT NULL,
	[AtributeType] [tinyint] NOT NULL,
	[Value] [nvarchar](50) NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_Type.Product.Quantity_IsActive]  DEFAULT ((1)),
 CONSTRAINT [PK_Type.Product.Quantity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[GetCategoryWithHasChildrenInfo]    Script Date: 25/02/2021 4:38:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[GetCategoryWithHasChildrenInfo]
AS
SELECT        c3.Id, c3.Titlle AS 'Title', c3.ParentId, CASE WHEN s.CategoryId_Fk IS NOT NULL THEN 1 ELSE CountTable.IsEndPoint END AS HasChildren
FROM            (SELECT        c1.Id, CASE WHEN COUNT(c2.Id) > 0 THEN 1 ELSE 0 END AS 'IsEndPoint'
                          FROM            dbo.Category AS c1 LEFT OUTER JOIN
                                                    dbo.Category AS c2 ON c1.Id = c2.ParentId
                          GROUP BY c1.Id) AS CountTable LEFT OUTER JOIN
                         dbo.[SeriesHolder.Category] AS s ON s.CategoryId_Fk = CountTable.Id INNER JOIN
                         dbo.Category AS c3 ON c3.Id = CountTable.Id


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
/****** Object:  StoredProcedure [dbo].[GetImmediateNode]    Script Date: 25/02/2021 4:38:45 PM ******/
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
    from  [Category] t
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
  IF(SELECT TOP 1 A.Category_Id_FK FROM [ProductType] as A WHERE A.Category_Id_FK=@CurrentID)>0
      BEGIN
	  SELECT TOP 1 * FROM [Category] WHERE Id=@CurrentId;
	  BREAK;
	  END
  else if(@CurrentId=@MINId)
  BREAK;
  else
  set @CurrentID = (SELECT TOP 1 Id from #temp WHERE Id<@CurrentID);
END




GO
/****** Object:  StoredProcedure [dbo].[GetNodeTillFirstLevel]    Script Date: 25/02/2021 4:38:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetNodeTillFirstLevel]
AS
 WITH FindLevelOfEachNodeCTE
 AS
 (
 select 
        t.*,0 AS 'Level'
    from  [dbo].[Category] AS  t
    where t.ParentId IS NULL
    union all 
    select 
        t2.*,t.Level+1
    from FindLevelOfEachNodeCTE AS t
    inner join [dbo].[Category] AS t2 on t2.ParentId = t.Id
 )
 SELECT c.Id,c.Titlle AS 'Title',c.ParentId,CAST(c2.HasChildren AS bit),c.ImagePath FROM FindLevelOfEachNodeCTE AS c INNER JOIN GetCategoryWithHasChildrenInfo AS c2 ON c2.Id=c.Id WHERE c.Level<=1 
 AND c.Id NOT IN (SELECT sb.Category_Id_FK From [Series.Brand] AS sb);


GO
/****** Object:  StoredProcedure [dbo].[GetNonSeriesHolderCategoryBreadcrumb]    Script Date: 25/02/2021 4:38:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetNonSeriesHolderCategoryBreadcrumb](@Seperator nchar(1))
AS
WITH GetBreadCrumbsCTE(Id,Breadcrump)
AS (
SELECT c1.Id,CAST((c1.Titlle) as nvarchar(110)) AS 'Breadcrump'  FROM Category  AS c1 WHERE c1.ParentId IS NULL 
UNION ALL
SELECT  c1.Id,CAST((c2.Breadcrump+' '+@Seperator+' '+c1.Titlle) as nvarchar(110)) AS 'Breadcrump' FROM Category AS c1 INNER JOIN GetBreadCrumbsCTE AS c2 ON c1.ParentId=c2.Id 
)
SELECT c1.Id,b.Breadcrump,c1.ImagePath FROM Category AS c1 INNER JOIN GetBreadCrumbsCTE as  b ON c1.Id=b.Id  LEFT JOIN [SeriesHolder.Category] AS s ON s.CategoryId_Fk=c1.Id 
WHERE 1=CASE 
WHEN(c1.ParentId IS NULL) THEN 1 
WHEN((SELECT COUNT(*) FROM [SeriesHolder.Category] as se WHERE se.CategoryId_Fk=c1.ParentId) > 0) THEN 0
ELSE 1
END 
ORDER BY c1.Id
 

GO
/****** Object:  StoredProcedure [dbo].[GetRootPath]    Script Date: 25/02/2021 4:38:45 PM ******/
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
SELECT c2.Id,CAST(c2.HasChildren AS bit) AS 'HasChildren',c2.Title As 'Title',c2.ParentId from GetPathCTE INNER JOIN GetCategoryWithHasChildrenInfo AS c2 ON c2.Id=GetPathCTE.Id;

GO
/****** Object:  StoredProcedure [dbo].[GetTypeImmediateResult]    Script Date: 25/02/2021 4:38:45 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SearchProductWithPartition]    Script Date: 25/02/2021 4:38:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SearchProductWithPartition] @Search as varchar(50),@PageCount as int,@Page as int
AS
IF OBJECT_ID('tempdb.dbo.#SearchTemp', 'U') IS NOT NULL
DROP TABLE #SearchTemp;
SELECT p.Id,p.Name,p.Code,p.DateAdded,p.DateUpdated,p.Description,p.Type,CAST(p.IsActive as bit) AS 'IsActive',COUNT(*) OVER() AS 'TotalCount',p.Brand_Id_FK into #SearchTemp FROM Product AS p WHERE p.IsActive=1 AND (p.Code LIKE @Search+'%' OR p.Name LIKE '%'+@Search+'%')  ORDER BY p.Id OFFSET (@Page-1)*@PageCount ROWS FETCH NEXT @PageCount ROWS ONLY;
SELECT t.*,COUNT(*) OVER(PARTITION BY t.Id) AS 'PartitionCount',b.Id AS 'BrandId',b.Name AS 'BrandName',tpq.Id AS 'AttributeId',CAST(tpq.IsActive as  bit) AS 'AttributeIsActive',tpq.Value,tpq.Price,tpq.AtributeType AS 'AttributeType' FROM #SearchTemp AS t INNER JOIN [Type.Product.Quantity] AS tpq ON tpq.Product_Id_FK=t.Id INNER JOIN Brand AS b ON b.Id=t.Brand_Id_FK ORDER BY t.Id;
SELECT TOP 1 TotalCount FROM #SearchTemp;

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[38] 4[27] 2[28] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "s"
            Begin Extent = 
               Top = 0
               Left = 480
               Bottom = 95
               Right = 650
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c3"
            Begin Extent = 
               Top = 58
               Left = 294
               Bottom = 187
               Right = 464
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CountTable"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 101
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 8580
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'GetCategoryWithHasChildrenInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'GetCategoryWithHasChildrenInfo'
GO
