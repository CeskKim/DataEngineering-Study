use test
--테이블 검색
SELECT *
  FROM information_schema.tables
 WHERE TABLE_SCHEMA = 'test';
 
/*************************************************************************************************
 테이블 생성
**************************************************************************************************/
CREATE TABLE IF NOT EXISTS TBLTestTable
(
  TSeq  INT           ,
  TNo   NVARCHAR(50)  ,
  
  CONSTRAINT PK_TBLTestTable PRIMARY KEY(TSeq)
);

/*************************************************************************************************
 데이터 삽입
**************************************************************************************************/
INSERT INTO TBLTestTable(TSeq, TNo)
SELECT 1, '20201003-001' FROM TBLTestTable WHERE NOT EXISTS(SELECT 1 FROM TBLTestTable WHERE TSeq = 1);

SELECT * FROM TBLTestTable


