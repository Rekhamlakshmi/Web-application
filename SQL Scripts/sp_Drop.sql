USE [University]
GO

/****** Object:  StoredProcedure [dbo].[sp_Drop]    Script Date: 12/12/2012 22:16:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_Drop]
	-- Add the parameters for the stored procedure here
	@Studentid nvarchar(20),
	@ClassNumber int,
	@ReturnVal int= NULL OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    IF EXISTS(SELECT * FROM Student WHERE NetID=@Studentid)
	BEGIN
		IF EXISTS(SELECT * FROM Section WHERE ClassNumber=@ClassNumber)
		BEGIN
			IF EXISTS(SELECT * FROM StudentCourse WHERE NetID=@Studentid AND ClassNumber=@ClassNumber)
			BEGIN
				DELETE FROM StudentCourse WHERE NetID=@Studentid AND ClassNumber=@ClassNumber
				UPDATE Section SET AvailSeats=AvailSeats+1 WHERE ClassNumber=@ClassNumber
				SET @ReturnVal=1
			END
			ELSE
				SET @ReturnVal=0
		END
		ELSE
			SET @ReturnVal=2 ---Invalid Class Number
		END
	ELSE
		SET @ReturnVal=3  --Invalid Student ID
		
	RETURN @ReturnVal
END

GO


