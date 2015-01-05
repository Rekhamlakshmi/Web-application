USE [University]
GO

/****** Object:  StoredProcedure [dbo].[Students_List]    Script Date: 12/12/2012 22:21:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Rekha Muthulakshmi Nachadalingam
-- =============================================
CREATE PROCEDURE [dbo].[Students_List]
	-- Add the parameters for the stored procedure here
	@ClassNumber int,
	@ReturnVal INT =NULL OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    IF EXISTS(SELECT * FROM Section WHERE ClassNumber=@ClassNumber)
    BEGIN
		SELECT S.NetID,FName,LName 
		FROM Person P, StudentCourse S
		WHERE S.NetID=P.NetID AND S.ClassNumber=@ClassNumber
		set @ReturnVal=1
	END
	ELSE
	set @ReturnVal=2
	return @ReturnVal
END

GO


