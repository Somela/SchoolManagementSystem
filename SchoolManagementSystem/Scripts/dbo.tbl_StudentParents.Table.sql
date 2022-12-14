USE [SchoolManagement]
GO
/****** Object:  Table [dbo].[tbl_StudentParents]    Script Date: 10/13/2022 3:11:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_StudentParents](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentRollNumber] [int] NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Gender] [nvarchar](10) NOT NULL,
	[Education] [nvarchar](50) NULL,
	[Profession] [nvarchar](50) NULL,
	[Password] [varbinary](200) NULL,
	[Phone] [nvarchar](50) NULL,
	[ParentImageName] [nvarchar](50) NULL,
	[ParentImageType] [nvarchar](50) NULL,
	[ParentImageData] [nvarchar](max) NULL,
 CONSTRAINT [PK_tbl_Parents] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_StudentParents] ON 

INSERT [dbo].[tbl_StudentParents] ([Id], [StudentRollNumber], [Email], [FirstName], [LastName], [Gender], [Education], [Profession], [Password], [Phone], [ParentImageName], [ParentImageType], [ParentImageData]) VALUES (1, 10000, N'somela.s@gmail.com', N'Somela', N'Sanjeevareddy', N'Male', N'B.Tech', N'Software Developer', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_StudentParents] ([Id], [StudentRollNumber], [Email], [FirstName], [LastName], [Gender], [Education], [Profession], [Password], [Phone], [ParentImageName], [ParentImageType], [ParentImageData]) VALUES (4, 10001, N'indlasan@gmail.com', N'Indla', N'Ankireddy', N'Male', N'NA', N'Farmer', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tbl_StudentParents] OFF
