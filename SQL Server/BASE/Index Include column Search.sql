/*************************************************************************************************
 Index Include column Á¶È¸
**************************************************************************************************/
IF NOT EXISTS
(
	SELECT 1
	FROM sysobjects 
	WHERE
		xtype = 'U'
	AND
		NAME = N'TBLIndexInclude'		
)
BEGIN
	
	CREATE TABLE dbo.TBLIndexInclude
	(
		PkIdx INT NOT NULL
	,	Include_01 INT NULL
	,	Include_02 INT NULL
		
		CONSTRAINT PK_TBLIndexInclude PRIMARY KEY(PkIdx ASC)
	)

	IF NOT EXISTS
	(
		SELECT 1
		FROM sys.indexes
		WHERE
			NAME = N'IX_TBLIndexInclude_Include'
	)
	BEGIN
		CREATE NONCLUSTERED INDEX IX_TBLIndexInclude_Include ON dbo.TBLIndexInclude(Include_01) INCLUDE(Include_02)
	END
END

DECLARE 
	@IndexName NVARCHAR(50)

SELECT 
	@IndexName = N'IX_TBLIndexInclude_Include'
SELECT 
	IndexName = i.Name
,	ColName = c.Name 
FROM sys.indexes i 
INNER JOIN sys.index_columns ic 
	ON ic.object_id = i.object_id 
AND ic.index_id = i.index_id 
INNER JOIN sys.columns c 
	ON c.object_id = ic.object_id 
AND c.column_id = ic.column_id 
WHERE 
	ic.is_included_column = 1 
AND
	i.name = @IndexName
ORDER BY 
	i.Name

