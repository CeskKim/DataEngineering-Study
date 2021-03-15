/*************************************************************************************************
 테이블명, 칼럼, 타입 정보
**************************************************************************************************/

SELECT   
	A.name
,	B.name
,	C.Name
FROM sys.tables AS A
INNER JOIN sys.columns AS B
ON   
   A.object_id = B.object_id
INNER JOIN sys.types AS C 
ON
   B.system_type_id = C.system_type_id
