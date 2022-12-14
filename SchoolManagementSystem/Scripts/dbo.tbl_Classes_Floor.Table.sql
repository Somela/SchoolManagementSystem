USE [SchoolManagement]
GO
/****** Object:  Table [dbo].[tbl_Classes_Floor]    Script Date: 10/13/2022 3:11:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Classes_Floor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FloorId] [int] NULL,
	[ClassNumber] [int] NULL,
	[ClassName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_Classes_Floor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_Classes_Floor] ON 

INSERT [dbo].[tbl_Classes_Floor] ([Id], [FloorId], [ClassNumber], [ClassName]) VALUES (1, 1, 1, N'Across Borders')
INSERT [dbo].[tbl_Classes_Floor] ([Id], [FloorId], [ClassNumber], [ClassName]) VALUES (2, 1, 2, N'Alive Scholars')
INSERT [dbo].[tbl_Classes_Floor] ([Id], [FloorId], [ClassNumber], [ClassName]) VALUES (3, 1, 3, N'All Night Long
')
INSERT [dbo].[tbl_Classes_Floor] ([Id], [FloorId], [ClassNumber], [ClassName]) VALUES (4, 1, 4, N'Axis Anything ')
INSERT [dbo].[tbl_Classes_Floor] ([Id], [FloorId], [ClassNumber], [ClassName]) VALUES (5, 1, 5, N'Bingo Wives')
INSERT [dbo].[tbl_Classes_Floor] ([Id], [FloorId], [ClassNumber], [ClassName]) VALUES (6, 1, 6, N'Birds of a Feather')
INSERT [dbo].[tbl_Classes_Floor] ([Id], [FloorId], [ClassNumber], [ClassName]) VALUES (7, 1, 7, N'Chichore Dost')
INSERT [dbo].[tbl_Classes_Floor] ([Id], [FloorId], [ClassNumber], [ClassName]) VALUES (8, 1, 8, N'Class Acts')
INSERT [dbo].[tbl_Classes_Floor] ([Id], [FloorId], [ClassNumber], [ClassName]) VALUES (9, 1, 9, N'Clever Cats
')
INSERT [dbo].[tbl_Classes_Floor] ([Id], [FloorId], [ClassNumber], [ClassName]) VALUES (10, 1, 10, N'Colony of Weirdos
')
INSERT [dbo].[tbl_Classes_Floor] ([Id], [FloorId], [ClassNumber], [ClassName]) VALUES (11, 2, 1, N'Consonant Love')
INSERT [dbo].[tbl_Classes_Floor] ([Id], [FloorId], [ClassNumber], [ClassName]) VALUES (12, 2, 2, N'Counter Strike')
INSERT [dbo].[tbl_Classes_Floor] ([Id], [FloorId], [ClassNumber], [ClassName]) VALUES (13, 2, 3, N'Dream Team
')
INSERT [dbo].[tbl_Classes_Floor] ([Id], [FloorId], [ClassNumber], [ClassName]) VALUES (14, 2, 4, N'Elemental Elites
')
INSERT [dbo].[tbl_Classes_Floor] ([Id], [FloorId], [ClassNumber], [ClassName]) VALUES (15, 2, 5, N'Goal Diggers')
INSERT [dbo].[tbl_Classes_Floor] ([Id], [FloorId], [ClassNumber], [ClassName]) VALUES (16, 2, 6, N'Great Mates
')
INSERT [dbo].[tbl_Classes_Floor] ([Id], [FloorId], [ClassNumber], [ClassName]) VALUES (17, 2, 7, N'Hang over
')
INSERT [dbo].[tbl_Classes_Floor] ([Id], [FloorId], [ClassNumber], [ClassName]) VALUES (18, 2, 8, N'Hard Rock Life')
INSERT [dbo].[tbl_Classes_Floor] ([Id], [FloorId], [ClassNumber], [ClassName]) VALUES (19, 2, 9, N'Hike & Bike')
INSERT [dbo].[tbl_Classes_Floor] ([Id], [FloorId], [ClassNumber], [ClassName]) VALUES (20, 2, 10, N'Jumping Jacks
')
INSERT [dbo].[tbl_Classes_Floor] ([Id], [FloorId], [ClassNumber], [ClassName]) VALUES (21, 3, 1, N'Just Chat')
INSERT [dbo].[tbl_Classes_Floor] ([Id], [FloorId], [ClassNumber], [ClassName]) VALUES (22, 3, 2, N'Life for friends
')
INSERT [dbo].[tbl_Classes_Floor] ([Id], [FloorId], [ClassNumber], [ClassName]) VALUES (23, 3, 3, N'Life Is a Highway
')
INSERT [dbo].[tbl_Classes_Floor] ([Id], [FloorId], [ClassNumber], [ClassName]) VALUES (24, 3, 4, N'Little Moons
')
INSERT [dbo].[tbl_Classes_Floor] ([Id], [FloorId], [ClassNumber], [ClassName]) VALUES (25, 3, 5, N'Local Losers
')
INSERT [dbo].[tbl_Classes_Floor] ([Id], [FloorId], [ClassNumber], [ClassName]) VALUES (26, 3, 6, N'Low and Slow
')
INSERT [dbo].[tbl_Classes_Floor] ([Id], [FloorId], [ClassNumber], [ClassName]) VALUES (27, 3, 7, N'Lucky Charms
')
INSERT [dbo].[tbl_Classes_Floor] ([Id], [FloorId], [ClassNumber], [ClassName]) VALUES (28, 3, 8, N'Maniac Messengers')
INSERT [dbo].[tbl_Classes_Floor] ([Id], [FloorId], [ClassNumber], [ClassName]) VALUES (29, 3, 9, N'Mountain Movers
')
INSERT [dbo].[tbl_Classes_Floor] ([Id], [FloorId], [ClassNumber], [ClassName]) VALUES (30, 3, 10, N'Only singles
')
INSERT [dbo].[tbl_Classes_Floor] ([Id], [FloorId], [ClassNumber], [ClassName]) VALUES (31, 4, 1, N'Pack of All Trades
')
INSERT [dbo].[tbl_Classes_Floor] ([Id], [FloorId], [ClassNumber], [ClassName]) VALUES (32, 4, 2, N'Party, Study, Repeat
')
INSERT [dbo].[tbl_Classes_Floor] ([Id], [FloorId], [ClassNumber], [ClassName]) VALUES (33, 4, 3, N'Pen Pals')
INSERT [dbo].[tbl_Classes_Floor] ([Id], [FloorId], [ClassNumber], [ClassName]) VALUES (34, 4, 4, N'Procrastinators Now
')
INSERT [dbo].[tbl_Classes_Floor] ([Id], [FloorId], [ClassNumber], [ClassName]) VALUES (35, 4, 5, N'Rhythm and Weep
')
INSERT [dbo].[tbl_Classes_Floor] ([Id], [FloorId], [ClassNumber], [ClassName]) VALUES (36, 4, 6, N'Royal Benchers
')
INSERT [dbo].[tbl_Classes_Floor] ([Id], [FloorId], [ClassNumber], [ClassName]) VALUES (37, 4, 7, N'Serial Winners
')
INSERT [dbo].[tbl_Classes_Floor] ([Id], [FloorId], [ClassNumber], [ClassName]) VALUES (38, 4, 8, N'Shade Thwers
')
INSERT [dbo].[tbl_Classes_Floor] ([Id], [FloorId], [ClassNumber], [ClassName]) VALUES (39, 4, 9, N'Silent killers
')
INSERT [dbo].[tbl_Classes_Floor] ([Id], [FloorId], [ClassNumber], [ClassName]) VALUES (40, 4, 10, N'Silent Tooters
')
INSERT [dbo].[tbl_Classes_Floor] ([Id], [FloorId], [ClassNumber], [ClassName]) VALUES (41, 5, 1, N'Six Spoons
')
INSERT [dbo].[tbl_Classes_Floor] ([Id], [FloorId], [ClassNumber], [ClassName]) VALUES (42, 5, 2, N'Strong Signals
')
INSERT [dbo].[tbl_Classes_Floor] ([Id], [FloorId], [ClassNumber], [ClassName]) VALUES (43, 5, 3, N'Study Wars
')
INSERT [dbo].[tbl_Classes_Floor] ([Id], [FloorId], [ClassNumber], [ClassName]) VALUES (44, 5, 4, N'Talk to Mock
')
INSERT [dbo].[tbl_Classes_Floor] ([Id], [FloorId], [ClassNumber], [ClassName]) VALUES (45, 5, 5, N'Unlimited talks')
INSERT [dbo].[tbl_Classes_Floor] ([Id], [FloorId], [ClassNumber], [ClassName]) VALUES (46, 5, 6, N'Big Boss')
INSERT [dbo].[tbl_Classes_Floor] ([Id], [FloorId], [ClassNumber], [ClassName]) VALUES (47, 5, 7, N'We Talk A Lot
')
INSERT [dbo].[tbl_Classes_Floor] ([Id], [FloorId], [ClassNumber], [ClassName]) VALUES (48, 5, 8, N'ABCD Dosts
')
INSERT [dbo].[tbl_Classes_Floor] ([Id], [FloorId], [ClassNumber], [ClassName]) VALUES (49, 5, 9, N'Best Brothers
')
INSERT [dbo].[tbl_Classes_Floor] ([Id], [FloorId], [ClassNumber], [ClassName]) VALUES (50, 5, 10, N'Art Breakers
')
SET IDENTITY_INSERT [dbo].[tbl_Classes_Floor] OFF
