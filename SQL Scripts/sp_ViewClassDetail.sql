USE [University]
GO

/****** Object:  StoredProcedure [dbo].[sp_ViewClassDetail]    Script Date: 12/12/2012 22:21:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ViewClassDetail]
	-- Add the parameters for the stored procedure here
	@ClassNumber int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT CNo,SectionNo,Semester,Year,FacultyNetID,LectureDays,LecStartTime,LecEndTime,TotalSeats,AvailSeats
	FROM Section 
	WHERE ClassNumber=@ClassNumber
END

GO


