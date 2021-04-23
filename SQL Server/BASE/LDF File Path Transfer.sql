-- MDF,LDF등의 파일 물리적 위치 확인
SELECT
	NAME
,	PHYSICAL_NAME
FROM sys.database_files

-- LDF 파일 이동
ALTER DATABASE TransferTest MODIFY FILE(NAME = TransferTest_Log, FILENAME = 'C:\DataBaseFile\Log\TransferTest_log.ldf');

-- 변경 파일 데이터베이스 OFFLINE 모드
ALTER DATABASE TransferTest SET OFFLINE;
GO

-- 파일 위치 변경 데이터베이스 ONLINE 모드
ALTER DATABASE TransferTest SET ONLINE;

