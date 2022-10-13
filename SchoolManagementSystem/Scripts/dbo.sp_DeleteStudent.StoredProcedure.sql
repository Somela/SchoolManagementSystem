USE [SchoolManagement]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteStudent]    Script Date: 10/13/2022 3:11:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_DeleteStudent]
@RollNumber int
as
delete from tbl_Student where RollNumber=@RollNumber;
delete from tbl_Student_Image where RollNumber=@RollNumber;
delete from tbl_StudentPermanentAddress where StudentRollNumber=@RollNumber;
delete from tbl_StudentPresentAddress where StudentRollNumber=@RollNumber;
GO
