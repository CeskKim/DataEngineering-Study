/*************************************************************************************************
 데이터베이스 명칭 변경
**************************************************************************************************/
ALTER DATABASE inMemoryDB SET SINGLE_USER
GO
ALTER DATABASE inMemoryDB MODIFY NAME = InMemoryOLTPDB
GO
ALTER DATABASE InMemoryOLTPDB SET OFFLINE
GO

/*************************************************************************************************
 DB 논리명 변경
**************************************************************************************************/
ALTER DATABASE inMemoryDB MODIFY FILE(NAME = inMemoryDB, NEWNAME = InMemoryOLTPDB)
GO
ALTER DATABASE inMemoryDB MODIFY FILE(NAME = inMemoryDB_log, NEWNAME = InMemoryOLTPDB_log)
GO

/*************************************************************************************************
 변경 DB파일명 -> 디렉토리 이동해서 명칭 변경
**************************************************************************************************/
ALTER DATABASE inMemoryDB MODIFY FILE(NAME = InMemoryOLTPDB, FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\InMemoryOLTPDB.mdf')
GO
ALTER DATABASE inMemoryDB MODIFY FILE(NAME = InMemoryOLTPDB, FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\InMemoryOLTPDB_log.ldf')
GO

/*************************************************************************************************
 DB 온라인, 멀티유저 변경
**************************************************************************************************/
ALTER DATABASE InMemoryOLTPDB SET ONLINE
GO
ALTER DATABASE InMemoryOLTPDB SET MULTI_USER
