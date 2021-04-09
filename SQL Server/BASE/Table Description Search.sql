/*************************************************************************************************
 TABLE Desscription 확인
**************************************************************************************************/
SELECT D.COLORDER                 AS COLUMN_IDX				
     , A.NAME                     AS TABLE_NAME				
     , C.VALUE                    AS TABLE_DESCRIPTION		
     , D.NAME                     AS COLUMN_NAME				
     , E.VALUE                    AS COLUMN_DESCRIPTION		
     , F.DATA_TYPE                AS TYPE                   
     , F.CHARACTER_OCTET_LENGTH   AS LENGTH				
     , F.IS_NULLABLE              AS IS_NULLABLE              
     , F.COLLATION_NAME           AS COLLATION_NAME        
  FROM SYSOBJECTS A WITH (NOLOCK)
  INNER JOIN SYSUSERS B WITH (NOLOCK)        ON A.UID = B.UID
  INNER JOIN SYSCOLUMNS D WITH (NOLOCK)        ON D.ID = A.ID
  INNER JOIN INFORMATION_SCHEMA.COLUMNS F WITH (NOLOCK)
     ON A.NAME = F.TABLE_NAME
    AND D.NAME = F.COLUMN_NAME
   LEFT OUTER JOIN SYS.EXTENDED_PROPERTIES C WITH (NOLOCK)
     ON C.MAJOR_ID = A.ID
    AND C.MINOR_ID = 0
    AND C.NAME = 'MS_Description'
   LEFT OUTER JOIN SYS.EXTENDED_PROPERTIES E WITH (NOLOCK)
     ON E.MAJOR_ID = D.ID
    AND E.MINOR_ID = D.COLID
    AND E.NAME = 'MS_Description'  
  WHERE 1=1
    AND A.TYPE = 'U'
    AND A.NAME = 테이블명
  ORDER BY D.COLORDER