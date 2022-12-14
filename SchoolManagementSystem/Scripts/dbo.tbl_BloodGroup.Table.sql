USE [SchoolManagement]
GO
/****** Object:  Table [dbo].[tbl_BloodGroup]    Script Date: 10/13/2022 3:11:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_BloodGroup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BloodGroup] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_BloodGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_BloodGroup] ON 

INSERT [dbo].[tbl_BloodGroup] ([Id], [BloodGroup]) VALUES (1, N'A+')
INSERT [dbo].[tbl_BloodGroup] ([Id], [BloodGroup]) VALUES (2, N'A-')
INSERT [dbo].[tbl_BloodGroup] ([Id], [BloodGroup]) VALUES (3, N'B+')
INSERT [dbo].[tbl_BloodGroup] ([Id], [BloodGroup]) VALUES (4, N'B-')
INSERT [dbo].[tbl_BloodGroup] ([Id], [BloodGroup]) VALUES (5, N'AB+')
INSERT [dbo].[tbl_BloodGroup] ([Id], [BloodGroup]) VALUES (6, N'AB-')
INSERT [dbo].[tbl_BloodGroup] ([Id], [BloodGroup]) VALUES (7, N'O+')
INSERT [dbo].[tbl_BloodGroup] ([Id], [BloodGroup]) VALUES (8, N'O-')
SET IDENTITY_INSERT [dbo].[tbl_BloodGroup] OFF
