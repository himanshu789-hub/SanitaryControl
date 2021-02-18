USE [sanitarycart]
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'c87f2208-62b6-4e5b-8472-8b341a507128', N'Manager', N'MANAGER', N'ed592f46-d892-4b3d-b854-3b1f91e9de75')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'f79c8ae0-a139-4393-a337-235b098abb98', N'Administration', N'ADMINISTRATION', N'68fb6354-b2c2-405a-9c1a-0bcb59bee866')
GO
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [ImagePath], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'245b42c3-f2a5-4210-af7a-b36c84cbb433', N'Naresh', N'Lalwani', N'/images/site/administration.svg', N'nl12@gecart.com', N'NL12@GECART.COM', NULL, NULL, 0, N'AQAAAAEAACcQAAAAEBDNnLWBTEt5mvSmBAPVo19H0sAnZZQOLyImtMj9lFPdwjU37rJ4Fx3rS+NRgg7/xg==', N'RFMP6ZBK5KN6TU6LHUGMV442DJASNXLI', N'84b38d88-b82c-4a02-889e-f0e847f4c36b', NULL, 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'245b42c3-f2a5-4210-af7a-b36c84cbb433', N'f79c8ae0-a139-4393-a337-235b098abb98')
GO
SET IDENTITY_INSERT [dbo].[AttributeType] ON 

GO
INSERT [dbo].[AttributeType] ([Id], [Type]) VALUES (1, N'Type      ')
GO
INSERT [dbo].[AttributeType] ([Id], [Type]) VALUES (2, N'Size      ')
GO
INSERT [dbo].[AttributeType] ([Id], [Type]) VALUES (3, N'Color     ')
GO
INSERT [dbo].[AttributeType] ([Id], [Type]) VALUES (4, N'Grade     ')
GO
INSERT [dbo].[AttributeType] ([Id], [Type]) VALUES (5, N'None      ')
GO
INSERT [dbo].[AttributeType] ([Id], [Type]) VALUES (7, N'Material  ')
GO
SET IDENTITY_INSERT [dbo].[AttributeType] OFF
GO

SET IDENTITY_INSERT [dbo].[Category] ON 

GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (1, N'Faucets', NULL, N'/images/category/33f71f5a-b3d2-4f55-a753-388297296f39.jpg')
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (2, N'Showers', NULL, N'/images/category/5fe0d43d-a875-44d3-86a5-fc93e44d1aa7.jpg')
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (3, N'Sanitaryware', NULL, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (4, N'Accessories', NULL, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (5, N'Kitchen Sinks', NULL, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (6, N'Flushing System', NULL, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (7, N'Diverters', NULL, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (8, N'PVC Pipe Fittings', NULL, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (9, N'Rain Shower', 2, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (10, N'Square Shower', 9, N'/images/category/c9d6f2c7-2593-4685-93c4-c0fc8f3855f9.jpg')
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (11, N'Round Shower', 9, N'/images/category\27599213-28f2-4987-bdd4-a5517f2adbf9.jpg')
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (12, N'Ceiling Shower', 2, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (13, N'Square Shower', 12, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (14, N'Round Shower', 12, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (15, N'Body Shower', 2, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (16, N'Square Shower', 15, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (17, N'Round Shower', 15, N'/images/category\5d676576-1879-4a2a-a5ce-d41ff278423c.jpg')
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (18, N'Multiflow Shower', 2, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (19, N'Over Head Shower', 2, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (20, N'Over Head Shower With Arms', 19, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (21, N'Over Head Shower Without Arms', 19, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (22, N'Round Showers', 20, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (23, N'Square Showers', 20, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (24, N'Round Showers', 21, N'/images/category\9db9da10-f418-4013-bb51-dba046eb85d7.jpg')
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (25, N'Square Showers', 21, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (26, N'Telephonic Shower', 2, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (27, N'Round Showers', 26, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (28, N'Square Showers', 26, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (29, N'Multiflow Showers', 26, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (30, N'Health Faucet', 2, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (31, N'Jet Spray', 2, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (32, N'Shower Arm', 2, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (33, N'Round Showers', 32, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (34, N'Square Showers', 32, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (35, N'Shower Tube', 2, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (36, N'Pan', 3, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (37, N'Orissa Pan', 36, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (38, N'C.T.  Pan', 36, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (39, N'Urinal', 3, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (40, N'Flat Back Urinal ', 39, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (41, N'Squatting Urinal', 39, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (42, N'Float Back Urinal', 40, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (43, N'Large Urinal', 40, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (44, N'Corner Urinal', 40, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (45, N'EWC', 3, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (46, N'Floor Mount EWC', 45, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (47, N'Wall Hung EWC', 45, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (48, N'Plain EWC', 46, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (49, N'Anglo Indian EWC', 46, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (50, N'Wall Hung Closet', 3, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (51, N'One Piece Closet', 3, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (52, N'Wall Hung Basin', 3, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (53, N'Wall Hung Stand Basin', 52, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (54, N'Wall Hung Half Pedestal Basin', 52, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (55, N'Table Top Wash Basin', 3, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (56, N'Plain Wash Basin', 55, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (57, N'Designer Wash Basin', 55, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (58, N'Wash Basin With Pedestal ', 3, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (59, N'Plain Wash Basin', 58, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (60, N'Designer Wash Basin', 58, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (61, N'Wooden Wash Basin', 58, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (62, N'One Piece Wash Basin', 3, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (63, N'Plain Wash Basin', 62, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (64, N'Designer Wash Basin', 62, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (65, N'Ceramic Sink', 3, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (66, N'Individual Items', 4, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (67, N'Shelf', 66, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (68, N'Soap Dish Holder', 66, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (69, N'Soap Dispenser With Holder', 66, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (70, N'Tumbler Holder', 66, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (71, N'Towel Holder', 66, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (72, N'Hook', 66, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (73, N'Drainers', 66, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (74, N'Allieds', 66, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (75, N'Corner Shelf', 67, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (76, N'Center Shelf', 67, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (77, N'Double Bowl', 68, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (78, N'Single Bowl', 68, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (79, N'Towel Rack', 71, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (80, N'Towel Rod', 71, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (81, N'Towel Ring', 71, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (82, N'Bath Sets', 4, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (83, N'Single Bowl Sink', 5, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (84, N'Double Bowl Sink', 5, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (85, N'Single Bowl Sink With Drainer Board', 5, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (86, N'Double Bowl Sink With Drainer Board', 5, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (87, N'Stop Cock ', 6, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (88, N'Flush Cock', 6, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (89, N'Flush Valve', 6, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (90, N'Conceated Body', 6, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (91, N'Conceated Sets', 6, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (92, N'Cistern', 6, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (93, N'Concealed Cistern', 92, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (94, N'PVC Cistern', 92, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (95, N'Thermo Hi-Flow Multi Box', 7, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (96, N'Hi-Flow Multi Box', 7, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (97, N'Multi Box ', 7, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (98, N'Concealed Body Diverter ', 95, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (99, N'Exposed Parts Diverter', 95, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (100, N'Concealed Body Diverter ', 96, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (101, N'Exposed Parts Diverter', 96, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (102, N'High Flow Single Lever Mixer And Diverter', 97, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (103, N'Single Lever Mixer and Diverter', 97, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (104, N'Plumbing', 8, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (105, N'Sewage', 8, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (106, N'Agriculture', 8, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (107, N'UPVC Pipe and Fittings', 104, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (108, N'CPVC Pipe and Fittings', 104, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (109, N'S.W.R Pipe and Fittings', 105, NULL)
GO
INSERT [dbo].[Category] ([Id], [Titlle], [ParentId], [ImagePath]) VALUES (110, N'Drainage Pipes', 105, N'/images/category\eebe4b02-664e-4d33-a218-6040a42ae4f1.png')
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
INSERT [dbo].[ProductType] ([Attribute_Id_FK], [Category_Id_FK]) VALUES (5, 1)
GO
INSERT [dbo].[ProductType] ([Attribute_Id_FK], [Category_Id_FK]) VALUES (1, 2)
GO
INSERT [dbo].[ProductType] ([Attribute_Id_FK], [Category_Id_FK]) VALUES (3, 3)
GO
INSERT [dbo].[ProductType] ([Attribute_Id_FK], [Category_Id_FK]) VALUES (7, 4)
GO
INSERT [dbo].[ProductType] ([Attribute_Id_FK], [Category_Id_FK]) VALUES (1, 5)
GO
INSERT [dbo].[ProductType] ([Attribute_Id_FK], [Category_Id_FK]) VALUES (5, 6)
GO
INSERT [dbo].[ProductType] ([Attribute_Id_FK], [Category_Id_FK]) VALUES (5, 7)
GO
INSERT [dbo].[ProductType] ([Attribute_Id_FK], [Category_Id_FK]) VALUES (1, 32)
GO
INSERT [dbo].[ProductType] ([Attribute_Id_FK], [Category_Id_FK]) VALUES (3, 67)
GO
INSERT [dbo].[ProductType] ([Attribute_Id_FK], [Category_Id_FK]) VALUES (4, 72)
GO
INSERT [dbo].[ProductType] ([Attribute_Id_FK], [Category_Id_FK]) VALUES (4, 73)
GO
INSERT [dbo].[ProductType] ([Attribute_Id_FK], [Category_Id_FK]) VALUES (4, 74)
GO
INSERT [dbo].[ProductType] ([Attribute_Id_FK], [Category_Id_FK]) VALUES (2, 104)
GO
INSERT [dbo].[ProductType] ([Attribute_Id_FK], [Category_Id_FK]) VALUES (2, 105)
GO
INSERT [dbo].[ProductType] ([Attribute_Id_FK], [Category_Id_FK]) VALUES (2, 106)
GO
SET IDENTITY_INSERT [dbo].[Grade] ON 

GO
INSERT [dbo].[Grade] ([Id], [Grade], [Category_Id_FK]) VALUES (2, N'202 ', 72)
GO
INSERT [dbo].[Grade] ([Id], [Grade], [Category_Id_FK]) VALUES (3, N'204 ', 72)
GO
INSERT [dbo].[Grade] ([Id], [Grade], [Category_Id_FK]) VALUES (4, N'304 ', 72)
GO
INSERT [dbo].[Grade] ([Id], [Grade], [Category_Id_FK]) VALUES (5, N'202 ', 73)
GO
INSERT [dbo].[Grade] ([Id], [Grade], [Category_Id_FK]) VALUES (7, N'204 ', 73)
GO
INSERT [dbo].[Grade] ([Id], [Grade], [Category_Id_FK]) VALUES (8, N'304 ', 73)
GO
INSERT [dbo].[Grade] ([Id], [Grade], [Category_Id_FK]) VALUES (9, N'202 ', 74)
GO
INSERT [dbo].[Grade] ([Id], [Grade], [Category_Id_FK]) VALUES (11, N'204 ', 74)
GO
INSERT [dbo].[Grade] ([Id], [Grade], [Category_Id_FK]) VALUES (12, N'304 ', 74)
GO
SET IDENTITY_INSERT [dbo].[Grade] OFF
GO
SET IDENTITY_INSERT [dbo].[Kind] ON 

GO
INSERT [dbo].[Kind] ([Id], [Kind], [Category_Id_FK]) VALUES (1, N'Glossy Finish', 5)
GO
INSERT [dbo].[Kind] ([Id], [Kind], [Category_Id_FK]) VALUES (2, N'Matte Finish', 5)
GO
INSERT [dbo].[Kind] ([Id], [Kind], [Category_Id_FK]) VALUES (4, N'Brass Body', 2)
GO
INSERT [dbo].[Kind] ([Id], [Kind], [Category_Id_FK]) VALUES (5, N'ABS Body', 2)
GO
INSERT [dbo].[Kind] ([Id], [Kind], [Category_Id_FK]) VALUES (6, N'Brass Arm', 32)
GO
INSERT [dbo].[Kind] ([Id], [Kind], [Category_Id_FK]) VALUES (7, N'S.S Arm', 32)
GO
SET IDENTITY_INSERT [dbo].[Kind] OFF
GO
SET IDENTITY_INSERT [dbo].[Material] ON 

GO
INSERT [dbo].[Material] ([Id], [Title], [Category_Id_FK]) VALUES (1, N'Glass', 67)
GO
INSERT [dbo].[Material] ([Id], [Title], [Category_Id_FK]) VALUES (2, N'PVC (Acrylic)', 67)
GO
INSERT [dbo].[Material] ([Id], [Title], [Category_Id_FK]) VALUES (3, N'Unbreakable', 67)
GO
INSERT [dbo].[Material] ([Id], [Title], [Category_Id_FK]) VALUES (4, N'Unbreakable', 4)
GO
INSERT [dbo].[Material] ([Id], [Title], [Category_Id_FK]) VALUES (5, N'Brass', 4)
GO
INSERT [dbo].[Material] ([Id], [Title], [Category_Id_FK]) VALUES (6, N'Acrylic', 4)
GO
SET IDENTITY_INSERT [dbo].[Material] OFF
GO
SET IDENTITY_INSERT [dbo].[SeriesHolder.Category] ON 

GO
INSERT [dbo].[SeriesHolder.Category] ([Id], [CategoryId_Fk]) VALUES (1, 1)
GO
INSERT [dbo].[SeriesHolder.Category] ([Id], [CategoryId_Fk]) VALUES (2, 2)
GO
INSERT [dbo].[SeriesHolder.Category] ([Id], [CategoryId_Fk]) VALUES (3, 3)
GO
INSERT [dbo].[SeriesHolder.Category] ([Id], [CategoryId_Fk]) VALUES (4, 4)
GO
INSERT [dbo].[SeriesHolder.Category] ([Id], [CategoryId_Fk]) VALUES (5, 5)
GO
INSERT [dbo].[SeriesHolder.Category] ([Id], [CategoryId_Fk]) VALUES (6, 6)
GO
INSERT [dbo].[SeriesHolder.Category] ([Id], [CategoryId_Fk]) VALUES (7, 7)
GO
INSERT [dbo].[SeriesHolder.Category] ([Id], [CategoryId_Fk]) VALUES (8, 8)
GO
SET IDENTITY_INSERT [dbo].[SeriesHolder.Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Size] ON 

GO
INSERT [dbo].[Size] ([Id], [Size], [Category_Id_FK]) VALUES (2, N'½ ″       ', 104)
GO
INSERT [dbo].[Size] ([Id], [Size], [Category_Id_FK]) VALUES (4, N'1 ″       ', 104)
GO
INSERT [dbo].[Size] ([Id], [Size], [Category_Id_FK]) VALUES (6, N'1½ ″      ', 104)
GO
INSERT [dbo].[Size] ([Id], [Size], [Category_Id_FK]) VALUES (7, N'2 ″       ', 104)
GO
INSERT [dbo].[Size] ([Id], [Size], [Category_Id_FK]) VALUES (8, N'75 mm     ', 105)
GO
INSERT [dbo].[Size] ([Id], [Size], [Category_Id_FK]) VALUES (9, N'110 mm    ', 105)
GO
INSERT [dbo].[Size] ([Id], [Size], [Category_Id_FK]) VALUES (10, N'40 mm     ', 106)
GO
INSERT [dbo].[Size] ([Id], [Size], [Category_Id_FK]) VALUES (12, N'50 mm     ', 106)
GO
INSERT [dbo].[Size] ([Id], [Size], [Category_Id_FK]) VALUES (13, N'63 mm     ', 106)
GO
INSERT [dbo].[Size] ([Id], [Size], [Category_Id_FK]) VALUES (14, N'75 mm     ', 106)
GO
INSERT [dbo].[Size] ([Id], [Size], [Category_Id_FK]) VALUES (15, N'90 mm     ', 106)
GO
INSERT [dbo].[Size] ([Id], [Size], [Category_Id_FK]) VALUES (16, N'110 mm    ', 106)
GO
INSERT [dbo].[Size] ([Id], [Size], [Category_Id_FK]) VALUES (17, N'125 mm    ', 106)
GO
INSERT [dbo].[Size] ([Id], [Size], [Category_Id_FK]) VALUES (18, N'140 mm    ', 106)
GO
INSERT [dbo].[Size] ([Id], [Size], [Category_Id_FK]) VALUES (19, N'160 mm    ', 106)
GO
INSERT [dbo].[Size] ([Id], [Size], [Category_Id_FK]) VALUES (20, N'180 mm    ', 106)
GO
INSERT [dbo].[Size] ([Id], [Size], [Category_Id_FK]) VALUES (22, N'200 mm    ', 106)
GO
SET IDENTITY_INSERT [dbo].[Size] OFF
GO
SET IDENTITY_INSERT [dbo].[Color] ON 

GO
INSERT [dbo].[Color] ([Id], [Title], [Category_Id_FK]) VALUES (12, N'White', 3)
GO
INSERT [dbo].[Color] ([Id], [Title], [Category_Id_FK]) VALUES (13, N'Ivory', 3)
GO
SET IDENTITY_INSERT [dbo].[Color] OFF
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20201123111121_initial', N'5.0.0')
GO
