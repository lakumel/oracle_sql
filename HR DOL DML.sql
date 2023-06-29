

/*DDL, DML, ���� ����*/

/*
    SQL(Structured Query Language):����ť��, ����, ����ȭ�� ���� ���

select �÷���
from ���̺��[��]
where ����
group by �÷�[�׷���]
having ����[group by ����� ����]
order by �����÷�

SQL : ������ ������ �з�

DDL : (Data Definition Language) : ��ü(���̺�, �Լ�, ��, Ʈ����, �������ν���, �ε���, ��Ÿ���)�� �����ϴ� ���(����)
                                 : ��Ű��(Ʋ,��ü)�� �����ϴ� ���
        --create(����), alter(����), drop(����)
        
DML : (Data Manipulation Language) : ���̺��� ���ڵ带 ���۾��<==Ʈ������� �߻� ��Ŵ(commit, rollback)
   --����Ŭ������ Ʈ����� ������ �ڵ����� �۵���.
   --Ʈ������� �Ϸ� �ؾ� �Ѵ�.(commit, rollback)  
   <==Ʈ������� �Ϸ����� ������ LOCK �� �ɷ��� �ٸ� ����ڰ� ������ �ȵ�
    -insert(�Է�), update(����), delete(����)
    
DCL : (Data Controller Language) : ������ ���� ���, ������ ��ȯ�� �ο�, ����, ����
    --grant(������ �ο�), revoke(������ ���)
    
=======================================================

DQL : (Data Query Language) : ������ ���� ���(���), 
        -Select
TCL : (Transaction Control Language):Ʈ����� ���� ���, <== DML���� �߻���
    --begin transaction : Ʈ����� �ڵ����� ����(insert, update, delect)

    --commit [transction] : Ʈ������� �Ϸ�, ���� DataBase �� ���������� ����
    -- rollback [transction] : Ʈ������� ���۽������� �ǵ���.

    --savepoint : Ʈ������� �ӽ� ���� ���� ����

*/


--���̺� ���� : create table

create table dept (
    dno number(2) not null , 
    dname varchar2(50) not null,
    loc varchar2(13) null
);


desc dept; --���̺� ���� Ȯ��

--���̺� �� �ֱ�
--begin transaction;
insert into dept (dno , dname , loc )
values(10, '�λ��', '����');

rollback;
commit;


select * from dept;

/*

Ʈ�����(Transaction : �۾�(��)�� ó���ϴ� �ּ� ����
    -- DBMS : ��Ʈ��ũ�� ���ؼ� �������� ����ڰ� ���ÿ� �۾�
    -- �۾��� �Ҷ� LOCK�� �ɰ� �Ϸ�Ǹ� LOCK�� Ǯ���ش�.
    --DML ������ �۵�,
    -- Ʈ������� �����ϱ� �������� Lock�� �ɷ��� �ٸ� ������� ������ ����
    -- commit : RAM�� ������ ������ DB�� ���������� ����
    -- rollback : Ʈ����� ���� �������� �ǵ���.
    -- commit �������� RAM ������ ����Ǿ� ����.
    
    -- Ʈ������� 4���� Ư¡
         --ALL or NOTHING : �Ǹ� ���� �ǰ� �ϰų� �ƴϸ� ������ �ǵ����ų�
    
            -- ���ڼ�(Atomicity) : ����ó���ϴ� �ּ� ����
            -- �ϰ���(Consistency) : Ʈ����� ���� ó���� ����� �ϰ����� ������ �ִ�.
            -- ������(Isolation) : �ϳ��� Ʈ������� �ٸ� Ʈ����ǰ� �ݸ�, LOCK
            -- ���Ӽ�(durability) : commit Ʈ������� DB�� ������ ����ȴ�.
            -- log�� ��ϵ�, "Ʈ����� �α�"    <==��������� �ƴ϶� ������������ ����
            
    
    
         
        A�� B���� 100�� �Ա� �� : �� update ������ �ϳ��� Ʈ��������� �۵��Ǿ����.
        
        1.update ���� ����ؼ� A ���� 100���� ���
        
        2.update ���� ����ؼ� B ���� 100���� �Ա�

*/

--insert ��
desc dept;

insert into dept (loc,dname, dno)
values('�λ�', '������', 20);

--�÷��� ���� �Ǹ� ��� �÷��� ���� �Ҵ�
insert into dept
values (30,'������', null);

select * from dept;

insert into dept(dno, dname)
values(40, '����');

commit;

select * from dept;

--UPDATE : ����       <==���� : �ݵ�� where ����(Primary Key, Unique �÷�)�� ����ؾ� �Ѵ�.

update dept
set dname = '������'
where dno = 40;             --

rollback;
commit;

insert into dept(dno, dname)
values(40,'�Ǹź�');

-- dno : where �� ���, �ߺ��� ���� ������� �ʴ� �÷��� ���(primary key, Unique)
update dept
set dname = 'HR', loc = '����'
where dno = 40;

--���̺��� Primary Key �÷��� �����ؾ� �Ѵ�. <== �ߺ��� ���� ���� �� ������ ������ ����


--delete : ���̺��� Ư�� ���ڵ� ���� : ���� :�ݵ�� where ����(Primary Key, Unique �÷�)�� ����ؾ� �Ѵ�.
delete dept
where dno = 40;

commit;

/*
���� ���� : �÷��� �ο��Ǵ� ����,primary key, unique ,Not null, Check,Foreign Key/,default
      Ư�� �÷��� ���Ἲ�� Ȯ���ϱ� ���ؼ� �ο�
    Primary Key :
            --�ߺ��� ���� ���� ���ϵ��� ����
            -- NOT NULL
            -- ���̺� �ѹ��� ���� �� �ִ�. ���� �÷��� �ϳ��� Primary Key�� ���� �� �ִ�.
            --INDEX �� �ڵ����� �����ȴ�.    <==�˻��� ������ ��.
            --update, delete �� where������ ���Ǵ� �÷�
            -- JOIN �� On ������ ���Ǵ� �÷�
         Unique:
            -- �ߺ��� ���� ���� �� ����.
            -- null             <== 1���� ���� �� �ִ�.
            -- not null�÷����� ���� ����
            -- �ϳ��� ���̺� ������ ���� �� �ִ�.
            -- INDEX �� �ڵ����� ������     <== �˻��� ������ ��.
            -- --update, delete �� where������ ���Ǵ� �÷�
       Not null 
            --�ݵ�� ���� �ԷµǾ�� �Ѵ�. NULL�� ���� �� ������
      Check
            -- �÷��� ������ ���� üũ�ؼ� ����,���ǿ� �����ϴ� ���� �ֵ���         age>0 
      Foreign Key
            -- �θ����̺��� Ư�� �÷��� �����ؼ� ���� ���� �� �ֵ��� ����
            -- �θ� ���̺��� ���� �ϴ� �÷��� primary Key, Unique Ű �÷��� ����
      
      Default : �÷��� ���� ���� �ʴ� ��� default�� ������ ���� �ڵ����� ��.       
          --���������� �ƴϿ��� ���� ���� �̸��� �ο��� �� ����.
          --null, not null �տ� ó���ؾ� ��.<<����>>
      ������ ���� : ����Ŭ���� ���̺� ���� ���� ������ ������ ���̺�
            user_constraints                        -- ���� ������ Ȯ���ϴ� ������ ����
            select * from user_constraints

*/

create table member1(
    id varchar2(50) not null primary key,
    pass varchar2(50) not null,
    addr varchar2(100) null,
    phone varchar2(30) null,
    age number (3),             -- ���� 3�ڸ�    
    weight number(5,2)          -- �Ǽ� : ��ü 5�ڸ�, �Ҽ������� 2�ڸ�  
);

--Insert
insert into member1 
values('ddd','aaa','����','010-1111-1111',20,70.55);

select * from member1;


commit;

--update �� where ���ǿ� primaty key �÷��� �������� ó��

update member1
set addr='�λ�', phone='010-2222-2222',age=30,weight=88.55
where id ='bbb'

select * from member1

--delete �� where ���ǿ� primaty key �÷��� �������� ó��
delete member1
where id = 'ccc';

/*Unique*/

create table member2(
    id varchar2(50) not null primary key,
    pass varchar2(50) not null Unique,
    addr varchar2(100) null,
    phone varchar2(30) null Unique,
    age number (3),                
    weight number(5,2)          
);

--Insert
insert into member2 
values('bbbb','bbbbb','����','010-2222-2222',10,70.55);

select * from member2;
commit;

-- ����Ŭ�� ������ ������ ����ؼ� member2 ���̺��� ���� ������ Ȯ��
show user;    -- ���� ������ ���� ������ ��� : C##HR

select * from user_constraints
where table_name = 'MEMBER2';


--���̺� ������ ���� ���� �̸��� �ο��ϸ鼭 �������� �Ҵ�
-- ���� ���� �̸��� : PK_���̺��̸�_�÷���

create table member3(
    id varchar2(50) not null constraint PK_MEMBER3_ID primary key,
    pass varchar2(50) not null constraint PK_MEMBER3_PASS Unique,
    addr varchar2(100) null,
    phone varchar2(30) null constraint PK_MEMBER3_PHONE Unique,
    age number (3),                
    weight number(5,2)          
);

insert into member3 
values('bb','bb','����','010-1111-2222',10,70.55);


select * from member3;
commit;

/*check : �÷��� ���� üũ*/

create table member4(
    id varchar2(50) not null constraint PK_MEMBER4_ID primary key,
    pass varchar2(50) not null constraint U_MEMBER4_PASS Unique,
    addr varchar2(100) null,
    phone varchar2(30) null constraint U_MEMBER4_PHONE Unique,
    age number (3) constraint CK_MEMBER4_AGE  check(age > 0 and age < 150 ),
    gender char(1)  constraint CK_MEMBER4_GENDER check(gender in('W','M')), 
    weight number(5,2)          
);

--���� ���� ���

select * from user_constraints
where table_name = 'MEMBER4';

insert into member4 
values('b','b','����','010-1111-2222',70,'M', 70.55);


select * from member3;
commit;

/* Default: ���� ���� ������ default �� ������ ���� �ڵ����� ��*/

create table member5(
    id varchar2(50) not null constraint PK_MEMBER5_ID primary key,
    pass varchar2(50) not null constraint U_MEMBER5_PASS Unique,
    addr varchar2(100) default '����' null,
    phone varchar2(30) null constraint U_MEMBER5_PHONE Unique,
    age number (3) null constraint CK_MEMBER5_AGE  check(age > 0 and age < 150 ),
    gender char(1) null constraint CK_MEMBER5_GENDER check(gender in('W','M')), 
    weight number(5,2) default 10.00 null,
    hiredate date default sysdate
);

drop table member5;

--insert : default�� �� �Ҵ� : default Ű�� ����ϴ� ���
insert into member5 
values('b','b','default','010-1111-2222',70,'M', default, default);

--insert : default�� �� �Ҵ� : �÷��� ��� ���� �ʴ� ���
insert into member5(id, pass, phone, age, gender)
values('c','c','010-1111-3333',70,'M');


select * from member5;
commit;

/*Foreign Key: �θ� ���̺��� Ư���÷��� �����ؼ� ���� �ֵ��� ����
        - �θ� ���̺��� primary key, unique Ű �÷��� ����
        - Foreign Key�� �ڽ� ���̺��� Ư�� �÷��� �ִ´�.
*/

--employee ���̺��� 
select * from department;       --�μ� ������ �����ϴ� ���̺�(�θ� ���̺�) dno
select * from employee;         -- ��� ������ �����ϴ� ���̺� (�ڽ� ���̺� : Foreign Key(dno))






































































