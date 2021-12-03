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
commit;

