SELECT *
FROM dbo.TBLLockTest

/*************************************************************************************************
 Ʈ����� �α� ��ȸ
LOP_BEGIN_XACT	Ʈ����� ����
LOP_COMMIT_XACT	Ʈ����� Ŀ��
LOP_INSERT_ROWS	���̺� �� �Է�
LOP_MODIFY_ROW	���̺��� �� ����
LOP_DELETE_ROWS	���̺��� �� ����
**************************************************************************************************/
-- ��ü Ʈ����� �α�
SELECT *
FROM fn_dblog(NULL,NULL)

-- Ư�� ���̺� Ʈ����� �α�
SELECT 
	*
FROM fn_dblog(NULL,NULL)
WHERE
	AllocUnitName = 'dbo.TBLLockTest'