  =====================================================================  
1. SUBSTR �Լ��� ����Ͽ� ������� �Ի��� �⵵�� �Ի��� �޸� ��� �Ͻÿ�. 

select * from employee; 
select substr ( hiredate, 1,5 ) as ��� 
from employee; 




2. SUBSTR �Լ��� ����Ͽ� 4���� �Ի��� ����� ��� �Ͻÿ�.

select ename hiredate
from employee
where substr(hiredate,4,2)='04';

3. MOD �Լ��� ����Ͽ� ���ӻ���� Ȧ���� ����� ����Ͻÿ�. 
select ename,manager
from employee
where mod(manager,2)=1;

4. MOD �Լ��� ����Ͽ� ������ 3�� ����� ����鸸 ����ϼ���.

select ename, salary 
from employee
where mod(salary,3)=0;

5. �Ի��� �⵵�� 2�ڸ� (YY), ���� (MON)�� ǥ���ϰ� ������
��� (DY)�� �����Ͽ� ��� �Ͻÿ�. 

select hiredate, to_char( hiredate, 'YY MON DD DY') as ��°��
from employee;


6. ���� �� ���� �������� ��� �Ͻÿ�. 
���� ��¥���� ���� 1�� 1���� �� ����� ����ϰ� TO_DATE �Լ��� ����Ͽ�
   ������ ������ ��ġ ��Ű�ÿ�.
   
   select to_date('06/28/23','MM/DD/YY')-to_date('2023-01-01','YYYY-MM-DD') as �γ�¥����
   from dual;
   
   select trunc (sysdate - to_date ( 20220101 , 'YYYYMMDD')) as ���س�¥�� from dual  
   
7. �ڽ��� �¾ ��¥���� ������� �� ���� �������� ��� �ϼ���. 
select trunc(sysdate-to_date('19950714','YYYYMMDD'))as "��ƿ��ϼ�"
from dual;



8. �ڽ��� �¾ ��¥���� ������� �� ������ �������� ��� �ϼ���.

select trunc(months_between(sysdate, to_date('1995-07-14','YYYY-MM-DD')))as "��ƿ� ������"
from dual;

9. ������� ��� ����� ����ϵ� ����� ���� ����� ���ؼ��� null ����� 0���� ��� �Ͻÿ�.

select manager,NVL(NULL,0)
from employee;

select ename, manager , nvl (manager, 0), nvl2 (manager, manager,0)
from employee; 

10.   �����ȣ,
      [�����ȣ 2�ڸ������ �������� *���� ] as "������ȣ", 
      �̸�, [�̸��� ù�ڸ� ��� �� ���ڸ�, ���ڸ��� * ����] as "�����̸�"  
      
select eno �����ȣ, ename ����̸�,
RPAD(substr(eno,1,2),length(eno),'*')as �����ȣ,
RPAD(substr(ename,1,1),length(ename),'*')as ����̸�
from employee;


--������� �ø��� Ǭ����

    select eno, rpad (substr (eno , 1 ,2) , length(eno), '*')  as ������ȣ ,  
    ename, rpad ( substr (ename, 1,1), 4,'*')
    from employee;
    
        select eno, rpad (substr (eno , 1 ,2) , length(eno), '*')  as ������ȣ ,  
    ename, rpad ( substr (ename, 1,1), length (ename),'*')
    from employee;
      
    select ename, length(ename)
    from employee; 
      
      
11.  �ֹι�ȣ:   �� ����ϵ� 801210-1*******   ��� �ϵ��� , ��ȭ ��ȣ : 010-12*******
	dual ���̺� ���
    
select '801210-1234567' as �ֹι�ȣ, '010-1234-5678' as ��ȭ��ȣ,
RPAD(substr('801210-1234567',1,8),length('801210-1234567'),'*')as �ֹι�ȣ,
RPAD(substr('010-1234-5678',1,6),length('010-1234-5678'),'*') as ��ȭ��ȣ
from dual;

=============================================================================
��� ����� �Ҽ��� 2�ڸ����� ����ϵ� �ݿø� �ؼ� ��� �Ͻÿ�.  
1.  10 �� �μ��� �����ϰ� �� �μ��� ������ �հ�� ��հ� �ִ밪, �ּҰ��� ���Ͻÿ�. 

select sum(salary),round(avg(salary),2)as ���,max(salary), min(salary),dno,count(dno)
from employee
where dno not in(20)
group by dno
order by dno;


2.  ��å�� SALSMAN, PRESIDENT, CLERK �� ������ 
�� �μ��� ������ �հ�� ��հ� �ִ밪, �ּҰ��� ���Ͻÿ�. 

select sum(salary), round(avg(salary),2)as ���,max(salary),min(salary),dno, count(*)
from employee
where job not in('SALSMAN','PRESIDENT','CLERK')
group by dno
order by dno

3. SMITH �� ������ �μ��� �ٹ��ϴ� ����� �� ������ �հ�� ��հ� 
�ִ밪, �ּҰ��� ���Ͻÿ�. 

select sum(salary),round(avg(salary))as ���, max(salary),min(salary),count(*)
from employee
where dno not in(10,30)
group by dno;

--������� Ǭ ����

select sum(salary), round( avg(salary),2), max(salary), min(salary), dno, count(*)
from employee
where dno = (select dno from employee where ename = 'SMITH')
group by dno

4. �μ��� �ּҿ����� �������� �ּҿ����� 1000 �̻��� �͸� ����ϼ���. 

select min(salary),dno, count(*)
from employee
where salary>1000
group by dno;

--����Բ�

select min (salary), dno, count(*)
from employee
group by dno
having min(salary) > 1000

5.  �μ��� ������ �հ谡 9000 �̻�͸� ���
select *
from employee
where salary >=(select max(salary) from employee);

--������� Ǯ��
select dno , count(*), sum (salary) as �μ����հ� , round (avg(salary) , 2) as �μ������
from employee 
group by dno
having sum (salary) >9000 ; 

6.  �μ��� ������ ����� 2000 �̻� ���

select *
from employee
where salary >=(select round(avg(salary)) from employee);

select sum(salary),round(avg(salary))as ���, max(salary), min(salary),job ����,count(job)
from employee
group by job
having round(avg(salary))>2000;
--������� Ǯ��
select dno , count(*), sum (salary) as �μ����հ� , round (avg(salary) , 2) as �μ������
from employee 
group by dno
having round (avg(salary) , 2) > 2000.00 ; 

7. ������ 1500 ���ϴ� �����ϰ� �� �μ����� ������ 
����� ���ϵ� ������ ����� 2500�̻��� �͸� ��� �϶�. 

select sum(salary),round(avg(salary))as ���, max(salary), min(salary),job ����,count(*)
from employee
where salary>1500
group by job
having round(avg(salary))>=2500;
--������� Ǯ��
select dno, count(*) , round (avg (salary)) as �μ������
from employee
where salary > 1500
group by dno
having round (avg (salary)) > 2500 

8. sub query - �μ����� �ּ� �޿��� �޴� ������� �̸���
�޿��� ��å�� �μ���ȣ�� ����ϼ���. 

select ename �̸�, job ��å, salary ����, dno �μ���ȣ
from employee
where salary in(
select min(salary)
from employee
group by dno);

--������� Ǯ��
select eno, ename, salary, dno
from employee
where salary in (select  min(salary)
                from employee
                group by dno )
9. sub query - ��ü ��� �޿����� ���� �޴� �������  
�̸��� �޿��� ��å�� �μ���ȣ�� ����ϼ���. 

select *
from employee
where salary>=
(select 
avg(salary) from employee);

--������� Ǯ��
select ename, salary, job, dno 
from employee
where salary > ( select avg(salary) from employee); 
10. sub query - �޿��� ��� �޿����� ���� ������� 
�����ȣ�� �̸��� ǥ���ϵ� ����� �޿��� ���� �������� �����Ͻÿ�


select *
from employee
where salary>=
(select 
avg(salary) from employee)
order by salary asc;

--������� Ǯ��
select eno, ename,salary from employee
where salary > (select avg(salary) as ��ձ޿� from employee)
order by salary asc;
