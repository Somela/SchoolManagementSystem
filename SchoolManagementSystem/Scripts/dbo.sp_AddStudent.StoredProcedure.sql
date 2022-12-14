USE [SchoolManagement]
GO
/****** Object:  StoredProcedure [dbo].[sp_AddStudent]    Script Date: 10/13/2022 3:11:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_AddStudent]
@FirstName nvarchar(50),
@LastName nvarchar(50),
@DateOfBirth Date,
@Gender nvarchar(50),
@Email nvarchar(100),
@Phone nvarchar(10),
@BloodGroup nvarchar(10),
@Password nvarchar(50),
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
@ImageName nvarchar(50),
@ImageType nvarchar(50),
@ImageData nvarchar(max),

@ParentEmail nvarchar(100),
@ParentFirstName nvarchar(50),
@ParentLastName nvarchar(50),
@ParentGender nvarchar(10),
@ParentEducation nvarchar(50),
@ParentProfession nvarchar(50),
@ParentPassword nvarchar(50),
@ParentPhone nvarchar(10),
@ParentBlood nvarchar(50),
@ParentImageName nvarchar(50),
@ParentImageType nvarchar(50),
@ParentImageData nvarchar(max),

@SchoolDateOfJoin Date,
@Class nvarchar(50)
as

Declare @Encrypt varbinary(200)  
Select @Encrypt = EncryptByPassPhrase('password', @Password )  
Select @Encrypt as Encrypt 

Declare @ParentEncrypt varbinary(200)  
Select @ParentEncrypt = EncryptByPassPhrase('password', @ParentPassword )  
Select @ParentEncrypt as Encrypt 

declare @RollNumber nvarchar(10)

set @RollNumber = (SELECT top 1 RollNumber
    FROM tbl_Student order by RollNumber desc)

insert into tbl_Student values(@RollNumber,@FirstName,@LastName,@DateOfBirth,@Gender,@Email,@BloodGroup,@Encrypt,@Phone)
insert into tbl_StudentParents values(@RollNumber,@ParentEmail,@ParentFirstName,@ParentLastName,@ParentGender,@ParentEducation,@ParentProfession,@ParentEncrypt,@ParentPhone,@ParentImageName,@ParentImageType,@ParentImageData)
insert into tbl_StudentPresentAddress values(@RollNumber,@TempAddress,@TempStreet,@TempCountry,@TempState,@TempCity,@TempPinCode)
insert into tbl_StudentPresentAddress values(@RollNumber,@PermAddress,@PermStreet,@PermCountry,@PermState,@PermCity,@PermPinCode)
insert into tbl_Student_Image values(@RollNumber,@ImageName,@ImageType,@ImageData)
GO
