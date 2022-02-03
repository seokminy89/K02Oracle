-- ���� 1
--a
select * from tabs;

--b (desc + ���̺��)
desc BOARD;

--c
select * from all_constraints;


--���� 2

create table sh_product_code (
    p_code number primary key, --��ǰ�ڵ� pk
    category_name varchar2(200) not null  --ī�װ���
);

create table sh_goods (
    g_idx number primary key, --��ǰ�Ϸù�ȣ pk
    goods_name varchar2(30) not null, --��ǰ��
    goods_price number, --��ǰ����
    regidate date default sysdate not null, --�����
    p_code number --��ǰ�ڵ� fk
);

--4. �������� ����(�ܷ�Ű)
ALTER TABLE sh_goods
   ADD constraint sh_product_fk --���������� �̸�
   FOREIGN KEY (p_code)
   REFERENCES sh_product_code (p_code);
   
   
--����3
insert into sh_product_code values (1, '����');
insert into sh_product_code values (2, '����');
insert into sh_product_code values (3, '�Ƿ�');
    
insert into sh_goods values (1, '�����', 1200000, sysdate, 1);
insert into sh_goods values (2, '����û�ұ�', 500000, sysdate, 1); 
insert into sh_goods values (3, '������', 1500000, sysdate, 1); 
insert into sh_goods values (4, '�ѱռ�', 35000, sysdate, 2);
insert into sh_goods values (5, '�ڽ���', 25000, sysdate, 2); 
insert into sh_goods values (6, '��Ű����', 30000, sysdate, 3);
insert into sh_goods values (7, 'Ʈ���̴׺�', 65000, sysdate, 3);  

commit;

 select 
    *
 from sh_product_code P, sh_goods G
 where P.p_code=G.p_code
    and lower(p_code)='2';

