-- MDF,LDF���� ���� ������ ��ġ Ȯ��
SELECT
	NAME
,	PHYSICAL_NAME
FROM sys.database_files

-- LDF ���� �̵�
ALTER DATABASE TransferTest MODIFY FILE(NAME = TransferTest_Log, FILENAME = 'C:\DataBaseFile\Log\TransferTest_log.ldf');

-- ���� ���� �����ͺ��̽� OFFLINE ���
ALTER DATABASE TransferTest SET OFFLINE;
GO

-- ���� ��ġ ���� �����ͺ��̽� ONLINE ���
ALTER DATABASE TransferTest SET ONLINE;

