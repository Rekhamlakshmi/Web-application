USE [University]
GO

/****** Object:  StoredProcedure [dbo].[sp_PersonalInfo]    Script Date: 12/12/2012 22:19:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_PersonalInfo]
	-- Add the parameters for the stored procedure here
	@NetID nvarchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT s.SNo as StudentNo,P.FName,P.LName,P.Address,P.Phone,P.Sex,S.Degree
	FROM Person P,Student S
	WHERE P.NetID=@NetID AND S.NetID=P.NetID
END

GO


