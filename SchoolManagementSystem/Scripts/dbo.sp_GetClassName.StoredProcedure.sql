USE [SchoolManagement]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetClassName]    Script Date: 10/13/2022 3:11:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_GetClassName]
@floorName nvarchar(50)
as
declare @floorId int;
set @floorId = (select Id from tbl_Floor where FloorName=@floorName)
select ClassNumber, CAST(ClassNumber as VARCHAR(12)) +' - '+ ClassName as ClassName from tbl_Classes_Floor where FloorId = @floorId
GO
