-- 계정생성

--create user 계정명 indentified by 패스워드

create user member identified by 1234;

-- 생선된 계정에 권한 부여

grant resource, create session, create table, create sequence to member;


create user hospital identified by 1234;

grant resource, create session, create table, create sequence to hospital;


create user memo identified by 1234;

grant resource, create session, create table, create sequence to memo;

alter user hr account unlock;

alter user hr identified by hr;

create user board identified by 1234;

grant resource, create table, create session, create sequence to board;



CREATE USER exercise IDENTIFIED BY 92949597;

GRANT resource, CREATE session, CREATE table, CREATE sequence TO exercise;









