/*
  Table Locks Monitoring
  Table_locks_immediate : 즉시 획득 테이블 락 횟수(다른 잠금이 풀리기를 기다리지 않고 바로 잠금 획득)
  Table_locks_waited : 테이블 락을 즉식 획득 하지 못하고 대기한 횟수(다른 잠금이 이미 해당 테이블을 사용하고 있어 대기)
  
  <참고>
  MyISAM, Memory Storage Engine은 Table Level Lock만 지원
  InnoDB Row Level Lock지원
  Mysql Engine의 경우 Table Lock 획득을 요청 하지만 InnoDB에서는 Row Lock으로 처리에서 Mysql Engine에는 Row Lock으로 진행을
  보고하지 않기 때문에 Mysql Engine에서는 Table Lock으로 처리 
  
  <결론>
  InnoDB를 사용하는 경우 Table_locks_immediate 수치가 테이블락을 획득 한 절대적 수치가 아닌점을 명시
  
 */
show status where variable_name like 'table_locks%'

/*
  Lock Waited비율
  Table_locks_immediate / (Table_locks_waited + Table_locks)immediate) * 100
*/

/*
 [참고자료]
 https://dev.mysql.com/doc/refman/8.0/en/server-status-variables.html#statvar_Table_locks_immediate
 https://dev.mysql.com/doc/refman/8.0/en/server-status-variables.html#statvar_Table_locks_waited
 https://sungwookkang.com/1228?category=618835 [Data Science Lab]
*/
