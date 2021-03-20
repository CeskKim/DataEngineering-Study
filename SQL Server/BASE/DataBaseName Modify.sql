/*************************************************************************************************
 �����ͺ��̽� ��Ī ����
**************************************************************************************************/
ALTER DATABASE inMemoryDB SET SINGLE_USER
GO
ALTER DATABASE inMemoryDB MODIFY NAME = InMemoryOLTPDB
GO
ALTER DATABASE InMemoryOLTPDB SET OFFLINE
GO

/*************************************************************************************************
 DB ���� ����
**************************************************************************************************/
ALTER DATABASE inMemoryDB MODIFY FILE(NAME = inMemoryDB, NEWNAME = InMemoryOLTPDB)
GO
ALTER DATABASE inMemoryDB MODIFY FILE(NAME = inMemoryDB_log, NEWNAME = InMemoryOLTPDB_log)
GO

/*************************************************************************************************
 ���� DB���ϸ� -> ���丮 �̵��ؼ� ��Ī ����
**************************************************************************************************/
ALTER DATABASE inMemoryDB MODIFY FILE(NAME = InMemoryOLTPDB, FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\InMemoryOLTPDB.mdf')
GO
ALTER DATABASE inMemoryDB MODIFY FILE(NAME = InMemoryOLTPDB, FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\InMemoryOLTPDB_log.ldf')
GO

/*************************************************************************************************
 DB �¶���, ��Ƽ���� ����
**************************************************************************************************/
ALTER DATABASE InMemoryOLTPDB SET ONLINE
GO
ALTER DATABASE InMemoryOLTPDB SET MULTI_USER
