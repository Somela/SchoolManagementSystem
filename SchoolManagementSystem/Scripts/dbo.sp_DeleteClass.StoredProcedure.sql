USE [SchoolManagement]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteClass]    Script Date: 10/13/2022 3:11:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_DeleteClass]
@MapId int
as
delete from tbl_Class_Map_Floor where ClassMapId=@MapId;
GO
