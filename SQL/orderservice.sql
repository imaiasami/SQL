CREATE TABLE member(
	member_id varchar2(20) PRIMARY KEY,
	password varchar2(20) NOT NULL,
	name varchar2(50) NOT null
);

CREATE TABLE product(
	product_id NUMBER PRIMARY KEY,
	name varchar2(500) NOT NULL,
	stock NUMBER,
	price number
);

CREATE TABLE ORDERS(
	order_id NUMBER PRIMARY KEY,
	member_id REFERENCES member(member_id),
	product_id REFERENCES product(product_id),
	count NUMBER,
	order_price number,
	order_date DATE DEFAULT sysdate 
);

CREATE SEQUENCE seq_order;

-- 초기 삽입 데이터(상품 정보)
INSERT INTO product VALUES (seq_order.nextval, '상품1', 10, 10000);
INSERT INTO product VALUES (seq_order.nextval, '상품2', 10, 20000);
INSERT INTO product VALUES (seq_order.nextval, '상품3', 10, 15000);
INSERT INTO product VALUES (seq_order.nextval, '상품4', 10, 30000);
INSERT INTO product VALUES (seq_order.nextval, '상품5', 10, 50000);

delete from member;
delete from orders;
select * from member;
select * from orders;

alter table member modify password varchar2(60);
alter table member add gender varchar2(20);
alter table member add birth date;
alter table member add email varchar2(200);
-- 사용자 권한 --
alter table member add role varchar2(30);


commit;

select m.member_id, m.name as memberName, p.product_id, p.name as productName, p.stock, p.price, o.order_id, o.count, o.order_price, o.order_date
from orders o join member m on (o.member_id = m.member_id) join product p on (o.product_id = p.product_id)
where o.order_id = 123;