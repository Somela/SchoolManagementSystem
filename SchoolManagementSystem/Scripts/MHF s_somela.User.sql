USE [SchoolManagement]
GO
/****** Object:  User [MHF\s_somela]    Script Date: 10/13/2022 3:11:43 AM ******/
CREATE USER [MHF\s_somela] FOR LOGIN [MHF\s_somela] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [MHF\s_somela]
GO
