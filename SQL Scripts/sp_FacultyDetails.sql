USE [University]
GO

/****** Object:  StoredProcedure [dbo].[sp_FacultyDetails]    Script Date: 12/12/2012 22:17:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_FacultyDetails]
	-- Add the parameters for the stored procedure here
	@lname nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT dbo.Instructor.NetID,dbo.Person.FName, dbo.Person.LName, dbo.Instructor.Rank,dbo.Instructor.Office, dbo.Instructor.Officehrs  
    FROM  dbo.Instructor,dbo.Person
    WHERE dbo.Instructor.NetID = dbo.Person.NetID 
    AND dbo.Person.LName like @lname+'%'
    
END


GO


