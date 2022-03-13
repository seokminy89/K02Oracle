--계정, 비밀번호 생성.
create user freep identified by 1234;

grant connect, resource to freep;


#회원(member)테이블

--회원 테이블 생성
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

--회원 시퀀스 생성
create sequence seq_member_num 
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;



insert into member(m_code, id, name, pass, phone, email, zipcode, address, grade)
   VALUES (seq_member_num.nextval, 'admin1', '관리자1', '1111', '01011111111', 'test@gmail.com', '11111', '서울시 금천구 가산동', '4');
insert into member(m_code, id, name, pass, phone, email, zipcode, address, grade)
   VALUES (seq_member_num.nextval, 'admin2', '관리자2', '1111', '01011111111', 'test@gmail.com', '11111', '서울시 금천구 가산동', '3');
insert into member(m_code, id, name, pass, phone, email, zipcode, address, grade)
   VALUES (seq_member_num.nextval, 'test1', '고객1', '1111', '01011111111', 'test@gmail.com', '11111', '서울시 금천구 가산동', '1');   
insert into member(m_code, id, name, pass, phone, email, zipcode, address, grade)
   VALUES (seq_member_num.nextval, 'test2', '고객2', '1111', '01011111111', 'test@gmail.com', '11111', '서울시 금천구 가산동', '1');
insert into member(m_code, id, name, pass, phone, email, zipcode, address, grade)
   VALUES (seq_member_num.nextval, 'delivery1', '배달원1', '1111', '01011111111', 'test@gmail.com', '11111', '서울시 금천구 가산동', '2');
insert into member(m_code, id, name, pass, phone, email, zipcode, address, grade)
   VALUES (seq_member_num.nextval, 'delivery2', '배달원2', '1111', '01011111111', 'test@gmail.com', '11111', '서울시 금천구 가산동', '2');


? 3월7일 더미데이터 
insert into member(m_code, id, name, pass, phone, email, zipcode, address, grade)
   VALUES (seq_member_num.nextval, 'admin1', '관리자1', '1111', '01011111111', 'testadmin1@gmail.com', '12345', '서울시 금천구 가산1동', '4');
insert into member(m_code, id, name, pass, phone, email, zipcode, address, grade)
   VALUES (seq_member_num.nextval, 'admin2', '관리자2', '1111', '01022222222', 'testadmin2@gmail.com', '13579', '서울시 금천구 가산2동', '3');
insert into member(m_code, id, name, pass, phone, email, zipcode, address, grade)
   VALUES (seq_member_num.nextval, 'test1', '고객1', '1111', '01012345678', 'test1@gmail.com', '56789', '경기도 광명시 소하동', '1');   
insert into member(m_code, id, name, pass, phone, email, zipcode, address, grade)
   VALUES (seq_member_num.nextval, 'test2', '고객2', '1111', '01024565443', 'test2@gmail.com', '23456', '서울시 마포구 아현동', '1');
insert into member(m_code, id, name, pass, phone, email, zipcode, address, grade)
   VALUES (seq_member_num.nextval, 'delivery1', '배달원1', '1111', '01097875435', 'testdelivery1@gmail.com', '98074', '경기도 부천시 원미동', '2');
insert into member(m_code, id, name, pass, phone, email, zipcode, address, grade)
   VALUES (seq_member_num.nextval, 'delivery2', '배달원2', '1111', '01063345678', 'testdelivery2@gmail.com', '56708', '서울시 중구 충무로', '2');
==============================================================

#매장(store)테이블

--매장(store) 테이블 생성
CREATE TABLE store (
   b_code NUMBER (5) PRIMARY KEY,
   b_name VARCHAR2(30) NOT NULL, 
   address VARCHAR2(100) NOT NULL, 
   latitude VARCHAR2(20) NOT NULL, 
   longitude VARCHAR2(20) NOT NULL, 
   phone VARCHAR2(20) NOT NULL
);

--매장 시퀀스 생성
create sequence seq_store_idx 
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;

--매장 더미데이터 
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (1, '본점', '서울특별시 금천구 가산디지털2로 123', '37.478714','126.878665','02-123-1234');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (2, '강남점', '서울특별시 강남구 역삼동 831-11', '37.4942635','127.0296699','02-124-1235');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (3, '금천구점', '서울특별시 금천구 가산동 151-69', '37.4762052','126.8933986','02-234-5234');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (4, '구로점', '서울특별시 구로구 구로동 497-5', '37.5000384','126.8828494','02-212-9403');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (5, '신촌점', '서울특별시 서대문구 북아현동 209-30', '37.5605041','126.9512127','02-249-9540');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (6, '마포점', '서울특별시 마포구 합정동 385-17', '37.550787', '126.912592','02-204-0954');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (7, '영등포점', '서울특별시 영등포구 도림동 133-15', '37.50966','126.904673','02-054-9530');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (8, '용산점', '서울특별시 용산구 원효로1동 39-9', '37.5405032','126.9691858','02-153-7534');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (9, '서초점', '서울특별시 서초구 방배본동 18-16', '37.4952967','126.9889993','02-647-2365');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (10, '합정점', '서울특별시 마포구 서교동 394-41', '37.5502177','126.9153071','02-096-1504');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (11, '등촌점', '서울특별시 양천구 목동 603-6', '37.5494106','126.8675998','02-425-7586');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (12, '종로점', '서울특별시 종로구 연건동 128-1', '37.577112','126.99766','02-105-4920');

insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (13, '미추홀점', '인천광역시 남구 주안3동 1603-1', '37.443824','126.673017','032-493-2059');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (14, '인하대점', '인천광역시 남구 용현동 198-32', '37.45157626','126.6557593','032-143-0232');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (15, '부평점', '인천광역시 부평구 십정2동 577-14', '37.476022','126.709494','032-104-4932');
   
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (16, '부천점', '경기도 부천시 원미구 중1동 1158-11', '37.50334207','126.7637937','032-102-3029');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (17, '안양점', '경기도 안양시 동안구 동안로 120', '37.38959826','126.9521795','031-300-2043');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (18, '성남점', '경기도 성남시 분당구 서현1동 89-7', '37.38163615','127.1282697','031-004-1432');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (19, '시흥점', '경기도 시흥시 배곧4로 83', '37.37410466','126.7334437','031-940-1411');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (20, '광명점', '경기도 광명시 일직동 산44-5', '37.41565','126.87895','02-234-9302');
   
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (21, '태백점', '강원도 태백시 장성동 92-5', '37.09886232','129.0191345','033-049-3084');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (22, '영월점', '강원도 영월군 상동읍 상동시장길 9-1', '37.136383','128.836149','033-392-0814');
   
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (23, '공주점', '충청남도 공주시 봉황동 328', '36.44882075','127.120576','041-340-2021');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (24, '서산점', '충청남도 서산시 읍내동 1541', '36.78126614','126.450733','041-494-1104');

insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (25, '청주점', '충청북도 청주시 흥덕구 복대로 94', '36.62486354','127.4423189','043-390-0194');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (26, '충주점', '충청북도 충주시 동량면 손동리 21-4', '37.0224929','128.0262237','043-303-9403');

insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (27, '동구점', '대전광역시 서구 기성동 229-6', '36.250736'	,'127.33621','042-030-0011');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (28, '중구점', '대전광역시 중구 문화1동 161-5', '36.30998894','127.4078018','042-043-9749');
  
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (29, '김해점', '경상남도 김해시 장유면 삼문리 31-3', '35.20382','128.8092','055-045-4879');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (30, '진주점', '경상남도 진주시 지수면 청담리 762', '35.24735','128.27347','055-294-3042');
   
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (31, '안동점', '경상북도 안동시 용상동 1436-5', '36.561367','128.747798','054-309-1032');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (32, '경주점', '경상북도 경주시 천북면 모아리 576-4', '35.919975','129.2449008','054-503-9020');   
   
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (33, '서구점', '대구광역시 서구 비산4동 186-1', '35.87212319','128.5751549','053-943-2041'); 
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (34, '수성구점', '대구광역시 수성구 중동 573-5', '35.84137047','128.6098821','053-493-2954'); 
   
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (35, '목포점', '전라남도 목포시 43-14', '34.791093','126.383348','061-003-4308'); 
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (36, '여수점', '전라남도 여수시 서교동 460', '34.74148379','127.7276831','061-930-0312'); 
   
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (37, '고창점', '전라북도 고창군 고수면 초내리 631-1', '35.388045','126.670124','063-920-9123');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (38, '전주점', '전라북도 전주시 완산구 효자동1가 579', '35.80369311','127.116927','063-123-8493');

insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (39, '동구점', '광주광역시 동구 충장동 2', '35.15438611','126.9109556','062-264-3984');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (40, '광산구점', '광주 광산구 진곡산단중앙로 55', '35.19423259','126.791337','062-345-1240');

insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (41, '남구점', '울산광역시 남구 삼산로 247', '35.53851','129.33396','052-264-1284');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (42, '울주점', '울산광역시 울주군 삼남면 반구대로 675', '35.55377','129.11803','052-345-5943');
   
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (43, '해운대점', '부산광역시 해운대구 세실로 19', '35.16655632','129.178066','051-124-5849');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (44, '명지점', '부산광역시 강서구 명지동 국제8로 235', '35.10438371','128.9220773','051-584-9540');
   
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (45, '세종점', '세종특별자치시 조치원읍 향나무길 10', '36.601886914037365','127.2900686','044-483-9403');

insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (46, '서귀포점', '제주특별자치도 서귀포시 대륜동 1651', '33.246471','126.506865','064-384-9840');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (47, '제주점', ' 제주특별자치도 제주시 삼도1동 794-3', '33.50823534','126.5200254','064-948-3849');   
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (48, '본점 2호점', '서울특별시 금천구 서울시 금천구 가산디지털1로 30', '33.50823534','126.5200254','02-023-3942');

 
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
#가맹점문의(franchise)테이블
--가맹점문의(franchise) 테이블 생성
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

--가맹점 시퀀스
create sequence seq_fran_idx 
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;
    
-- 
INSERT into Franchise(f_code, f_name, f_phone, f_email, f_address, f_content) 
  		VALUES (seq_fran_idx.nextval, '김부자', '01054754452', 'rlaqnwk123@gmail.com', '서울-금천구', '서울특별시 금천구에 가맹점 문의드립니다.');

INSERT into Franchise(f_code, f_name, f_phone, f_email, f_address, f_content) 
  		VALUES (seq_fran_idx.nextval, '이성용', '01053512433', 'dltjddyd123@nate.com', '서울-강동구', '서울특별시 강동구에 가맹점 문의드립니다.');

INSERT into Franchise(f_code, f_name, f_phone, f_email, f_address, f_content) 
  		VALUES (seq_fran_idx.nextval, '박시원', '01010234943', 'qkrtldnjs123@hotmail.com', '서울-관악구', '서울특별시 관악구에 가맹점 문의드립니다.');

INSERT into Franchise(f_code, f_name, f_phone, f_email, f_address, f_content) 
  		VALUES (seq_fran_idx.nextval, '권혁준', '01068403342', 'rnjsgurwns123@hanmail.net', '서울-구로구', '서울특별시 구로구에 가맹점 문의드립니다.');

INSERT into Franchise(f_code, f_name, f_phone, f_email, f_address, f_content) 
  		VALUES (seq_fran_idx.nextval, '최은구', '01034448784', 'chldmsrn123@naver.com', '서울-은평구', '서울특별시 은평구에 가맹점 문의드립니다.');


==============================================================
#상품구분(goods)테이블
--상품구분 테이블 생성
CREATE TABLE goods (
	g_code number PRIMARY KEY,
	g_name VARCHAR2(50)
);

--데이터 
INSERT INTO goods(g_code, g_name) VALUES (1, '기본피자');
INSERT INTO goods(g_code, g_name) VALUES (2, '도우');
INSERT INTO goods(g_code, g_name) VALUES (3, '소스');
INSERT INTO goods(g_code, g_name) VALUES (4, '토핑');
INSERT INTO goods(g_code, g_name) VALUES (5, '사이드');
INSERT INTO goods(g_code, g_name) VALUES (6, '음료');
INSERT INTO goods(g_code, g_name) VALUES (9, 'diy피자');


--상품코드용 시퀀스 생성 
--사용법 NEXTVAL(sq_pizza)


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
#전체상품(product)테이블
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
--외래키 생성
ALTER TABLE product ADD constraint fk_product_goods
	FOREIGN KEY (g_code) REFERENCES goods (g_code);



--일반피자
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (1, 11110001, '불고기피자', '6900', 'M', '1143', 'normal_11110001.png', 'normal_11110001.png');
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (1, 11110002, '불고기피자', '9900', 'L', '1764', 'normal_11110001.png', 'normal_11110001.png');
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (1, 11110003, '콤비네이션피자', '6900', 'M', '1152', 'normal_11110002.png', 'normal_11110002.png');
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (1, 11110004, '콤비네이션피자', '9900', 'L', '1776', 'normal_11110002.png', 'normal_11110002.png');
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (1, 11110005, '페퍼로니피자', '6900', 'M', '1127', 'normal_11110003.png', 'normal_11110003.png');
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (1, 11110006, '페퍼로니피자', '9900', 'L', '1992', 'normal_11110003.png', 'normal_11110003.png');
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (1, 11110007, '포테이토피자', '7900', 'M', '1200', 'normal_11110004.png', 'normal_11110004.png');
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (1, 11110008, '포테이토피자', '10900', 'L', '2024', 'normal_11110004.png', 'normal_11110004.png');
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (1, 11110101, '이탈리안치즈피자', '5900', 'M', '1020', 'normal_11110005.png', 'normal_11110005.png');
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (1, 11110102, '이탈리안치즈피자', '8900', 'L', '1700', 'normal_11110005.png', 'normal_11110005.png');
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (1, 11110103, '스테이크불갈비피자', '8900', 'M', '1437', 'normal_11110006.png', 'normal_11110006.png');
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (1, 11110104, '스테이크불갈비피자', '13900', 'L', '2048', 'normal_11110006.png', 'normal_11110006.png');
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (1, 11110105, '하와이안쉬림프피자', '9900', 'M', '1464', 'normal_11110007.png', 'normal_11110007.png');
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (1, 11110106, '하와이안쉬림프피자', '14900', 'L', '2150', 'normal_11110007.png', 'normal_11110007.png');
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (1, 11110201, '불새피자', '10900', 'M', '1508', 'normal_11110008.png', 'normal_11110008.png');
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (1, 11110202, '불새피자', '16900', 'L', '2208', 'normal_11110008.png', 'normal_11110008.png');
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (1, 11110203, '바베큐치킨피자', '10900', 'M', '1989', 'normal_11110009.png', 'normal_11110009.png');
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (1, 11110204, '바베큐치킨피자', '16900', 'L', '2696', 'normal_11110009.png', 'normal_11110009.png');
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (1, 11110205, '오리지널시카고피자', '13900', 'M', '1986', 'normal_11110010.png', 'normal_11110010.png');
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (1, 11110206, '오리지널시카고피자', '18900', 'L', '2706', 'normal_11110010.png', 'normal_11110010.png');
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (1, 11110301, '페퍼치즈폭탄피자', '15900', 'M', '2128', 'normal_11110011.png', 'normal_11110011.png');
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (1, 11110302, '페퍼치즈폭탄피자', '21900', 'L', '3076', 'normal_11110011.png', 'normal_11110011.png');
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (1, 11110303, '치즈폭포피자', '16900', 'M', '2844', 'normal_11110012.png', 'normal_11110012.png');
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (1, 11110304, '치즈폭포피자', '22900', 'L', '3744', 'normal_11110012.png', 'normal_11110012.png');


--DIY피자 재료
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (2, 22220001, '기본도우', '3000', 'M', '150', 'dough_22220001.png', 'dough_22220001.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (2, 22220002, '기본도우', '5000', 'L', '200', 'dough_22220001.png', 'dough_22220001.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (2, 22220003, '씬도우', '3000', 'M', '100', 'dough_22220002.png', 'dough_22220002.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (2, 22220004, '씬도우', '5000', 'L', '150', 'dough_22220002.png', 'dough_22220002.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (2, 22220005, '고구마도우', '2000', 'M', '200', 'dough_22220003.png', 'dough_22220003.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (2, 22220006, '고구마도우', '4000', 'L', '300', 'dough_22220003.png', 'dough_22220003.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (2, 22220007, '치즈도우', '2000', 'M', '200', 'dough_22220004.png', 'dough_22220004.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (2, 22220008, '치즈도우', '4000', 'L', '300', 'dough_22220004.png', 'dough_22220004.png');					
					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (3, 33330001, '토마토소스', '1000', 'M', '25', 'source_33330001.png', 'source_33330001.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (3, 33330002, '바베큐소스', '1000', 'M', '36', 'source_33330002.png', 'source_33330002.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (3, 33330003, '크림소스', '1000', 'M', '36', 'source_33330003.png', 'source_33330003.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (3, 33330004, '칠리소스', '1000', 'M', '29', 'source_33330004.png', 'source_33330004.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (3, 33330005, '갈릭소스', '1000', 'M', '34', 'source_33330005.png', 'source_33330005.png');					
					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440001, '토마토', '1000', 'M', '20', 'topping_44440001.png', 'topping_44440001.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440002, '토마토', '2000', 'L', '30', 'topping_44440001.png', 'topping_44440001.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440003, '피망', '1000', 'M', '13', 'topping_44440002.png', 'topping_44440002.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440004, '피망', '2000', 'L', '24', 'topping_44440002.png', 'topping_44440002.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440005, '파프리카', '1000', 'M', '15', 'topping_44440003.png', 'topping_44440003.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440006, '파프리카', '2000', 'L', '25', 'topping_44440003.png', 'topping_44440003.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440007, '양파', '1000', 'M', '21', 'topping_44440004.png', 'topping_44440004.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440008, '양파', '2000', 'L', '33', 'topping_44440004.png', 'topping_44440004.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440009, '마늘', '1000', 'M', '10', 'topping_44440005.png', 'topping_44440005.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440010, '마늘', '2000', 'L', '17', 'topping_44440005.png', 'topping_44440005.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440011, '브로콜리', '1000', 'M', '8', 'topping_44440006.png', 'topping_44440006.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440012, '브로콜리', '2000', 'L', '12', 'topping_44440006.png', 'topping_44440006.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440013, '시금치', '1000', 'M', '14', 'topping_44440007.png', 'topping_44440007.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440014, '시금치', '2000', 'L', '25', 'topping_44440007.png', 'topping_44440007.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440015, '바질', '1000', 'M', '5', 'topping_44440008.png', 'topping_44440008.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440016, '바질', '2000', 'L', '9', 'topping_44440008.png', 'topping_44440008.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440017, '버섯', '1000', 'M', '12', 'topping_44440009.png', 'topping_44440009.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440018, '버섯', '2000', 'L', '25', 'topping_44440009.png', 'topping_44440009.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440019, '감자', '1000', 'M', '120', 'topping_44440010.png', 'topping_44440010.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440020, '감자', '2000', 'L', '210', 'topping_44440010.png', 'topping_44440010.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440021, '올리브', '1000', 'M', '20', 'topping_44440011.png', 'topping_44440011.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440022, '올리브', '2000', 'L', '30', 'topping_44440011.png', 'topping_44440011.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440023, '파인애플', '1000', 'M', '42', 'topping_44440012.png', 'topping_44440012.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440024, '파인애플', '2000', 'L', '65', 'topping_44440012.png', 'topping_44440012.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440025, '스위트콘', '1000', 'M', '43', 'topping_44440013.png', 'topping_44440013.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440026, '스위트콘', '2000', 'L', '68', 'topping_44440013.png', 'topping_44440013.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440027, '페퍼로니', '2000', 'M', '112', 'topping_44440014.png', 'topping_44440014.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440028, '페퍼로니', '3000', 'L', '125', 'topping_44440014.png', 'topping_44440014.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440029, '새우', '2000', 'M', '52', 'topping_44440015.png', 'topping_44440015.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440030, '새우', '3000', 'L', '74', 'topping_44440015.png', 'topping_44440015.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440031, '베이컨', '2000', 'M', '89', 'topping_44440016.png', 'topping_44440016.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440032, '베이컨', '3000', 'L', '113', 'topping_44440016.png', 'topping_44440016.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440033, '닭가슴살', '2000', 'M', '36', 'topping_44440017.png', 'topping_44440017.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440034, '닭가슴살', '3000', 'L', '57', 'topping_44440017.png', 'topping_44440017.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440035, '안심', '2000', 'M', '39', 'topping_44440018.png', 'topping_44440018.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440036, '안심', '3000', 'L', '58', 'topping_44440018.png', 'topping_44440018.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440037, '연어', '2000', 'M', '45', 'topping_44440019.png', 'topping_44440019.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440038, '연어', '3000', 'L', '62', 'topping_44440019.png', 'topping_44440019.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440039, '불고기', '2000', 'M', '83', 'topping_44440020.png', 'topping_44440020.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440040, '불고기', '3000', 'L', '102', 'topping_44440020.png', 'topping_44440020.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440041, '체다치즈', '3000', 'M', '57', 'topping_44440021.png', 'topping_44440021.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440042, '체다치즈', '5000', 'L', '94', 'topping_44440021.png', 'topping_44440021.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440043, '모짜렐라치즈', '3000', 'M', '64', 'topping_44440022.png', 'topping_44440022.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440044, '모짜렐라치즈', '5000', 'L', '86', 'topping_44440022.png', 'topping_44440022.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440045, '리코타치즈', '3000', 'M', '45', 'topping_44440023.png', 'topping_44440023.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440046, '리코타치즈', '5000', 'L', '67', 'topping_44440023.png', 'topping_44440023.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440047, '고르곤졸라치즈', '3000', 'M', '65', 'topping_44440024.png', 'topping_44440024.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (4, 44440048, '고르곤졸라치즈', '5000', 'L', '89', 'topping_44440024.png', 'topping_44440024.png');					

--사이드메뉴					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (5, 55550001, '버팔로윙', '8900', 'M', '752', 'side_55550001.png', 'side_55550001.png');
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (5, 55550002, '치킨텐더', '6000', 'M', '627', 'side_55550002.png', 'side_55550002.png');	
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (5, 55550003, '쉬림프링', '6000', 'M', '719', 'side_55550003.png', 'side_55550003.png');	
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (5, 55550004, '치즈오븐스파게티', '5000', 'M', '549', 'side_55550004.png', 'side_55550004.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (5, 55550005, '불고기스파게티', '5500', 'M', '578', 'side_55550005.png', 'side_55550005.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (5, 55550006, '크림스파게티', '5000', 'M', '524', 'side_55550006.png', 'side_55550006.png');					
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (5, 55550007, '감바스', '8000', 'M', '778', 'side_55550007.png', 'side_55550007.png');	
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (5, 55550008, '그라탕', '7000', 'M', '633', 'side_55550008.png', 'side_55550008.png');				

--음료 & 기타				
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (6, 66660001, '사이다', '1500', 'M', '228', 'etc_66660001.png', 'etc_66660001.png');	
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (6, 66660002, '사이다', '2000', 'L', '660', 'etc_66660002.png', 'etc_66660002.png');	
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (6, 66660003, '콜라', '1500', 'M', '216', 'etc_66660003.png', 'etc_66660003.png');	
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (6, 66660004, '콜라', '2000', 'L', '660', 'etc_66660004.png', 'etc_66660004.png');	
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (6, 66660005, '제로콜라', '1500', 'M', '0', 'etc_66660005.png', 'etc_66660005.png');	
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (6, 66660006, '제로콜라', '2000', 'L', '0', 'etc_66660006.png', 'etc_66660006.png');	
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (6, 66660007, '피클', '500', 'M', '40', 'etc_66660007.png', 'etc_66660007.png');		
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (6, 66660008, '핫소스', '500', 'M', '21', 'etc_66660008.png', 'etc_66660008.png');	
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (6, 66660009, '칠리마요소스', '500', 'M', '34', 'etc_66660009.png', 'etc_66660009.png');	
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (6, 66660010, '렌치드레싱소스', '500', 'M', '29', 'etc_66660010.png', 'etc_66660010.png');
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (6, 66660011, '갈릭디핑소스', '500', 'M', '32', 'etc_66660011.png', 'etc_66660011.png');
INSERT INTO product(g_code, p_code, p_name, p_price, p_size, p_info, p_ofile, p_sfile)
   VALUES (6, 66660012, '머스타드소스', '500', 'M', '27', 'etc_66660012.png', 'etc_66660012.png');

commit;
==============================================================
#DIY피자(diy)테이블
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
--외래키 생성
ALTER TABLE diy ADD constraint fk_diy_goods
	FOREIGN KEY (g_code) REFERENCES goods (g_code);

?시퀀스 생성
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
   VALUES (9, sq_diy_idx.nextval, 22220001, 33330000, 44440001, 20000, '무명의 DIY');


==============================================================
#장바구니(cart)테이블

--장바구니 테이블 생성
CREATE TABLE cart (
	ct_idx NUMBER PRIMARY KEY,
	m_code NUMBER,
	ct_code NUMBER NOT NULL,
	ct_name VARCHAR2(200) NOT NULL,
	ct_count NUMBER DEFAULT 1 NOT NULL
);
--외래키 생성
ALTER TABLE cart ADD constraint fk_cart_member
	FOREIGN KEY (m_code) REFERENCES member (m_code);

--시퀀스 생성
create sequence seq_ct_idx
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;

insert into cart(ct_idx, m_code, ct_code, ct_name, ct_count)
   VALUES (seq_ct_idx.nextval, 1, 11110001, '불고기피자', 1);

insert into cart(ct_idx, m_code, ct_code, ct_name, ct_count)
   VALUES (seq_ct_idx.nextval, 1, 11110007, '포테이토피자', 1);      
insert into cart(ct_idx, m_code, ct_code, ct_name, ct_count)
   VALUES (seq_ct_idx.nextval, 2, 66660000, '제로콜라', 1);   
insert into cart(ct_idx, m_code, ct_code, ct_name, ct_count)
   VALUES (seq_ct_idx.nextval, 2, 55550000, '버팔로윙', 1); 
insert into cart(ct_idx, m_code, ct_code, ct_name, ct_count)
   VALUES (seq_ct_idx.nextval, 2, 99990000, '누구의diy피자', 1);  

? 220307 ct_name varchar2 값 변경
alter table cart modify ct_name varchar2(200);


==============================================================
#주문(order_product)테이블

--주문 테이블 생성
CREATE TABLE order_product (
	op_idx NUMBER PRIMARY KEY,
	or_idx NUMBER NOT NULL,
	code NUMBER,
	p_price VARCHAR2(20) NOT NULL,
	p_count NUMBER NOT NULL
);
--외래키 생성
ALTER TABLE order_product ADD constraint fk_op_ordered
	FOREIGN KEY (or_idx) REFERENCES ordered (or_idx);

--시퀀스 생성
create sequence seq_op_idx
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;
    
-- 더미데이터
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
#주문완료(ordered)테이블
--주문완료 테이블 생성
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
? 3월2일 테이블 수정
ALTER TABLE ordered ADD(name varchar2(20));
ALTER TABLE ordered ADD(phone varchar2(20));
ALTER TABLE ordered ADD(request varchar2(200));

?3월3일 테이블 수정
ALTER TABLE ordered ADD(orderhow varchar2(10));
ALTER TABLE ordered ADD(pickup_time varchar2(50));

commit;

--외래키 생성
ALTER TABLE ordered ADD constraint fk_ordered_member
	FOREIGN KEY (m_code) REFERENCES member (m_code);	
ALTER TABLE ordered ADD constraint fk_ordered_store
	FOREIGN KEY (b_code) REFERENCES store (b_code);
--시퀀스 생성
create sequence seq_or_idx
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;

?테이블 추가된게 많아서 더미데이터 바꿔야되는데 …
insert into ordered(or_idx, m_code, b_code, origin_price, total_price, credit)
   VALUES (seq_or_idx.nextval, '4', '1', '23000', '20000', '1');
insert into ordered(or_idx, m_code, b_code, origin_price, total_price, credit)
   VALUES (seq_or_idx.nextval, '5', '1', '23000', '20000', '1');
insert into ordered(or_idx, m_code, b_code, origin_price, total_price, credit)
   VALUES (seq_or_idx.nextval, '11', '2', '23000', '20000', '1');
insert into ordered(or_idx, m_code, b_code, origin_price, total_price, credit)
   VALUES (seq_or_idx.nextval, '12', '2', '23000', '20000', '1');
   
   
--시연용 더미데이터 
INSERT INTO ordered (or_idx, m_code, b_code, origin_price, cp_price,
		 po_price, total_price, credit,name,phone,request, orderhow, pickup_time)
		VALUES
		(seq_or_idx.nextval, '7', '4', '24900','0', 
		'0', '24900', '21', '김피자', '01012361822', '문 앞에 놓아 주세요.','D', null);
INSERT INTO ordered (or_idx, m_code, b_code, origin_price, cp_price,
		 po_price, total_price, credit,name,phone,request, orderhow, pickup_time)
		VALUES
		(seq_or_idx.nextval, '5', '3', '25000','0', 
		'1000', '24000', '21', '김피자', '01012361822', '문 앞에 놓아 주세요.','P',  '17시~19시');
INSERT INTO ordered (or_idx, m_code, b_code, origin_price, cp_price,
		 po_price, total_price, credit,name,phone,request, orderhow, pickup_time)
		VALUES
		(seq_or_idx.nextval, '6', '1', '35000','3000', 
		'5000', '24000', '221', '김피자', '01012361822', '벨은 누르지 말아주세요.','P',  '17시~19시');
INSERT INTO ordered (or_idx, m_code, b_code, origin_price, cp_price,
		 po_price, total_price, credit,name,phone,request, orderhow, pickup_time)
		VALUES
		(seq_or_idx.nextval, '3', '4', '24900','0', 
		'0', '24900', '21', '김피자', '01012361822', '문 앞에 놓아 주세요.','D', null);
INSERT INTO ordered (or_idx, m_code, b_code, origin_price, cp_price,
		 po_price, total_price, credit,name,phone,request, orderhow, pickup_time)
		VALUES
		(seq_or_idx.nextval, '4', '3', '25000','0', 
		'1000', '24000', '21', '김피자', '01012361822', '문 앞에 놓아 주세요.','P',  '17시~19시');
INSERT INTO ordered (or_idx, m_code, b_code, origin_price, cp_price,
		 po_price, total_price, credit,name,phone,request, orderhow, pickup_time)
		VALUES
		(seq_or_idx.nextval, '3', '1', '35000','3000', 
		'5000', '24000', '221', '김피자', '01012361822', '벨은 누르지 말아주세요.','P',  '17시~19시');
INSERT INTO ordered (or_idx, m_code, b_code, origin_price, cp_price,
		 po_price, total_price, credit,name,phone,request, orderhow, pickup_time)
		VALUES
		(seq_or_idx.nextval, '4', '4', '24900','0', 
		'0', '24900', '21', '김피자', '01012361822', '문 앞에 놓아 주세요.','D', null);
INSERT INTO ordered (or_idx, m_code, b_code, origin_price, cp_price,
		 po_price, total_price, credit,name,phone,request, orderhow, pickup_time)
		VALUES
		(seq_or_idx.nextval, '5', '3', '25000','0', 
		'1000', '24000', '21', '김피자', '01012361822', '문 앞에 놓아 주세요.','P',  '17시~19시');


==============================================================
#쿠폰(coupon)테이블

--쿠폰 테이블 생성
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

--시퀀스 생성
create sequence seq_cp_idx
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;

insert into coupon(cp_idx, cp_name, cp_cate, cp_ofile, cp_sfile, cp_price, cp_const)
   VALUES (seq_cp_idx.nextval, '가입축하쿠폰', '15000원 이상 구매시 3000원 할인', 'ofilename.png', 'sfilename.png', '3000', '15000');
insert into coupon(cp_idx, cp_name, cp_cate, cp_ofile, cp_sfile, cp_price, cp_const)
   VALUES (seq_cp_idx.nextval, '피자!쿠폰', '20000원 이상 구매시 5000원 할인', 'ofilename.png', 'sfilename.png', '5000', '20000');
insert into coupon(cp_idx, cp_name, cp_cate, cp_ofile, cp_sfile, cp_price, cp_const)
   VALUES (seq_cp_idx.nextval, '베스트리뷰', '50000원 이상 구매시 8000원 할인', 'ofilename.png', 'sfilename.png', '8000', '50000');




==============================================================
#보유중 쿠폰(mycoupon)테이블

--보유중 쿠폰 테이블 생성
CREATE TABLE mycoupon (
	coupon_idx NUMBER PRIMARY KEY,
	m_code NUMBER NOT NULL,
	cp_idx NUMBER NOT NULL
);
--외래키 생성
ALTER TABLE mycoupon ADD constraint fk_mycoupon_member
	FOREIGN KEY (m_code) REFERENCES member (m_code);
	
ALTER TABLE mycoupon ADD constraint fk_mycoupon_coupon
	FOREIGN KEY (cp_idx) REFERENCES coupon (cp_idx);

--시퀀스 생성
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


--시연용
insert into mycoupon(coupon_idx, m_code, cp_idx)
   VALUES (seq_coupon_idx.nextval, '5', '1');
insert into mycoupon(coupon_idx, m_code, cp_idx)
   VALUES (seq_coupon_idx.nextval, '5', '2');
insert into mycoupon(coupon_idx, m_code, cp_idx)
   VALUES (seq_coupon_idx.nextval, '5', '3');











==============================================================
#게시판(board)테이블

--게시판(board) 테이블 생성
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

--미리등록한사람 테이블 수정용 쿼리
alter table board add ofile2 varchar2(30);
alter table board add sfile2  varchar2(200);

create sequence seq_board_num 
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;

--외래키 생성
ALTER TABLE board  ADD constraint member_board_fk
   FOREIGN KEY (m_code)  REFERENCES member (m_code);




==============================================================
#리뷰게시판(reviewboard)테이블

--리뷰게시판(reviewboard) 테이블 생성
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

--외래키 생성
ALTER TABLE reviewboard ADD constraint member_reviewboard_fk
   FOREIGN KEY (m_code) REFERENCES member (m_code);
ALTER TABLE reviewboard ADD constraint ordered_reviewboard_fk
   FOREIGN KEY (or_idx) REFERENCES ordered (or_idx);


--ordered 테이블에 데이터 있어야 삽입가능 (or_idx) 외래키있음
insert into reviewboard(rv_idx, m_code, title, contents, writer, rv_ofile1, rv_sfile1, or_idx)
    values (seq_reviewboard_idx.nextval, 2, '프리피 리뷰1', '프리피 피자 맛있어요~', '루키', 'pizzareview1.jpg','pizzareview1.jpg', 1);
insert into reviewboard(rv_idx, m_code, title, contents, writer, rv_ofile1, rv_sfile1, or_idx)
    values (seq_reviewboard_idx.nextval, 3, '프리피 리뷰2', '프리피 피자 맛있어요~', '단비', 'pizzareview2.jpg','pizzareview2.jpg', 2);
insert into reviewboard(rv_idx, m_code, title, contents, writer, rv_ofile1, rv_sfile1, or_idx)
    values (seq_reviewboard_idx.nextval, 4, '프리피 리뷰3', '프리피 피자 맛있어요~', '아실', 'pizzareview3.jpg','pizzareview3.jpg', 3);
insert into reviewboard(rv_idx, m_code, title, contents, writer, rv_ofile1, rv_sfile1, or_idx)
    values (seq_reviewboard_idx.nextval, 4, '프리피 리뷰4', '프리피 피자 맛있어요~', '초코', 'pizzareview4.jpg','pizzareview4.jpg', 4);


insert into reviewboard(rv_idx, m_code, title, contents, writer, rv_ofile1, rv_sfile1, rv_ofile2, rv_sfile2, rv_ofile3, rv_sfile3, or_idx)
    values (seq_reviewboard_idx.nextval, 7, '프리피 피자 정말 솔직한 리뷰입니다.', '지인 추천으로 프리피자를 처음 시켜먹어봤습니다. DIY피자라는것 부터 신선했었지만 음식은 맛으로 말해야죠 처음 피자를 받고 열어보자마자 2번 놀랐습니다. 첫째로 제가 생각했던 피자를 현실로 만들어 빠른 시간안에 배달해주셔서 
        놀랐고 둘쨰로 엄청난 토핑양과 맛이 놀랐습니다. 그 이후부터는 정신없이 먹기만 했던것 같네요... 사이드로 주문한 치즈오븐스파게티, 감바스도 정말 만족스럽더군요... 프리피 정말 맛있습니다. 
        꼭 시켜먹어 보세요!', '진짜솔직', 'rvbestpizza1','rvbestpizza1', 'rvbestpizza2','rvbestpizza2', 'rvbestpizza3','rvbestpizza3', 1);

--시연용
insert into reviewboard(rv_idx, m_code, title, contents, writer, rv_ofile1, rv_sfile1, or_idx)
    values (seq_reviewboard_idx.nextval, 5, '파인애플피자 시켜먹다 싸웠습니다..', '파인애플 피자를 진짜 싫어하는 친구가 프리피 파인애플 피자를 먹고나서 파인애플피자만 먹어요... 그만 먹으라고 싸웠습니다..', '펜파인애플팬', 'rvpanepizza.jpg','rvpanepizza.jpg', 2);
insert into reviewboard(rv_idx, m_code, title, contents, writer, rv_ofile1, rv_sfile1, or_idx)
    values (seq_reviewboard_idx.nextval, 6, '토쫀토푸(토핑쫀득토핑푸짐)', '도핑은쫀득쫀득~ 찹쌀떡같고 토핑은 남는게 있을까? 라는 의문이 들정도로 푸짐하네요... 사장님 감사합니다!!!', '토쫀토푸', 'rvgoodpizza.jpg','rvgoodpizza.jpg', 3);
insert into reviewboard(rv_idx, m_code, title, contents, writer, rv_ofile1, rv_sfile1, or_idx)
    values (seq_reviewboard_idx.nextval, 3, '이게 DIY피자? 도핑이 너무많아 고르는데 1시간 걸렸습니다...', '맘대로 골라골라먹는 프리피! 토핑종류가 너무 많아 고르는데만 1시간 걸린것 같아요... 휴... 진짜 너무 많은것도 힘드네요ㅜㅜ', '기다림의미학', 'rvpotapizza.jpg','rvpotapizza.jpg', 4);
insert into reviewboard(rv_idx, m_code, title, contents, writer, rv_ofile1, rv_sfile1, or_idx)
    values (seq_reviewboard_idx.nextval, 4, '으리넘치는! 프으리피!', '프으리피 피자진짜 믿고 시켜먹는 피자... 프으리피 도우는 쫀득~! 도핑은 푸짐! 이런게 으리가 아닐까 싶어요! 으리으리한 피자 프으리피! 으리로 시켜먹습니다! ', '벚꽃나드으리', 'rvsweetpizza.jpg','rvsweetpizza.jpg', 5);
insert into reviewboard(rv_idx, m_code, title, contents, writer, rv_ofile1, rv_sfile1, or_idx)
    values (seq_reviewboard_idx.nextval, 3, '배달이 진짜 빨라요! 라면보다 쪼끔 느린것 같아요!', '라면끓이는데 3~4분? 진짜 뻥 안치고 프리피는 그것보다 조금 느리게 오는수준? 앞으로 급하게 시켜먹을땐 프리피를 시켜먹으려구요!', '라면보다프리피', 'rvbullpizza.jpg','rvbullpizza.jpg', 6);
insert into reviewboard(rv_idx, m_code, title, contents, writer, rv_ofile1, rv_sfile1, or_idx)
    values (seq_reviewboard_idx.nextval, 4, '프리피 뭔가요? 기본피자도 이렇게 맛있어도 되나요? ', '프리피 진짜 어이가 없네요 DIY만 맛있는줄 알았는데 프리피는 그냥 피자를 잘 만드네용... 대박..', '기본만하자', 'rvhandpizza.jpg','rvhandpizza.jpg', 7);
insert into reviewboard(rv_idx, m_code, title, contents, writer, rv_ofile1, rv_sfile1, or_idx)
    values (seq_reviewboard_idx.nextval, 5, '치즈가 리뷰쓰는 지금까지 늘어나고 있어요...', '도대체 치즈를 얼마나 좋은걸 쓰시는거죠? 리뷰쓰는 지금까지 치즈가 늘어나고 있어요... 진짜 너무 쫄깃쫄깃합니다! ', '치즈인더트랩', 'rvpizza.jpg','rvpizza.jpg', 8);







==============================================================
#좋아요리뷰(likedreview)테이블

--좋아요리뷰(likedreview) 테이블 생성
CREATE TABLE likedreview (
    like_idx NUMBER PRIMARY KEY ,
    rv_idx NUMBER NOT NULL, 
    m_code NUMBER(10) NOT NULL
);

--외래키 생성1(멤버-좋아요리뷰)
ALTER TABLE likedreview  ADD constraint member_likedreview_fk
   FOREIGN KEY (m_code)  REFERENCES member (m_code);
--외래키 생성2(리뷰-좋아요리뷰)
ALTER TABLE likedreview  ADD constraint reviewboard_likedreview_fk
   FOREIGN KEY (rv_idx)  REFERENCES reviewboard (rv_idx);

--시퀀스 생성
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

--시연용
insert into likedreview (like_idx, rv_idx, m_code) values (seq_likedreview_idx.nextval, 1, 3);
insert into likedreview (like_idx, rv_idx, m_code) values (seq_likedreview_idx.nextval, 1, 4);
insert into likedreview (like_idx, rv_idx, m_code) values (seq_likedreview_idx.nextval, 1, 5);
insert into likedreview (like_idx, rv_idx, m_code) values (seq_likedreview_idx.nextval, 1, 6);
insert into likedreview (like_idx, rv_idx, m_code) values (seq_likedreview_idx.nextval, 4, 7);
insert into likedreview (like_idx, rv_idx, m_code) values (seq_likedreview_idx.nextval, 4, 7);
insert into likedreview (like_idx, rv_idx, m_code) values (seq_likedreview_idx.nextval, 7, 7);
insert into likedreview (like_idx, rv_idx, m_code) values (seq_likedreview_idx.nextval, 7, 6);
insert into likedreview (like_idx, rv_idx, m_code) values (seq_likedreview_idx.nextval, 2, 7);




