create table member (
member_id varchar2(20) primary key,
password varchar2(20) not null,
name varchar2(50) not null
);

create table movie (
movie_id number primary key,
title varchar(300) not null
);

create table review (
review_id number primary key,
contents varchar2(2000) not null,
score number not null,
movie_id number references movie(movie_id),
member_id varchar2(20) references member(member_id),
created_date date default sysdate
);

create sequence seq_movie;

select * from member;
select * from movie;
select * from review;

INSERT INTO movie VALUES (seq_movie.nextval, '카운트');
INSERT INTO movie VALUES (seq_movie.nextval, '서치2');
INSERT INTO movie VALUES (seq_movie.nextval, '살수');
INSERT INTO movie VALUES (seq_movie.nextval, '마루이 비디오');
INSERT INTO movie VALUES (seq_movie.nextval, 'TAR 타르');
INSERT INTO movie VALUES (seq_movie.nextval, '미녀와 야수: 마법에 걸린 왕자');
INSERT INTO movie VALUES (seq_movie.nextval, '스톰 보이');
INSERT INTO movie VALUES (seq_movie.nextval, '극장판 카케구루이2: 절체절명의 러시안 룰렛');
INSERT INTO movie VALUES (seq_movie.nextval, '앤트맨과 와스프: 퀀텀매니아');

commit;
