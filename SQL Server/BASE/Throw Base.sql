/*************************************************************************************************
  THORW SP
**************************************************************************************************/
CREATE OR ALTER PROC dbo._SPThorw
	@Name NVARCHAR(100)
AS
	BEGIN TRY
		
		INSERT dbo.TBLBase
		(
			UserSeq
		,	UserID
		,	UserName
		)
		SELECT 
			@Name
		,	N'Test'
		,	N'Test'
	END TRY
	BEGIN CATCH
		PRINT N'예외처리';
		THROW;
	END CATCH

GO	
EXEC dbo._SPThorw N'테스트'