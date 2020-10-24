USE [sanitarycart]
GO
/****** Object:  Table [dbo].[GstRate]    Script Date: 10/24/2020 17:47:16 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[GstRate] ON
INSERT [dbo].[GstRate] ([Id], [Percentage]) VALUES (1, 18)
INSERT [dbo].[GstRate] ([Id], [Percentage]) VALUES (2, 20)
SET IDENTITY_INSERT [dbo].[GstRate] OFF
/****** Object:  Table [dbo].[Category]    Script Date: 10/24/2020 17:47:16 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
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
/****** Object:  Table [dbo].[Brand]    Script Date: 10/24/2020 17:47:16 ******/
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
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Brand] ON
INSERT [dbo].[Brand] ([Id], [Name], [ImagePath], [IsActive]) VALUES (1, N'Cera', N'images//cera.jpg', 1)
INSERT [dbo].[Brand] ([Id], [Name], [ImagePath], [IsActive]) VALUES (2, N'Grafdoer', N'images//grafdoer.jpg', 1)
INSERT [dbo].[Brand] ([Id], [Name], [ImagePath], [IsActive]) VALUES (3, N'Other', N'images//nobrand.jpg', 1)
SET IDENTITY_INSERT [dbo].[Brand] OFF
/****** Object:  Table [dbo].[Product]    Script Date: 10/24/2020 17:47:16 ******/
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
	[Quantity] [tinyint] NOT NULL,
	[Description] [varchar](800) NOT NULL,
	[DateAdded] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DateUpdated] [datetime] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[GstRate_Id_FK] [tinyint] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON
INSERT [dbo].[Product] ([Id], [Code], [Name], [Price], [Quantity], [Description], [DateAdded], [IsActive], [DateUpdated], [CategoryId], [GstRate_Id_FK]) VALUES (8, N'AR48041', N'Single Liver With Mixer', CAST(960.33 AS Decimal(7, 2)), 9, N'It is very vivid and grate <b>Good</b>', CAST(0x0000AC5D0100EDC5 AS DateTime), 1, CAST(0x0000AC5D0100EDC5 AS DateTime), 10, 1)
INSERT [dbo].[Product] ([Id], [Code], [Name], [Price], [Quantity], [Description], [DateAdded], [IsActive], [DateUpdated], [CategoryId], [GstRate_Id_FK]) VALUES (9, N'GS-1101', N'ONE PIECE CLOSET(WASH DOWN) DUAL FLUSH FITTINGS AND SOFT CLOSING SEAT COVER', CAST(12000.00 AS Decimal(7, 2)), 9, N'It is very vivid and grate <b>Good</b>', CAST(0x0000AC5D01017A0A AS DateTime), 1, CAST(0x0000AC5D01017A0A AS DateTime), 2, 2)
INSERT [dbo].[Product] ([Id], [Code], [Name], [Price], [Quantity], [Description], [DateAdded], [IsActive], [DateUpdated], [CategoryId], [GstRate_Id_FK]) VALUES (10, N'S2040139', N'CHIME', CAST(1200.00 AS Decimal(7, 2)), 4, N'It is very vivid and grate <b>Good</b>', CAST(0x0000AC5D01025CF4 AS DateTime), 1, CAST(0x0000AC5D01025CF4 AS DateTime), 8, 2)
SET IDENTITY_INSERT [dbo].[Product] OFF
/****** Object:  Table [dbo].[Series.Brand]    Script Date: 10/24/2020 17:47:16 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product.Brand.Category]    Script Date: 10/24/2020 17:47:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product.Brand.Category](
	[Category_Id_FK] [int] NOT NULL,
	[Brand_Id_FK] [tinyint] NOT NULL,
	[Product_Id_FK] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 10/24/2020 17:47:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Image](
	[Id] [int] NOT NULL,
	[Path] [varchar](110) NOT NULL,
	[Product_Id_FK] [int] NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Default [DF_Brand_IsActive]    Script Date: 10/24/2020 17:47:16 ******/
ALTER TABLE [dbo].[Brand] ADD  CONSTRAINT [DF_Brand_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Check [Price_Greater_Than_Zero]    Script Date: 10/24/2020 17:47:16 ******/
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [Price_Greater_Than_Zero] CHECK  (([Price]>(0)))
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [Price_Greater_Than_Zero]
GO
/****** Object:  Check [Quantity_Greater_Than_Zero]    Script Date: 10/24/2020 17:47:16 ******/
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [Quantity_Greater_Than_Zero] CHECK  (([Quantity]>(0)))
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [Quantity_Greater_Than_Zero]
GO
/****** Object:  ForeignKey [FK_Category_Category]    Script Date: 10/24/2020 17:47:16 ******/
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_Category] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_Category]
GO
/****** Object:  ForeignKey [FK_Image_Product]    Script Date: 10/24/2020 17:47:16 ******/
ALTER TABLE [dbo].[Image]  WITH CHECK ADD  CONSTRAINT [FK_Image_Product] FOREIGN KEY([Product_Id_FK])
REFERENCES [dbo].[Product] ([Id])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Image] CHECK CONSTRAINT [FK_Image_Product]
GO
/****** Object:  ForeignKey [FK_Product_GstRate]    Script Date: 10/24/2020 17:47:16 ******/
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_GstRate] FOREIGN KEY([GstRate_Id_FK])
REFERENCES [dbo].[GstRate] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_GstRate]
GO
/****** Object:  ForeignKey [FK_Product.Brand.Category_Brand]    Script Date: 10/24/2020 17:47:16 ******/
ALTER TABLE [dbo].[Product.Brand.Category]  WITH CHECK ADD  CONSTRAINT [FK_Product.Brand.Category_Brand] FOREIGN KEY([Brand_Id_FK])
REFERENCES [dbo].[Brand] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product.Brand.Category] CHECK CONSTRAINT [FK_Product.Brand.Category_Brand]
GO
/****** Object:  ForeignKey [FK_Product.Brand.Category_Category1]    Script Date: 10/24/2020 17:47:16 ******/
ALTER TABLE [dbo].[Product.Brand.Category]  WITH CHECK ADD  CONSTRAINT [FK_Product.Brand.Category_Category1] FOREIGN KEY([Category_Id_FK])
REFERENCES [dbo].[Category] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product.Brand.Category] CHECK CONSTRAINT [FK_Product.Brand.Category_Category1]
GO
/****** Object:  ForeignKey [FK_Product.Brand.Category_Product]    Script Date: 10/24/2020 17:47:16 ******/
ALTER TABLE [dbo].[Product.Brand.Category]  WITH CHECK ADD  CONSTRAINT [FK_Product.Brand.Category_Product] FOREIGN KEY([Product_Id_FK])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[Product.Brand.Category] CHECK CONSTRAINT [FK_Product.Brand.Category_Product]
GO
/****** Object:  ForeignKey [FK_Series.Brand_Category]    Script Date: 10/24/2020 17:47:16 ******/
ALTER TABLE [dbo].[Series.Brand]  WITH CHECK ADD  CONSTRAINT [FK_Series.Brand_Category] FOREIGN KEY([Category_Id_FK])
REFERENCES [dbo].[Category] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Series.Brand] CHECK CONSTRAINT [FK_Series.Brand_Category]
GO
/****** Object:  ForeignKey [FK_Series_Brand]    Script Date: 10/24/2020 17:47:16 ******/
ALTER TABLE [dbo].[Series.Brand]  WITH CHECK ADD  CONSTRAINT [FK_Series_Brand] FOREIGN KEY([Brand_Id_FK])
REFERENCES [dbo].[Brand] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Series.Brand] CHECK CONSTRAINT [FK_Series_Brand]
GO
