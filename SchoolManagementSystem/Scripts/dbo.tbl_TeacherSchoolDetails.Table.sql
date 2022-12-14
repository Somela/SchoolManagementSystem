USE [SchoolManagement]
GO
/****** Object:  Table [dbo].[tbl_TeacherSchoolDetails]    Script Date: 10/13/2022 3:11:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_TeacherSchoolDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeCode] [nvarchar](10) NULL,
	[JoiningDate] [date] NULL,
	[LeavingDate] [date] NULL,
	[CurrentPosition] [nvarchar](50) NULL,
	[WorkStartingHours] [varchar](10) NULL,
	[WorkEndingHours] [varchar](10) NULL,
 CONSTRAINT [PK_tbl_TeacherSchoolDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_TeacherSchoolDetails] ON 

INSERT [dbo].[tbl_TeacherSchoolDetails] ([Id], [EmployeeCode], [JoiningDate], [LeavingDate], [CurrentPosition], [WorkStartingHours], [WorkEndingHours]) VALUES (1, N'2022Y39718', CAST(N'2021-10-10' AS Date), NULL, N'Maths Teacher', N'08:00 AM', N'06:00 PM')
SET IDENTITY_INSERT [dbo].[tbl_TeacherSchoolDetails] OFF
