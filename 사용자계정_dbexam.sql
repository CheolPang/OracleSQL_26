-----[1. dbtable 생성]-----
select * from tab;
create table dbtest(
    name varchar2(15), 
    age number,
    height number(5,2),
    logtime date
);
desc dbtest;
drop table dbtest;
flashback table dbtest to before drop;

insert into dbtest (name, age, height, logtime) values ('Park-JinYeong',25, 185.445, sysdate);
insert into dbtest (name, age, logtime) values ('Park-TwoYeong',25, sysdate);
select * from dbtest;
select name, logtime from dbtest;
insert into dbtest values ('Kim-DongRul',27, 176.46, sysdate);
insert into dbtest values ('IU',30, 166, sysdate);
insert into dbtest values ('HongDang-Moo',45, 176.5, sysdate);
insert into dbtest values ('Hong-GilDong',50, 156.5, sysdate);
insert into dbtest values ('Kim-HongSuk',40, 156.5, sysdate);
insert into dbtest values ('Na-Hong',50, 166.5, sysdate);
insert into dbtest values ('NaNa-Hong',50, 166.5, sysdate);
insert into dbtest (name, age, height) values ('hong si',45, 176.5);
insert into dbtest (age, height) values (45, 176.5);
insert into dbtest (name, height) values ('Kim-NaNa', 176.5);
select count(*) from dbtest;
select count(height) from dbtest;
select * from dbtest;
commit;

--정렬
select * from dbtest order by name asc; --기본이 오름차순이라 asc를 생략해도 됨. 다만 내림차순을 할 때에는 desc를 쓰면 됨.
select * from dbtest order by name desc;
select * from dbtest order by age, height desc;

--조건 검색
select * from dbtest where name='HongDang-Moo';
select * from dbtest where name='HONG SI'; --문자열은 대소문자 구분을 하기 때문에 문자열을 검색할 때에는 대소문자 구분을 잘 해서 넣어야 한다.
select * from dbtest where name='hong si';
select * from dbtest where name='Hong'; -- 홍이 포함된 사람을 찾는 것이 아니기 때문에 검색하려는 대상을 정확하게 입력하여야 한다.
select * from dbtest where name like '%Hong%'; --홍이 포함된 사람을 찾을 때는 = 대신 like를 쓰고, 모든 조건에서 다 찾으려면 문자열 양 옆에 %를 붙여야 한다.
select * from dbtest where name like 'Hong%'; --홍으로 시작하는 사람만 찾는다.
select * from dbtest where name like '%Hong'; --홍으로 끝나는 사람만 찾는다.
select * from dbtest where name like '___Hong'; --언더바는 글자수를 뜻한다.
select * from dbtest where name like '_____Hong';
select * from dbtest where name like '%Hong%' and age>=45; --조건이 두가지다. Hong이 들어가고, 동시에 나이가 45 이상인 것을 찾는다.
select * from dbtest where height is null; --height 데이터가 null인것만 찾는다.
select * from dbtest where height is not null; --height 데이터가 null이지 않은 것만 찾는다.

--(문제) 한 사람의 데이터 중 어느 하나에 컬럼에 null이 들어가 있으면 모두 출력하시오.
select * from dbtest where name is null or age is null or height is null or sysdate is null; --or 조건 주기
commit;
select * from dbtest;

--삭제
delete dbtest where name='HongDang-Moo'; --delete from 에서 from은 생략 가능.
delete dbtest; --모든 데이터를 삭제할 수 있음 (테이블은 삭제하지 않음. 테이블 삭제 시 drop table; 사용) / 마지막에 * 생략 가능.
--이름이 김으로 시작하는 사람들을 모두 삭제
delete dbtest where name like 'Kim%';
rollback;

--수정
update dbtest set age=age+1 where name like 'Hong%';
update dbtest set age=age+1 where name like '%Hong%';
select * from dbtest;
update dbtest set age=30 where name='Hong-GilDong';
--나이가 null인 사람의 데이터는 모두 30살로 수정
update dbtest set age=30 where age is null;

--depart 부서 테이블 생성
create table depart(
    deptno number not null, --부서번호(학과번호)
    dname varchar2(25) not null, --부서명(학과명)
    loc varchar2(10) default null --위치(건물명)  
);


select * from depart;
----drop table depart purge;


INSERT INTO depart (deptno, dname) VALUES (302, 'Electrical_Engineering');
INSERT INTO depart VALUES (101, 'Computer_Science', 'Building1');
INSERT INTO depart VALUES (102, 'Multimedia', 'Building2');
INSERT INTO depart VALUES (201, 'Electronic_Engineering', 'Building3');
INSERT INTO depart VALUES (202, 'Mechanical_Engineering', 'Building4');


--emp 테이블
create table emp(
    empno number primary key, --직원번호 pk:unique(데이터 중복 금지), not null(반드시 데이터가 있어야 한다.)
    name varchar2(20) not null, --이름
    position varchar2(10) not null, --직급
    tel varchar2(15) not null, --연락처
    deptno number not null); --학과번호
    --empYear number, --연차
    --regTime date --입사 날짜
    --primary key(empno)


----drop table emp purge;


--INSERT INTO emp (empno,name,position,tel,deptno,empYear) VALUES (20101, '홍길동', '사원', '031)781-2158', 101, null);
INSERT INTO emp VALUES (20101, 'Hong-GilDong', 'Sawon', '031)781-2158', 101);
INSERT INTO emp VALUES (10102, 'Kim-CheolSu', 'GwaZang', '032)261-8947', 101);
INSERT INTO emp VALUES (10103, 'Lee-YeongHee', 'Daeri', '02)824-9637', 102);
INSERT INTO emp VALUES (10104, 'Go-GilDong', 'Sawon', '02)824-9637', 102);
INSERT INTO emp VALUES (10105, 'Kang-HoDong', 'Sawon', '02)824-9637', 102);
INSERT INTO emp VALUES (10106, 'IU', 'Sawon', '02)881-2158', 105);

--중복값을 방지하기 위해 자동으로 순차적으로 증강하는 순변을 생성하는 데이터베이스 객체 => 시퀀스
create sequence seq_board nocycle nocache;
drop sequence seq_board;

create sequence empno nocycle nocache;
INSERT INTO emp VALUES (empno.nextval, 'IU', 'Sawon', '02)881-2158', 105, sysdate);
select * from emp;
select empno, sysdate from emp;
select empno, to_char(sysdate, 'YY-mm-dd hh:mi:ss') from emp;
select empno, to_char(sysdate, 'YY-mm-dd hh24:mi:ss') from emp;
select empno, to_char(sysdate, '""YYYY"Year "mm"Month "dd"Date "hh"time "mi"minute "ss"second') from emp;
