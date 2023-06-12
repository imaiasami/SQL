select * from tabs;

create table board (
id number primary key,
title varchar2(500) not null,
content varchar2(4000),
hit number default 0,
input_date date default sysdate,
name varchar2(100) not null,
password varchar2(100) not null
);

create sequence seq_board;

-- alter table board rename column ____ to _____;

select * from board;

create table member(
id varchar2(20) primary key,
password varchar2(20) not null,
name varchar2(50) not null,
gender varchar2(10),
birth date
);

select * from member;
delete from member where id = 123;

create table boardv2 (
board_id number primary key,
title varchar2(500) not null,
content varchar2(4000),
hit number default 0,
input_date date default sysdate,
id varchar2(20) references member(id)
);

select * from boardv2;

insert into boardv2 (board_id, title, content, id)
values (seq_board.nextval, '테스트 제목', '테스트 내용', 'userA');

commit;

create table attached_file (
    id number primary key,
    originalfile varchar2(4000),
    savedfile varchar2(4000)
    );
    
select * from attached_file;

insert into attached_file values (seq_board.nextval, 'abc', 'abc');

commit;

select rownum, a.* from attached_file a;
-- 가상의 시퀀스(오름차순)를 붙여주는 명령어 --

select * from (select rownum as rn, a.* from attached_file a) where rn between 11 and 20;
-- 11에서 20인 것만 출력하는 명령어 --

create table reply (
    reply_id number primary key,
    board_id number references boardv2(board_id),
    id varchar2(20) references member(id),
    content varchar2(4000),
    input_date date default sysdate
);

select * from reply;

drop table reply;


    

