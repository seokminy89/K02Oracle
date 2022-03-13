--����, ��й�ȣ ����.
create user freep identified by 1234;

grant connect, resource to freep;


#ȸ��(member)���̺�

--ȸ�� ���̺� ����
CREATE TABLE member (
	m_code number(10) PRIMARY KEY,
	id VARCHAR2(20) NOT NULL,
	name VARCHAR2(20) NOT NULL,
	pass VARCHAR2(13) NOT NULL,
	phone VARCHAR2(20) NOT NULL,
	email VARCHAR2(50) NOT NULL,
	zipcode VARCHAR2(10),
	address VARCHAR2(100),
	regidate date DEFAULT SYSDATE NOT NULL,
	grade number DEFAULT 1 NOT NULL, 
	point number(20) DEFAULT 0 NOT NULL,
	active number DEFAULT 1  NOT NULL
);

--ȸ�� ������ ����
create sequence seq_member_num 
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;



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


? 3��7�� ���̵����� 
insert into member(m_code, id, name, pass, phone, email, zipcode, address, grade)
   VALUES (seq_member_num.nextval, 'admin1', '������1', '1111', '01011111111', 'testadmin1@gmail.com', '12345', '����� ��õ�� ����1��', '4');
insert into member(m_code, id, name, pass, phone, email, zipcode, address, grade)
   VALUES (seq_member_num.nextval, 'admin2', '������2', '1111', '01022222222', 'testadmin2@gmail.com', '13579', '����� ��õ�� ����2��', '3');
insert into member(m_code, id, name, pass, phone, email, zipcode, address, grade)
   VALUES (seq_member_num.nextval, 'test1', '��1', '1111', '01012345678', 'test1@gmail.com', '56789', '��⵵ ����� ���ϵ�', '1');   
insert into member(m_code, id, name, pass, phone, email, zipcode, address, grade)
   VALUES (seq_member_num.nextval, 'test2', '��2', '1111', '01024565443', 'test2@gmail.com', '23456', '����� ������ ������', '1');
insert into member(m_code, id, name, pass, phone, email, zipcode, address, grade)
   VALUES (seq_member_num.nextval, 'delivery1', '��޿�1', '1111', '01097875435', 'testdelivery1@gmail.com', '98074', '��⵵ ��õ�� ���̵�', '2');
insert into member(m_code, id, name, pass, phone, email, zipcode, address, grade)
   VALUES (seq_member_num.nextval, 'delivery2', '��޿�2', '1111', '01063345678', 'testdelivery2@gmail.com', '56708', '����� �߱� �湫��', '2');
==============================================================

#����(store)���̺�

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

--���� ���̵����� 
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (1, '����', '����Ư���� ��õ�� ���������2�� 123', '37.478714','126.878665','02-123-1234');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (2, '������', '����Ư���� ������ ���ﵿ 831-11', '37.4942635','127.0296699','02-124-1235');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (3, '��õ����', '����Ư���� ��õ�� ���굿 151-69', '37.4762052','126.8933986','02-234-5234');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (4, '������', '����Ư���� ���α� ���ε� 497-5', '37.5000384','126.8828494','02-212-9403');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (5, '������', '����Ư���� ���빮�� �Ͼ����� 209-30', '37.5605041','126.9512127','02-249-9540');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (6, '������', '����Ư���� ������ ������ 385-17', '37.550787', '126.912592','02-204-0954');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (7, '��������', '����Ư���� �������� ������ 133-15', '37.50966','126.904673','02-054-9530');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (8, '�����', '����Ư���� ��걸 ��ȿ��1�� 39-9', '37.5405032','126.9691858','02-153-7534');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (9, '������', '����Ư���� ���ʱ� ��躻�� 18-16', '37.4952967','126.9889993','02-647-2365');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (10, '������', '����Ư���� ������ ������ 394-41', '37.5502177','126.9153071','02-096-1504');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (11, '������', '����Ư���� ��õ�� �� 603-6', '37.5494106','126.8675998','02-425-7586');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (12, '������', '����Ư���� ���α� ���ǵ� 128-1', '37.577112','126.99766','02-105-4920');

insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (13, '����Ȧ��', '��õ������ ���� �־�3�� 1603-1', '37.443824','126.673017','032-493-2059');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (14, '���ϴ���', '��õ������ ���� ������ 198-32', '37.45157626','126.6557593','032-143-0232');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (15, '������', '��õ������ ���� ����2�� 577-14', '37.476022','126.709494','032-104-4932');
   
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (16, '��õ��', '��⵵ ��õ�� ���̱� ��1�� 1158-11', '37.50334207','126.7637937','032-102-3029');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (17, '�Ⱦ���', '��⵵ �Ⱦ�� ���ȱ� ���ȷ� 120', '37.38959826','126.9521795','031-300-2043');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (18, '������', '��⵵ ������ �д籸 ����1�� 89-7', '37.38163615','127.1282697','031-004-1432');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (19, '������', '��⵵ ����� ���4�� 83', '37.37410466','126.7334437','031-940-1411');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (20, '������', '��⵵ ����� ������ ��44-5', '37.41565','126.87895','02-234-9302');
   
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (21, '�¹���', '������ �¹�� �强�� 92-5', '37.09886232','129.0191345','033-049-3084');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (22, '������', '������ ������ ���� �󵿽���� 9-1', '37.136383','128.836149','033-392-0814');
   
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (23, '������', '��û���� ���ֽ� ��Ȳ�� 328', '36.44882075','127.120576','041-340-2021');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (24, '������', '��û���� ����� ������ 1541', '36.78126614','126.450733','041-494-1104');

insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (25, 'û����', '��û�ϵ� û�ֽ� ����� ����� 94', '36.62486354','127.4423189','043-390-0194');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (26, '������', '��û�ϵ� ���ֽ� ������ �յ��� 21-4', '37.0224929','128.0262237','043-303-9403');

insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (27, '������', '���������� ���� �⼺�� 229-6', '36.250736'	,'127.33621','042-030-0011');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (28, '�߱���', '���������� �߱� ��ȭ1�� 161-5', '36.30998894','127.4078018','042-043-9749');
  
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (29, '������', '��󳲵� ���ؽ� ������ �﹮�� 31-3', '35.20382','128.8092','055-045-4879');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (30, '������', '��󳲵� ���ֽ� ������ û�㸮 762', '35.24735','128.27347','055-294-3042');
   
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (31, '�ȵ���', '���ϵ� �ȵ��� ��� 1436-5', '36.561367','128.747798','054-309-1032');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (32, '������', '���ϵ� ���ֽ� õ�ϸ� ��Ƹ� 576-4', '35.919975','129.2449008','054-503-9020');   
   
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (33, '������', '�뱸������ ���� ���4�� 186-1', '35.87212319','128.5751549','053-943-2041'); 
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (34, '��������', '�뱸������ ������ �ߵ� 573-5', '35.84137047','128.6098821','053-493-2954'); 
   
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (35, '������', '���󳲵� ������ 43-14', '34.791093','126.383348','061-003-4308'); 
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (36, '������', '���󳲵� ������ ������ 460', '34.74148379','127.7276831','061-930-0312'); 
   
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (37, '��â��', '����ϵ� ��â�� ����� �ʳ��� 631-1', '35.388045','126.670124','063-920-9123');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (38, '������', '����ϵ� ���ֽ� �ϻ걸 ȿ�ڵ�1�� 579', '35.80369311','127.116927','063-123-8493');

insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (39, '������', '���ֱ����� ���� ���嵿 2', '35.15438611','126.9109556','062-264-3984');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (40, '���걸��', '���� ���걸 �������߾ӷ� 55', '35.19423259','126.791337','062-345-1240');

insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (41, '������', '��걤���� ���� ���� 247', '35.53851','129.33396','052-264-1284');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (42, '������', '��걤���� ���ֱ� �ﳲ�� �ݱ���� 675', '35.55377','129.11803','052-345-5943');
   
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (43, '�ؿ����', '�λ걤���� �ؿ�뱸 ���Ƿ� 19', '35.16655632','129.178066','051-124-5849');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (44, '������', '�λ걤���� ������ ������ ����8�� 235', '35.10438371','128.9220773','051-584-9540');
   
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (45, '������', '����Ư����ġ�� ��ġ���� �⳪���� 10', '36.601886914037365','127.2900686','044-483-9403');

insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (46, '��������', '����Ư����ġ�� �������� ����� 1651', '33.246471','126.506865','064-384-9840');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (47, '������', ' ����Ư����ġ�� ���ֽ� �ﵵ1�� 794-3', '33.50823534','126.5200254','064-948-3849');   
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (48, '���� 2ȣ��', '����Ư���� ��õ�� ����� ��õ�� ���������1�� 30', '33.50823534','126.5200254','02-023-3942');

 
--
--CREATE OR REPLACE FUNCTION RADIANS(V_DEGREES IN NUMBER)
--RETURN NUMBER DETERMINISTIC
--IS 
--BEGIN
--  /*
--  -- radians = degrees / (180 / pi)
--  -- RETURN nDegrees / (180 / ACOS(-1)); but 180/pi is a constant, so...
--  */
--    RETURN V_DEGREES / 57.29577951308232087679815481410517033235;
--END; 
--
--
--
--
--CREATE OR REPLACE FUNCTION DISTANCE_WGS84(H_LAT IN NUMBER, H_LOT IN NUMBER, T_LAT IN NUMBER, T_LOT IN NUMBER)
--RETURN NUMBER DETERMINISTIC
--IS
--BEGIN
--  RETURN ( 6371.0 * ACOS(
--    LEAST(1,
--     COS( RADIANS(H_LAT) ) * COS( RADIANS(T_LAT) )
--     * COS(RADIANS(T_LOT) - RADIANS(H_LOT) )
--     + SIN( RADIANS (H_LAT) ) * SIN(RADIANS( T_LAT) )                                    
--    )
--  ));
--END;


commit;
==============================================================
#����������(franchise)���̺�
--����������(franchise) ���̺� ����
CREATE TABLE franchise(
   f_code NUMBER PRIMARY KEY,
   f_name VARCHAR2(20) NOT NULL,
   f_phone VARCHAR2(20) NOT NULL,
   f_email VARCHAR2(50) NOT NULL,
   f_address VARCHAR2(100) NOT NULL, 
   f_content VARCHAR2(4000) NOT NULL,
   postdate date DEFAULT SYSDATE, 
   f_state VARCHAR2(20) DEFAULT 1 NOT NULL
);

--������ ������
create sequence seq_fran_idx 
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;
    
-- 
INSERT into Franchise(f_code, f_name, f_phone, f_email, f_address, f_content) 
  		VALUES (seq_fran_idx.nextval, '�����', '01054754452', 'rlaqnwk123@gmail.com', '����-��õ��', '����Ư���� ��õ���� ������ ���ǵ帳�ϴ�.');

INSERT into Franchise(f_code, f_name, f_phone, f_email, f_address, f_content) 
  		VALUES (seq_fran_idx.nextval, '�̼���', '01053512433', 'dltjddyd123@nate.com', '����-������', '����Ư���� �������� ������ ���ǵ帳�ϴ�.');

INSERT into Franchise(f_code, f_name, f_phone, f_email, f_address, f_content) 
  		VALUES (seq_fran_idx.nextval, '�ڽÿ�', '01010234943', 'qkrtldnjs123@hotmail.com', '����-���Ǳ�', '����Ư���� ���Ǳ��� ������ ���ǵ帳�ϴ�.');

INSERT into Franchise(f_code, f_name, f_phone, f_email, f_address, f_content) 
  		VALUES (seq_fran_idx.nextval, '������', '01068403342', 'rnjsgurwns123@hanmail.net', '����-���α�', '����Ư���� ���α��� ������ ���ǵ帳�ϴ�.');

INSERT into Franchise(f_code, f_name, f_phone, f_email, f_address, f_content) 
  		VALUES (seq_fran_idx.nextval, '������', '01034448784', 'chldmsrn123@naver.com', '����-����', '����Ư���� ���򱸿� ������ ���ǵ帳�ϴ�.');


==============================================================
#��ǰ����(goods)���̺�
--��ǰ���� ���̺� ����
CREATE TABLE goods (
	g_code number PRIMARY KEY,
	g_name VARCHAR2(50)
);

--������ 
INSERT INTO goods(g_code, g_name) VALUES (1, '�⺻����');
INSERT INTO goods(g_code, g_name) VALUES (2, '����');
INSERT INTO goods(g_code, g_name) VALUES (3, '�ҽ�');
INSERT INTO goods(g_code, g_name) VALUES (4, '����');
INSERT INTO goods(g_code, g_name) VALUES (5, '���̵�');
INSERT INTO goods(g_code, g_name) VALUES (6, '����');
INSERT INTO goods(g_code, g_name) VALUES (9, 'diy����');


--��ǰ�ڵ�� ������ ���� 
--���� NEXTVAL(sq_pizza)


create sequence sq_pizza
    increment by 1
    start with 11110050
    minvalue 11110050
    maxvalue 11119999
    nocycle
    nocache;

create sequence sq_dough
    increment by 1
    start with 22220050
    minvalue 22220050
    maxvalue 22229999
    nocycle
    nocache;

create sequence sq_sauce
    increment by 1
    start with 33330050
    minvalue 33330050
    maxvalue 33339999
    nocycle
    nocache;


create sequence sq_topping
    increment by 1
    start with 44440050
    minvalue 44440050
    maxvalue 44449999
    nocycle
    nocache;


create sequence sq_side
    increment by 1
    start with 55550050
    minvalue 55550050
    maxvalue 55559999
    nocycle
    nocache;

create sequence sq_drink
    increment by 1
    start with 66660050
    minvalue 66660050
    maxvalue 66669999
    nocycle
    nocache;

create sequence sq_diy
    increment by 1
    start with 99990001
    minvalue 99990001
    maxvalue 99999999
    nocycle
    nocache;
==============================================================
#��ü��ǰ(product)���̺�
CREATE TABLE product(
	g_code number ,
	p_code number(10) PRIMARY KEY, 
	p_name VARCHAR2(60) NOT NULL,
	p_price VARCHAR2(20) NOT NULL,
	p_size VARCHAR2(5) NOT NULL,
	p_info VARCHAR2(20) NOT NULL,
	p_ofile VARCHAR2(30),
p_sfile VARCHAR2(200),
	p_best_pizza number DEFAULT 0 NOT NULL
);
--�ܷ�Ű ����
ALTER TABLE product ADD constraint fk_product_goods
	FOREIGN KEY (g_code) REFERENCES goods (g_code);



--�Ϲ�����
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (1, 11110001, '�Ұ������', '6900', 'M', '1143', 'normal_11110001.png', 'normal_11110001.png');
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (1, 11110002, '�Ұ������', '9900', 'L', '1764', 'normal_11110001.png', 'normal_11110001.png');
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (1, 11110003, '�޺���̼�����', '6900', 'M', '1152', 'normal_11110002.png', 'normal_11110002.png');
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (1, 11110004, '�޺���̼�����', '9900', 'L', '1776', 'normal_11110002.png', 'normal_11110002.png');
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (1, 11110005, '���۷δ�����', '6900', 'M', '1127', 'normal_11110003.png', 'normal_11110003.png');
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (1, 11110006, '���۷δ�����', '9900', 'L', '1992', 'normal_11110003.png', 'normal_11110003.png');
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (1, 11110007, '������������', '7900', 'M', '1200', 'normal_11110004.png', 'normal_11110004.png');
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (1, 11110008, '������������', '10900', 'L', '2024', 'normal_11110004.png', 'normal_11110004.png');
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (1, 11110101, '��Ż����ġ������', '5900', 'M', '1020', 'normal_11110005.png', 'normal_11110005.png');
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (1, 11110102, '��Ż����ġ������', '8900', 'L', '1700', 'normal_11110005.png', 'normal_11110005.png');
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (1, 11110103, '������ũ�Ұ�������', '8900', 'M', '1437', 'normal_11110006.png', 'normal_11110006.png');
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (1, 11110104, '������ũ�Ұ�������', '13900', 'L', '2048', 'normal_11110006.png', 'normal_11110006.png');
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (1, 11110105, '�Ͽ��̾Ƚ���������', '9900', 'M', '1464', 'normal_11110007.png', 'normal_11110007.png');
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (1, 11110106, '�Ͽ��̾Ƚ���������', '14900', 'L', '2150', 'normal_11110007.png', 'normal_11110007.png');
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (1, 11110201, '�һ�����', '10900', 'M', '1508', 'normal_11110008.png', 'normal_11110008.png');
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (1, 11110202, '�һ�����', '16900', 'L', '2208', 'normal_11110008.png', 'normal_11110008.png');
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (1, 11110203, '�ٺ�ťġŲ����', '10900', 'M', '1989', 'normal_11110009.png', 'normal_11110009.png');
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (1, 11110204, '�ٺ�ťġŲ����', '16900', 'L', '2696', 'normal_11110009.png', 'normal_11110009.png');
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (1, 11110205, '�������ν�ī������', '13900', 'M', '1986', 'normal_11110010.png', 'normal_11110010.png');
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (1, 11110206, '�������ν�ī������', '18900', 'L', '2706', 'normal_11110010.png', 'normal_11110010.png');
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (1, 11110301, '����ġ����ź����', '15900', 'M', '2128', 'normal_11110011.png', 'normal_11110011.png');
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (1, 11110302, '����ġ����ź����', '21900', 'L', '3076', 'normal_11110011.png', 'normal_11110011.png');
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (1, 11110303, 'ġ����������', '16900', 'M', '2844', 'normal_11110012.png', 'normal_11110012.png');
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (1, 11110304, 'ġ����������', '22900', 'L', '3744', 'normal_11110012.png', 'normal_11110012.png');


--DIY���� ���
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (2, 22220001, '�⺻����', '3000', 'M', '150', 'dough_22220001.png', 'dough_22220001.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (2, 22220002, '�⺻����', '5000', 'L', '200', 'dough_22220001.png', 'dough_22220001.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (2, 22220003, '������', '3000', 'M', '100', 'dough_22220002.png', 'dough_22220002.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (2, 22220004, '������', '5000', 'L', '150', 'dough_22220002.png', 'dough_22220002.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (2, 22220005, '��������', '2000', 'M', '200', 'dough_22220003.png', 'dough_22220003.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (2, 22220006, '��������', '4000', 'L', '300', 'dough_22220003.png', 'dough_22220003.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (2, 22220007, 'ġ���', '2000', 'M', '200', 'dough_22220004.png', 'dough_22220004.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (2, 22220008, 'ġ���', '4000', 'L', '300', 'dough_22220004.png', 'dough_22220004.png');					
					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (3, 33330001, '�丶��ҽ�', '1000', 'M', '25', 'source_33330001.png', 'source_33330001.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (3, 33330002, '�ٺ�ť�ҽ�', '1000', 'M', '36', 'source_33330002.png', 'source_33330002.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (3, 33330003, 'ũ���ҽ�', '1000', 'M', '36', 'source_33330003.png', 'source_33330003.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (3, 33330004, 'ĥ���ҽ�', '1000', 'M', '29', 'source_33330004.png', 'source_33330004.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (3, 33330005, '�����ҽ�', '1000', 'M', '34', 'source_33330005.png', 'source_33330005.png');					
					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440001, '�丶��', '1000', 'M', '20', 'topping_44440001.png', 'topping_44440001.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440002, '�丶��', '2000', 'L', '30', 'topping_44440001.png', 'topping_44440001.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440003, '�Ǹ�', '1000', 'M', '13', 'topping_44440002.png', 'topping_44440002.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440004, '�Ǹ�', '2000', 'L', '24', 'topping_44440002.png', 'topping_44440002.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440005, '������ī', '1000', 'M', '15', 'topping_44440003.png', 'topping_44440003.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440006, '������ī', '2000', 'L', '25', 'topping_44440003.png', 'topping_44440003.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440007, '����', '1000', 'M', '21', 'topping_44440004.png', 'topping_44440004.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440008, '����', '2000', 'L', '33', 'topping_44440004.png', 'topping_44440004.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440009, '����', '1000', 'M', '10', 'topping_44440005.png', 'topping_44440005.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440010, '����', '2000', 'L', '17', 'topping_44440005.png', 'topping_44440005.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440011, '����ݸ�', '1000', 'M', '8', 'topping_44440006.png', 'topping_44440006.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440012, '����ݸ�', '2000', 'L', '12', 'topping_44440006.png', 'topping_44440006.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440013, '�ñ�ġ', '1000', 'M', '14', 'topping_44440007.png', 'topping_44440007.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440014, '�ñ�ġ', '2000', 'L', '25', 'topping_44440007.png', 'topping_44440007.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440015, '����', '1000', 'M', '5', 'topping_44440008.png', 'topping_44440008.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440016, '����', '2000', 'L', '9', 'topping_44440008.png', 'topping_44440008.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440017, '����', '1000', 'M', '12', 'topping_44440009.png', 'topping_44440009.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440018, '����', '2000', 'L', '25', 'topping_44440009.png', 'topping_44440009.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440019, '����', '1000', 'M', '120', 'topping_44440010.png', 'topping_44440010.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440020, '����', '2000', 'L', '210', 'topping_44440010.png', 'topping_44440010.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440021, '�ø���', '1000', 'M', '20', 'topping_44440011.png', 'topping_44440011.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440022, '�ø���', '2000', 'L', '30', 'topping_44440011.png', 'topping_44440011.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440023, '���ξ���', '1000', 'M', '42', 'topping_44440012.png', 'topping_44440012.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440024, '���ξ���', '2000', 'L', '65', 'topping_44440012.png', 'topping_44440012.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440025, '����Ʈ��', '1000', 'M', '43', 'topping_44440013.png', 'topping_44440013.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440026, '����Ʈ��', '2000', 'L', '68', 'topping_44440013.png', 'topping_44440013.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440027, '���۷δ�', '2000', 'M', '112', 'topping_44440014.png', 'topping_44440014.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440028, '���۷δ�', '3000', 'L', '125', 'topping_44440014.png', 'topping_44440014.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440029, '����', '2000', 'M', '52', 'topping_44440015.png', 'topping_44440015.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440030, '����', '3000', 'L', '74', 'topping_44440015.png', 'topping_44440015.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440031, '������', '2000', 'M', '89', 'topping_44440016.png', 'topping_44440016.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440032, '������', '3000', 'L', '113', 'topping_44440016.png', 'topping_44440016.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440033, '�߰�����', '2000', 'M', '36', 'topping_44440017.png', 'topping_44440017.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440034, '�߰�����', '3000', 'L', '57', 'topping_44440017.png', 'topping_44440017.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440035, '�Ƚ�', '2000', 'M', '39', 'topping_44440018.png', 'topping_44440018.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440036, '�Ƚ�', '3000', 'L', '58', 'topping_44440018.png', 'topping_44440018.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440037, '����', '2000', 'M', '45', 'topping_44440019.png', 'topping_44440019.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440038, '����', '3000', 'L', '62', 'topping_44440019.png', 'topping_44440019.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440039, '�Ұ��', '2000', 'M', '83', 'topping_44440020.png', 'topping_44440020.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440040, '�Ұ��', '3000', 'L', '102', 'topping_44440020.png', 'topping_44440020.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440041, 'ü��ġ��', '3000', 'M', '57', 'topping_44440021.png', 'topping_44440021.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440042, 'ü��ġ��', '5000', 'L', '94', 'topping_44440021.png', 'topping_44440021.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440043, '��¥����ġ��', '3000', 'M', '64', 'topping_44440022.png', 'topping_44440022.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440044, '��¥����ġ��', '5000', 'L', '86', 'topping_44440022.png', 'topping_44440022.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440045, '����Ÿġ��', '3000', 'M', '45', 'topping_44440023.png', 'topping_44440023.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440046, '����Ÿġ��', '5000', 'L', '67', 'topping_44440023.png', 'topping_44440023.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440047, '��������ġ��', '3000', 'M', '65', 'topping_44440024.png', 'topping_44440024.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440048, '��������ġ��', '5000', 'L', '89', 'topping_44440024.png', 'topping_44440024.png');					

--���̵�޴�					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (5, 55550001, '���ȷ���', '8900', 'M', '752', 'side_55550001.png', 'side_55550001.png');
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (5, 55550002, 'ġŲ�ٴ�', '6000', 'M', '627', 'side_55550002.png', 'side_55550002.png');	
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (5, 55550003, '��������', '6000', 'M', '719', 'side_55550003.png', 'side_55550003.png');	
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (5, 55550004, 'ġ����콺�İ�Ƽ', '5000', 'M', '549', 'side_55550004.png', 'side_55550004.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (5, 55550005, '�Ұ�⽺�İ�Ƽ', '5500', 'M', '578', 'side_55550005.png', 'side_55550005.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (5, 55550006, 'ũ�����İ�Ƽ', '5000', 'M', '524', 'side_55550006.png', 'side_55550006.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (5, 55550007, '���ٽ�', '8000', 'M', '778', 'side_55550007.png', 'side_55550007.png');	
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (5, 55550008, '�׶���', '7000', 'M', '633', 'side_55550008.png', 'side_55550008.png');				

--���� & ��Ÿ				
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (6, 66660001, '���̴�', '1500', 'M', '228', 'etc_66660001.png', 'etc_66660001.png');	
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (6, 66660002, '���̴�', '2000', 'L', '660', 'etc_66660002.png', 'etc_66660002.png');	
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (6, 66660003, '�ݶ�', '1500', 'M', '216', 'etc_66660003.png', 'etc_66660003.png');	
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (6, 66660004, '�ݶ�', '2000', 'L', '660', 'etc_66660004.png', 'etc_66660004.png');	
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (6, 66660005, '�����ݶ�', '1500', 'M', '0', 'etc_66660005.png', 'etc_66660005.png');	
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (6, 66660006, '�����ݶ�', '2000', 'L', '0', 'etc_66660006.png', 'etc_66660006.png');	
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (6, 66660007, '��Ŭ', '500', 'M', '40', 'etc_66660007.png', 'etc_66660007.png');		
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (6, 66660008, '�ּҽ�', '500', 'M', '21', 'etc_66660008.png', 'etc_66660008.png');	
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (6, 66660009, 'ĥ������ҽ�', '500', 'M', '34', 'etc_66660009.png', 'etc_66660009.png');	
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (6, 66660010, '��ġ�巹�̼ҽ�', '500', 'M', '29', 'etc_66660010.png', 'etc_66660010.png');
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (6, 66660011, '�������μҽ�', '500', 'M', '32', 'etc_66660011.png', 'etc_66660011.png');
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (6, 66660012, '�ӽ�Ÿ��ҽ�', '500', 'M', '27', 'etc_66660012.png', 'etc_66660012.png');

commit;
==============================================================
#DIY����(diy)���̺�
CREATE TABLE diy(
	g_code number,
	diy_idx number(10) PRIMARY KEY,
	dough number(10) NOT NULL,
	sauce number(10) NOT NULL,
	topping1 number(10) NOT NULL,
	topping2 number(10),
	topping3 number(10),
	topping4 number(10),
	topping5 number(10),
	d_name  VARCHAR2(100),
	d_price number(20)  NOT NULL,
	d_ofile VARCHAR2(30),
d_sfile VARCHAR2(200)
);
--�ܷ�Ű ����
ALTER TABLE diy ADD constraint fk_diy_goods
	FOREIGN KEY (g_code) REFERENCES goods (g_code);

?������ ����
create sequence sq_diy_idx
    increment by 1
    start with 99990000
    minvalue 99990000
    maxvalue 99999999
    nocycle
    nocache;

insert into diy(g_code, diy_idx, dough, sauce, topping1, d_price)
   VALUES (9, sq_diy_idx.nextval, 22220000, 33330000, 44440000, 20000); 
insert into diy(g_code, diy_idx, dough, sauce, topping1, d_price, d_name)
   VALUES (9, sq_diy_idx.nextval, 22220001, 33330000, 44440001, 20000, '������ DIY');


==============================================================
#��ٱ���(cart)���̺�

--��ٱ��� ���̺� ����
CREATE TABLE cart (
	ct_idx NUMBER PRIMARY KEY,
	m_code NUMBER,
	ct_code NUMBER NOT NULL,
	ct_name VARCHAR2(200) NOT NULL,
	ct_count NUMBER DEFAULT 1 NOT NULL
);
--�ܷ�Ű ����
ALTER TABLE cart ADD constraint fk_cart_member
	FOREIGN KEY (m_code) REFERENCES member (m_code);

--������ ����
create sequence seq_ct_idx
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;

insert into cart(ct_idx, m_code, ct_code, ct_name, ct_count)
   VALUES (seq_ct_idx.nextval, 1, 11110001, '�Ұ������', 1);

insert into cart(ct_idx, m_code, ct_code, ct_name, ct_count)
   VALUES (seq_ct_idx.nextval, 1, 11110007, '������������', 1);      
insert into cart(ct_idx, m_code, ct_code, ct_name, ct_count)
   VALUES (seq_ct_idx.nextval, 2, 66660000, '�����ݶ�', 1);   
insert into cart(ct_idx, m_code, ct_code, ct_name, ct_count)
   VALUES (seq_ct_idx.nextval, 2, 55550000, '���ȷ���', 1); 
insert into cart(ct_idx, m_code, ct_code, ct_name, ct_count)
   VALUES (seq_ct_idx.nextval, 2, 99990000, '������diy����', 1);  

? 220307 ct_name varchar2 �� ����
alter table cart modify ct_name varchar2(200);


==============================================================
#�ֹ�(order_product)���̺�

--�ֹ� ���̺� ����
CREATE TABLE order_product (
	op_idx NUMBER PRIMARY KEY,
	or_idx NUMBER NOT NULL,
	code NUMBER,
	p_price VARCHAR2(20) NOT NULL,
	p_count NUMBER NOT NULL
);
--�ܷ�Ű ����
ALTER TABLE order_product ADD constraint fk_op_ordered
	FOREIGN KEY (or_idx) REFERENCES ordered (or_idx);

--������ ����
create sequence seq_op_idx
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;
    
-- ���̵�����
insert into order_product(op_idx, or_idx, code, p_count, p_price)
	values(SEQ_OP_IDX.nextval,  '25', '55550002', '1' ,'6000');
insert into order_product(op_idx, or_idx, code, p_count, p_price)
	values(SEQ_OP_IDX.nextval,  '25', '66660002', '1' ,'2000');
insert into order_product(op_idx, or_idx, code, p_count, p_price)
	values(SEQ_OP_IDX.nextval,  '25', '11110303', '1' ,'16900');

insert into order_product(op_idx, or_idx, code, p_count, p_price)
	values(SEQ_OP_IDX.nextval,  '26', '99990031', '1' ,'10000');
insert into order_product(op_idx, or_idx, code, p_count, p_price)
	values(SEQ_OP_IDX.nextval,  '26', '55550008', '2' ,'7000');
insert into order_product(op_idx, or_idx, code, p_count, p_price)
	values(SEQ_OP_IDX.nextval,  '26', '66660007', '2' ,'500');

insert into order_product(op_idx, or_idx, code, p_count, p_price)
	values(SEQ_OP_IDX.nextval,  '27', '99990032', '1' ,'10000');
insert into order_product(op_idx, or_idx, code, p_count, p_price)
	values(SEQ_OP_IDX.nextval,  '27', '55550007', '3' ,'8000');
insert into order_product(op_idx, or_idx, code, p_count, p_price)
	values(SEQ_OP_IDX.nextval,  '27', '66660011', '2' ,'500');


    
==============================================================
#�ֹ��Ϸ�(ordered)���̺�
--�ֹ��Ϸ� ���̺� ����
CREATE TABLE ordered (
	or_idx NUMBER PRIMARY KEY,
	m_code NUMBER NOT NULL,
	b_code NUMBER NOT NULL,
	or_date DATE DEFAULT SYSDATE NOT NULL,
	origin_price NUMBER NOT NULL,
	cp_price NUMBER DEFAULT 0,
	po_price NUMBER DEFAULT 0,
	total_price NUMBER NOT NULL,
	credit VARCHAR2(20) NOT NULL,
	state VARCHAR2(20) DEFAULT 1 NOT NULL
);
? 3��2�� ���̺� ����
ALTER TABLE ordered ADD(name varchar2(20));
ALTER TABLE ordered ADD(phone varchar2(20));
ALTER TABLE ordered ADD(request varchar2(200));

?3��3�� ���̺� ����
ALTER TABLE ordered ADD(orderhow varchar2(10));
ALTER TABLE ordered ADD(pickup_time varchar2(50));

commit;

--�ܷ�Ű ����
ALTER TABLE ordered ADD constraint fk_ordered_member
	FOREIGN KEY (m_code) REFERENCES member (m_code);	
ALTER TABLE ordered ADD constraint fk_ordered_store
	FOREIGN KEY (b_code) REFERENCES store (b_code);
--������ ����
create sequence seq_or_idx
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;

?���̺� �߰��Ȱ� ���Ƽ� ���̵����� �ٲ�ߵǴµ� ��
insert into ordered(or_idx, m_code, b_code, origin_price, total_price, credit)
   VALUES (seq_or_idx.nextval, '4', '1', '23000', '20000', '1');
insert into ordered(or_idx, m_code, b_code, origin_price, total_price, credit)
   VALUES (seq_or_idx.nextval, '5', '1', '23000', '20000', '1');
insert into ordered(or_idx, m_code, b_code, origin_price, total_price, credit)
   VALUES (seq_or_idx.nextval, '11', '2', '23000', '20000', '1');
insert into ordered(or_idx, m_code, b_code, origin_price, total_price, credit)
   VALUES (seq_or_idx.nextval, '12', '2', '23000', '20000', '1');
   
   
--�ÿ��� ���̵����� 
INSERT INTO ordered (or_idx, m_code, b_code, origin_price, cp_price,
		 po_price, total_price, credit,name,phone,request, orderhow, pickup_time)
		VALUES
		(seq_or_idx.nextval, '7', '4', '24900','0', 
		'0', '24900', '21', '������', '01012361822', '�� �տ� ���� �ּ���.','D', null);
INSERT INTO ordered (or_idx, m_code, b_code, origin_price, cp_price,
		 po_price, total_price, credit,name,phone,request, orderhow, pickup_time)
		VALUES
		(seq_or_idx.nextval, '5', '3', '25000','0', 
		'1000', '24000', '21', '������', '01012361822', '�� �տ� ���� �ּ���.','P',  '17��~19��');
INSERT INTO ordered (or_idx, m_code, b_code, origin_price, cp_price,
		 po_price, total_price, credit,name,phone,request, orderhow, pickup_time)
		VALUES
		(seq_or_idx.nextval, '6', '1', '35000','3000', 
		'5000', '24000', '221', '������', '01012361822', '���� ������ �����ּ���.','P',  '17��~19��');
INSERT INTO ordered (or_idx, m_code, b_code, origin_price, cp_price,
		 po_price, total_price, credit,name,phone,request, orderhow, pickup_time)
		VALUES
		(seq_or_idx.nextval, '3', '4', '24900','0', 
		'0', '24900', '21', '������', '01012361822', '�� �տ� ���� �ּ���.','D', null);
INSERT INTO ordered (or_idx, m_code, b_code, origin_price, cp_price,
		 po_price, total_price, credit,name,phone,request, orderhow, pickup_time)
		VALUES
		(seq_or_idx.nextval, '4', '3', '25000','0', 
		'1000', '24000', '21', '������', '01012361822', '�� �տ� ���� �ּ���.','P',  '17��~19��');
INSERT INTO ordered (or_idx, m_code, b_code, origin_price, cp_price,
		 po_price, total_price, credit,name,phone,request, orderhow, pickup_time)
		VALUES
		(seq_or_idx.nextval, '3', '1', '35000','3000', 
		'5000', '24000', '221', '������', '01012361822', '���� ������ �����ּ���.','P',  '17��~19��');
INSERT INTO ordered (or_idx, m_code, b_code, origin_price, cp_price,
		 po_price, total_price, credit,name,phone,request, orderhow, pickup_time)
		VALUES
		(seq_or_idx.nextval, '4', '4', '24900','0', 
		'0', '24900', '21', '������', '01012361822', '�� �տ� ���� �ּ���.','D', null);
INSERT INTO ordered (or_idx, m_code, b_code, origin_price, cp_price,
		 po_price, total_price, credit,name,phone,request, orderhow, pickup_time)
		VALUES
		(seq_or_idx.nextval, '5', '3', '25000','0', 
		'1000', '24000', '21', '������', '01012361822', '�� �տ� ���� �ּ���.','P',  '17��~19��');


==============================================================
#����(coupon)���̺�

--���� ���̺� ����
CREATE TABLE coupon (
	cp_idx NUMBER PRIMARY KEY,
	cp_name VARCHAR2(20) NOT NULL,
	cp_cate VARCHAR2(50) NOT NULL,
	cp_ofile VARCHAR2(30),
	cp_sfile VARCHAR2(200),
	issue_date DATE DEFAULT SYSDATE NOT NULL,
	expire_date DATE DEFAULT SYSDATE+30 NOT NULL,
	cp_price NUMBER NOT NULL,
	cp_const NUMBER
);

--������ ����
create sequence seq_cp_idx
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;

insert into coupon(cp_idx, cp_name, cp_cate, cp_ofile, cp_sfile, cp_price, cp_const)
   VALUES (seq_cp_idx.nextval, '������������', '15000�� �̻� ���Ž� 3000�� ����', 'ofilename.png', 'sfilename.png', '3000', '15000');
insert into coupon(cp_idx, cp_name, cp_cate, cp_ofile, cp_sfile, cp_price, cp_const)
   VALUES (seq_cp_idx.nextval, '����!����', '20000�� �̻� ���Ž� 5000�� ����', 'ofilename.png', 'sfilename.png', '5000', '20000');
insert into coupon(cp_idx, cp_name, cp_cate, cp_ofile, cp_sfile, cp_price, cp_const)
   VALUES (seq_cp_idx.nextval, '����Ʈ����', '50000�� �̻� ���Ž� 8000�� ����', 'ofilename.png', 'sfilename.png', '8000', '50000');




==============================================================
#������ ����(mycoupon)���̺�

--������ ���� ���̺� ����
CREATE TABLE mycoupon (
	coupon_idx NUMBER PRIMARY KEY,
	m_code NUMBER NOT NULL,
	cp_idx NUMBER NOT NULL
);
--�ܷ�Ű ����
ALTER TABLE mycoupon ADD constraint fk_mycoupon_member
	FOREIGN KEY (m_code) REFERENCES member (m_code);
	
ALTER TABLE mycoupon ADD constraint fk_mycoupon_coupon
	FOREIGN KEY (cp_idx) REFERENCES coupon (cp_idx);

--������ ����
create sequence seq_coupon_idx
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;

insert into mycoupon(coupon_idx, m_code, cp_idx)
   VALUES (seq_coupon_idx.nextval, '1', '1');
insert into mycoupon(coupon_idx, m_code, cp_idx)
   VALUES (seq_coupon_idx.nextval, '1', '2');
insert into mycoupon(coupon_idx, m_code, cp_idx)
   VALUES (seq_coupon_idx.nextval, '1', '3');
insert into mycoupon(coupon_idx, m_code, cp_idx)
   VALUES (seq_coupon_idx.nextval, '2', '3');


--�ÿ���
insert into mycoupon(coupon_idx, m_code, cp_idx)
   VALUES (seq_coupon_idx.nextval, '5', '1');
insert into mycoupon(coupon_idx, m_code, cp_idx)
   VALUES (seq_coupon_idx.nextval, '5', '2');
insert into mycoupon(coupon_idx, m_code, cp_idx)
   VALUES (seq_coupon_idx.nextval, '5', '3');











==============================================================
#�Խ���(board)���̺�

--�Խ���(board) ���̺� ����
CREATE TABLE board (
    b_idx NUMBER PRIMARY KEY,
    m_code NUMBER (10) NOT NULL, 
    b_cate NUMBER  NOT NULL, 
    title VARCHAR2(200) NOT NULL,  
    contents VARCHAR2(4000) NOT NULL, 
    postdate date DEFAULT SYSDATE, 
    hits number DEFAULT 0 NOT NULL,
    writer VARCHAR2(20) NOT NULL, 
    ofile VARCHAR2(30), 
    sfile VARCHAR2(200), 
    ofile2 VARCHAR2(30), 
    sfile2 VARCHAR2(200), 
    q_category NUMBER 
);

--�̸�����ѻ�� ���̺� ������ ����
alter table board add ofile2 varchar2(30);
alter table board add sfile2  varchar2(200);

create sequence seq_board_num 
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;

--�ܷ�Ű ����
ALTER TABLE board  ADD constraint member_board_fk
   FOREIGN KEY (m_code)  REFERENCES member (m_code);




==============================================================
#����Խ���(reviewboard)���̺�

--����Խ���(reviewboard) ���̺� ����
CREATE TABLE reviewboard (
    rv_idx NUMBER PRIMARY KEY ,
    m_code NUMBER(10) NOT NULL, 
    title VARCHAR2(200) NOT NULL,  
    contents VARCHAR2(4000) NOT NULL, 
    writer VARCHAR2(20) NOT NULL, 
    postdate date DEFAULT SYSDATE, 
    hits NUMBER DEFAULT 0 NOT NULL,
    rv_ofile1 VARCHAR2(30), 
    rv_sfile1 VARCHAR2(200),
    rv_ofile2 VARCHAR2(30), 
    rv_sfile2 VARCHAR2(200),
    rv_ofile3 VARCHAR2(30), 
    rv_sfile3 VARCHAR2(200),

    or_idx NUMBER , 
    rv_best NUMBER  DEFAULT 0 
);

create sequence seq_reviewboard_idx 
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;

--�ܷ�Ű ����
ALTER TABLE reviewboard ADD constraint member_reviewboard_fk
   FOREIGN KEY (m_code) REFERENCES member (m_code);
ALTER TABLE reviewboard ADD constraint ordered_reviewboard_fk
   FOREIGN KEY (or_idx) REFERENCES ordered (or_idx);


--ordered ���̺� ������ �־�� ���԰��� (or_idx) �ܷ�Ű����
insert into reviewboard(rv_idx, m_code, title, contents, writer, rv_ofile1, rv_sfile1, or_idx)
    values (seq_reviewboard_idx.nextval, 2, '������ ����1', '������ ���� ���־��~', '��Ű', 'pizzareview1.jpg','pizzareview1.jpg', 1);
insert into reviewboard(rv_idx, m_code, title, contents, writer, rv_ofile1, rv_sfile1, or_idx)
    values (seq_reviewboard_idx.nextval, 3, '������ ����2', '������ ���� ���־��~', '�ܺ�', 'pizzareview2.jpg','pizzareview2.jpg', 2);
insert into reviewboard(rv_idx, m_code, title, contents, writer, rv_ofile1, rv_sfile1, or_idx)
    values (seq_reviewboard_idx.nextval, 4, '������ ����3', '������ ���� ���־��~', '�ƽ�', 'pizzareview3.jpg','pizzareview3.jpg', 3);
insert into reviewboard(rv_idx, m_code, title, contents, writer, rv_ofile1, rv_sfile1, or_idx)
    values (seq_reviewboard_idx.nextval, 4, '������ ����4', '������ ���� ���־��~', '����', 'pizzareview4.jpg','pizzareview4.jpg', 4);


insert into reviewboard(rv_idx, m_code, title, contents, writer, rv_ofile1, rv_sfile1, rv_ofile2, rv_sfile2, rv_ofile3, rv_sfile3, or_idx)
    values (seq_reviewboard_idx.nextval, 7, '������ ���� ���� ������ �����Դϴ�.', '���� ��õ���� �������ڸ� ó�� ���ѸԾ�ý��ϴ�. DIY���ڶ�°� ���� �ż��߾����� ������ ������ ���ؾ��� ó�� ���ڸ� �ް� ����ڸ��� 2�� ������ϴ�. ù°�� ���� �����ߴ� ���ڸ� ���Ƿ� ����� ���� �ð��ȿ� ������ּż� 
        ����� �Ѥ��� ��û�� ���ξ�� ���� ������ϴ�. �� ���ĺ��ʹ� ���ž��� �Ա⸸ �ߴ��� ���׿�... ���̵�� �ֹ��� ġ����콺�İ�Ƽ, ���ٽ��� ���� ��������������... ������ ���� ���ֽ��ϴ�. 
        �� ���ѸԾ� ������!', '��¥����', 'rvbestpizza1','rvbestpizza1', 'rvbestpizza2','rvbestpizza2', 'rvbestpizza3','rvbestpizza3', 1);

--�ÿ���
insert into reviewboard(rv_idx, m_code, title, contents, writer, rv_ofile1, rv_sfile1, or_idx)
    values (seq_reviewboard_idx.nextval, 5, '���ξ������� ���ѸԴ� �ο����ϴ�..', '���ξ��� ���ڸ� ��¥ �Ⱦ��ϴ� ģ���� ������ ���ξ��� ���ڸ� �԰��� ���ξ������ڸ� �Ծ��... �׸� ������� �ο����ϴ�..', '�����ξ�����', 'rvpanepizza.jpg','rvpanepizza.jpg', 2);
insert into reviewboard(rv_idx, m_code, title, contents, writer, rv_ofile1, rv_sfile1, or_idx)
    values (seq_reviewboard_idx.nextval, 6, '������Ǫ(�����˵�����Ǫ��)', '�������˵��˵�~ ���Ҷ����� ������ ���°� ������? ��� �ǹ��� �������� Ǫ���ϳ׿�... ����� �����մϴ�!!!', '������Ǫ', 'rvgoodpizza.jpg','rvgoodpizza.jpg', 3);
insert into reviewboard(rv_idx, m_code, title, contents, writer, rv_ofile1, rv_sfile1, or_idx)
    values (seq_reviewboard_idx.nextval, 3, '�̰� DIY����? ������ �ʹ����� ���µ� 1�ð� �ɷȽ��ϴ�...', '����� �����Դ� ������! ���������� �ʹ� ���� ���µ��� 1�ð� �ɸ��� ���ƿ�... ��... ��¥ �ʹ� �����͵� ����׿�̤�', '��ٸ��ǹ���', 'rvpotapizza.jpg','rvpotapizza.jpg', 4);
insert into reviewboard(rv_idx, m_code, title, contents, writer, rv_ofile1, rv_sfile1, or_idx)
    values (seq_reviewboard_idx.nextval, 4, '������ġ��! ��������!', '�������� ������¥ �ϰ� ���ѸԴ� ����... �������� ����� �˵�~! ������ Ǫ��! �̷��� ������ �ƴұ� �;��! ���������� ���� ��������! ������ ���ѸԽ��ϴ�! ', '���ɳ�������', 'rvsweetpizza.jpg','rvsweetpizza.jpg', 5);
insert into reviewboard(rv_idx, m_code, title, contents, writer, rv_ofile1, rv_sfile1, or_idx)
    values (seq_reviewboard_idx.nextval, 3, '����� ��¥ �����! ��麸�� �ɲ� ������ ���ƿ�!', '�����̴µ� 3~4��? ��¥ �� ��ġ�� �����Ǵ� �װͺ��� ���� ������ ���¼���? ������ ���ϰ� ���Ѹ����� �����Ǹ� ���Ѹ���������!', '��麸��������', 'rvbullpizza.jpg','rvbullpizza.jpg', 6);
insert into reviewboard(rv_idx, m_code, title, contents, writer, rv_ofile1, rv_sfile1, or_idx)
    values (seq_reviewboard_idx.nextval, 4, '������ ������? �⺻���ڵ� �̷��� ���־ �ǳ���? ', '������ ��¥ ���̰� ���׿� DIY�� ���ִ��� �˾Ҵµ� �����Ǵ� �׳� ���ڸ� �� ����׿�... ���..', '�⺻������', 'rvhandpizza.jpg','rvhandpizza.jpg', 7);
insert into reviewboard(rv_idx, m_code, title, contents, writer, rv_ofile1, rv_sfile1, or_idx)
    values (seq_reviewboard_idx.nextval, 5, 'ġ� ���侲�� ���ݱ��� �þ�� �־��...', '����ü ġ� �󸶳� ������ ���ô°���? ���侲�� ���ݱ��� ġ� �þ�� �־��... ��¥ �ʹ� �̱��̱��մϴ�! ', 'ġ���δ�Ʈ��', 'rvpizza.jpg','rvpizza.jpg', 8);







==============================================================
#���ƿ丮��(likedreview)���̺�

--���ƿ丮��(likedreview) ���̺� ����
CREATE TABLE likedreview (
    like_idx NUMBER PRIMARY KEY ,
    rv_idx NUMBER NOT NULL, 
    m_code NUMBER(10) NOT NULL
);

--�ܷ�Ű ����1(���-���ƿ丮��)
ALTER TABLE likedreview  ADD constraint member_likedreview_fk
   FOREIGN KEY (m_code)  REFERENCES member (m_code);
--�ܷ�Ű ����2(����-���ƿ丮��)
ALTER TABLE likedreview  ADD constraint reviewboard_likedreview_fk
   FOREIGN KEY (rv_idx)  REFERENCES reviewboard (rv_idx);

--������ ����
create sequence seq_likedreview_idx 
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;


insert into likedreview (like_idx, rv_idx, m_code) values (seq_likedreview_idx.nextval, 1, 2);
insert into likedreview (like_idx, rv_idx, m_code) values (seq_likedreview_idx.nextval, 2, 3);
insert into likedreview (like_idx, rv_idx, m_code) values (seq_likedreview_idx.nextval, 2, 4);
insert into likedreview (like_idx, rv_idx, m_code) values (seq_likedreview_idx.nextval, 2, 5);
insert into likedreview (like_idx, rv_idx, m_code) values (seq_likedreview_idx.nextval, 3, 4);
insert into likedreview (like_idx, rv_idx, m_code) values (seq_likedreview_idx.nextval, 3, 5);
insert into likedreview (like_idx, rv_idx, m_code) values (seq_likedreview_idx.nextval, 4, 5);

--�ÿ���
insert into likedreview (like_idx, rv_idx, m_code) values (seq_likedreview_idx.nextval, 1, 3);
insert into likedreview (like_idx, rv_idx, m_code) values (seq_likedreview_idx.nextval, 1, 4);
insert into likedreview (like_idx, rv_idx, m_code) values (seq_likedreview_idx.nextval, 1, 5);
insert into likedreview (like_idx, rv_idx, m_code) values (seq_likedreview_idx.nextval, 1, 6);
insert into likedreview (like_idx, rv_idx, m_code) values (seq_likedreview_idx.nextval, 4, 7);
insert into likedreview (like_idx, rv_idx, m_code) values (seq_likedreview_idx.nextval, 4, 7);
insert into likedreview (like_idx, rv_idx, m_code) values (seq_likedreview_idx.nextval, 7, 7);
insert into likedreview (like_idx, rv_idx, m_code) values (seq_likedreview_idx.nextval, 7, 6);
insert into likedreview (like_idx, rv_idx, m_code) values (seq_likedreview_idx.nextval, 2, 7);




