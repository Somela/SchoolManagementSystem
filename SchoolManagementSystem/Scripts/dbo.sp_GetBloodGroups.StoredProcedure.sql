USE [SchoolManagement]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetBloodGroups]    Script Date: 10/13/2022 3:11:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_GetBloodGroups]
as
select * from tbl_BloodGroup
GO
