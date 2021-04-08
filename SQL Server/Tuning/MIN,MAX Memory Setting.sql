/*************************************************************************************************
 SQL Server Memory 반환
 1.SQL Server는 OS에서 메모리 요청 X -> 메모리 반환 하지 않고 점유
 2.작업 관리자를 통해 SQL Server가 Memory 90% 이상 발견
 3.MIN/MAX Server Memory를 통해 확인
**************************************************************************************************/
-- SQL Server MIN/ MAX SERVER Memory
-- Max Memory : 2147483647 
-- -> OS에서 메모리를 요청하지 않으면 계속 메모리를 점유하겠다라는 의미
SELECT
	Value
,	minimum
,	maximum  
FROM sys.configurations
WHERE
	NAME IN('min server memory (MB)','max server memory (MB)')

/*************************************************************************************************
 컴퓨터 사양에 따라 Max Memory 설정
**************************************************************************************************/
-- 8GB이므로 6400으로 설정

--Show advanced options 활성화 
EXEC SP_CONFIGURE 'SHOW ADVANCED OPTIONS', 1 
--재시작하지 않고 즉시 적용 
RECONFIGURE WITH OVERRIDE 
GO 
--메모리정보 확인 
EXEC SP_CONFIGURE 
GO 
 
--Min server memory 를 6400 (MB) 로 설정, 라이브의 경우 외부와 접촉 문제로 Max server memory와 돟일 구성
EXEC SP_CONFIGURE 'MIN SERVER MEMORY (MB)', 6400
RECONFIGURE WITH OVERRIDE 
GO 
 
--Max server memory 를 6400 (MB) 로 설정 
EXEC SP_CONFIGURE 'MAX SERVER MEMORY (MB)', 6400 
RECONFIGURE WITH OVERRIDE 
GO 
 
--Show advanced options 비활성화 
EXEC SP_CONFIGURE 'SHOW ADVANCED OPTIONS', 0 
RECONFIGURE WITH OVERRIDE 
GO 
-- 메모리정보 확인 
EXEC SP_CONFIGURE 
GO

/*************************************************************************************************
 참조 사이트
 https://ryean.tistory.com/30
 https://m.blog.naver.com/PostView.nhn?blogId=jevida&logNo=140190158874&proxyReferer=https:%2F%2Fwww.google.com%2F
**************************************************************************************************/
