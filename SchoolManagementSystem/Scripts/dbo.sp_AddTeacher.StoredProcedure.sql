USE [SchoolManagement]
GO
/****** Object:  StoredProcedure [dbo].[sp_AddTeacher]    Script Date: 10/13/2022 3:11:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_AddTeacher]
@FirstName nvarchar(50),
@LastName nvarchar(50),
@DateOfBirth Date,
@Gender nvarchar(50),
@Email nvarchar(100),
@Phone nvarchar(10),
@BloodGroup nvarchar(10),
@Password nvarchar(50),
@Qualification nvarchar(100),
@TempAddress nvarchar(100),
@TempStreet nvarchar(100),
@TempCountry nvarchar(50),
@TempState nvarchar(50),
@TempCity nvarchar(50),
@TempPinCode nvarchar(10),
@PermAddress nvarchar(100),
@PermStreet nvarchar(100),
@PermCountry nvarchar(50),
@PermState nvarchar(50),
@PermCity nvarchar(50),
@PermPinCode nvarchar(10),
@JoiningDate DateTime,
@LeavingDate DateTime,
@CurrentPostiton nvarchar(50),
@WorkStartingHours varchar(10),
@WorkEndingHours varchar(10),
@ImageName nvarchar(50),
@ImageType nvarchar(50),
@ImageData nvarchar(max)
as

Declare @Encrypt varbinary(200)  
Select @Encrypt = EncryptByPassPhrase('password', @Password )  
Select @Encrypt as Encrypt 

declare @alphabet varchar(26) = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
declare @TeacherId nvarchar(10)
declare @year AS varchar(10);set @year = (SELECT YEAR(GETDATE()))
set @TeacherId = (@year  + '' + substring(@alphabet, convert(int, rand()*26), 1) + ''+CAST(RAND()*1000000 AS varchar(10)))


insert into tbl_Teachers values(@TeacherId,@FirstName,@LastName,@DateOfBirth,@Gender,@Email,@Phone,@BloodGroup,@Encrypt,@Qualification)
insert into tbl_TeacherSchoolDetails values(@TeacherId,@JoiningDate,@LeavingDate,@CurrentPostiton,@WorkStartingHours,@WorkEndingHours)
insert into tbl_TeacherPermanentAddress values(@TeacherId,@TempAddress,@TempStreet,@TempCountry,@TempState,@TempCity,@TempPinCode)
insert into tbl_TeacherPresentAddress values(@TeacherId,@PermAddress,@PermStreet,@PermCountry,@PermState,@PermCity,@PermPinCode)
insert into tbl_Teacher_Image values(@TeacherId,@ImageName,@ImageType,@ImageData)
GO
