/*************************************************************************************************
 SQL Server Memory ��ȯ
 1.SQL Server�� OS���� �޸� ��û X -> �޸� ��ȯ ���� �ʰ� ����
 2.�۾� �����ڸ� ���� SQL Server�� Memory 90% �̻� �߰�
 3.MIN/MAX Server Memory�� ���� Ȯ��
**************************************************************************************************/
-- SQL Server MIN/ MAX SERVER Memory
-- Max Memory : 2147483647 
-- -> OS���� �޸𸮸� ��û���� ������ ��� �޸𸮸� �����ϰڴٶ�� �ǹ�
SELECT
	Value
,	minimum
,	maximum  
FROM sys.configurations
WHERE
	NAME IN('min server memory (MB)','max server memory (MB)')

/*************************************************************************************************
 ��ǻ�� ��翡 ���� Max Memory ����
**************************************************************************************************/
-- 8GB�̹Ƿ� 6400���� ����

--Show advanced options Ȱ��ȭ 
EXEC SP_CONFIGURE 'SHOW ADVANCED OPTIONS', 1 
--��������� �ʰ� ��� ���� 
RECONFIGURE WITH OVERRIDE 
GO 
--�޸����� Ȯ�� 
EXEC SP_CONFIGURE 
GO 
 
--Min server memory �� 6400 (MB) �� ����, ���̺��� ��� �ܺο� ���� ������ Max server memory�� ���� ����
EXEC SP_CONFIGURE 'MIN SERVER MEMORY (MB)', 6400
RECONFIGURE WITH OVERRIDE 
GO 
 
--Max server memory �� 6400 (MB) �� ���� 
EXEC SP_CONFIGURE 'MAX SERVER MEMORY (MB)', 6400 
RECONFIGURE WITH OVERRIDE 
GO 
 
--Show advanced options ��Ȱ��ȭ 
EXEC SP_CONFIGURE 'SHOW ADVANCED OPTIONS', 0 
RECONFIGURE WITH OVERRIDE 
GO 
-- �޸����� Ȯ�� 
EXEC SP_CONFIGURE 
GO

/*************************************************************************************************
 ���� ����Ʈ
 https://ryean.tistory.com/30
 https://m.blog.naver.com/PostView.nhn?blogId=jevida&logNo=140190158874&proxyReferer=https:%2F%2Fwww.google.com%2F
**************************************************************************************************/
