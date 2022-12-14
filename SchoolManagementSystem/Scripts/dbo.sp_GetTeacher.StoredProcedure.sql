USE [SchoolManagement]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetTeacher]    Script Date: 10/13/2022 3:11:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_GetTeacher]
as
select s.TeacherId,s.FirstName +' ' + s.LastName as FullName,pa.Address+','+pa.Street+','+pa.Country+','+pa.State+','+pa.City+','+pa.PinCode+',' as Address,s.Qualiication,
s.MobileNumber as Phone,p.CurrentPosition from tbl_Teachers s join 
tbl_TeacherSchoolDetails p on s.TeacherId = p.EmployeeCode
join tbl_TeacherPresentAddress pa on pa.TeacherId = s.TeacherId
GO
