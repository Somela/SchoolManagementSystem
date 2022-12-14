USE [SchoolManagement]
GO
/****** Object:  Table [dbo].[tbl_Student]    Script Date: 10/13/2022 3:11:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Student](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RollNumber] [nvarchar](10) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[DateOfBirth] [datetime] NOT NULL,
	[Gender] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[BloodGroup] [nvarchar](50) NULL,
	[Password] [varbinary](200) NOT NULL,
	[MobileNumber] [nvarchar](10) NULL,
 CONSTRAINT [PK_tbl_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_Student] ON 

INSERT [dbo].[tbl_Student] ([Id], [RollNumber], [FirstName], [LastName], [DateOfBirth], [Gender], [Email], [BloodGroup], [Password], [MobileNumber]) VALUES (1, N'10000', N'Somela', N'Sanjeevareddy', CAST(N'1995-06-06T00:00:00.000' AS DateTime), N'Male', N'somelasanjeevareddy@yahoo.com', N'A+', 0x530061006E006A00610079004000310034003700, N'8688198695')
INSERT [dbo].[tbl_Student] ([Id], [RollNumber], [FirstName], [LastName], [DateOfBirth], [Gender], [Email], [BloodGroup], [Password], [MobileNumber]) VALUES (2, N'10001', N'Indla', N'Sandhya', CAST(N'1995-06-06T00:00:00.000' AS DateTime), N'Female', N'indlasandhya@gmail.com', N'A+', 0x530061006E006A00610079004000310034003700, N'807436477')
SET IDENTITY_INSERT [dbo].[tbl_Student] OFF
