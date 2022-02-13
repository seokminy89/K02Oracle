--계정, 비밀번호 생성.
create user freep identified by 1234;

grant connect, resource to freep;

-- 테이블 생성.

--회원(member) 테이블 생성

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
--테이블 삭제
drop table member;

--회원 시퀀스 생성
create sequence seq_member_num 
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;
-- 더미데이터 입력(member)
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

--더미데이터 입력(store)
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (seq_store_idx.nextval, '본점', '서울시 금천구 가산동', '222222222', '111111111', '0211111111');
insert into store(b_code, b_name, address, latitude, longitude, phone)
   VALUES (seq_store_idx.nextval, '방배점', '서울시 서초구 방배동', '222222222', '111111111', '0211111111');
   

commit;
