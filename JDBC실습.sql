--JDBC 실습용 문서

/*
JAVA에서 처음으로 JDBC 프로그래밍 해보기
*/
--우선 system계정으로 연결한 후 새로운 실습용 계정을 생성한다.
create user kosmo identified by 1234;
--role을 사용한 권한 부여
grant connect, resource to kosmo;

--여기서부터는 kosmo계정에서 실습합니다.

--테이블생성하기1 (회원관리 테이블)
create table member
(
    id varchar2(30) not null,
    pass varchar2(40) not null,
    name varchar2(50) not null,
    regidate date default sysdate,
    primary key (id)
);
-- 테이블 삭제하기(필요시에만)
drop table member;
--제약조건 확인을 위한 데이터 사전
select * from user_constraints;
--더미데이터 입력하기
insert into member (id, pass, name) values ('test', '1234', '테스트');
select * from member;
select to_char(regidate, 'yyyy-mm-dd hh24:mi:ss') "회원가입일" from member;

--테이블생성하기2(게시판 테이블)
create table board
(
    num number primary key, --게시물의 일련번호
    title varchar2(200) not null,  --제목
    content varchar2(2000) not null,  --내용
    id varchar2(30)not null,  --작성자의 아이디
    postdate date default sysdate not null, --작성일
    visitcount number default 0 not null --조회수
);
-- 테이블 삭제하기(필요시에만)
drop table member;

/*
퀴즈] 위에서 생성한 테이블에 외래키와 시퀀스를 설정하시오.
1. 외래키명 : board_mem_fk
board 테이블의 id 컬럼이 member 테이블의 id 컬럼을 참조하도록 외래키를 생성
2. 시퀀스명 : seq_board_num
board 테이블에 데이터를 입력시 num 컬럼이 자동증가 할 수 있도록 시퀀스를 생성
*/
--제약조건 삭제하기(필요시에만) : 제약조건을 잘못만든 경우 수정이 안되므로 삭제후 재 생성해야함.
alter table board drop constraint board_mem_fk;

--1.외래키 생성
alter table board add
    constraint board_mem_fk
        foreign key (id) references member (id);
--1-1. 데이터 사전에서 확인
select * from user_constraints;

--2.시퀀스생성
create sequence seq_board_num
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;
--시퀀스삭제하기
drop sequence seq_board_num;
--시퀀스 확인을 위한 데이터사전
select * from user_sequences;
--2-1.시퀀스 확인
select seq_board_num.nextval from dual;

insert into member (id, pass, name) values ('test91', '9191', '테스트91');

commit;





/*************
JSP 실습
    : JDBC, 세션, 회원제 게시판 제작
*************/
--system계정에서 실행하세요.
--새로운 사용자 계정 생성
create user musthave identified by 1234;
--롤(Role)을 이용한 여러가지 권한 부여
grant connect, resource to musthave;

--계정 등록 후 musthave에서 실행하세요
/* Create Tables */
--게시판 테이블
CREATE TABLE board
(
	num number NOT NULL, --일련번호(PK)
	title varchar2(200) NOT NULL, --제목
	content varchar2(2000) NOT NULL, --내용
	id varchar2(10) NOT NULL, --작성자 아이디(FK)
	postdate date default sysdate NOT NULL, --작성일
	visitcount number(6), --조회수
	PRIMARY KEY (num)
);

--회원테이블
CREATE TABLE member
(
	id varchar2(10) NOT NULL, --아이디(PK)
	pass varchar2(10) NOT NULL, --패스워드
	name varchar2(30) NOT NULL, --이름
	regidate date DEFAULT SYSDATE NOT NULL, --등록일
	PRIMARY KEY (id)
);



/* Create Foreign Keys */
/*
자식테이블인 board의 id 컬럼이 부모테이블인 member의 id 컬럼을 
참조하는 외래키 생성.
이 경우 부모쪽에 레코드가 있어야지만 자식쪽에 레코드를 insert 할 수 있다.
*/
ALTER TABLE board
	ADD constraint board_mem_fk --제약조건의 이름
	FOREIGN KEY (id)
	REFERENCES member (id)
;
--시퀀스 생성
create sequence seq_board_num
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;
    
--더미 데이터 입력
insert into member (id, pass, name) values ('musthave', '1234', '머스트해브');
insert into board (num, title, content, id, postdate, visitcount)
    values (seq_board_num.nextval, '제목1입니다.', '내용1입니다.', 'musthave', sysdate, 0);
insert into board (num, title, content, id, postdate, visitcount)
    values (seq_board_num.nextval, '제목2입니다.', '내용2입니다.', 'musthave', sysdate, 0);
insert into board (num, title, content, id, postdate, visitcount)
    values (seq_board_num.nextval, '제목3입니다.', '내용3입니다.', 'musthave', sysdate, 0);
insert into board (num, title, content, id, postdate, visitcount)
    values (seq_board_num.nextval, '제목4입니다.', '내용4입니다.', 'musthave', sysdate, 0);
insert into board (num, title, content, id, postdate, visitcount)
    values (seq_board_num.nextval, '제목5입니다.', '내용5입니다.', 'musthave', sysdate, 0);
commit;


--Model1 방식의 회원제 게시판 제작하기.

--board 테이블의 게시물 수 카운트 하기.
select count(*) from board; -- 전체게시물
--검색을 하는 경우에 카운트 하기
select count(*) from board where title like '%제목%';
select count(*) from board where title like '%제목9%';

--전체 게시물 출력하기
select * from board;
--게시물 검색하기
select * from board where title like '%제목%';--1건 인출됨
select * from board where title like '%내용%';--0건 인출됨
--정렬까지 추가하기
select * from board order by num desc;
select * from board where title like '%제목%' order by num desc;
select * from board where title like '%제목3%' order by num desc;

--더미데이터 추가하기
INSERT INTO board VALUES (seq_board_num.nextval, '지금은 봄입니다', '봄의왈츠', 'musthave', sysdate, 0);
INSERT INTO board VALUES (seq_board_num.nextval, '지금은 여름입니다', '여름향기', 'musthave', sysdate, 0);
INSERT INTO board VALUES (seq_board_num.nextval, '지금은 가을입니다', '가을동화', 'musthave', sysdate, 0);
INSERT INTO board VALUES (seq_board_num.nextval, '지금은 겨울입니다', '겨울연가', 'musthave', sysdate, 0);
commit;

--게시판 상세보기 처리 : 회원의 이름을 출력하기 위해 Join문 작성
--가령 9번 게시물을 읽고 싶다면 
select * from board where num=9;
--작성자 이름을 확인하기 위해 join문 작성
select
    num, title, content, id, postdate, visitcount, name
from board inner join member on board.id=member.id
where num=9; -- id 컬럼이 애매하므로 에러 발생됨.

--테이블에 별칭을 사용하고, 애매한 id컬럼에도 별칭추가함
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

--앞의 쿼리문을 using을 통해 조금 더 간소화 하기.
/*
    using은 참조하는 두개의 테이블에 동일한 이름의 컬럼이 있을때만
    사용할 수 있는 문장이다. 따라서 별칭, on절이 필요 없어 지므로
    쿼리문이 좀 더 간소해진다.
*/
select
    num, title, content, id, postdate, visitcount, name
from board inner join member
    using(id)
where num=9;

--게시물을 읽을 경우 조회수 1증가시키기

/*
    visitcount 컬럼은 number 타입이므로 사칙연산이 가능하다.
*/
update board set visitcount = visitcount+1 where num=9;

commit;



