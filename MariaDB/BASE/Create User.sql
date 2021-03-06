USE mysql;
/*
  계정 조회
*/
SELECT 
  host
, USER
, PASSWORD
FROM user;

/*
  계정생성
  Local : @localhost
  
*/

CREATE USER 'TUser'@'localhost' /*접속위치*/ identified by '비밀번호';

/*
  권한생성
  1.SELECT,UPDATE,DELETE : 기능별 권한
  2.all privileges : 모든권한
*/
GRANT SELECT, UPDATE, DELETE ON TestDB.*/*적용 DB*/ TO 'TUser' /*계정아이디*/@localhost; /*접속위치*/

/*
  권한확인
*/
SHOW GRANTS FOR 'TUser'/*계정아이디*/ @localhost; /*접속위치*/

/*
  계정삭제
*/
DROP USER 'jb' /*계정아이디*/ @localhost /*접속위치*/

