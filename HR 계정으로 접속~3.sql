
create table MEMBER(
        a number(3),
        b char(20),
        c varchar2(100),
        d varchar2(10),
         e varchar2(2),
        f varchar2(10),
        g varchar2(40)
);


select * from member;

commit;

drop table member;

insert into member
values(1,'id','varchar2(20)','not null','PK', ' ', '�� ���̵�');

insert into member
values(2,'pwd','varchar2(20)',' ',' ',' ','�� ��ȣ');

insert into member
values(3,'name','varchar2(50)',' ',' ',' ','�� �̸�');

insert into member
values(4,'zipcode','varchar2(7)',' ','FK', ' ', '�����ȣ');

insert into member
values(5,'address','varchar2(20)',' ',' ', ' ', '�ּ�');

insert into member
values(6,'tel','varchar2(13)',' ',' ', ' ', '����ó');

insert into member
values(7,'indate','date',' ',' ', 'sysdate ', '������');

select a ����, b "Į�� ��", c "������ Ÿ��",d as "Null?",e �������,f as "default",g ����
from member;

