--depart 부서 테이블 생성
create table depart(
    deptno number not null, --부서번호(학과번호)
    dname varchar2(25) not null, --부서명(학과명)
    loc varchar2(10) default null --위치(건물명)  
);


select * from depart;
----drop table depart purge;


INSERT INTO depart (deptno, dname) VALUES (302, '전기공학과');
INSERT INTO depart VALUES (101, '컴퓨터공학과', '1호관');
INSERT INTO depart VALUES (102, '멀티미디어학과', '2호관');
INSERT INTO depart VALUES (201, '전자공학과', '3호관');
INSERT INTO depart VALUES (202, '기계공학과', '4호관');


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
INSERT INTO emp VALUES (20101, '홍길동', '사원', '031)781-2158', 101);
INSERT INTO emp VALUES (10102, '김철수', '과장', '032)261-8947', 101);
INSERT INTO emp VALUES (10103, '이영희', '대리', '02)824-9637', 102);
INSERT INTO emp VALUES (10104, '고길동', '사원', '02)824-9637', 102);
INSERT INTO emp VALUES (10105, '강호동', '사원', '02)824-9637', 102);
INSERT INTO emp VALUES (10106, '아이유', '사원', '02)881-2158', 105);

select * from depart;
select * from emp;

--조인구문
--1) 내부 조인 inner join : 두 테이블에서 조건이 일치하는 데이터만 조회(교집합)
--방법1. 오라클 전용 구문
select * from emp, depart where emp.deptno=depart.deptno;
select empno, name, dname, emp.deptno from emp, depart where emp.deptno=depart.deptno;
--방법2. ANSI 표준 (심플하고 편함)
select * from emp join depart using(deptno);
select empno, name, dname, deptno from emp join depart using(deptno);
--별명, 별칭 alias(as) 찾기
select empno "사원번호", name "사원명", dname "부서번호", deptno "부서명" from emp join depart using(deptno); --as가 생략된 버전 (empno as "사원번호")
--2) 외부 조인 outer join : 조건이 일치하지 않는 데이터도 함께 조회(왼쪽전체 + 교집합, 오른쪽 전체 + 교집합, 합집합)
--방법1. ANSI 표준
select * from emp left join depart using(deptno); --null값 가지고 있는거까지 다 불러옴
select empno, name, dname, deptno from emp left join depart using(deptno);
--방법2. 오라클 전용 구문
select e.name, d.dname, d.deptno from emp e, depart d where e.deptno=d.deptno(+); --left일땐 + 오른쪽
--right join
--방법1. ANSI 표준
select * from emp right join depart using(deptno);
--방법2. 오라클 전용 구문
select e.name, d.dname, d.deptno from emp e, depart d where e.deptno(+)=d.deptno; --right일땐 + 왼쪽
--full join (오라클 전용구문 존재하지 않음)
select * from depart full join emp using(deptno);

commit;
