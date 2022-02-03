-- 문제 1
--a
select * from tabs;

--b (desc + 테이블명)
desc BOARD;

--c
select * from all_constraints;


--문제 2

create table sh_product_code (
    p_code number primary key, --상품코드 pk
    category_name varchar2(200) not null  --카테고리명
);

create table sh_goods (
    g_idx number primary key, --상품일련번호 pk
    goods_name varchar2(30) not null, --상품명
    goods_price number, --상품가격
    regidate date default sysdate not null, --등록일
    p_code number --상품코드 fk
);

--4. 제약조건 설정(외래키)
ALTER TABLE sh_goods
   ADD constraint sh_product_fk --제약조건의 이름
   FOREIGN KEY (p_code)
   REFERENCES sh_product_code (p_code);
   
   
--문제3
insert into sh_product_code values (1, '가전');
insert into sh_product_code values (2, '도서');
insert into sh_product_code values (3, '의류');
    
insert into sh_goods values (1, '냉장고', 1200000, sysdate, 1);
insert into sh_goods values (2, '진공청소기', 500000, sysdate, 1); 
insert into sh_goods values (3, '건조기', 1500000, sysdate, 1); 
insert into sh_goods values (4, '총균쇠', 35000, sysdate, 2);
insert into sh_goods values (5, '코스모스', 25000, sysdate, 2); 
insert into sh_goods values (6, '스키니진', 30000, sysdate, 3);
insert into sh_goods values (7, '트레이닝복', 65000, sysdate, 3);  

commit;

 select 
    *
 from sh_product_code P, sh_goods G
 where P.p_code=G.p_code
    and lower(p_code)='2';

