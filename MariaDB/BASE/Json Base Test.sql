/*
  JSON 형식 테이블 생성
  Mariadb 10.2 부터 지원
*/
USE testdb;
CREATE TABLE IF NOT EXISTS jsontest
(
    ID TINYINT NOT NULL
 ,  DATA LONGTEXT NOT NULL
);

insert into jsontest(ID , DATA) values(1, json_object('age', 28, 'gender', 'man', '부서', '연구')); -- json 기본
insert into jsontest(ID , DATA) values(3, json_object('age', 30, 'gender', 'woman', '부서', '연구','자격증', json_array('CISA','PMP'))); -- json array 사용, 이전 내역과 파라미터 일치

-- json 검색
SELECT 
  ID
, json_extract(DATA, '$."부서"')
FROM jsontest;
