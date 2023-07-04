/*JOIN �ǽ�*/

drop table member10 cascade constraints;
drop table zipcode10 cascade constraints;
drop table product10 cascade constraints;
drop table orders10 cascade constraints;

create table member10 (
    m_id number(4) not null constraint PK_MEMBER10_M_ID Primary key, 
    pass varchar2(200) not null , 
    name  varchar2(200) not null, 
    email varchar2(200) not null, 
    zipcode number(6) null , 
    constraint FK_MEMBER10_ZIPCODE10 foreign key (zipcode) references zipcode10(zipcode)
    ); 
create table zipcode10 (
    zipcode number(6) not null constraint PK_ZIPCODE_ZIPCODE Primary key, 
    si_do varchar2(200) not null, 
    gu_gun varchar2 (200) not null, 
    bungi varchar2 (200) not null
    ); 
create table product10 ( 
    pro_id number (6) not null constraint PK_PRODUCT10_PRO_ID primary key, 
    pro_name varchar2(200) not null, 
    pro_price number (7,2) not null , 
    pro_cnt number (4) default 0 not null 
); 

create table orders10 (
    ord_id number (6) not null constraint PK_ORDER10_ORD_ID Primary key, 
    m_id number(4) not null , 
    pro_id number(6) not null , 
    orderdate date,
        constraint FK_ORDER10_M_ID foreign key (m_id) references member10(m_id), 
        constraint FK_ORDER10_PRO_ID foreign key (pro_id) references product10(pro_id)
); 

-- �� ���� ���̺� ���ڵ� 5���� ������ join �ǽ� : EQUIE JOIN,ANSI JOIN
-- ���� ������ ���ؼ� , ȸ���̸�, �����ּ�, �õ�, ��ǰ�̸�, ��ǰ ����,��ǰ ����(cnt),���ų�¥�� ���

--insert �� ����, EQUIE JOIN,ANSI JOIN <==2�ð� ���� �ǽ�

select * from MEMBER10;
select * from zipcode10;
select * from product10;
select * from orders10;

--�� ���̺� ���ڵ� 5���� ����


-- MEMBER10 ���̺� ���ڵ� 5�� ����
INSERT INTO MEMBER10(m_id,pass,name,email,zipcode)
VALUES(11,'1q2w3e4r!','ȫ�浿','aaaaa@aa.com','1');

INSERT INTO MEMBER10(m_id,pass,name,email,zipcode)
VALUES(22,'1q2w3e4r','���缮','bbb@bbbb.com','2');

INSERT INTO MEMBER10(m_id,pass,name,email,zipcode)
VALUES(1234,'q12gfe','�ڸ��','ccc@cccc.com',000003);

INSERT INTO MEMBER10(m_id,pass,name,email,zipcode)
VALUES(5678,'himedia12','������','ddd@dddd.com',000004);

INSERT INTO MEMBER10(m_id,pass,name,email,zipcode)
VALUES(5465,'himelapdw','����','eeee@kbs.co.kr',000005);

-- zipcode10 ���̺� ���ڵ� 5�� ����
INSERT INTO zipcode10(zipcode,si_do,gu_gun,bungi)
VALUES(000001,'����Ư���� ����','�ŵ�����','694');

INSERT INTO zipcode10(zipcode,si_do,gu_gun,bungi)
VALUES(000002,'����Ư���� ����','�λ絿','43');

INSERT INTO zipcode10(zipcode,si_do,gu_gun,bungi)
VALUES(000003,'����Ư���� �����','���','60');

INSERT INTO zipcode10(zipcode,si_do,gu_gun,bungi)
VALUES(000004,'����Ư���� ���빮��','���빮','20');

INSERT INTO zipcode10(zipcode,si_do,gu_gun,bungi)
VALUES(000005,'����Ư���� ���ϱ�','�Ⱦϵ�','������');

commit;

-- product10 ���̺� ���ڵ� 5�� ����

INSERT INTO product10(pro_id,pro_name,pro_price,pro_cnt)
VALUES(111111,'��浿',111.11,0001);

INSERT INTO product10(pro_id,pro_name,pro_price,pro_cnt)
VALUES(222222,'���浿',2222.22,0002);

INSERT INTO product10(pro_id,pro_name,pro_price,pro_cnt)
VALUES(333333,'������',33333.33,0003);

INSERT INTO product10(pro_id,pro_name,pro_price,pro_cnt)
VALUES(444444,'�̼���',44444.42,0004);

INSERT INTO product10(pro_id,pro_name,pro_price,pro_cnt)
VALUES(555555,'��浿',555.55,0052);

-- orders10 ���̺� ���ڵ� 5�� ����
INSERT INTO orders10(ord_id,m_id,pro_id,orderdate)
VALUES(435424,11,'111111','23/01/01');

INSERT INTO orders10(ord_id,m_id,pro_id,orderdate)
VALUES(213256,22,222222,'23/02/01');

INSERT INTO orders10(ord_id,m_id,pro_id,orderdate)
VALUES(132546,1234,333333,'23/03/01');

INSERT INTO orders10(ord_id,m_id,pro_id,orderdate)
VALUES(456422,5678,444444,'19/06/07');

INSERT INTO orders10(ord_id,m_id,pro_id,orderdate)
VALUES(846523,5465,555555,'23/07/03');

commit;

-- �� ���� ���̺� ���ڵ� 5���� ������ join �ǽ� : EQUIE JOIN,ANSI JOIN

select firstname, email, city
from member10 m join 


-- ���� ������ ���ؼ� , ȸ���̸�, �����ּ�, �õ�, ��ǰ�̸�, ��ǰ ����,��ǰ ����(cnt),���ų�¥�� ���

--insert �� ����, EQUIE JOIN,ANSI JOIN
select * from MEMBER10;
select * from zipcode10;
select * from product10;
select * from orders10;

--EQUI JOIN
select m.m_id,o.m_id,p.pro_id,o.pro_id,m.zipcode,z.zipcode,email,pro_price,orderdate
from member10 m,zipcode10 z,product10 p,orders10 o
where o.m_id=m.m_id
and p.pro_id=o.pro_id
and m.zipcode=z.zipcode

--ANSI JOIN

select m.m_id,o.m_id,p.pro_id,o.pro_id,m.zipcode,z.zipcode,email,pro_price,orderdate
from member10 m join zipcode10 z
on o.m_id=m.m_id
join product10 p
on m.zipcode=z.zipcode
join orders10 o
ono.pro_id=p.pro_id
