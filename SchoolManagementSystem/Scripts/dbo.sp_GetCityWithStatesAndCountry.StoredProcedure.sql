USE [SchoolManagement]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetCityWithStatesAndCountry]    Script Date: 10/13/2022 3:11:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_GetCityWithStatesAndCountry]
@CountryName nvarchar(255),
@StateName nvarchar(255)
as
declare @CountryId int;declare @StateId int;
set @CountryId =(SELECT Id FROM tbl_Countries WHERE Name=@CountryName)
set @StateId = (SELECT Id FROM tbl_States where Name=@StateName and Country_Id=@CountryId)
Select Id,Name from tbl_Cities where Country_Id = @CountryId and State_Id=@StateId order by Name asc
GO
