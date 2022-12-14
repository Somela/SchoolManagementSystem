USE [SchoolManagement]
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateStudent]    Script Date: 10/13/2022 3:11:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_UpdateStudent]
@RollNumber nvarchar(10),
@FirstName nvarchar(50),
@LastName nvarchar(50),
@DateOfBirth Date,
@Gender nvarchar(50),
@Email nvarchar(100),
@Phone nvarchar(10),
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
@Class nvarchar(50),
@ImageName nvarchar(50),
@ImageType nvarchar(50),
@ImageData nvarchar(max)
as
begin

Declare @Encrypt varbinary(200)  
Select @Encrypt = EncryptByPassPhrase('password', @Password )  
Select @Encrypt as Encrypt 

Declare @ParentEncrypt varbinary(200)  
Select @ParentEncrypt = EncryptByPassPhrase('password', @ParentPassword )  
Select @ParentEncrypt as Encrypt 

update tbl_Student set FirstName = @FirstName,LastName = @LastName,DateOfBirth=@DateOfBirth,Gender=@Gender,Email=@Email,BloodGroup=@BloodGroup,Password=@Encrypt,MobileNumber=@Phone where RollNumber = @RollNumber
update tbl_StudentParents set FirstName = @ParentFirstName,LastName = @ParentLastName,Gender=@ParentGender,Email=@ParentEmail,Education=@ParentEducation,Profession=@ParentProfession
,Password=@ParentEncrypt,Phone=@ParentPhone where StudentRollNumber = @RollNumber
update tbl_StudentPresentAddress set Address = @TempAddress,Street = @TempStreet,Country=@TempCountry,State=@TempState,City=@TempCity,PinCode=@TempPinCode where StudentRollNumber = @RollNumber
update tbl_StudentPermanentAddress set Address = @PermAddress,Street = @PermStreet,Country=@PermCountry,State=@PermState,City=@PermCity,PinCode=@PermPinCode where StudentRollNumber = @RollNumber
update tbl_Student_Image set ImageName = @ImageName , ImageType = @ImageType,ImageData=@ImageData where RollNumber = @RollNumber

end
GO
