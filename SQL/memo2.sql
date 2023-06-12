create table memo (
    no number primary key,
    title varchar2(500) not null,
    content varchar2(4000) not null,
    indate date default sysdate
    );
    
create sequence memo_seq;

select * from memo;

commit;
    
    