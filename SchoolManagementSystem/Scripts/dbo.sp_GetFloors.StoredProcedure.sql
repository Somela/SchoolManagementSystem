USE [SchoolManagement]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetFloors]    Script Date: 10/13/2022 3:11:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_GetFloors]
as
select Floor,FloorName from tbl_Floor
GO
