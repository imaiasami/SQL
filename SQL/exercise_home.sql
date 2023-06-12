select * from exercise where diff = 0;
select * from equipment;
select * from member;
select * from ex_book;
select * from rout_d_book;
select * from rout_default order by rout_d_no asc;
-- 운동은 '55:2, 14:2, 7:2, 43:2 / 63:2, 12:2, 7:2, 43:2',
-- 장비는 'dumbbell, band' 으로 넣어야 한다. 전자는 순서대로, 후자는 순서 무상관 --
update rout_default set runtime = 40 where rout_d_no = 23;


commit;

