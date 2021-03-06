/*
  MariaDB 실행 계획 구문
  EXPLAIN (SELECT * FROM 테이블명)
  1.select type : 실행 종류 표시, DEPENDENT SUBQUERY, DEPENDENT UNION 등 표시(의존성 문제로 인한 비효율 쿼리)
  2.table : 접근하는 테이블 명칭 또는 별칭 표시
  3.type : 최적화에서 중요 부분
    3.1 system : 테이블 내 레코드가 1개 이하,
    3.2 const, eq_ref : PK, UNIQUE INDEX를 사용해 레코드 접근, 가장 빠른 검색 방법
    3.3 ref : INDEX를 이용 동등 비교 연산자를 통해 레코드 접근
    3.4 fulltext : fulltext Index를 이용 모든 레코드 접근, 비교 연산으로 접근이 어려운 경우 사용됨
    3.5 range : Index를 이용 값 비교 연산(BETWEEN)등을 이용 레코드 접근
    3.6 index : Index 전체를 scan해야만 레코드 접근
    3.7 ALL : TABLE 전체 SCAN
  4.possible_keys : 레코드에 접근 할 수 있는 KEY 또는 INDEX 표시
  5.key : 레코드 접근에 어떠한 인덱스를 사용했는지 표시 
  6.key_len : 사용된 인덱스 중 몇 바이트를 참조 했는지 표시
*/
EXPLAIN(
SELECT *
FROM tbllottoarea AS A
INNER JOIN tbllottonumber AS B 
ON 
  A.WinNo = B.WinNo
);
