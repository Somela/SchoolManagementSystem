USE [SchoolManagement]
GO
/****** Object:  StoredProcedure [dbo].[sp_AddClass]    Script Date: 10/13/2022 3:11:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_AddClass]
@ClassName nvarchar(50),
@FloorName nvarchar(50),
@ClassNumber nvarchar(10),
@ClassCapacity int,
@ClassTeacher nvarchar(100),
@ClassStartingOn Date,
@ClassEndingOn Date,
@ClassLocation nvarchar(100)
as
declare @FloorNumber int;
set @FloorNumber = (select Id from tbl_Floor where FloorName=@FloorName)
declare @mapId int;
set @mapId = (select Id from tbl_Classes_Floor where FloorId = @FloorNumber and ClassNumber=@ClassNumber and ClassName=@ClassName)

insert into tbl_Class_Map_Floor values(@mapId,@ClassCapacity,@ClassTeacher,@ClassStartingOn,@ClassEndingOn,@ClassLocation)
GO
