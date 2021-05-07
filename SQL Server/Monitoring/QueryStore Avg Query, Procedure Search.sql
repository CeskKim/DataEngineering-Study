-- 기간 내 평균 높은 쿼리 조회
-- 참고사이트 : https://docs.microsoft.com/ko-kr/sql/relational-databases/performance/monitoring-performance-by-using-the-query-store?view=sql-server-ver15
DECLARE
   @StartDT DATETIME2 = '2021-05-06 09:00:00'
,  @EndDT DATETIME2 = '2021-05-06 09:05:00'
SELECT 
   TOP 10 
    rs.avg_physical_io_reads		AS [평균 물리적 읽기]
,   qt.query_sql_text				AS [쿼리내용]
,   q.query_id						AS QueryId
,   rs.runtime_stats_id				AS RunTimeStatsId
,   rs.avg_cpu_time					AS [평균 Cpu 시간]
,   rs.avg_logical_io_reads         AS [평균 논리적 읽기]
,   rsi.start_time					AS [시작시간]
,   rsi.end_time					AS [종료시간]
,   rs.avg_rowcount					AS [평균 로우 반환 수]
,   rs.count_executions				AS [실행횟수]
FROM sys.query_store_query_text AS qt 
INNER JOIN sys.query_store_query AS q 
ON qt.query_text_id = q.query_text_id 
INNER JOIN sys.query_store_plan AS p 
ON q.query_id = p.query_id 
INNER JOIN sys.query_store_runtime_stats AS rs 
ON p.plan_id = rs.plan_id 
INNER JOIN sys.query_store_runtime_stats_interval AS rsi 
ON rsi.runtime_stats_interval_id = rs.runtime_stats_interval_id 
WHERE 
   rsi.start_time BETWEEN @StartDT AND @EndDT
ORDER BY 
   rs.avg_physical_io_reads DESC;



-- 기간 내 평균 실행 시간 높은 프로시저 조회
-- 참고사이트 : https://docs.microsoft.com/ko-kr/sql/relational-databases/system-dynamic-management-views/sys-dm-exec-procedure-stats-transact-sql?view=sql-server-ver15
SELECT 
   TOP 10 
   d.object_id
,   d.database_id
,   OBJECT_NAME(object_id, database_id) 'proc name'
,   d.last_execution_time               AS [프로시저 마지막 실행시간]
,   d.total_elapsed_time               AS [프로시저 실행 완료 총 경과시간(µs)]
,   d.total_elapsed_time/d.execution_count  AS [프로시저 평균 완료 경과시간(µs)]
FROM sys.dm_exec_procedure_stats AS d  
ORDER BY [total_worker_time] DESC;  