/***********************
���ϸ� : Or07DDL.sql
DDL : Data Definition language(������ ���Ǿ�)
���� : ���̺�, ��� ���� ��ü�� ���� �� �����ϴ� �������� ���Ѵ�.
***********************/

/*
system�������� ������ �� �Ʒ� ������ �����Ѵ�.
���ο� ������ ������ �� ���ӱ��Ѱ� ���̺� �������� ����� �ο��Ѵ�.
*/
create user study identified by 1234; --study ���� ����.
grant connect, resource to study; --������ ������ ������ �ο�.

-------------------------------------------------------------------------------
--study ������ ������ �� �ǽ��� �����մϴ�.
select * from dual;
select * from tab;


/*
���̺� ����
����]
    create table ���̺���(
        �÷�1 �ڷ���,
        �÷�2 �ڷ���
        ....
        primary key (�÷���) �� ��������
    );

*/

create table tb_member(
    member_idx number(10),  --10�ڸ��� ���� ǥ��
    userid varchar2(30),
    passwd varchar2(50),
    username  varchar2(30),
    mileage number(7,2)     --�Ǽ�ǥ��. ��ü7�ڸ�, �Ҽ�����2�ڸ�
);
--���� ������ ������ ������ ���̺��� ����� Ȯ��
select * from tab;
--���̺��� ������ Ȯ��. (�÷���, �÷��� �ڷ���, �������� ���� Ȯ���� �� ����.)
desc tb_member;

/*
���� ������ ���̺��� ���ο� �÷� �߰��ϱ�
    -> tb_memeber ���̺��� email �÷��� �߰��Ͻÿ�.
    
    ����] alter table ���̺��� add �߰��� �÷� �ڷ���(ũ��) ��������;
*/
alter table tb_member add email varchar2(100);
desc tb_member;

/*
���� ������ ���̺��� �÷� �����ϱ�
    -> tb_member ���̺��� email Ŀ���� ����� 200���� Ȯ���Ͻÿ�.
    ���� �̸��� ����Ǵ� username�÷��� 60���� Ȯ���Ͻÿ�
    
    ����] alter table ���̺��� modify ������ �÷��� �ڷ���(ũ��);
*/

alter table tb_member modify email varchar2(200);
desc tb_member;
alter table tb_member modify username varchar2(60);
desc tb_member;

/*
���� ������ ���̺����� �÷� �����ϱ�
    - tb_member ���̺��� mileage �÷��� �����Ͻÿ�.
    
    ����] alter table ���̺��� drop column �������÷���;
*/
alter table tb_member drop column mileage;
desc tb_member;

/*
���̺� �����ϱ�
    -> tb_member ���̺��� �� �̻� ������� �����Ƿ� �����Ͻÿ�
    
    ����] drop table ������ ���̺���;
*/
drop table tb_member;
select * from tab;--�� ���ڵ� ��µ�
desc tb_member; --�����߻�

/*
����] ���̺� ���Ǽ��� �ۼ��� employees ���̺��� �ش� study������ �״�� 
�����Ͻÿ�. ��, ���������� �������� �ʽ��ϴ�.
*/
create table employees(
    employee_id number(6),  
    first_name varchar2(20),
    last_name varchar2(25),
    email  varchar2(25),
    phone_number varchar2(20) ,  
    hire_date date ,
    job_id varchar2(10) ,
    salary number(8,2) ,
    commission_pct number(2,2) ,
    manager_id number(6) ,
    department_id number(4)
);
desc employees;

----------------------------------
--������ �����ߴ� tb_member ���̺��� �ٽ� �ѹ� ������ �� �����մϴ�.
select * from tab;

--���ο� ���ڵ带 �����ϴ� DML��(�ڿ��� �н��� ����)
insert into tb_member values (1, 'hong', '1234', 'ȫ�浿', 10000);
insert into tb_member values (2, 'park', '9876', '�ڹ���', 20000);
select * from tb_member;

--���̺��� ���ڵ���� �����ϱ�
create table tb_member_copy
as
select * from tb_member;
--����Ǿ����� Ȯ���ϱ�.
desc tb_member_copy;
select * from tb_member_copy;


--���̺��� ���ڵ带 �����ϰ� ������ �����ϱ�
create table tb_member_copy2
as
select * from tb_member where 1=0;
--����Ǿ����� Ȯ���ϱ�.
desc tb_member_copy2;
select * from tb_member_copy2;

/*
DDL�� : ���̺��� ���� �� �����ϴ� ������
    ���̺� ���� :  create table ���̺���
    ���̺� ����
        �÷��߰� : alter table ���̺��� add �÷���
        �÷����� : alter table ���̺��� modify �÷���
        �÷����� : alter table ���̺��� drop column �÷���
    ���̺� ���� : drop table ���̺���
*/

------------------------------------------------------------
--��������(study ���� ���)
/*
1. ���� ���ǿ� �´� ��pr_dept�� ���̺��� �����Ͻÿ�.
*/
creat table pr_dept{
    eno number(4),
    ename
);

/*
2. ���� ���ǿ� �´� ��pr_emp�� ���̺��� �����Ͻÿ�.
*/

/*
3. pr_emp ���̺��� ename �÷��� varchar2(50) �� �����Ͻÿ�.
*/

/*
4. 1������ ������ pr_dept ���̺����� dname Į���� �����Ͻÿ�.
*/

/*
5. ��pr_emp�� ���̺��� job �÷��� varchar2(50) ���� �����Ͻÿ�.
*/