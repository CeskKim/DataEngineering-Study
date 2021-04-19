## SSMS Read Replica접속절차
- 1.Coonect To Server 에서 Options >> 클릭
- 2.Additional Connection Parameters 탭 선택
- 3.ApplicationIntent=ReadOnly 입력
- 4.Connect
- 5.Read Only 확인
  SELECT DATABASEPROPERTYEX(DB_NAME(), 'Updateability');
- 6.Results에 READ_ONLY 확인. 
- 7.READ_WRITE일 경우, 연결된 커넥션 모두 끊고 1번부터 다시 시작
