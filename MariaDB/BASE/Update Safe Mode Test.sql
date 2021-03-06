USE testdb
/*
  SAFE UPDATE MODE
  1.update or delete 작업시 key칼럼에 대한 where 조건이 없으면 아래와 같은 오류발생
  You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column
*/
SET SQL_SAFE_UPDATES =1;
CREATE TABLE IF NOT EXISTS tblsafenokey
(
    SafeSeq TINYINT NOT NULL
 ,  SafeName VARCHAR(30) NOT NULL
  
);
/*
  테이블 정보
  1.DESC : Describe요약
*/
DESC tblsafenokey;

/*
  INSERT INTO(Coulmn) VALUES(Data)
  INSERT INTO ~ SELECT Coulmn UNION ALL
*/
INSERT INTO tblsafenokey(SafeSeq,SafeName)
VALUES(1,'S1');
INSERT INTO tblsafenokey(SafeSeq,SafeName)
VALUES(1,'S2');
INSERT INTO tblsafenokey
SELECT 3, 'S3' UNION ALL
SELECT 4, 'S4' UNION ALL
SELECT 5, 'S5'; 


/*
  UPDATE 
  SAFE MODE로 인해 해당 테이블은 key가 지정되어 있지 않아 오류 발생
*/
UPDATE tblsafenokey
SET
  SafeName = 'S6'
WHERE
  SafeSeq IN(3,5);
  
CREATE TABLE IF NOT EXISTS tblsafekey
(
    SafeSeq TINYINT NOT NULL
 ,  SafeName VARCHAR(30) NOT NULL
 ,  CONSTRAINT PK_tblsafekey PRIMARY KEY(SafeSeq)
  
);

INSERT INTO tblsafekey
SELECT 3, 'S3' UNION ALL
SELECT 4, 'S4' UNION ALL
SELECT 5, 'S5';   

/*
  UPDATE 
  SAFE MODE이지만 Key지정으로 인해 오류 미발생
*/
UPDATE tblsafekey
SET
  SafeName = 'S6'
WHERE
  SafeSeq IN(3,5);

/*
  SAFE MODE 해제
*/
SET SQL_SAFE_UPDATES =0; 