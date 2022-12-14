USE [SchoolManagement]
GO
/****** Object:  Table [dbo].[tbl_Floor]    Script Date: 10/13/2022 3:11:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Floor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Floor] [int] NULL,
	[FloorName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_Floor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_Floor] ON 

INSERT [dbo].[tbl_Floor] ([Id], [Floor], [FloorName]) VALUES (1, 1, N'First Floor')
INSERT [dbo].[tbl_Floor] ([Id], [Floor], [FloorName]) VALUES (2, 2, N'Second Floor')
INSERT [dbo].[tbl_Floor] ([Id], [Floor], [FloorName]) VALUES (3, 3, N'Third Floor')
INSERT [dbo].[tbl_Floor] ([Id], [Floor], [FloorName]) VALUES (4, 4, N'Fourth Floor')
INSERT [dbo].[tbl_Floor] ([Id], [Floor], [FloorName]) VALUES (5, 5, N'Fifth Floor')
SET IDENTITY_INSERT [dbo].[tbl_Floor] OFF
