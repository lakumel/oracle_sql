/*  Select ��  */ 

/* ���̺��� ��� �÷��� ��� */  


select * from Employee;        -- ��� ������ ����� ���̺�

select * from Department;       -- ����� ���� �μ� ������ ����

select * from Salgrade;         -- ������ ���� ����� �����

/* EMPLOYEE ���̺��� �÷�(�ʵ�) ���� */
  /*
   ENO  :   �����ȣ
   ENAME:   �����
   JOB  :   ��å
   MANAGER  : ���� ���(���)
   HIREDATE : �Ի�����
   SALARY   : ����
   COMMISSION   : ���ʽ�
   DNO  : �μ���ȣ
  
  */
  
/* DEPARTMENT ���̺��� �÷�(�ʵ�) ���� */
  
  /*
    DNO     : �μ���ȣ
    DNAME   : �μ���
    LOG     : �μ� ��ġ
  */
  
/* SALGRADE ���̺��� �÷�(�ʵ�) ���� */
  /*
    GRADE:���
    LOSAL:�ּ� ����
    HISAL:�ִ� ����
  */
  
 /*SELECT ���� : ����϶� */
 
 SELECT �÷���
 FROM ���̺��[��]
 WHERE ����
 GROUP BY �׷������÷�
 HAVING ����(�׷����� ����� ����)
 ORDER BY �÷��� (������ �÷���)
 
 /*���̺��� ������ Ȯ��*/
 desc employee;
 
 /*�⺻ Select */
-- ��� �÷� ��� �ϱ�
select * from employee;

-- Ư�� �÷��� ��� �ϱ�
select eno, ename, salary
from employee;
 
-- �÷��� ������ ��� �� �� �ִ�. �÷��� ������ ���� �� �� �ִ�.
select ename, salary, salary + 100, hiredate, salary * 2
from employee;
 
 -- �÷��� ��Ī �����ϱ�, �����̸� as ��Ī�̸�
 select ename as �̸� , salary as ���� , salary +100 as "����+100", salary*2 as"������ 2��"
 from employee;
 
-- as�� ������ �� �ִ�.
 select ename �̸� ,salary ���� , salary +100 "����+100", salary*2 "������ 2��"
 from employee;
 
 -- WHERE ���ǻ���ϱ� 
select * from employee; 

--�̸��� JAMES �� ����� �̸��� ��å, �Ի��, �μ���ȣ ��� �ϱ� 
-- SELECT , select, FROM , from , WHERE, where 
-- �÷��� ����� ��(���ڵ�) �� �����ö� ��ҹ��ڸ� ������.  

select ename �̸�, job ��å, hiredate �Ի�����, dno �μ���ȣ
from employee
where ename = JAMES';
  
-- where ������ ������ ��� : or, and
select *
from employee
where ename = 'JAMES' or ename = 'SMITH';

-- where ������ in ������ ���
select *
from employee
where ename in('JAMES', 'SMITH');

-- where ������ �� ������ ����ϱ� : > , < , >= , <=
-- ������ 1500�̻��� ����ڸ� ���
select *
from employee
where salary >= 1500;

-- ������ 1500 �̰� �μ��� 30�� ����� ������ ���
  
select *
from employee
where salary >=1500 and dno = 30;

-- ���̺��� �÷��� �ڷ��� �� ���̺� ���� Ȯ��
-- NUMBER : Oracle ���� ����, �Ǽ� 

/*
    NUMBER(4) : ���� 4�ڸ� ������ ���� �� �ִ�.
    NUMBER(7,2) : �Ǽ�(��ü 7�ڸ�, �Ҽ��� ���� 2�ڸ�)

    CHAR(10) : ���� 10byte    <=== �ڸ����� �˼� �ִ� ���
        varchar2 ���� ������ ������. �ϵ� ���� ���� ���� �� �ִ�.
        �ֹι�ȣ(13), ��й�ȣ 4�ڸ��� ����.
        
    VARCHAR2(10) : ���� 10byte       <===VARCHAR2�� ���, �ڸ����� �� �� ���� ���
        char ���� ������ ���������� �ϵ� ������ �������� �ʴ´�.
    
    DATE : ��¥�� �����ϴ� ������ Ÿ��
*/

-- ���̺� ���� Ȯ��
desc employee;

select * from employee;

-- NUMBER : ����, �Ǽ�, ���� �����ö� ''�� ���̸� �ȵ�
-- CHAR, VARCHAR2, DATE ���� �����ö� ''�� �ٿ��� ��

--��å�� �������(SALESMAN)�̰� ������ 1500 �̻� 3000�̸��� ����� �̸��� ����غ���
select *
from employee
where job = 'SALESMAN' and (salary >=1500 and salary<3000);

-- null �� �˻� : ���� : =�� ����ϸ� �ȵ�, is null
    -- null : 0�� �ƴϰ� ����ִ� ����
    
-- ���ʽ�(commission)�� ���� ��� ���� ��� 
select *
from employee
where commission is null;

-- ���ʽ�(commission)�� �ִ� ��� ���� ��� : null �� �ƴѰ͸� �˻� 
select *
from employee
where commission is not null;

/*���(���)MANAGER �� ���� ��� ���� ���*/
select * from employee;

select *
from employee
where manager is null;

/*��¥ �˻� �ϱ�*/
-- �Ի� ��¥�� 81/02/20 �ϳ� �Ի��� ����� �̸��� ��å�� ����, �Ի����� ���
select ename as �̸�, job as ��å, salary ����, hiredate as �Ի���
from employee
where hiredate='81/02/20';

-- 81�⵵�� �Ի��� ����ڸ� ���
select * from employee;

select *
from employee
where hiredate > '81/01/01' and hiredate < '81/12/31'; -- ��¥ �ɸ� : date

--where ���� Like ������ ����ϱ�    <== �÷��� Ư�� �ܾ �˻� �Ҷ� ��� : �Խ���, �̸�, �۳���, ��¥�� �˻� 
    -- ���ڿ��� �ܾ �˻��Ҷ� ��� 
     -- ���ϵ� ī�� �ĺ��� ��� : %  ����ڰ� �͵� �������. 

-- �̸��� A�� ���۵Ǵ� ����� �˻�
select *
from employee
where ename like 'A%';

select *
from employee
where hiredate like '81%';

-- ��å (job) �÷����� AG ��� �ܾ �� ��� ������ ���
select *
from employee
where job like '%AG%';

/*�ߺ��� �����ؼ� ����ϱ� : distinct, �ٸ� �÷��� �����Ǹ� ���� �߻�, ���� �÷����� ���*/

-- �츮 ȸ�翡 �����ϴ� ��å�� ���
select distinct job
from employee;

-- �츮 ȸ�翡 �����ϴ� �μ��� ���
select distinct dno
from employee;

/*�����ؼ� ��� : order by �÷��� asc[desc]
    asc : ���� ���� ����, A ->Z, 1 -> 9       <==�⺻ ��
    desc : ���� ���� ����, Z -> A, 9->1
*/

-- ��� ���̺��� �̸� �÷��� �������� ���� ���� ����
select *
from employee
order by ename desc;

-- �����ȣ�� �������� ���� ���� ����
select *
from employee
order by eno asc;

--�ֱ� �Ի��� ������� ��� �϶�.
select *
from employee
order by hiredate desc;

-- �޿��� ���� ������� ����ϵ� ������ 1000���� �̻� �����, ��å, �޿�, �μ���ȣ�� ��� �϶�.
select ename as �����, job as ��å, salary �޿�, dno �μ���ȣ
from employee
where salary >= 1000
order by salary desc;

-- NVL �Լ� ����ϱ� :Null�� 0���� ó���ϴ� �Լ�
    -- + / - / * / NULL�� ������ �����ϸ� NUll�� ó����
    -- NULL �� ����ִ� ������. 0�� �ƴ�.
    -- NVL(commission, 0)   : commission �÷��� null�� ������ ��� 0 ���� �ٲپ��
    
--NVL �Լ��� ������� �ʰ� ��ü ������ ���ϴ� �÷��� ���
select *
from employee;

-- ���� : ��Ģ ������ �Ҷ� null �÷��� �����ϴ��� Ȯ��

--�� ���� = ����(salary) * 12 + commission(���ʽ�)
--��ü ������ ����ؼ� �̸�, ��å, ����, ���ʽ�, �ѿ���
select ename as �̸�, job as ��å, salary as ����, commission as ���ʽ�, 
        salary * 12 + commission as �ѿ���
from employee;

-- NVL �Լ��� ����ؼ� commission �÷��� null �� 0���� ��ġ�� ����� ������ ���� ������ ���
select ename as �̸�, job as ��å, salary as ����, commission as ���ʽ�, 
        salary * 12 + NVL(commission,0) as �ѿ���
from employee
order by �ѿ��� desc;

--null�� �˻�
select * from employee
where commission is null;

-- where �÷��� between A and B : A �̻� B����
-- ������ 1500 �̻� 3000 ������ �����, ��å, ����(�޿�), �Ի����� ����ϵ� �ֱ� �Ի��� ����ڷ� �����Ͽ� ���
select *
from employee
where salary >=1500 and salary <=3000
order by hiredate desc;

select *
from employee
where salary between 1500 and 3000
order by hiredate desc;

/*���ڵ� ���� ��� : count   <== �Խ��ǿ��� DB ��ü ���ڵ� ���� �����ͼ� ����¡ ó���� �ϱ� ���ؼ� ���*/   
-- count �Լ��� null�� ī��Ʈ ���� �ʴ´�.
-- Ư�� �÷��� ����� ���Ҷ�, null �� ī��Ʈ ���� ī��Ʈ ���� �������� �����ؾ� �Ѵ�.

-- count(*) : ��ü ���ڵ���� ���
select count(*) as "��ü ���ڵ��"
from employee;

--not null �÷��� count �ؾ� ��ü���ڵ带 ����� ��� �� �� �ִ�.
select count(eno)
from employee;

-- Ư�� �÷��� ī��Ʈ �Ҷ� null ���� �÷��� ��� null�� ī��Ʈ ���� �ʴ´�.
select count(commission) as "���ڵ��"
from employee;

-- employee ���̺��� �÷��� null ��� ����, �ڷ��� (number(n), char(n) ,varchar2(n), date)
desc employee;


select * from employee;
/*order by ���� �ΰ� �̻��� �÷��� ���� �ɶ�*/
select *
from employee
order by job asc;
--job asc, ename desc
--�ΰ� �̻��� �÷��� ���ĵɶ�, job �÷��� ���� ��,job �÷��� �ߺ��� ���� ���ؼ� ename desc ���ĵ�
select *
from employee
order by job asc, ename desc;
/*
<����1> �÷� �˸��(��Ī) , commission(���ʽ�) 
 �÷��� null �� ���� ����ϵ� �����ȣ, ����̸�,�Ի糯¥�� ��� 
*/

select eno as �����ȣ, ename as ����̸�, hiredate as �Ի糯¥ , commission ���ʽ�
from employee
where commission is null;

/*<����2> dno(�μ���ȣ) �� 20�̰� 
�Ի糯¥�� 81�� 4�� ���� ����� �̸��� ��å�� �Ի糯¥�� ���*/

-- ���� Ǭ��

select ename as �̸�, job as ��å, hiredate as �Ի糯¥
from employee
where dno like '20%' and hiredate>'81/04/01'
order by hiredate desc;

-- ���� Ǯ��
select ename as "��� �̸�",job as ��å,hiredate as �Ի糯¥, dno �μ���ȣ
from employee
where dno =20 and hiredate>='81/04/01';

/*<����3> ������ ����ؼ� �����ȣ, 
����̸�, ����, ���ʽ�, ��ü ������ ���*/

--���� Ǭ��

select eno as �����ȣ, ename as �̸�, salary as ����, commission as ���ʽ�,
salary*12 + commission as �ѿ���
from employee;

--�ٸ� Ǯ��

select eno �����ȣ, ename as ����̸�, salary ����, commission ���ʽ�,
salary*12 + NVL(commission,0) ��ü����
from employee

desc employee;


/*<����4> commission�� null �� �ƴ� ������� �̸��� ��� */
-- ���� Ǭ��(Ʋ��)
select eno as �����ȣ, ename as �̸�, salary as ����, commission as ���ʽ�,
salary*12 + NVl(commission,0) as �ѿ���
from employee


-- �ٸ� Ǯ��(����)

select ename as �̸�
from employee
where commission is not null;

/*<����5> manager (���޻��) 7698 �� ����̸��� ��å�� ���.*/
select ename as ����̸�, job as ��å
from employee
where manager = '7698';

select ename ����̸�, job as ��å, manager ���޻��
from employee
where manager = 7698;

<����6> ������ 1500 �̻��̰� �μ��� 20�� ����� 
����̸��� �Ի糯¥, �μ���ȣ, ������ ���

select ename as ����̸�, hiredate as �Ի糯¥, dno as �μ���ȣ, salary as ����
from employee
where salary >=1500 and dno =20;

<����7> �Ի糯¥�� 81�� 4�� 1�� �̻��̰� 
81�� 12�� ���ϱ����� ��� �̸��� �Ի糯¥�� ���

select ename as ����̸�, hiredate as �Ի糯¥
from employee
where hiredate between '81/04/01' and '81/12/31';

--�ٸ� Ǯ��

select ename as ����̸�, hiredate as �Ի糯¥
from employee
where hiredate>='81/04/01' and hiredate<= '81/12/31';


<����8> ��å(job) salesman �̸鼭 ������ 1500 �̻��̸鼭 
�μ���ȣ�� 30�� ������� ���

-- ���� Ǭ��
select ename as ����̸�
from employee
where job = 'SALESMAN' and dno=30 and salary>=1500;

-- �ٸ� Ǯ��
select ename as �����, salary * 12 + NVL(commission,0) as ����, job ��å
from employee
where job = UPPER('salesman') and salary * 12 + NVL(commission,0) >1500
order by ���� desc;

/*where ������ ��Ī�̸��� ����ϸ� �����߻�
order by �������� ��Ī �̸� ��� ����
*/

<����9> ������ 1500 �����̸鼭 �μ���ȣ�� 20�� �� �ƴ� ����̸���,
���ް�, �μ���ȣ�� ���

select ename as ����̸�, salary as ����, dno as �μ���ȣ
from employee
where salary <=1500 and dno <> 20;

--�ٸ� Ǯ��

select ename as ����̸�, salary as ����, dno as �μ���ȣ
from employee
where salary <=1500 and dno!=20
order by ���� desc;
/*<����10> �����ȣ(eno) �� 7788, 7782 �� �μ���ȣ�� 
�̸��� ��å�� ��� */

select ename as ����̸�, job as ��å, dno as �μ���ȣ, eno as �����ȣ
from employee
where eno = 7788 or eno =7782;
--where eno IN(7788,7782);