USE [SchoolManagement]
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateClass]    Script Date: 10/13/2022 3:11:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_UpdateClass]
@ClassId int,
@ClassName nvarchar(50),
@FloorName nvarchar(50),
@ClassNumber nvarchar(10),
@ClassCapacity int,
@ClassTeacher nvarchar(100),
@ClassStartingOn Date,
@ClassEndingOn Date,
@ClassLocation nvarchar(100)
as
begin
declare @FloorNumber int;
set @FloorNumber = (select Id from tbl_Floor where FloorName=@FloorName)
update tbl_Classes_Floor set ClassName = @ClassName,FloorId = @FloorNumber,ClassNumber=@ClassNumber where Id = @ClassId

update tbl_Class_Map_Floor set ClassCapacity=@ClassCapacity,ClassTeacher=@ClassTeacher,ClassStartingOn=@ClassStartingOn,
ClassEndingOn=@ClassEndingOn,ClassLocation=@ClassLocation where ClassMapId = @ClassId
end
GO
