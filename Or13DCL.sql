/***************************
���ϸ� : Or13DCL.sql
DCL : Data Control Language(������ �����)
����ڱ���
���� : ���ο� ����� ������ �����ϰ� �ý��� ������ �ο��ϴ� ����� �н�
***************************/

/*
[����� ���� ���� �� ���Ѽ���]
�ش� ������ DBA������ �ִ� �ְ������(sys, system)�� ������ �� 
�����ؾ� �Ѵ�.
����� ���� ���� �� ���� �׽�Ʈ�� CMD(���������Ʈ)���� �����Ѵ�.
*/

/*
1] ����� ���� ���� �� ��ȣ ����
����]
    create user ���̵� identified by �н�����;
*/
create user test_user1 identified by 1234;
--�������� cmd���� sqlplus ������� ���ӽ� logon denied ���� �߻���

/*
2] ������ ����� ������ ���� Ȥ�� ���� �ο�
����]
    grant �ý��� ����1, 2, ...N
        to ����ڰ�����
            [with grant �ɼ�];
*/
--���ӱ��� �ο�
grant create session to test_user1;-- ������ ������ ���̺� ������ �ȵȴ�.
--���̺� �������� �ο�
grant create table to test_user1; -- ���̺� ���������� ������ ���̺� �����̽��� ���� ������ �߻��Ѵ�.
/*
���̺� �����̽���?
    ��ũ ������ �Һ��ϴ� ���̺�� ��, �׸��� �� ���� �ٸ� �����ͺ��̽�
    ��ü���� ����Ǵ� ����̴�. ���� ��� ����Ŭ�� ���ʷ� ��ġ�ϸ�
    hr ������ �����͸� �����ϴ� user ��� ���̺� �����̽��� �ڵ����� �����ȴ�.
*/
--���̺� �����̽� ��ȸ�ϱ�.
select tablespace_name, status, contents from dba_tablespaces;
desc dba_tablespaces;

--���̺� �����̽��� ��� ������ ���� Ȯ���ϱ�
select tablespace_name, sum(bytes), max(bytes) from dba_free_space
    group by tablespace_name;
    
--�տ��� ������ test_user1 ������� ���̺� �����̽� Ȯ���ϱ�
select username, default_tablespace from dba_users
    where username in upper('test_user1');

--���̺� �����̽� ���� �Ҵ�
alter user test_user1 quota 2m on system;/*
                test_user1�� system ���̺� �����̽��� ���̺��� ������ �� 
                �ֵ��� 2m�� �뷮�� �Ҵ��Ѵ�.
            */
--CMD���� ���̺� ������ Ȯ���Ѵ�.

--2��° ����� �߰� : ���̺� �����̽� user�� ����� �� �ֵ��� �����Ѵ�.
create user test_user2 identified by 1234 default tablespace users;
grant create session to test_user2; --���ӱ��� �ο�
grant create table to test_user2; --���̺� �������� �ο�
--���̺� ������ �غ��� users ���̺����̽��� ���� ������ ��� ������ �� ����.

--test_user2�� ����ϴ� ���̺� �����̽� Ȯ��.
select username, default_tablespace from dba_users
    where username in upper('test_user2'); --�츮�� ������ ��� users�� ����ϰ� ����
    
--users ���̺����̽��� 10m ������ �Ҵ�
alter user test_user2 quota 10m on users;

--���̺� ���� �õ� 2: ����

/*
�̹� ������ ������� ����Ʈ ���̺� �����̽��� �����ϰ� ���� ���
alter user ����� ����Ѵ�.
*/
alter user test_user1 default tablespace users;
/*
���̺����̽��� user�� ����� ���� Ȯ��
*/
select username, default_tablespace from dba_users
    where username in upper('test_user1');


/*
sqlplus���� ED��ɾ� ����ϱ�
    : �� �������� �ۼ��� �� �޸����� editer�� Ȱ���Ͽ� �����Ű�� ���

1.���ϻ����ϱ�
SQL> ed new_table [Enter]
    :�̿� ���� ������� ����ڰ��� ���丮�� new_table.sql ������ �����ȴ�.

2.�޸��忡�� ���̺� (Ȥ�� �ٸ� ������)�� �����Ѵ�.
    �޸��忡�� �ۼ��Ҷ� ������ ���� ; �� �ƴ϶� / �� �ٿ��� �Ѵ�.
    �ۼ��� �Ϸ�Ǹ� ���� �� ������ �ݾ��ش�.
3.����
SQL> @new_table[Enter]

4.���� ���� �����ÿ��� ���� ������ �����ϰ� �����Ѵ�.
SQL> ed ���ϸ� [Enter]
    �� ������ ������ �����̰�, ���ٸ� ���Ӱ� �����Ѵ�.
*/

--test_user2 �������� ���̺� ������ ������ ������ �õ� : �������� ���Ѻ������� �����߻���.

/*
3] ��ȣ����
    :alter user ����ڰ��� identified by �����Ҿ�ȣ;
*/
alter user test_user1 identified by 4321;

/*
4] Role(��)�� ���� �������� ������ ���ÿ� �ο��ϱ�
    : ���� ����ڰ� �پ��� ������ ȿ�������� ������ �� �ֵ���
    ���õ� ���ѳ��� ����������� ���Ѵ�.
�� �츮�� �ǽ��� ���� ���Ӱ� ������ ������ connect, resource���� �ַ� �ο��Ѵ�.
*/
grant connect, resource to test_user2;

--cmd���� new_table.sql ������ ����. ������ ����, ���ڵ� �Է� : ����

/*
4-1] �� �����ϱ� : ����ڰ� ���ϴ� ������ ���� ���ο� ���� �����Ѵ�.
*/
create role kosmo_role;

/*
4-2] ������ �ѿ� ���� �ο��ϱ�
*/
grant create session, create table, create view to kosmo_role;
--���ο� ����� ���� ����
create user test_user3 identified by 1234;
--�տ��� ������ ���� ���� ���� �ο�
grant kosmo_role to test_user3;

--cmd���� ���� Ȯ��. ���� ������ �����ϳ�, ���̺� �����̽��� ���� ���̺� ������ �ȵ�.

--������ �������� ������ �� Ȯ��
select * from role_sys_privs where role like upper('%kosmo_role%');

/*
4-3] �� �����ϱ�
*/
drop role kosmo_role;
/*
    teste_user3 ����ڴ� ���� ���� ������ �ο��޾����Ƿ�
    �ش� ���� �����ϸ� �ο��޾Ҵ� ��� ������ ȸ��(revoke)�ȴ�.
    ��, �� �����Ŀ��� ������ �� ����.
*/

/*
5] ��������(ȸ��)
    ����] revoke ���� �� ���� from ����ڰ���;
*/
revoke create session from test_user1;
--test_user1 �δ� ������ �� ����.

/*
6] ����� ���� ����
    ����] drop user ����ڰ��� [cascade];
�� cascade�� ����ϸ� ����ڰ����� ���õ� ��� �����ͺ��̽� ��Ű����
�����ͻ������� ���� �����ǰ� ��� ��Ű�� ��ü�� ���������� �����ȴ�.
*/
--����� ����� Ȯ���� �� �ִ� ������ ����
select * from dba_users;

drop user test_user1 cascade;


