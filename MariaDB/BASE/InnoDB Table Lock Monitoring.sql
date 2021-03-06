/*
  InnoDB Table Lock Monitoring
  
  Innodb_row_lock_current_waits : 현재 row 락을 획득하기 위해 대기중인 수
  Innodb_row_lock_time : row lock 획득에 소비된 총 시간 (milliseconds)
  Innodb_row_lock_time_avg : row lock 획득에 소비된 평균 시간 (milliseconds)
  Innodb_row_lock_time_max : row lock 획득에 소비된 최대 시간 (milliseconds)
  Innodb_row_lock_waits : InnoDB 테이블에서 row lock을 기다려야 하는 횟수

  [참고자료]
  https://sungwookkang.com/1232?category=618835
  
*/
Show status where variable_name like 'Innodb_row_lock%';
