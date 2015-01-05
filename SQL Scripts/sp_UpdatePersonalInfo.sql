USE [University]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdatePersonalInfo]    Script Date: 12/12/2012 22:20:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_UpdatePersonalInfo]
	-- Add the parameters for the stored procedure here
	@Studentid nvarchar(20),
	@Fname nvarchar(50),
	@Lname nvarchar(50),
	@Address nvarchar(150),
	@Phone bigint,
	@Sex nchar(1),
	@Degree nvarchar(70)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Person 
	SET FName=@Fname,LName=@Lname,Address=@Address,Phone=@Phone,Sex=@Sex
	WHERE NetID=@Studentid
	
	UPDATE Student
	SET Degree=@Degree 
	WHERE NetID=@Studentid
	
	--SELECT s.SNo as StudentNo,P.FName,P.LName,P.Address,P.Phone,P.Sex,S.Degree
	--FROM Person P,Student S
	--WHERE P.NetID=@Studentid AND S.NetID=P.NetID
END

GO


