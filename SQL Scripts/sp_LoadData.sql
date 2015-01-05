USE [University]
GO

/****** Object:  StoredProcedure [dbo].[sp_LoadData]    Script Date: 12/12/2012 22:18:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_LoadData] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT DISTINCT CName FROM Course 
	SELECT DISTINCT CNo FROM Course
	
	SELECT P.FName,P.LName FROM Person P
	WHERE
	P.NetID IN (SELECT NetID FROM Instructor)
	
	SELECT DISTINCT LecStartTime FROM Section 
	SELECT DISTINCT LecEndTime FROM Section 
	
END

GO


