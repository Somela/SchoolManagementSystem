USE [SchoolManagement]
GO
/****** Object:  Table [dbo].[tbl_Class_Map_Floor]    Script Date: 10/13/2022 3:11:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Class_Map_Floor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClassMapId] [int] NOT NULL,
	[ClassCapacity] [int] NULL,
	[ClassTeacher] [nvarchar](50) NULL,
	[ClassStartingOn] [date] NULL,
	[ClassEndingOn] [date] NULL,
	[ClassLocation] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_Class] PRIMARY KEY CLUSTERED 
(
	[ClassMapId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_Class_Map_Floor] ON 

INSERT [dbo].[tbl_Class_Map_Floor] ([Id], [ClassMapId], [ClassCapacity], [ClassTeacher], [ClassStartingOn], [ClassEndingOn], [ClassLocation]) VALUES (1, 13, 30, N'Somela Sanjay', CAST(N'2016-06-06' AS Date), NULL, N'chennai')
SET IDENTITY_INSERT [dbo].[tbl_Class_Map_Floor] OFF
