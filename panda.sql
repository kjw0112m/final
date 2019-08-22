--필수 테이블(먼저 만들어져야할 테이블)
--회원 테이블
create table member(
id varchar2(30) primary key,
pw varchar2(128) not null,
name varchar2(21) not null,
email varchar2(255) unique,
phone varchar2(32) not null,
post_code varchar2(12) not null,
basic_addr varchar2(255) not null,
detail_addr varchar2(64),
regist_dt date default sysdate,
login_dt date,
pw_dt date default sysdate,
birth varchar2(16) not null
);

--판매자 테이블
create table seller(
id varchar2(30) primary key,
pw varchar2(128) not null,
name varchar2(21) not null,
nickname varchar2(60) unique,
email varchar2(255) unique,
phone varchar2(32) not null,
regist_dt date default sysdate,
login_dt date,
url varchar2(1000) not null,
main_yn varchar2(2) check (main_yn in('y','n'))
);

--관리자 테이블
create table admin(
id varchar2(30) primary key,
pw varchar2(128) not null
);

--파일 테이블
create table files(
savename varchar2(255) not null,
uploadname varchar2(255) not null,
len number not null,
type varchar2(255) not null
);

--주카테고리 테이블
create table category(
id number primary key,
name varchar2(30) not null
);
create sequence category_seq;

--판매자요청 테이블
create table seller_application(
id number primary key,
title varchar2(300) not null,
content varchar2(1500) not null,
name varchar2(21) not null,
nickname varchar2(60) unique,
phone varchar2(32) not null,
email varchar2(255) unique,
url varchar2(1000) not null
);
create sequence seller_appli_seq;

---------------------------------------------------------------------------------------------------------------------------
-- 외래키 필요한 테이블
---------------------------------------------------------------------------------------------------------------------------
-- 인증 테이블
create table cert(
no varchar2(64) primary key,
who constraint cert_member_fk references member(id) on delete cascade,
when date not null
);

-- 상품 테이블
create table product(
id number primary key,
seller_id constraint product_seller_fk references seller(id) on delete cascade,
sub_category_id constraint product_sub_category_fk references sub_category(id) on delete set null,
name varchar2(100) not null,
price number not null,
quantity number not null,
dis_rate number default  100,
regist_dt date default sysdate,
sale_yn varchar2(2) check (sale_yn in('y','n')),
hit_yn varchar2(2) check (hit_yn in('y','n')),
display_yn varchar2(2) check (display_yn in('y','n'))
);
create sequence product_seq;

-- 적립금 테이블
create table point(
id number primary key,
member_id constraint point_member_fk references member(id) on delete cascade,
use_point number default 1000,
current_point number default 1000,
total_point number default 1000,
content varchar2(100) default '회원가입 보너스',
when date default sysdate
);
create sequence point_seq;

-- 수익금 테이블
create table proceeds(
id number primary key,
seller_id constraint proceeds_seller_fk references seller(id) on delete cascade,
sell_money number not null,
total_money number not null,
current_money number not null,
content varchar2(255) not null,
when date default sysdate
);
create sequence proceeds_seq;

-- 상품 후기 테이블
create table review(
id number primary key,
title varchar2(300) not null,
content varchar2(4000) not null,
regist_dt date default sysdate,
orders_id constraint review_orders_fk references orders(order_id) on delete cascade
);

drop table review;
drop table orders;
drop table transport;
create sequence review_seq;

-- 주문 테이블
create table orders(
order_id varchar2(50) primary key,
id number,
product_id constraint orders_product_fk references product(id) on delete set null,
member_id constraint orders_member_fk references member(id) on delete cascade,
t_id constraint orders_transport_fk references transport(id) on delete cascade,
quantity number not null,
order_dt date default sysdate,
pay_type varchar2(20) not null,
total_price number not null,
discount_price number not null,
status varchar2(6) check(status in('입금전','입금완료','결제완료','배송중','배송완료','구매확정')),
cs_status varchar2(6) check(cs_status in('취소', '반품', '교환', '환불')),
t_invoice varchar2(30),
CONSTRAINT orders_uk unique(id, order_dt)
);

create table transport(
id varchar2(4) primary key,
name varchar2(50) not null
);
create sequence orders_seq
    start with 1000
    maxvalue 9999
    minvalue 1000;
drop sequence orders_seq;

commit;

-- 장바구니 테이블
create table cart(
id number primary key,
product_id constraint cart_product_fk references product(id) on delete set null,
member_id constraint cart_member_fk references member(id) on delete cascade,
total_price number not null,
quantity number not null,
team number not null
);
create sequence cart_seq;

-- 팔로우 테이블
create table follow(
id number primary key,
member_id constraint follow_member_fk references member(id) on delete cascade,
seller_id constraint follow_seller_fk references seller(id) on delete cascade
);
create sequence follow_seq;

-- 1:1문의 테이블
create table contact(
id number primary key,
member_id constraint contact_member_fk references member(id) on delete cascade,
title varchar2(300) not null,
content varchar2(4000) not null,
regist_dt date default sysdate,
team number not null
);
create sequence contact_seq;

--서브 카테고리 테이블
create table sub_category(
id number primary key,
category_id constraint sub_cateogry_cateogry_fk references category(id) on delete cascade,
name varchar2(60) not null
);

-- 회원등급 테이블
create table grade(
id number primary key,
name varchar2(15) not null
);

--채팅 테이블
create table chat(
id number primary key,
member_id constraint chat_member_fk references member(id) on delete cascade,
seller_id constraint chat_seller_fk references seller(id) on delete cascade,
content varchar2(4000) not null
);
create sequence chat_seq;

commit;
--외래키명 constraint 테이블명_참조테이블명_fk references 참조테이블명(id) on delete cascade 또는 on delete set null
--com.kh17.panda 패키지명

create or replace view cart_view as
select
c.id cart_id,
c.member_id member_id,
p.seller_id product_seller_id,
p.name product_name,
p.price product_price,
s.sizes sizes_sizes
from
   	product p
    inner join cart c
            on p.id = c.product_id
	inner join sizes s
	    on p.id = s.product_id;


create or replace view order_view as
select
p.name product_name,
p.seller_id, 
o.cs_status,
o.status,
o.member_id,
o.order_dt,
o.order_id,             -- 품목별 주문번호
o.pay_type,
o.t_invoice,
o.team,                 -- 총 주문번호
m.basic_addr,
m.detail_addr,
m.name member_name,
m.phone
from
   	product p
    inner join orders o
            on p.id = o.product_id
    inner join member m
            on m.id = o.member_id;
        
        
create or replace view product_subcategory
as
select
    s.id subcategory_id,
    s.category_id,
    s.name subcategory_name,
    p.id product_id,
    p.seller_id,
    p.name product_name,
    p.price,
    p.dis_rate,
    p.regist_dt,
    p.sale_yn,
    p.hit_yn,
    p.display_yn,
    c.name category_name
from
    sub_category S 
    inner join product P
        on S.id = P.sub_category_id
    inner join category C
        on C.id = S.category_id;