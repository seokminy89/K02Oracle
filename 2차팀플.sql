----------------------------------------------------------------------------
------------------------------2�� ��������Ʈ--------------------------------
create user justcoding identified by 1234;
grant connect, resource to justcoding;

--1. ���� ���̺� ����
drop table board;
drop table member;

--2. ���� ���̺� ����
create table board (
    idx number primary key, --�ε���
    id varchar2(10) not null,  --���̵�(�ܷ�Ű)
    title varchar2(200) not null, --����
    content varchar2(2000) not null, --����
    postdate date default sysdate not null, --�ۼ���
    ofile varchar2(200), --���� ����
    sfile varchar2(30), --����� ����
    visitcount number(10), --��ȸ��
    tname varchar2(10) --���̺� ����
);

--3. ��� ���̺� ����
create table member (
    name varchar2(30) not null, --�̸�
    id varchar2(10) primary key, --���̵�(�ܷ�Ű)
    pass varchar2(10) not null, --�н�����
    num varchar2(20), --��ȭ��ȣ
    phone_num varchar2(20) not null, --�޴���ȭ
    email varchar2(50) not null, --�̸���
    postcode number(10) not null, --�����ȣ
    basicadd varchar2(100) not null, --�⺻ �ּ�
    detailadd varchar2(100) not null --�� �ּ�
);

--�� member���̺� ��¥ �÷� �߰�
alter table member add regidate date default sysdate not null;


--������ ����
create sequence seq_board_num
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;

--4. �������� ����(�ܷ�Ű)
ALTER TABLE board
   ADD constraint board_mem_fk --���������� �̸�
   FOREIGN KEY (id)
   REFERENCES member (id);

--5. ���� ������ �Է�
insert into member values ('�׽�Ʈ1', 'test1', '1111', '02-1111-1111', 
    '010-1111-1111', 'test1@naver.com', 61085, '��õ��', '���굿');
insert into member values ('�׽�Ʈ2', 'test2', '2222', '02-2222-2222', 
    '010-2222-2222', 'test2@gmail.com', 57382, '���Ǳ�', '��õ��');
insert into member values ('�׽�Ʈ3', 'test3', '3333', '02-3333-3333', 
    '010-3333-3333', 'test3@naver.com', 24584, '��õ��', '���굿');
insert into member values ('�׽�Ʈ4', 'test4', '4444', '02-4444-4444', 
    '010-4444-4444', 'test4@naver.com', 21353, '��õ��', '���굿');
--6. ���� ������ �Է�
insert into board (idx, id, title, content, postdate, visitcount, tname)
    values (seq_board_num.nextval, 'test1', '�����Խ���', '����1�Դϴ�', sysdate, 0, '����');
insert into board (idx, id, title, content, postdate, visitcount, tname)
    values (seq_board_num.nextval, 'test1', '�����Խ���', '����1�Դϴ�', sysdate, 0, '����');
insert into board (idx, id, title, content, postdate, visitcount, tname)
    values (seq_board_num.nextval, 'test1', '�ڷ�Խ���', '����1�Դϴ�', sysdate, 0, '�ڷ�');
insert into board (idx, id, title, content, postdate, visitcount, tname)
    values (seq_board_num.nextval, 'test1', '�ڷ�Խ���', '����1�Դϴ�', sysdate, 0, '�ڷ�');
insert into board (idx, id, title, content, postdate, visitcount, tname)
    values (seq_board_num.nextval, 'test1', '�ڷ�Խ���', '����1�Դϴ�', sysdate, 0, '�ڷ�');
insert into board (idx, id, title, content, postdate, visitcount, tname)
    values (seq_board_num.nextval, 'test1', '�ڷ�Խ���', '����1�Դϴ�', sysdate, 0, '�ڷ�');
insert into board (idx, id, title, content, postdate, visitcount)
    values (seq_board_num.nextval, 'test4', '����4�Դϴ�', '����4�Դϴ�', sysdate, 0);

--rownumȮ�� ���
select rownum from member;
select rownum from board;

--�÷� �߰� ���
alter table board add �÷��� number;
alter table board drop column �÷���;

select id, title, content, postdate, visitcount, sfile, ofile from board where tname='�ڷ�';

      ---------��������� ȸ�Ƕ� �ۼ��ߴ� �⺻ ���̺� �Դϴ�---------
      
      
      
      
-------------------��� Ŭ����, ü���н� ��û�� ���̺�----------------------
-- ���Ŭ���� �����Ƿ� ���̺� ����
create table blue_cleaning (
    id varchar2(10) primary key,  --���̵�
    name varchar2(100) not null, --����/ȸ���
    address varchar2(100) not null, --û���� �� �ּ�
    phone_num varchar2(30) not null, --����ó
    email varchar2(50) not null, --�̸���
    bc_type varchar2(200) not null, --û������
    bc_space varchar2(10) not null, --���
    bc_date varchar2(10) not null, --û�� �����¥
    regi_type number not null, --�������� ����
    note varchar2(200) not null --��Ÿ Ư�̻���
);

--���� ������
insert into blue_cleaning
    values ('test1', 'ȸ���1', '�ּ�1', '010-1111-1111', 'test1@naver.com',
            'û������1', '100��', '2022-01-01', 1, '��Ÿ Ư�̻���1');
insert into blue_cleaning
    values ('test2', 'ȸ���2', '�ּ�2', '010-2222-2222', 'test2@naver.com',
            'û������2', '1000', '2022-02-02', 2, '��Ÿ Ư�̻���2');


-- ü���н� ��û ���̺� ����
create table field_trip (
    id varchar2(10) primary key,  --���̵�
    name varchar2(100) not null, --����/ȸ���
    phone_num varchar2(30) not null, --����ó
    email varchar2(50) not null, --�̸���
    cake varchar2(10) not null,--����ü�� �ο���
    cookie varchar2(10) not null,--��Űü�� �ο���
    c_date varchar2(10) not null, --ü�� �����¥
    regi_type number not null, --�������� ����
    note varchar2(200) not null --��Ÿ Ư�̻���
);

--���� ������
insert into field_trip
    values ('test1', 'ȸ���1', '010-1111-1111', 'test1@naver.com',
            '1��', '1��', '2022-01-01', 1, '��Ÿ Ư�̻���1');
insert into field_trip
    values ('test2', 'ȸ���2', '010-2222-2222', 'test2@naver.com',
            '2', '2', '2022-02-02', 2, '��Ÿ Ư�̻���2');

--------------------���θ� ���� ���̺�----------------------

--��ǰ���� ���̺�
drop table management;
drop table orderform;

--��ٱ��� ���̺�
create table management (
    idx varchar2(10) primary key, --�Ϸù�ȣ
    name varchar2(30) not null, --��ǰ��
    price number(10) not null, --����
    point number(10) not null, --������
    count number(5) --����
);

--���� ������
insert into management (idx, name, price, point) values ('C01', '����', 38000, 380);
insert into management (idx, name, price, point) values ('D01', 'å��', 99000, 990);
insert into management (idx, name, price, point) values ('C02', '����2', 38000, 380);
insert into management (idx, name, price, point) values ('D02', 'å��2', 99000, 990);
insert into management (idx, name, price, point) values ('C03', '����3', 38000, 380);
insert into management (idx, name, price, point) values ('D03', 'å��3', 99000, 990);
insert into management (idx, name, price, point) values ('C04', '����4', 38000, 380);
insert into management (idx, name, price, point) values ('D04', 'å��4', 99000, 990);

--��ǰ�ֹ��� ���̺�
create table orderform (
    idx varchar2(10) primary key, --��ǰ �Ϸù�ȣ
    name varchar2(30) not null, --�ֹ��� ����
    location varchar2(30) not null, --����� ����
    phone_num varchar2(20) not null, -- �ڵ���
    email varchar2(50) not null, --�̸���
    message varchar2(50), --��۸޼���
    payment number(5) not null --�������
);

--���� ������
insert into orderform 
    values ('C01', '���ؿ�', '��õ��', '010-2700-1733', 'sonjy2717@naver.com', '��۸޼���', 1);
insert into orderform 
    values ('D01', '������', '���Ǳ�', '010-9597-6450', 'jihyun@naver.com', '��۸޼���', 2);
   
commit;

ALTER TABLE orderform
   ADD constraint order_manage_fk
   FOREIGN KEY (idx)
   REFERENCES management (idx);

select rownum from management;
SELECT * FROM (SELECT Tb.*, ROWNUM rNum FROM (SELECT * FROM management ORDER BY idx DESC)Tb) WHERE rNum BETWEEN 4 AND 6;
SELECT * FROM ( SELECT Tb.*, ROWNUM rNum FROM ( SELECT * FROM management ORDER BY idx DESC ) Tb);
select to_char(price, '999,999,999') from management;

SELECT * FROM 
    (SELECT Tb.*, ROWNUM rNum FROM 
        (SELECT idx, name, to_char(price, '999,999,999'), 
        to_char(point, '999,999,999'), count FROM management ORDER BY idx DESC)Tb) 
WHERE rNum BETWEEN 4 AND 6;

SELECT idx, name, to_char(price, '999,999,999'), to_char(point, '999,999,999'), count FROM management WHERE idx='D04';
----------------------------------------------------------------------------
-- �ؿ� ��ȣ�� �ִ� ��� �����ϱ�.
delete from member where num = '111-1111-1111';
delete from member where num = '999-999-9999';
--

commit;