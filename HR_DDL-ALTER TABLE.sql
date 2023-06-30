/*DDL : Alter Table : 기존의 생성된 테이블을 수정
        - 기존 테이블의 컬럼을 추가, 컬럼이름변경, 컬럼삭제
        - 컬럼의 부여된 제약 조건을 생성, 수정, 삭제
        
        
    */    

-- 샘플 테이블 생성
-- 테이블 복사 : 원본 테이블 : department, 복사 : dept01
    -- 원본 컬럼명, 자료형, 데이타(레코드) 복사
    --원본 테이블의 제약 조건은 복사되어 오지 않음
    
create table dept01
as
select * from department;

create table emp01
as
select * from employee;

select * from dept01;

desc dept01;
desc department;

--제약 조건을 확인하는 데이터 사전
show user;
select * from user_constraints      --현재 접속한 계정의 모든 테이블의 제약조건을 확인함
-- where table_name = 'DEPARTMENT';

where table_name = 'DEPT01';


select * from user_constraints      --현재 접속한 계정의 모든 테이블의 제약조건을 확인함
where table_name = 'EMPLOYEE';

--where table_name = 'EMP01';

