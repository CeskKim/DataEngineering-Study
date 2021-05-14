-- SP Lock 권한 부여
USE
master
GO
GRANT ALTER SERVER  STATE TO Intern
GO
-- Kill 권한 부여
-- GRANT EXECUTE ON sys.SP_KILL_SESSION TO Intern;

-- 접속 계정 확인
 SELECT suser_name()

-- 참조 사이트
/***************************************************
https://docs.microsoft.com/ko-kr/sql/analytics-platform-system/grant-permissions?view=aps-pdw-2016-au7
**************************************************/