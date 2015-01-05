USE [University]
GO

/****** Object:  StoredProcedure [dbo].[sp_StudentProfile]    Script Date: 12/12/2012 22:19:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_StudentProfile] 
	-- Add the parameters for the stored procedure here
	@NetID nvarchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT s.CNo,c.CName,sc.ClassNumber as ClassNo,sc.Grade
	FROM
	StudentCourse sc,Section s,Course c
	WHERE
	sc.ClassNumber=s.ClassNumber AND s.CNo=c.CNo AND sc.NetID=@NetID
END

GO


