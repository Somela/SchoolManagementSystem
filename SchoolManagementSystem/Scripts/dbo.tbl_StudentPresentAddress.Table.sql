USE [SchoolManagement]
GO
/****** Object:  Table [dbo].[tbl_StudentPresentAddress]    Script Date: 10/13/2022 3:11:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_StudentPresentAddress](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentRollNumber] [int] NULL,
	[Address] [nvarchar](100) NULL,
	[Street] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[PinCode] [nvarchar](10) NULL,
 CONSTRAINT [PK_tbl_StudentAddress] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_StudentPresentAddress] ON 

INSERT [dbo].[tbl_StudentPresentAddress] ([Id], [StudentRollNumber], [Address], [Street], [Country], [State], [City], [PinCode]) VALUES (1, 10000, N'1/38C,Gotur,Vallur', N'MainStreet', N'India', N'AndhraPradesh', N'Kadapa', N'516293')
INSERT [dbo].[tbl_StudentPresentAddress] ([Id], [StudentRollNumber], [Address], [Street], [Country], [State], [City], [PinCode]) VALUES (2, 10001, N'1/38C,Gotur,Vallur', N'MainStreet', N'India', N'AndhraPradesh', N'Kadapa', N'516293')
SET IDENTITY_INSERT [dbo].[tbl_StudentPresentAddress] OFF
