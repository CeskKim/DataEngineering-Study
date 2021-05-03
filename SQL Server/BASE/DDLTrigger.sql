/*************************************************************************************************
 DDL 추적  테이블
**************************************************************************************************/
IF NOT EXISTS
(
	SELECT 1 
	FROM sysobjects 
	WHERE
		NAME = N'DDLEvents'
	AND
		xtype = 'P'
)
BEGIN
	CREATE TABLE dbo.DDLEvents(
	
		EventDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
	,	EventType NVARCHAR(64)
	,	EventDDL NVARCHAR(MAX)
	,	EventXML XML
	,	DatabaseName NVARCHAR(255)
	,	SchemaName NVARCHAR(255)
	,	ObjectName NVARCHAR(255)
	,	HostName VARCHAR(64)
	,	IPAddress VARCHAR(32)
	,	ProgramName NVARCHAR(255)
	,	LoginName NVARCHAR(255)
	
	);
END
GO
/*************************************************************************************************
 DDL Trigger 생성
**************************************************************************************************/

	CREATE TRIGGER DDLTrigger_Sample
	ON DATABASE

	FOR 
	CREATE_PROCEDURE 
,	ALTER_PROCEDURE
,	DROP_PROCEDURE
,	CREATE_SCHEMA
,	ALTER_SCHEMA
,	RENAME
,	CREATE_TABLE
,	ALTER_TABLE
,	DROP_TABLE

AS
	SET NOCOUNT ON;
 
DECLARE
	@EventData XML = EVENTDATA();
 
DECLARE
	@ip VARCHAR(32) =

(

	SELECT client_net_address	
	FROM sys.dm_exec_connections	
	WHERE session_id = @@SPID

);

INSERT dbo.DDLEvents
(

	EventType
,	EventDDL
,	EventXML
,	DatabaseName
,	SchemaName
,	ObjectName
,	HostName
,	IPAddress
,	ProgramName
,	LoginName

)

SELECT
	@EventData.value('(/EVENT_INSTANCE/EventType)[1]', 'NVARCHAR(100)')
,	@EventData.value('(/EVENT_INSTANCE/TSQLCommand)[1]', 'NVARCHAR(MAX)')
,	@EventData
,	DB_NAME()
,	@EventData.value('(/EVENT_INSTANCE/SchemaName)[1]', 'NVARCHAR(255)')
,	@EventData.value('(/EVENT_INSTANCE/ObjectName)[1]', 'NVARCHAR(255)')
,	HOST_NAME()
,	@ip
,	PROGRAM_NAME()
,	SUSER_SNAME();

/*************************************************************************************************
 DDL Trigger 확인
**************************************************************************************************/
SET CONCAT_NULL_YIELDS_NULL ON --NULL 자체를 빈 값 처리 기능 EX SELECT 'ABC' + NULLL -> ABC

CREATE TABLE dbo.TriggerSample
(
	T1 INT NULL
,	TName NVARCHAR(50) NULL
)
INSERT INTO dbo.TriggerSample
SELECT 1, N'Trigger Success'

