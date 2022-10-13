USE [SchoolManagement]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetTeacherInfo]    Script Date: 10/13/2022 3:11:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_GetTeacherInfo]
as
select s.TeacherId,s.FirstName +' ' + s.LastName as FullName from tbl_Teachers s
GO
