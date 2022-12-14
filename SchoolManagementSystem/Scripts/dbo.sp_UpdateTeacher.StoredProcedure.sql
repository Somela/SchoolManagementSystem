USE [SchoolManagement]
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateTeacher]    Script Date: 10/13/2022 3:11:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_UpdateTeacher]
@TeacherId nvarchar(10),
@FirstName nvarchar(50),
@LastName nvarchar(50),
@DateOfBirth Date,
@Gender nvarchar(50),
@Email nvarchar(100),
@Phone nvarchar(10),
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
@BloodGroup nvarchar(10),
@Password nvarchar(50),
@ParentEmail nvarchar(100),
@ParentFirstName nvarchar(50),
@ParentLastName nvarchar(50),
@ParentGender nvarchar(10),
@ParentEducation nvarchar(50),
@ParentProfession nvarchar(50),
@ParentPassword nvarchar(50),
@ParentPhone nvarchar(10),
@ParentBlood nvarchar(50),
@SchoolDateOfJoin Date,
@SchoolLeavingDate Date,
@CurrentPosition nvarchar(50),
@WorkingStartingHours varchar(10) ,
@WorkingEndingHours varchar(10) ,
@ImageName nvarchar(50),
@ImageType nvarchar(50),
@ImageData nvarchar(max)
as

Declare @Encrypt varbinary(200)  
Select @Encrypt = EncryptByPassPhrase('password', @Password )  
Select @Encrypt as Encrypt 

update tbl_Teachers set FirstName = @FirstName,LastName = @LastName,DateOfBirth=@DateOfBirth,Gender=@Gender,Email=@Email,BloodGroup=@BloodGroup,Password=@Encrypt,MobileNumber=@Phone 
where TeacherId = @TeacherId
update tbl_TeacherSchoolDetails set  JoiningDate= @SchoolDateOfJoin,LeavingDate = @SchoolLeavingDate,CurrentPosition=@CurrentPosition,WorkStartingHours=@WorkingStartingHours,WorkEndingHours = @WorkingEndingHours where EmployeeCode = @TeacherId
update tbl_TeacherPresentAddress set Address = @TempAddress,Street = @TempStreet,Country=@TempCountry,State=@TempState,City=@TempCity,PinCode=@TempPinCode where TeacherId = @TeacherId
update tbl_TeacherPermanentAddress set Address = @PermAddress,Street = @PermStreet,Country=@PermCountry,State=@PermState,City=@PermCity,PinCode=@PermPinCode where TeacherId = @TeacherId

update tbl_Teacher_Image set ImageName = @ImageName , ImageType = @ImageType,ImageData=@ImageData where TeacherId = @TeacherId
GO
