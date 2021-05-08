SELECT *
FROM dbo.TBLLockTest

/*************************************************************************************************
 트랜잭션 로그 조회
LOP_BEGIN_XACT	트랜잭션 시작
LOP_COMMIT_XACT	트랜잭션 커밋
LOP_INSERT_ROWS	테이블에 행 입력
LOP_MODIFY_ROW	테이블의 행 수정
LOP_DELETE_ROWS	테이블의 행 삭제
**************************************************************************************************/
-- 전체 트랙잰션 로그
SELECT *
FROM fn_dblog(NULL,NULL)

-- 특정 테이블 트랜잭션 로그
SELECT 
	*
FROM fn_dblog(NULL,NULL)
WHERE
	AllocUnitName = 'dbo.TBLLockTest'