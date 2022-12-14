USE [SchoolManagement]
GO
/****** Object:  Table [dbo].[tbl_TeacherPresentAddress]    Script Date: 10/13/2022 3:11:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_TeacherPresentAddress](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TeacherId] [nvarchar](10) NULL,
	[Address] [nvarchar](100) NULL,
	[Street] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[PinCode] [nvarchar](10) NULL,
 CONSTRAINT [PK_tbl_TeacherAddress] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_TeacherPresentAddress] ON 

INSERT [dbo].[tbl_TeacherPresentAddress] ([Id], [TeacherId], [Address], [Street], [Country], [State], [City], [PinCode]) VALUES (1, N'2022Y39718', N'1/38C,Gotur,Valuur', N'Main Road', N'India', N'Andhra Pradesh', N'Kadapa', N'516293')
SET IDENTITY_INSERT [dbo].[tbl_TeacherPresentAddress] OFF
