/*���� ��ȯ �Լ�
    TO_CHAR : ��¥,�������� ���������� ��ȯ
    TO_DATE : �������� ��¥Ÿ������ ��ȯ
    TO_NUMBER : �������� ���ڷ� ��ȯ
*/

--TO_CHAR(date,'YYYYMMDD') : ��¥������ 'YYYYMMDD' �������� �̾ƿͼ� char Ÿ������ ��ȯ


/*
        YYYY:��¥ ������ �⵵�� �̾Ƴ�
        YY: �⵵�� ������ 2�ڸ� �̾ƿ�
        MM : ��
        MON : 
        DD : ��
        
        DAY : ������ �̾ƿ�(������, ȭ����,....�Ͽ���)
        DY : ������ �̾ƿ�(��, ȭ,....��)
        
        HH : �ð�
        MI : ��
        SS : ��

*/

select TO_CHAR(sysdate, 'YYYYMMDD'), TO_CHAR(sysdate, 'YYYY-MM-DD DAY HH:MI:SS')
from dual;

select sysdate, TO_CHAR(sysdate, 'YY/MM/DD_HH:MI:SS_DY')
from dual;

select * from employee;

desc employee;

select hiredate , TO_CHAR(hiredate,'YYYY-MM-DD DAY HH:MM:SS')
from employee;

-- TO_CHAR : ��¥,����==>���������� ��ȯ

/*
    0 : �ڸ����� ó����, �ڸ����� ���� ������ 0���� ó����
    9 : �ڸ����� ó����, �ڸ����� ���� ������ ���� ó����
    L : �� ������ ��ȭ�� ��ȣ�� ǥ��
    . : �Ҽ������� ó��
    , : õ���� ������

*/

desc employee;

select ename , salary , to_char(salary,'L999,999'), to_char(salary,'L000,000')
from employee;

--TO_DATE : ������, ���� =>��¥Ÿ������ ��ȯ

/*
        TO_DATE(��ȯ�ҹ���[����], YYYYMMDD);
*/

select TO_DATE(20230628, 'YYYYMMDD'), TO_DATE('06282023', 'MMDDYYYY')
from dual;

select to_date('2001-10-30','YYYY-MM-DD')
from dual;

--���Ͽ��� ���� ��¥ ���� �� �� ��Ҵ���:1981-04-15
select TRUNC(sysdate - to_date('1981-04-15','YYYY-MM-DD')) -- �ش糯¥���� ��������� �ϼ�
from dual;

select to_date('12/06/22','MM/DD/YY') -to_date('1900-10-17','YYYY-MM-DD') as �γ�¥����
from dual;


-- �ڽ��� ���Ͽ��� ������� ���� ��Ҵ���. ��� ��������?

select trunc(sysdate - to_date('1995-07-14','YYYY-MM-DD')) as "��ƿ��� ��",
        trunc(months_between(sysdate ,to_date('1995/07/14','YYYY/MM/DD')))as "��ƿ� ������"
from dual;

--employee ���̺��� �� ����� �Ի��Ͽ��� 2030/01/01������ �ٹ��������� ���Ͻÿ�

select *
from employee;

select ename, hiredate , 
trunc(months_between(to_date('2030/01/01','YYYY/MM/DD'),hiredate)) as "Ư����¥����������"
from employee

--null ó�� �Լ�:NAL, NVL2,NULLIF

/*
    NVL(�÷�, ��) : �÷��� NULL�� ������ ��� ������ ��ġ
    NVL2(�÷���,null�� �ƴҰ�� ó��, null���ó�����)
*/

select * from employee;

--NVL �Լ��� ����ؼ� ó�� - ������ ����. ����(salary)*12+���ʽ�(commission)
select ename, salary, commission,
salary*12+NVL(commission,0) as �ѿ���
from employee

--NVL2 �Լ��� ����ؼ� ó��
select ename, salary, commission,
    NVL2(commission,salary *12 + commission,salary*12) as �ѿ���
from employee;

/*�׷� �Լ� : group by, Ư�� �÷��� �׷����ؼ� ó����.*/

select �÷���
from ���̺��̸�[��]
where ����
group by �÷���[�׷������÷���]
having ����[�׷����Ѱ��������]
order by �÷���[�������÷���]




/*���� �Լ� : SUM,AVG,COUNT,MAX,MIN     <==null�� �ڵ����� ó���ؼ� �۵��� 
   NUMBER Ÿ�Կ����� ��� ����
   
    SUM     : �÷��� ��� ���� ���ϴ� �Լ�
    AVG     : �÷��� ��� ���� ����� ���ϴ� �Լ�
    MAX     : �÷��� ��� ���� �ִ밪�� �������� �Լ�
    MIN     : �÷��� ��� ���� �ּҰ��� �������� �Լ�
    COUNT   : ���ڵ��, �׷��ε� ���� ���

    ���� : ���� row�� ��µ�, �ٸ� �÷��� ���� ����� ��� ������ �߻�
*/

select commission from employee
order by commission asc;

select SUM(commission) as �հ�, 
        AVG(commission) as ���,
        MAX(commission) as �ִ밪,
        MIN(commission) as �ּҰ�,
        count(commission)
from employee;

select * from employee;


--�μ��� ������ �հ�, ���, �ִ밪, �ּҰ�,�׷��ε� ����
--dno : �μ���ȣ �� ������ ���� �׷��ؼ� ó����.
select sum (salary) as �μ����հ�, dno, count(dno) as �׷��εȰ���
from employee
group by dno;

select ename,salary,dno
from employee
order by dno asc;

--�μ����� ������ �հ�, ���, �ִ����, �ּҿ���,�׷��εȼ��� ���

select sum(salary),round(avg(salary)),max(salary),min(salary),dno �μ���ȣ ,count(dno) �׷��μ�
from employee
group by dno
order by dno asc;

select salary from employee where dno = 20;


select ename,job,salary
from employee;

-- ���� ���� ������ �հ�,���,�ִ밪, �ּҰ�,�׷��εȼ�
select sum (salary),round(avg(salary))as ���,max(salary),min(salary),job ����,count(job)
from employee
group by job
order by ��� desc;

select sum (salary),round(avg(salary))as ���,max(salary),min(salary),job ����,count(job)
from employee
--where round(avg(salary)) >2000
group by job
having round(avg(salary)) >2000
order by ��� desc;

--group by ����
/*
    WHERE �� : <����> : group by ���� ������ ó���ؼ� ���� ����� group by
    having �� : <����> : group by �� ����� ���� ����ó��, ��Ī�̸��� ����ϸ� �ȵ�. 
    order by�� ��Ī�̸� ��� ����
*/

-- ���޺��� ������ �հ�,���,�ִ밪,�ּҰ��� ����ϵ� 20���μ��� ����, ����� 2000�̻��ΰ͸� ��� �϶�.
-- ����� ������������ �����϶�.

select sum (salary),round(avg(salary))as ���,max(salary),min(salary),job ����,count(*) �׷��μ�
from employee
where dno not in(20)
group by job
having round(avg(salary))>2000
order by round(avg(salary)) desc;

--�� �÷� �̻� �׷����� �� �� �ִ�. �� �÷���ΰ� �����Ҷ� �׷��� �̵�
select dno,job
from employee
order by dno, job

--�μ���ȣ�� ��å�÷� ��θ� �׷��� �ؼ� ������ �հ�, ���, �ִ밪, �ּҰ�, �׷��ε� ��

select sum(salary),round(avg(salary)) as ���,max(salary), min(salary), count(*) �׷��εȼ�
from employee
group by dno,job
order by �׷��εȼ� desc;

--�� ��å�� ���ؼ� ������ �հ�, ���, �ִ밪, �ּҰ��� ����ϴµ� �Ի����� 81�⵵�� �Ի��� ����鸸 ����ϵ�
--������ ����� 1500���� �̻��̰͸� ����ϰ� ����� desc(��������)���� �����ؼ� ���

select sum(salary), round(avg(salary)) as ���, max(salary), min(salary),count(*)�׷��εȼ�
from employee
where hiredate like '81%'
--between '81/01/01' and '81/12/31'
group by job
having round(avg(salary))>=1500
order by ��� desc;

select count(*)
from employee
where hiredate like '81%';

--rollup : �׷��� ��� ������ ���ο� ��ü ����� ��� , 
--cube   : �� �׷����� ������ ���ο� ������, ���� ������ ���ο� ��ü����� �Բ� ���

--rollup, cube�� ������� �ʴ� �׷��� ����

--groupup by ������ �÷� 2���� �׷��� �ɶ� �� �÷��� ���ļ� �ߺ��� �׷���

select sum(salary), round(avg(salary))as ���, max(salary), min(salary), dno, count(*)
from employee
group by dno
order by dno asc;

select dno, job 
from employee
order by dno asc, job asc;

--rollup�� ���

select sum(salary), round(avg(salary))as ���, max(salary), min(salary), dno, count(*)
from employee
group by rollup (dno,job)
order by dno asc;

--cube�� ���
select sum(salary), round(avg(salary))as ���, max(salary), min(salary), dno,job, count(*)
from employee
group by cube (dno,job)
order by dno asc;

/*SubQuery(���� ����) : Select ������ select ����, ������ �۾��� �ϳ��� �������� ����
        where ������ ���� �����.
*/

--ename �� SCOTT�� ����� ������ ��å�� ������� ����϶�.
/*
1.ename�� SCOTT�� ����� ��å�� �������� ����
2.��å�� �������� �ؼ� ����� �˾ƿ;� �ϴ� ����
*/

select * from employee;

select job
from employee 
where ename = 'SCOTT';

select ename from employee where job = 'ANALYST';

--subQuery�� ����ؼ� ename �� SCOTT�� ����� ������ ��å�� ������� ����϶�.

select ename
from employee
where job =(select job from employee where ename = 'SCOTT');

--SMITH�� ������ �μ��� ���� ������� ��� �ϱ�

select *
from employee;

select ename
from employee
where dno=(select dno from employee where ename='SMITH');

--�ٸ� Ǯ��
select dno from employee where ename ='SMITH';
select ename from employee where dno =20;

select ename 
from employee 
where dno =(select dno from employee where ename ='SMITH');

--'SCOTT'�� ���޺��� ���� ������� ��� �ϱ� subQuery

select ename
from employee
where salary>(select salary from employee where ename='SCOTT');

--�ּ� �޿��� �޴� ����� �̸��� ������, �޿� ����ϱ�

select ename, job, salary
from employee
where salary=(select min(salary) from employee);

--���� ���� �ƴ϶� �������� ���� ��µɰ�� INŰ���带 ���

--subQuery�� ���
--�μ����� �ּұ޿��� �޴� ��� ������ �̸�, ��å, ������ ��� group by, min,inŰ���� ����ؼ� ���

select ename �̸� , job ��å, salary ����, dno �μ���ȣ
from employee
where salary in(
select min(salary)
from employee
group by dno
);

--�� �μ��� �ּ� �޿��� 30�� �μ��� �ּ� �޿� ���� ū �μ��� ���
1.30�� �μ��� �ּұ޿�
2.�� �μ��� �ּұ޿��� ����� having

select min(salary),dno,count(*)
from employee
group by dno
having min(salary) >(
    --30�� �μ��� �ּұ޿��� ���
    select min(salary) from employee
    where dno =30
);
/*
    ANY ������ : ���������� ��ȯ�ϴ� ������ ���� ����
        -- < any �� �ִ밪���� ������ ��Ÿ����.
        -- > any�� �ּҰ� ���� ŭ�� ��Ÿ��.
        -- = any �� IN�� ������ Ű����
        
     ALL ������ : ������������ ��ȯ�Ǵ� ��� ���� ����.
        -- < all�� �ּҰ� ���� ������ ��Ÿ��
        -- > all�� �ִ밪 ���� ŭ�� ��Ÿ��
*/

--������ SALESMAN�� �ƴϸ鼭 ������ SALESMAN�� ������� �޿� ���� ����� ��� ���

select * from employee order by job asc;


--ALL �����ڸ� ����ؼ� ���
select ename,job, salary
from employee
where salary <all(select salary from employee
                   where job='SALESMAN')
    and job<>'SALESMAN';
--or and job!='SALESMAN'; ���� ����ϴ�.
-- != , <>

--min�� ����ؼ� ���
select ename,job, salary
from employee
where salary <(select min(salary) from employee
                   where job='SALESMAN')
    and job!='SALESMAN';

--��� ������ �м���(ANALYST)�� ������� �޿��� �����鼭 ������ �м����� �ƴ� ������� ���

select ename, job, salary
from employee
where salary<all(select salary from employee 
where job='ANALYST')
and job!='ANALYST';

select *
from employee
where salary<(select min(salary) from employee where job='ANALYST')
and job<>'ANALYST';













