USE [SchoolManagement]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetStudents]    Script Date: 10/13/2022 3:11:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_GetStudents]
as
select S.Id,s.RollNumber,s.FirstName +' ' + s.LastName as FullName,pa.Address+','+pa.Street+','+pa.Country+','+pa.State+','+pa.City+','+pa.PinCode+',' as Address,
s.MobileNumber as Phone,p.FirstName + '' + P.LastName as Parent from tbl_student s join 
tbl_StudentParents p on s.RollNumber = p.StudentRollNumber
join tbl_StudentPresentAddress pa on pa.StudentRollNumber = s.RollNumber
GO
