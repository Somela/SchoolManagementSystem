USE [SchoolManagement]
GO
/****** Object:  Table [dbo].[tbl_Teacher_Image]    Script Date: 10/13/2022 3:11:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Teacher_Image](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TeacherId] [nvarchar](10) NOT NULL,
	[ImageName] [nvarchar](50) NOT NULL,
	[ImageType] [nvarchar](50) NOT NULL,
	[ImageData] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_tbl_Teacher_Image] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
