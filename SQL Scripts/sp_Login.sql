USE [University]
GO

/****** Object:  StoredProcedure [dbo].[sp_login]    Script Date: 12/12/2012 22:18:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_login] 
	-- Add the parameters for the stored procedure here
	@UserName nvarchar(20),
	@Password nvarchar(30) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	
			SELECT * FROM Users WHERE NetID=@UserName
			
	 
END


GO


