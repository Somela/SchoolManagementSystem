USE [SchoolManagement]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetStatesWithCountry]    Script Date: 10/13/2022 3:11:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_GetStatesWithCountry]
@CountryName nvarchar(255)
as
declare @CountryId int;
set @CountryId =(SELECT Id FROM tbl_Countries WHERE Name=@CountryName)
Select Id,Name from tbl_States where Country_Id = @CountryId order by Name asc
GO
