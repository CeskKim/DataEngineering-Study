SELECT *
  FROM tbltesttable;
/*************************************************************************************************
 테이블 칼럼 추가
 1.테이블 가장 첫 번째 칼럼 추가 
 2.테이블 지정 칼럼 뒤 칼럼 추가
**************************************************************************************************/
ALTER TABLE tbltesttable ADD COLUMN TID NVARCHAR(20) FIRST;
SELECT *
  FROM tbltesttable;
  
ALTER TABLE tbltesttable ADD COLUMN TDATE NCHAR(8) AFTER TSeq;
SELECT *
  FROM tbltesttable;
  
/*************************************************************************************************
 인덱스 생성
**************************************************************************************************/
SHOW INDEX FROM tbltesttable;
CREATE INDEX IDX_tbltesttable ON tbltesttable(TDATE);
CREATE INDEX IDX_tbltesttableMul ON tbltesttable(TSeq, TDATE);

SELECT *
  FROM information_schema.ENGINES 
 WHERE SUPPORT = 'DEFAULT'
