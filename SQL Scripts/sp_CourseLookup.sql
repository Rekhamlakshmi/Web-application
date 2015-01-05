USE [University]
GO

/****** Object:  StoredProcedure [dbo].[sp_CourseLookup]    Script Date: 12/12/2012 22:15:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Rekha Muthulakshmi Nachadalingam
-- Create date: 11/19/2012
-- Description:	Displays the sections offered in a semester based on the search parameters
-- =============================================
CREATE PROCEDURE [dbo].[sp_CourseLookup]
	-- Add the parameters for the stored procedure here
	@CName NVARCHAR(70)=NULL,
	@CNo nvarchar(50)=NULL,
	@Semester nvarchar(20)=NULL,
	@Year int=NULL,
	@Instructor nvarchar(50)=NULL,
	@LecStartTime nvarchar(20)=NULL,
	@LecEndTime nvarchar(20)=NULL
	 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT S.ClassNumber,S.CNo,C.CName,S.SectionNo,S.Semester,S.Year,S.LectureDays,S.LecStartTime,S.LecEndTime,P.FName,P.LName
	FROM Course C, Section S,Person P
	WHERE 
	S.CNo=C.CNo AND S.FacultyNetID=P.NetID
	AND
	(S.CNo=@CNo OR @CNo IS NULL)
	AND
	(C.CName=@CName OR @CName IS NULL)
	AND
	(S.Semester=@Semester OR @Semester IS NULL)
	AND
	(S.Year=@Year OR @Year IS NULL)
	AND
	(P.LName=@Instructor OR @Instructor IS NULL)
	AND 
	(S.LecStartTime=@LecStartTime OR @LecStartTime IS NULL)
	AND
	(S.LecEndTime=@LecEndTime OR @LecEndTime IS NULL)
    
END


GO


