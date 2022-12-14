USE [SchoolManagement]
GO
/****** Object:  Table [dbo].[tbl_Teachers]    Script Date: 10/13/2022 3:11:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Teachers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TeacherId] [nvarchar](10) NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[DateOfBirth] [date] NULL,
	[Gender] [nvarchar](10) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[MobileNumber] [nvarchar](10) NULL,
	[BloodGroup] [nvarchar](50) NULL,
	[Password] [varbinary](200) NOT NULL,
	[Qualiication] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_Teachers] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_Teachers] ON 

INSERT [dbo].[tbl_Teachers] ([Id], [TeacherId], [FirstName], [LastName], [DateOfBirth], [Gender], [Email], [MobileNumber], [BloodGroup], [Password], [Qualiication]) VALUES (1, N'2022Y39718', N'Somela', N'Sanjay', CAST(N'1995-06-16' AS Date), N'Male', N'somelasanjeevareddy@outlook.com', N'8688198695', N'A+', 0x020000008CBF73C83708BB6CF4E785A95892D5154CEDA81C16C85E87A2236B4F9E992BD0A98911799CC8F3C8DD946BD605C16742, N'B.ed')
SET IDENTITY_INSERT [dbo].[tbl_Teachers] OFF
