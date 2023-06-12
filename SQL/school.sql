--create table [소유자명].테이블 이름 (
--    컬럼명1 데이터타입 [제약조건],
--    컬럼명2 데이터타입 [제약조건],
--)

--create table TB_MEMBER (
--    MEMBER_ID VARCHAR2(30) PRIMARY KEY,
--    NAME VARCHAR2(50) NOT NULL,
--    BIRTH DATE,
--    GENDER VARCHAR2(10),
--    EMAIL VARCHAR2(100),
--    PHONE VARCHAR2(13)
--);

create table person (

        seq_person number primary key,
        ssn varchar2(20) unique,
        name varchar2(20) not null,
        age number,
        type varchar2(10)
        
        );
        
create table student (
        seq_student number primary key,
        stdno varchar2(5) not null,
        seq_person number references person(seq_person)
        );
        
create table teacher (
        seq_teacher number primary key,
        major varchar2(30) not null,
        seq_person number references person(seq_person)
        );
        
create table staff (
        seq_staff number primary key,
        dept varchar2(30) not null,
        seq_person number references person(seq_person)
        );
        
        
select * from tb_person;
select * from tb_student;
select * from tb_teacher;
select * from tb_staff;

create sequence seq_school;
create sequence seq_person;
create sequence seq_student;
create sequence seq_teacher;
create sequence seq_staff;



insert into person (seq_person, ssn, name, age, type)
values (seq_person.nextval, '111111', 'Yoo', '28', 'student');

insert into person (seq_person, ssn, name, age, type)
values (seq_person.nextval, '222222', 'kim', '38', 'teacher');

insert into person (seq_person, ssn, name, age, type)
values (seq_person.nextval, '333333', 'park', '48', 'staff');



insert into student (seq_student, stdno, seq_person)
values (seq_student.currval, '15', '25');

insert into teacher (seq_teacher, major, seq_person)
values (seq_teacher.currval, 'math', '26');

insert into staff (seq_staff, dept, seq_person)
values (seq_staff.nextval, 'clear', '27');

commit;

select * from student;
select * from person;


	select
		p.seq_person,
		p.name,
		p.ssn,
		p.age,
		p.type,
		s.seq_student,
		s.stdno
	from
		person p,
		student s
	where
		p.seq_person = s.seq_person;
        
        	select
		p.seq_person,
		p.name,
		p.ssn,
		p.age,
		p.type,
		s.seq_staff,
		s.dept
	from
		person p,
		staff s
	where
		p.seq_person = s.seq_person;
        
        
        
        
