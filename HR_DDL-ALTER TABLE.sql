/*DDL : Alter Table : ������ ������ ���̺��� ����
        - ���� ���̺��� �÷��� �߰�, �÷��̸�����, �÷�����
        - �÷��� �ο��� ���� ������ ����, ����, ����
        
        
    */    

-- ���� ���̺� ����
-- ���̺� ���� : ���� ���̺� : department, ���� : dept01
    -- ���� �÷���, �ڷ���, ����Ÿ(���ڵ�) ����
    --���� ���̺��� ���� ������ ����Ǿ� ���� ����
    
create table dept01
as
select * from department;

create table emp01
as
select * from employee;

select * from dept01;

desc dept01;
desc department;

--���� ������ Ȯ���ϴ� ������ ����
show user;
select * from user_constraints      --���� ������ ������ ��� ���̺��� ���������� Ȯ����
-- where table_name = 'DEPARTMENT';

where table_name = 'DEPT01';


select * from user_constraints      --���� ������ ������ ��� ���̺��� ���������� Ȯ����
where table_name = 'EMPLOYEE';

--where table_name = 'EMP01';

