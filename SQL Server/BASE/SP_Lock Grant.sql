-- SP Lock ���� �ο�
USE
master
GO
GRANT ALTER SERVER  STATE TO Intern
GO
-- Kill ���� �ο�
-- GRANT EXECUTE ON sys.SP_KILL_SESSION TO Intern;

-- ���� ���� Ȯ��
 SELECT suser_name()

-- ���� ����Ʈ
/***************************************************
https://docs.microsoft.com/ko-kr/sql/analytics-platform-system/grant-permissions?view=aps-pdw-2016-au7
**************************************************/