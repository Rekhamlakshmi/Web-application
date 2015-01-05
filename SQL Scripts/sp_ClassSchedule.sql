USE [University]
GO

/****** Object:  StoredProcedure [dbo].[sp_ClassSchedule]    Script Date: 12/12/2012 22:14:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_ClassSchedule] 
	-- Add the parameters for the stored procedure here
	@netid nvarchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT C.CNo,S.SectionNo as SecNo,S.ClassNumber as ClassNo,S.LectureDays,S.LecStartTime,S.LecEndTime,S.ClassRoom
	FROM Course C, Section S,StudentCourse sc
	WHERE C.CNo=S.CNo AND sc.NetID=@netid AND sc.ClassNumber=s.ClassNumber
END

GO


