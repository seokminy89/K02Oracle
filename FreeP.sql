--����, ��й�ȣ ����.
create user freep identified by 1234;

grant connect, resource to freep;

-- ���̺� ����.

--ȸ��(member) ���̺� ����

CREATE TABLE member (
	m_code number(10) PRIMARY KEY,
	id VARCHAR2(13) NOT NULL,
	name VARCHAR2(20) NOT NULL,
	pass VARCHAR2(13) NOT NULL,
	phone VARCHAR2(20) NOT NULL,
	email VARCHAR2(20) NOT NULL,
	zipcode VARCHAR2(10),
	address VARCHAR2(100),
	regidate date DEFAULT SYSDATE NOT NULL,
	grade number DEFAULT 1 NOT NULL, 
	point number(20) DEFAULT 0 NOT NULL,
	active number DEFAULT 1  NOT NULL
);
--���̺� ����
drop table member;

--ȸ�� ������ ����
create sequence seq_member_num 
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;
-- ���̵����� �Է�(member)
insert into member(m_code, id, name, pass, phone, email, zipcode, address, grade)
   VALUES (seq_member_num.nextval, 'admin1', '������1', '1111', '01011111111', 'test@gmail.com', '11111', '����� ��õ�� ���굿', '4');
insert into member(m_code, id, name, pass, phone, email, zipcode, address, grade)
   VALUES (seq_member_num.nextval, 'admin2', '������2', '1111', '01011111111', 'test@gmail.com', '11111', '����� ��õ�� ���굿', '3');
insert into member(m_code, id, name, pass, phone, email, zipcode, address, grade)
   VALUES (seq_member_num.nextval, 'test1', '��1', '1111', '01011111111', 'test@gmail.com', '11111', '����� ��õ�� ���굿', '1');   
insert into member(m_code, id, name, pass, phone, email, zipcode, address, grade)
   VALUES (seq_member_num.nextval, 'test2', '��2', '1111', '01011111111', 'test@gmail.com', '11111', '����� ��õ�� ���굿', '1');
insert into member(m_code, id, name, pass, phone, email, zipcode, address, grade)
   VALUES (seq_member_num.nextval, 'delivery1', '��޿�1', '1111', '01011111111', 'test@gmail.com', '11111', '����� ��õ�� ���굿', '2');
insert into member(m_code, id, name, pass, phone, email, zipcode, address, grade)
   VALUES (seq_member_num.nextval, 'delivery2', '��޿�2', '1111', '01011111111', 'test@gmail.com', '11111', '����� ��õ�� ���굿', '2');

--����(store) ���̺� ����
CREATE TABLE store (
   b_code NUMBER (5) PRIMARY KEY,
   b_name VARCHAR2(30) NOT NULL, 
   address VARCHAR2(100) NOT NULL, 
   latitude VARCHAR2(20) NOT NULL, 
   longitude VARCHAR2(20) NOT NULL, 
   phone VARCHAR2(20) NOT NULL
);

--���� ������ ����
create sequence seq_store_idx 
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;

--���̵����� �Է�(store)
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (seq_store_idx.nextval, '����', '����� ��õ�� ���굿', '222222222', '111111111', '0211111111');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (seq_store_idx.nextval, '�����', '����� ���ʱ� ��赿', '222222222', '111111111', '0211111111');
   

commit;
