USE [sanitarycart]
GO
/****** Object:  Table [dbo].[GstRate]    Script Date: 10/23/2020 22:52:23 ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 10/23/2020 22:52:23 ******/
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
/****** Object:  Table [dbo].[Brand]    Script Date: 10/23/2020 22:52:23 ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 10/23/2020 22:52:23 ******/
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
/****** Object:  Table [dbo].[Series.Brand]    Script Date: 10/23/2020 22:52:23 ******/
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
/****** Object:  Table [dbo].[Product.Brand.Category]    Script Date: 10/23/2020 22:52:23 ******/
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
/****** Object:  Table [dbo].[Image]    Script Date: 10/23/2020 22:52:23 ******/
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
/****** Object:  Default [DF_Brand_IsActive]    Script Date: 10/23/2020 22:52:23 ******/
ALTER TABLE [dbo].[Brand] ADD  CONSTRAINT [DF_Brand_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
/****** Object:  Check [Price_Greater_Than_Zero]    Script Date: 10/23/2020 22:52:23 ******/
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [Price_Greater_Than_Zero] CHECK  (([Price]>(0)))
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [Price_Greater_Than_Zero]
GO
/****** Object:  Check [Quantity_Greater_Than_Zero]    Script Date: 10/23/2020 22:52:23 ******/
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [Quantity_Greater_Than_Zero] CHECK  (([Quantity]>(0)))
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [Quantity_Greater_Than_Zero]
GO
/****** Object:  ForeignKey [FK_Category_Category]    Script Date: 10/23/2020 22:52:23 ******/
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_Category] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_Category]
GO
/****** Object:  ForeignKey [FK_Image_Product]    Script Date: 10/23/2020 22:52:23 ******/
ALTER TABLE [dbo].[Image]  WITH CHECK ADD  CONSTRAINT [FK_Image_Product] FOREIGN KEY([Product_Id_FK])
REFERENCES [dbo].[Product] ([Id])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Image] CHECK CONSTRAINT [FK_Image_Product]
GO
/****** Object:  ForeignKey [FK_Product_GstRate]    Script Date: 10/23/2020 22:52:23 ******/
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_GstRate] FOREIGN KEY([GstRate_Id_FK])
REFERENCES [dbo].[GstRate] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_GstRate]
GO
/****** Object:  ForeignKey [FK_Product.Brand.Category_Brand]    Script Date: 10/23/2020 22:52:23 ******/
ALTER TABLE [dbo].[Product.Brand.Category]  WITH CHECK ADD  CONSTRAINT [FK_Product.Brand.Category_Brand] FOREIGN KEY([Brand_Id_FK])
REFERENCES [dbo].[Brand] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product.Brand.Category] CHECK CONSTRAINT [FK_Product.Brand.Category_Brand]
GO
/****** Object:  ForeignKey [FK_Product.Brand.Category_Category1]    Script Date: 10/23/2020 22:52:23 ******/
ALTER TABLE [dbo].[Product.Brand.Category]  WITH CHECK ADD  CONSTRAINT [FK_Product.Brand.Category_Category1] FOREIGN KEY([Category_Id_FK])
REFERENCES [dbo].[Category] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product.Brand.Category] CHECK CONSTRAINT [FK_Product.Brand.Category_Category1]
GO
/****** Object:  ForeignKey [FK_Product.Brand.Category_Product]    Script Date: 10/23/2020 22:52:23 ******/
ALTER TABLE [dbo].[Product.Brand.Category]  WITH CHECK ADD  CONSTRAINT [FK_Product.Brand.Category_Product] FOREIGN KEY([Product_Id_FK])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[Product.Brand.Category] CHECK CONSTRAINT [FK_Product.Brand.Category_Product]
GO
/****** Object:  ForeignKey [FK_Series.Brand_Category]    Script Date: 10/23/2020 22:52:23 ******/
ALTER TABLE [dbo].[Series.Brand]  WITH CHECK ADD  CONSTRAINT [FK_Series.Brand_Category] FOREIGN KEY([Category_Id_FK])
REFERENCES [dbo].[Category] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Series.Brand] CHECK CONSTRAINT [FK_Series.Brand_Category]
GO
/****** Object:  ForeignKey [FK_Series_Brand]    Script Date: 10/23/2020 22:52:23 ******/
ALTER TABLE [dbo].[Series.Brand]  WITH CHECK ADD  CONSTRAINT [FK_Series_Brand] FOREIGN KEY([Brand_Id_FK])
REFERENCES [dbo].[Brand] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Series.Brand] CHECK CONSTRAINT [FK_Series_Brand]
GO
