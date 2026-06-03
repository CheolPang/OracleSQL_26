create user C##dbexam identified by m1234;
grant create session, create table, create sequence, create view to C##dbexam;
alter user C##dbexam default tablespace users;
alter user C##dbexam quota unlimited on users;
commit;