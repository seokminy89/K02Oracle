--JDBC �ǽ��� ����

/*
JAVA���� ó������ JDBC ���α׷��� �غ���
*/
--�켱 system�������� ������ �� ���ο� �ǽ��� ������ �����Ѵ�.
create user kosmo identified by 1234;
--role�� ����� ���� �ο�
grant connect, resource to kosmo;

--���⼭���ʹ� kosmo�������� �ǽ��մϴ�.

--���̺�����ϱ�1 (ȸ������ ���̺�)
create table member
(
    id varchar2(30) not null,
    pass varchar2(40) not null,
    name varchar2(50) not null,
    regidate date default sysdate,
    primary key (id)
);
-- ���̺� �����ϱ�(�ʿ�ÿ���)
drop table member;
--�������� Ȯ���� ���� ������ ����
select * from user_constraints;
--���̵����� �Է��ϱ�
insert into member (id, pass, name) values ('test', '1234', '�׽�Ʈ');
select * from member;
select to_char(regidate, 'yyyy-mm-dd hh24:mi:ss') "ȸ��������" from member;

--���̺�����ϱ�2(�Խ��� ���̺�)
create table board
(
    num number primary key, --�Խù��� �Ϸù�ȣ
    title varchar2(200) not null,  --����
    content varchar2(2000) not null,  --����
    id varchar2(30)not null,  --�ۼ����� ���̵�
    postdate date default sysdate not null, --�ۼ���
    visitcount number default 0 not null --��ȸ��
);
-- ���̺� �����ϱ�(�ʿ�ÿ���)
drop table member;

/*
����] ������ ������ ���̺� �ܷ�Ű�� �������� �����Ͻÿ�.
1. �ܷ�Ű�� : board_mem_fk
board ���̺��� id �÷��� member ���̺��� id �÷��� �����ϵ��� �ܷ�Ű�� ����
2. �������� : seq_board_num
board ���̺� �����͸� �Է½� num �÷��� �ڵ����� �� �� �ֵ��� �������� ����
*/
--�������� �����ϱ�(�ʿ�ÿ���) : ���������� �߸����� ��� ������ �ȵǹǷ� ������ �� �����ؾ���.
alter table board drop constraint board_mem_fk;

--1.�ܷ�Ű ����
alter table board add
    constraint board_mem_fk
        foreign key (id) references member (id);
--1-1. ������ �������� Ȯ��
select * from user_constraints;

--2.����������
create sequence seq_board_num
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;
--�����������ϱ�
drop sequence seq_board_num;
--������ Ȯ���� ���� �����ͻ���
select * from user_sequences;
--2-1.������ Ȯ��
select seq_board_num.nextval from dual;

insert into member (id, pass, name) values ('test91', '9191', '�׽�Ʈ91');

commit;





/*************
JSP �ǽ�
    : JDBC, ����, ȸ���� �Խ��� ����
*************/
--system�������� �����ϼ���.
--���ο� ����� ���� ����
create user musthave identified by 1234;
--��(Role)�� �̿��� �������� ���� �ο�
grant connect, resource to musthave;

--���� ��� �� musthave���� �����ϼ���
/* Create Tables */
--�Խ��� ���̺�
CREATE TABLE board
(
	num number NOT NULL, --�Ϸù�ȣ(PK)
	title varchar2(200) NOT NULL, --����
	content varchar2(2000) NOT NULL, --����
	id varchar2(10) NOT NULL, --�ۼ��� ���̵�(FK)
	postdate date default sysdate NOT NULL, --�ۼ���
	visitcount number(6), --��ȸ��
	PRIMARY KEY (num)
);

--ȸ�����̺�
CREATE TABLE member
(
	id varchar2(10) NOT NULL, --���̵�(PK)
	pass varchar2(10) NOT NULL, --�н�����
	name varchar2(30) NOT NULL, --�̸�
	regidate date DEFAULT SYSDATE NOT NULL, --�����
	PRIMARY KEY (id)
);



/* Create Foreign Keys */
/*
�ڽ����̺��� board�� id �÷��� �θ����̺��� member�� id �÷��� 
�����ϴ� �ܷ�Ű ����.
�� ��� �θ��ʿ� ���ڵ尡 �־������ �ڽ��ʿ� ���ڵ带 insert �� �� �ִ�.
*/
ALTER TABLE board
	ADD constraint board_mem_fk --���������� �̸�
	FOREIGN KEY (id)
	REFERENCES member (id)
;
--������ ����
create sequence seq_board_num
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;
    
--���� ������ �Է�
insert into member (id, pass, name) values ('musthave', '1234', '�ӽ�Ʈ�غ�');
insert into board (num, title, content, id, postdate, visitcount)
    values (seq_board_num.nextval, '����1�Դϴ�.', '����1�Դϴ�.', 'musthave', sysdate, 0);
insert into board (num, title, content, id, postdate, visitcount)
    values (seq_board_num.nextval, '����2�Դϴ�.', '����2�Դϴ�.', 'musthave', sysdate, 0);
insert into board (num, title, content, id, postdate, visitcount)
    values (seq_board_num.nextval, '����3�Դϴ�.', '����3�Դϴ�.', 'musthave', sysdate, 0);
insert into board (num, title, content, id, postdate, visitcount)
    values (seq_board_num.nextval, '����4�Դϴ�.', '����4�Դϴ�.', 'musthave', sysdate, 0);
insert into board (num, title, content, id, postdate, visitcount)
    values (seq_board_num.nextval, '����5�Դϴ�.', '����5�Դϴ�.', 'musthave', sysdate, 0);
commit;


--Model1 ����� ȸ���� �Խ��� �����ϱ�.

--board ���̺��� �Խù� �� ī��Ʈ �ϱ�.
select count(*) from board; -- ��ü�Խù�
--�˻��� �ϴ� ��쿡 ī��Ʈ �ϱ�
select count(*) from board where title like '%����%';
select count(*) from board where title like '%����9%';

--��ü �Խù� ����ϱ�
select * from board;
--�Խù� �˻��ϱ�
select * from board where title like '%����%';--1�� �����
select * from board where title like '%����%';--0�� �����
--���ı��� �߰��ϱ�
select * from board order by num desc;
select * from board where title like '%����%' order by num desc;
select * from board where title like '%����3%' order by num desc;

--���̵����� �߰��ϱ�
INSERT INTO board VALUES (seq_board_num.nextval, '������ ���Դϴ�', '���ǿ���', 'musthave', sysdate, 0);
INSERT INTO board VALUES (seq_board_num.nextval, '������ �����Դϴ�', '�������', 'musthave', sysdate, 0);
INSERT INTO board VALUES (seq_board_num.nextval, '������ �����Դϴ�', '������ȭ', 'musthave', sysdate, 0);
INSERT INTO board VALUES (seq_board_num.nextval, '������ �ܿ��Դϴ�', '�ܿ￬��', 'musthave', sysdate, 0);
commit;

--�Խ��� �󼼺��� ó�� : ȸ���� �̸��� ����ϱ� ���� Join�� �ۼ�
--���� 9�� �Խù��� �а� �ʹٸ� 
select * from board where num=9;
--�ۼ��� �̸��� Ȯ���ϱ� ���� join�� �ۼ�
select
    num, title, content, id, postdate, visitcount, name
from board inner join member on board.id=member.id
where num=9; -- id �÷��� �ָ��ϹǷ� ���� �߻���.

--���̺� ��Ī�� ����ϰ�, �ָ��� id�÷����� ��Ī�߰���
select
    num, title, content, B.id, postdate, visitcount, name
from board B inner join member M 
    on B.id=M.id
where num=9;

select
    B.*, M.name
from board B inner join member M 
    on B.id=M.id
where num=9;

--���� �������� using�� ���� ���� �� ����ȭ �ϱ�.
/*
    using�� �����ϴ� �ΰ��� ���̺� ������ �̸��� �÷��� ��������
    ����� �� �ִ� �����̴�. ���� ��Ī, on���� �ʿ� ���� ���Ƿ�
    �������� �� �� ����������.
*/
select
    num, title, content, id, postdate, visitcount, name
from board inner join member
    using(id)
where num=9;

--�Խù��� ���� ��� ��ȸ�� 1������Ű��

/*
    visitcount �÷��� number Ÿ���̹Ƿ� ��Ģ������ �����ϴ�.
*/
update board set visitcount = visitcount+1 where num=9;

commit;

--�Խù� �����ϱ�
select * from board order by num desc; --���� �Խù� Ȯ��

update board
    set title= '���ǿ���', content='�̳� ��̾���'
    where num=6;

select * from board where num = 6;

commit;

--�����ϱ�
delete from board where num=5; --�Ϸù�ȣ 5�� ����
commit;

--�Խ��� ����¡ ó���ϱ�.
select * from board;
select * from board order by num desc; --�Ϸ� ��ȣ�� ������������ ����
select num, title, rownum from board order by num desc; --rownum Ȯ��
--�Ϸ� ��ȣ�� ������������ ������ ���¿��� rownum �ο�
select Tb.*, rownum rNum from
    (select * from board order by num desc) Tb;
--������ ���ؼ� ��������(����¡ ó������ ����� ����������)
select * from (
    select Tb.*, rownum rNum from
        (select * from board order by num desc) Tb)
--where rNum between 1 and 10;
where rNum between 11 and 20;
--where rNum between 21 and 30;


--�˻��� ó���ϱ� : 'ó��-1'�� ���Ե� ��� ���ڵ� �˻�
select * from (
    select Tb.*, rownum rNum from
        (select * from board 
        where title like '%ó��-1%'
        order by num desc) Tb)
--where rNum between 1 and 10;
where rNum between 11 and 20;


--���� ���ε带 ���� ���̺� ����
drop table myfile;
create table myfile(
    idx number primary key,
    name varchar2(50) not null,
    title varchar2(200) not null,
    cate varchar2(100),
    ofile varchar2(100) not null,
    sfile varchar2(30) not null,
    postdate date default sysdate not null
);
commit;

--���� �����ȣ �����ϱ�(csv������ import)
create table zipcode(
    zipcode char(7),
    sido varchar2(10),
    gugun varchar2(50),
    dong varchar2(200),
    bunji varchar2(50),
    seq number 
);

--�õ� ��������
select * from zipcode;
select sido from zipcode;
--�õ��� �ߺ��� ������ �� ����Ʈ �ϱ�
select distinct sido from zipcode;

--��/�� ��������
select gugun from zipcode where sido='����';
select distinct gugun from zipcode where sido='����';
select distinct gugun from zipcode where sido='����';

--��2 ����� ��ȸ���� �ڷ���� �Խ��� �����

--���̺� ����
create table mvcboard(
    idx number primary key, --�Ϸù�ȣ
    name varchar2(50) not null, --�ۼ��ڸ�
    title varchar2(200) not null,
    content varchar2(2000) not null,
    postdate date default sysdate not null,
    ofile varchar2(200), --÷�������� ���� ���ϸ�
    sfile varchar2(30),  --������ ���� ����� ���ϸ�
    downcount number(5) default 0 not null, --���� �ٿ�ε� ī��Ʈ ��
    pass varchar2(50) not null, --��й�ȣ(����, �������� Ȯ���� ���� ���)
    visitcount number(5) default 0 not null --�Խù� ��ȸ��
);



--���̵����� �Է�
insert into mvcboard(idx, name, title, content, pass)
    values(seq_board_num.nextval, '������', '�ڷ�� ����1 �Դϴ�.','����','1234');
insert into mvcboard(idx, name, title, content, pass)
    values(seq_board_num.nextval, '�庸��', '�ڷ�� ����2 �Դϴ�.','����','1234');
insert into mvcboard(idx, name, title, content, pass)
    values(seq_board_num.nextval, '�̼���', '�ڷ�� ����3 �Դϴ�.','����','1234');
insert into mvcboard(idx, name, title, content, pass)
    values(seq_board_num.nextval, '������', '�ڷ�� ����4 �Դϴ�.','����','1234');
insert into mvcboard(idx, name, title, content, pass)
    values(seq_board_num.nextval, '������', '�ڷ�� ����5 �Դϴ�.','����','1234');

--Ŀ��

commit;

--�Խù� �� ī��Ʈ�ϱ�
select count(*) from mvcboard;
select count(*) from mvcboard where name like '%����%';

--����¡ ������ select ������
--�⺻ ����  : �ۼ����� ������������ ����
select * from mvcboard order by idx desc;
--rownum �߰��ϱ�
select Tb.*, rownum rNum from(
    select * from mvcboard order by idx desc) Tb;
--����¡ ������ ������ ������ �ϼ�
select * from(
    select Tb.*, rownum rNum from(
        select * from mvcboard order by idx desc) Tb)
--where rNum>=1 and rNum<=3;
--where rNum>=4 and rNum<=6;
where rNum between 1 and 3;
--�˻����� �߰��ϱ�
select * from(
    select Tb.*, rownum rNum from(
        select * from mvcboard 
        where title like '%����2%'
        order by idx desc) Tb)
where rNum>=1 and rNum<=3;


create user justcoding identified by 1234;
grant connect, resource to justcoding;


/**************************************/
/*
Spring �Խ��� ����1
    -JDBCTemplate���� �����Ѵ�.
    -��ȸ���� �Խ���
*/


--���̺� ����
create table springboard(
    idx number primary key,  /* �Ϸù�ȣ */
    name varchar2(30) not null, /* �ۼ��ڸ� */
    title varchar2(200) not null, /* ���� */
    contents varchar2(4000) not null, /* ���� */
    postdate date default sysdate, /* �ۼ��� */
    hits number default 0,  /* ��ȸ�� */
    bgroup number default 0,
    bstep number default 0,
    bindent number default 0,
    pass varchar2(30) /* ��й�ȣ */
);
-- ������ ����
create sequence springboard_seq
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;
--���̵����� �߰�
insert into springboard values (springboard_seq.nextval, '�ڽ���1',
    '�������Խ��� ù��° �Դϴ�.', '�����Դϴ�.', sysdate, 0,
    springboard_seq.nextval, 0, 0, '1234');
insert into springboard values (springboard_seq.nextval, '�ڽ���2',
    '�������Խ��� �ι�° �Դϴ�.', '�����Դϴ�.', sysdate, 0,
    springboard_seq.nextval, 0, 0, '1234');
insert into springboard values (springboard_seq.nextval, '�ڽ���3',
    '�������Խ��� ����° �Դϴ�.', '�����Դϴ�.', sysdate, 0,
    springboard_seq.nextval, 0, 0, '1234');
insert into springboard values (springboard_seq.nextval, '�ڽ���4',
    '�������Խ��� �׹�° �Դϴ�.', '�����Դϴ�.', sysdate, 0,
    springboard_seq.nextval, 0, 0, '1234');
insert into springboard values (springboard_seq.nextval, '�ڽ���5',
    '�������Խ��� �ټ���° �Դϴ�.', '�����Դϴ�.', sysdate, 0,
    springboard_seq.nextval, 0, 0, '1234');
    
select * from springboard;
commit;

/*****************************************************/
/*
Spring �Խ��� ����2
    -Mybatis�� ����
    -ȸ���� ����(���ٰԽ���) ����.  
*/
--���̺� ����(ȸ������ �����ϱ� ���� id�÷��� ����)
create table myboard (
    idx number primary key,
    id varchar2(30) not null,
    name varchar2(30) not null,
    contents varchar2(4000) not null
);
--������ ����
create sequence myboard_seq
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;
--���̵����� �Է�
insert into myboard values (myboard_seq.nextval, 'kosmo', '�ڽ���',
    '����1 �Խ��� �Դϴ�.');
insert into myboard values (myboard_seq.nextval, 'kosmo', '����',
    '����2 �Խ��� �Դϴ�.');
insert into myboard values (myboard_seq.nextval, 'kosmo', '�����',
    '����3 �Խ��� �Դϴ�.');
insert into myboard values (myboard_seq.nextval, 'kosmo', '����',
    '����4 �Խ��� �Դϴ�.');
commit;
select * from myboard;
select * from member;

--���� �Խ��� ����¡ ó�� ������
--between�� ���
select * from (
    select Tb.*, rownum rNum from (
        select * from myboard order by idx desc) Tb
    )
where rNum between 1 and 3;

--�� ������ ���
select * from (
    select Tb.*, rownum rNum from (
        select * from myboard order by idx desc) Tb
    )
where rNum >= 1 and rNum<= 3;

/*******************
Ʈ����� ó��
    : Ƽ�� ���ſ� ������ ���ÿ� �õ��Ѵ�.
*******************/
--Ƽ�� ���� �ݾ��� �Է��ϴ� ���̺�
create table transaction_pay (
    customerId varchar2(30) not null,
    amount number not null
);
--������ Ƽ���� �ż��� �Է��ϴ� ���̺�
--üũ �������ǿ� ���� 5���� �ʰ��ϸ� �����߻���
create table transaction_ticket (
    customerId varchar2(30) not null,
    countNum number(2) not null
        check(countNum<=5)
);
--������ �Է� �׽�Ʈ
--Ƽ�� 2���� �����ߴٰ� ����..
insert into transaction_ticket values ('kosmo', 2);
insert into transaction_pay values ('kosmo', 20000);

select * from transaction_ticket;
select * from transaction_pay;
--check�������� ����� ���� ���� �߻���
insert into transaction_ticket values ('error', 6);

/*
������ ��ť��Ƽ 3�ܰ� Ŀ������ ���� ���̺� ����
��ȸ�����̺� ������ �Ʒ� 4���� �÷��� �ʼ������� �־�� �ϰ�
�� ���� �÷�(name�̳� email)�� �ʿ信 ���� �߰��ϸ� �ȴ�.
*/
create table security_admin (
    user_id varchar2(30) primary key, --ȸ�����̵�
    user_pw varchar2(30) not null,    --�н�����
    authority varchar2(20) default 'ROLE_USER', --����
    enabled number(1) default 1       --Ȱ��ȭ����(0�̸� ��Ȱ��ȭ)
);
--���̵����� �Է�
insert into security_admin values ('kosmo_user1', '1234', 'ROLE_USER', 1); --�α��� ��
insert into security_admin values ('kosmo_user2', '1234', 'ROLE_USER', 0);  --�α��� �ȵ�
insert into security_admin values ('kosmo_admin1', '1234', 'ROLE_ADMIN', 1); --�α��� ��
insert into security_admin values ('kosmo_admin2', '1234', 'ROLE_ADMIN', 0); --�α��� �ȵ�

commit;





