USE [SchoolManagement]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetClass]    Script Date: 10/13/2022 3:11:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_GetClass]
as
select tcmf.Id, tf.FloorName,tcf.ClassName,tcf.ClassNumber,tcmf.ClassCapacity,tcmf.ClassTeacher,tcmf.ClassStartingOn,tcmf.ClassEndingOn,tcmf.ClassLocation from tbl_Classes_Floor tcf 
join tbl_Class_Map_Floor tcmf on tcf.Id=tcmf.ClassMapId
join tbl_Floor tf on tf.Floor=tcf.FloorId
GO
