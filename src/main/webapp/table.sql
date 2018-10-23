---- USERS TABLE -------------------
create table s_users
(user_id VARCHAR2(20) primary key,
user_pwd VARCHAR2(100) not null,
user_name VARCHAR2(20) not null,
user_email VARCHAR2(30),
user_phone VARCHAR2(20),
user_addr VARCHAR2(50),
user_isAdmin NUMBER DEFAULT 0,
user_profileImage VARCHAR2(100),
user_regdate DATE);

UPDATE s_users
SET user_isAdmin=1
WHERE user_id='sooyeolyoo';
-----------------------------------
---- PRODUCT 좋아요 TABLE -----------------------
create table s_product_like
(user_id VARCHAR2(20) not null,
product_id VARCHAR2(100) not null);
--------------------------------------------------
CREATE table s_product
(product_num NUMBER PRIMARY KEY,	--상품번호
product_name VARCHAR2(100),			--상품이름
product_price NUMBER,						--상품 가격
product_stock NUMBER,						--상품 재고
product_content	VARCHAR2(500),		--상품 내용
product_description CLOB,					--상품 상세 내용
product_saveFileName VARCHAR2(500),	--상품 이미지
product_regdate DATE						--상품 입력한 날짜
);
create sequence product_seq;
---- ORDER TABLE --------------------------------
CREATE TABLE s_order
(order_num VARCHAR2(40) PRIMARY KEY NOT NULL,	--주문 번호
user_id VARCHAR2(100) NOT NULL,							--사용자 ID
order_totalPrice NUMBER NOT NULL,							--총 금액
order_regdate VARCHAR2(30) NOT NULL,					--주문 날짜
order_name VARCHAR2(20) NOT NULL,						--상품 이름
order_address VARCHAR2(100) NOT NULL,					--고객 주소
order_phone VARCHAR2(20) NOT NULL,						--고객 핸드폰 번호
order_request CLOB);											--고객 요청
CREATE SEQUENCE s_order_seq; 
---- ORDER DETAIL TABLE --------------------------------
CREATE TABLE s_order_detail
(order_num VARCHAR2(40) NOT NULL,							--주문 번호
product_num NUMBER NOT NULL,						--상품 번호
product_name VARCHAR2(100) NOT NULL	,		--상품 번호
product_price NUMBER NOT NULL,			--상품 가격
product_quantity VARCHAR2(30) NOT NULL);		--상품 수량

---community 의 QnA -------------
CREATE TABLE s_comm_qna(
num NUMBER PRIMARY KEY, 						-- qna 글번호
writer VARCHAR2(50), 								-- 작성자
title VARCHAR2(100) NOT NULL, 					--글제목
content CLOB NOT NULL,							--내용 
target_id VARCHAR2(100), 						-- 답글의 대상이 되는 아이디 
qna_group NUMBER, 									-- 원글의 번호를 답변의 그룹번호로 지정 
viewCount NUMBER, 									-- 글 조회수 
passwdok VARCHAR2(50), 							-- 비밀글인지 아닌지 체크 !! 
passwd VARCHAR2(20), 							-- 글 비밀번호 설정 
isDeleted NUMBER, 									-- 삭제 된 글인지 여부. 1 이면 삭제 된 댓글
regdate DATE 											-- 댓글 등록일 
);
CREATE SEQUENCE s_comm_qna_seq;


----------------- NEWS의 table -----------------
CREATE TABLE s_news(
num NUMBER PRIMARY KEY,
writer VARCHAR2(100),
title VARCHAR2(100),
content CLOB,
viewcount NUMBER,
regdate DATE);

CREATE SEQUENCE s_news_seq;
------------------------------------------------
CREATE TABLE s_cart(
product_num NUMBER NOT NULL,               --상품번호
user_id VARCHAR2(100) NOT NULL,              --사용자 ID
cart_regdate VARCHAR2(30) NOT NULL,        --카트에 담은 날짜
product_name VARCHAR2(100) NOT NULL,      --상품이름
product_price NUMBER NOT NULL,            --상품 가격
product_quantity NUMBER NOT NULL,         --(회원이 선택한)상품 수량
product_content VARCHAR2(500) NOT NULL,      --상품 내용
product_img VARCHAR2(500) NOT NULL         --상품 이미지
);

select o.order_num, o.user_id, o.order_regdate, o.order_totalPrice, d.product_num, d.product_name, d.product_quantity
from (select *
			from s_order
			where order_num='2018092205015617') o, s_order_detail d
where d.order_num='2018092205015617'
			
SELECT o.order_num, o.user_id, o.order_regdate, o.order_totalPrice, d.product_num, d.product_name, d.product_quantity
FROM s_order o,s_order_detail d
WHERE o.order_num='2018092205015617' AND d.order_num='2018092205015617' AND o.order_num=d.order_num 

<select id="getData" resultType="OrderDto">
		SELECT o.order_num, o.user_id, o.order_regdate, d.product_num, d.product_name,
		d.product_price, d.product_quantity, d.product_price*d.product_quantity AS product_totalPrice
		FROM s_order o,s_order_detail d
		WHERE o.order_num=d.order_num
	</select>
	
	SELECT o.order_num, o.user_id, o.order_regdate, o.order_totalPrice, d.product_num, d.product_name, d.product_price, d.product_quantity
		FROM (SELECT *
					FROM s_order
					WHERE order_num='2018092205015617') o, s_order_detail d
		WHERE d.order_num='2018092205015617'