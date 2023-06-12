
-- 테이블 생성

--create table [소유자명].테이블 이름 (
--    컬럼명1 데이터타입 [제약조건],
--    컬럼명2 데이터타입 [제약조건],
--)

create table TB_MEMBER (
    MEMBER_ID VARCHAR2(30) PRIMARY KEY,
    NAME VARCHAR2(50) NOT NULL,
    BIRTH DATE,
    GENDER VARCHAR2(10),
    EMAIL VARCHAR2(100),
    PHONE VARCHAR2(13)
);

select * from tb_member;

-- insert 문법
-- insert into 테이블명 (컬럼명1, 컬럼명2, ...)
-- values (컬럼1의 값, 컬럼2의 값, ...)

insert into tb_member (member_id, name, birth, gender, email)
values ('hong', '홍길동', '1990-02-03', 'MALE', 'hong@naver.com');

-- Update 문법
-- update 테이블명 set 컬럼명1 = 데이터1, 컬럼명2 = 데이터2, ...
-- where 조건
-- update는 조건을 주지 않으면 모두 바뀌기 때문에, 꼭 조건을 주어야 한다.

update tb_member set birth = to_date('1995-05-20', 'YYYY-MM-DD'), phone = '010-1111-2222'
where member_id = 'hong';

-- 모든 컬럼에 값을 insert하는 함수

insert into tb_member values('kim', '김개똥', '2000-12-25', 'FEMALE', 'kim@naver.com', null);

insert into tb_member values('lee', '이말똥', '1995-12-25', 'FEMALE', 'lee@abc.com', null);


-- TCL 을 써야지 테이블에 영구 저장이 가능하다

commit;
rollback;

-- delete 문법

-- delete from 테이블명 where 조건

delete from tb_member where member_id = 'kim';

select * from tb_member;

-- alter 는 테이블에 컬럼을 추가하는 명령어

-- alter table 테이블명 add 컬럼명 데이터타입 제약조건

alter table tb_member add join_date date;

desc tb_member;

select * from tb_member;

update tb_member set join_date = current_date;

update tb_member set join_date = sysdate;

-- 컬럼명 변경
-- alter table 테이블명 rename column 기존 컬럼명 to 변경할 컬럼명;

alter table tb_member rename column name to member_name;

select * from tb_member;

-- 컬럼 삭제
-- alter table 테이블명 drop column 컬럼명

alter table tb_member drop column join_date;

select * from tb_member;

-- 컬럼 타입 변경
-- alter table 테이블명 modify 컬럼명 데이터타입

alter table tb_member modify member_name VARCHAR2(200);

-- 테이블 삭제
-- drop table 테이블명

drop table tb_member;

select * from tb_member;


create table tb_board (
    board_id number primary key,
    title varchar2(200) not null,
    content varchar2(4000) not null,
    input_date date default sysdate,
    update_date date default sysdate,
    hit number default 0,
    member_id varchar2(30) references tb_member(member_id)
);

select * from tb_board;
insert into tb_board (board_id, title, content, member_id)
values (1, '테스트 제목', '테스트 내용', 'Yoo');
rollback;
commit;

delete from tb_member where member_id = 'Yoo';      -- 자식을 먼저 지우지 않고서는 부모를 지울 수 없다.
delete from tb_board where member_id = 'Yoo';



-- 시퀀스 생성

-- create sequence [시퀀스명] [옵션]

create sequence seq_board;

-- 시퀀스 값 생성하기

select seq_board.nextval from dual;

-- 시퀀스 값 가져오기, 현재까지 생선된 시퀀스값의 가장 마지막 값을 가져오는 것.

-- select [시퀀스명].curval from dual;

select seq_board.currval from dual;

insert into tb_board (board_id, title, content, member_id)
values (seq_board.nextval, '테스트 제목', '테스트 내용', 'hong');
select * from tb_member;

select * from tb_board;

-- 시퀀스 전용 테이블을 생성해서 사용

create table seq_board(seq number)
insert into seq_board values (max(seq) +1);

-- 시퀀스 전략
-- 1. 시퀀스 객체 생성(오라클)
-- 2. 시퀀스 전용 테이블을 생성해서 사용
-- 3. 오토 인크리먼트 (MySQL, MariaDB, ...)


select * from tb_member;
select * from tb_board;
select seq_board.nextval from dual;
select seq_board.currval from dual;

select
b.board_id,
b.title,
b.content,
m.member_id,
m.name
from
tb_board b,
tb_member m
where
b.member_id = m.member_id
and board_id = '25';



select * from tb_member;
select * from tb_board;

alter table tb_member

rename column name to member_name;

insert into tb_board (board_id, title, content, member_id)
values (seq_board.nextval, 'a', 'a', 'hong');

update tb_board set hit=1 where board_id = 37;

select * from tb_board where board_id in (26, 31, 37);


delete from tb_board;

commit;
