USE [SchoolManagement]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteTeacher]    Script Date: 10/13/2022 3:11:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_DeleteTeacher]
@TeacherId int
as
delete from tbl_Teachers where TeacherId=@TeacherId;
delete from tbl_TeacherPermanentAddress where TeacherId=@TeacherId;
delete from tbl_TeacherPresentAddress where TeacherId=@TeacherId;
delete from tbl_TeacherSchoolDetails where EmployeeCode=@TeacherId;
delete from tbl_Teacher_Image where TeacherId=@TeacherId;
GO
