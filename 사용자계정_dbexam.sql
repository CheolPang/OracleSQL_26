----------------[3.p73_selfEX Quiz]---------------
create table department(
deptno number not null, --부서번호(학과번호)
dname varchar2(25) not null, --부서명(학과명)
loc varchar2(10) default null --위치(건물명)
);


select * from department;
----drop table depart purge;


INSERT INTO department(deptno, dname) VALUES (302, '전기공학과');
INSERT INTO departmentVALUES (101, '컴퓨터공학과', '1호관');
INSERT INTO departmentVALUES (102, '멀티미디어학과', '2호관');
INSERT INTO departmentVALUES (201, '전자공학과', '3호관');
INSERT INTO departmentVALUES (202, '기계공학과', '4호관');

-- professor 테이블
CREATE TABLE professor (
profno number NOT NULL,       -- 교수번호
name varchar2(20) NOT NULL,   -- 이름
userid varchar2(10) NOT NULL, -- 아이디
position varchar2(20) NOT NULL,   -- 직급
sal number NOT NULL,          -- 급여
hiredate date NOT NULL,           -- 입사일
comm number DEFAULT NULL, -- 보직수당
deptno number NOT NULL,       -- 부서번호(학과번호)
PRIMARY KEY (profno));    


INSERT INTO professor VALUES
(9901, '김도훈', 'capool', '교수', 500,
To_Date( '2010.12.08 16:33', 'yyyy.mm.dd hh24:mi'), 20, 101);
INSERT INTO professor VALUES
(9902, '이재우', 'sweat413', '조교수', 320,
To_Date( '1995.04.12 00:00:00', 'yyyy.mm.dd hh24:mi:ss'), null, 201);
INSERT INTO professor VALUES
(9903, '성연희', 'pascal', '조교수', 360,
To_Date('1993.03.17', 'YYYY.MM.DD'), 15, 101);
INSERT INTO professor VALUES
(9904, '염일웅', 'blue77', '전임강사', 240,
To_Date('1998-10-11 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), null, 102);
INSERT INTO professor VALUES
(9905, '권혁일', 'refresh', '교수', 450,  
To_Date('1986-02-11 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), 25, 102);
INSERT INTO professor VALUES
(9906, '이만식', 'pocari', '부교수', 420,  
To_Date('1988-07-11 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), null, 101);
INSERT INTO professor VALUES
(9907, '전은지', 'totoro', '전임강사', 210,  
To_Date('2001-05-11 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), null, 101);
INSERT INTO professor VALUES
(9908, '남은혁', 'bird13', '부교수', 400,  
To_Date('1990-10-18 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), 17, 202);



--student 테이블
CREATE TABLE student (
studno number NOT NULL,       -- 학생번호
name varchar2(20) NOT NULL,   -- 이름
userid varchar2(10) NOT NULL,     -- 아이디
grade number NOT NULL,        -- 학년
idnum varchar2(13) NOT NULL,  -- 주민번호
birthdate date NOT NULL,      -- 생년월일
tel varchar2(15) NOT NULL,    -- 전화번호
height number NOT NULL,       -- 키
weight number NOT NULL,       -- 몸무게
deptno number NOT NULL,       -- 학과번호
profno number DEFAULT NULL,   -- 담당교수의 일련번호
PRIMARY KEY (studno)) ;


INSERT INTO student VALUES
(10101, '전인하', 'jun123', 4, '7907021369824', To_Date('1979-07-02', 'yyyy-mm-dd'), '051)781-2158', 176, 72, 101, 9903);
INSERT INTO student VALUES
(10102, '박미경', 'ansel414', 1, '8405162123648', To_Date('1984-05-16', 'yyyy-mm-dd'), '055)261-8947', 168, 52, 101, null);
INSERT INTO student VALUES
(10103, '김영균', 'mandu', 3, '8103211063421', To_Date('1981-03-21', 'yyyy-mm-dd'), '051)824-9637', 170, 88, 101, 9906);
INSERT INTO student VALUES
(10104, '지은경', 'gomo00', 2, '8004122298371', To_Date('1980-04-12', 'yyyy-mm-dd'), '055)418-9627', 161, 42, 101, 9907);
INSERT INTO student VALUES
(10105, '임유진', 'youjin12', 2, '8301212196482', To_Date('1983-01-21', 'yyyy-mm-dd'), '02)312-9838', 171, 54, 101, 9907);
INSERT INTO student VALUES
(10106, '서재진', 'seolly', 1, '8511291186273', To_Date('1985-11-29', 'yyyy-mm-dd'), '051)239-4861', 186, 72, 101, null);
INSERT INTO student VALUES
(10107, '이광훈', 'huriky', 4, '8109131276431', To_Date('1981-09-13', 'yyyy-mm-dd'), '055)736-4981', 175, 92, 101, 9903);
INSERT INTO student VALUES
(10108, '류민정', 'cleansky', 2, '8108192157498', To_Date('1981-08-19', 'yyyy-mm-dd'), '055)248-3679', 162, 72, 101, 9907);
INSERT INTO student VALUES
(10201, '김진영', 'simply', 2, '8206062186327', To_Date('1982-06-06', 'yyyy-mm-dd'), '055)419-6328', 164, 48, 102, 9905);
INSERT INTO student VALUES
(10202, '오유석', 'yousuk', 4, '7709121128379', To_Date('1977-09-12', 'yyyy-mm-dd'), '051)724-9618', 177, 92, 102, 9905);
INSERT INTO student VALUES
(10203, '하나리', 'hanal', 1, '8501092378641', To_Date('1985-01-09', 'yyyy-mm-dd'), '055)296-3784', 160, 68, 102, null);
INSERT INTO student VALUES
(10204, '윤진욱', 'samba7', 3, '7904021358671', To_Date('1979-04-02', 'yyyy-mm-dd'), '053)487-2698', 171, 70, 102, 9905);
INSERT INTO student VALUES
(20101, '이동훈', 'dals', 1, '8312101128467', To_Date('1983-12-10', 'yyyy-mm-dd'), '055)426-1752', 172, 64, 201, null);
INSERT INTO student VALUES
(20102, '박동진', 'ping2', 1, '8511241639826', To_Date('1985-11-24', 'yyyy-mm-dd'), '051)742-6384', 182, 70, 201, null);
INSERT INTO student VALUES
(20103, '김진경', 'lovely', 2, '8302282169387', To_Date('1983-02-28', 'yyyy-mm-dd'), '052)175-3941', 166, 51, 201, 9902);
INSERT INTO student VALUES
(20104, '조명훈', 'rader214', 1, '8412141254963', To_Date('1984-12-14', 'yyyy-mm-dd'), '02)785-6984', 184, 62, 201, null);


select * from student;
select * from professor;
commit;

select name, sal ,plus from professor;

select * from users;
create table users(
    ID varchar2(4000), 
    PW varchar2(4000),
    NM varchar2(4000),
    WARN number(1),
    BAN number(1),
    logtime date
);



---------------[school data]-----------------
--table 작성
create table school(
    name VARCHAR2(15) not null,
    value VARCHAR2(30),
    code number,--1이면 학생, 2이면 교수, 3이면 관리자
    logtime date
);
---drop table school purge;
desc school;
select * from tab;


insert into school values('홍길동', '2018001', 1,sysdate);
insert into school values('홍길선', '컴퓨터공학부', 2,sysdate);
insert into school values('김길관', '관리부', 3,sysdate);
select * from school;
select * from school where name like '%홍%';
delete school where name='홍길동';
commit;