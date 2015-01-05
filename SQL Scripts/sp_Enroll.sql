USE [University]
GO

/****** Object:  StoredProcedure [dbo].[sp_Enroll]    Script Date: 12/12/2012 22:17:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Enroll]
	-- Add the parameters for the stored procedure here
	@Studentid nvarchar(20),
	@ClassNumber int,
	@ReturnVal INT =NULL OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @avail INT
	
	IF EXISTS(SELECT * FROM Student WHERE NetID=@Studentid)
	BEGIN
		IF EXISTS(SELECT * FROM Section WHERE ClassNumber=@ClassNumber)
			BEGIN
				SELECT @avail=AvailSeats FROM Section WHERE ClassNumber=@ClassNumber	
				IF NOT EXISTS(SELECT * FROM StudentCourse WHERE ClassNumber=@ClassNumber AND NetID=@Studentid)  --Successfully Enrolled
					BEGIN
						IF @avail<=0           --No Seats Available
							SET @ReturnVal= 0 
						ELSE
						BEGIN
							INSERT INTO StudentCourse VALUES(@Studentid,@ClassNumber,NULL)
							UPDATE Section SET AvailSeats=AvailSeats-1 WHERE ClassNumber=@ClassNumber
							set @ReturnVal=1
						END
					END
				ELSE
					set @ReturnVal=2        --Student is already enrolled
			END
		ELSE
			set @ReturnVal=3   ---Invalid Class Number
		END
	ELSE
			SET @ReturnVal=4 ---Invalid Student ID
	RETURN @ReturnVal
	

END

GO


