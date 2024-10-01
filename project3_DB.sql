-- 테이블 삭제 (위에서부터 아래로 지우기)
drop view cartlistviewL;			-- 뷰 (대형)
drop view cartlistviewM;			-- 뷰 (중형)
drop view cartlistviewS;			-- 뷰 (소형)
drop table ticket;              -- 구매내역
drop table s_hall;              -- 소형공연장
drop table m_hall;              -- 중형공연장
drop table l_hall;				-- 대형공연장
drop table cart_seat;			-- 장바구니좌석
drop table cart;				-- 장바구니
drop table performance_date;	-- 공연날짜

drop table payment;             -- 결제 내역
drop table orders_seat;			-- 주문 좌석
drop table orders;              -- 주문 정보
drop table seat;                -- 좌석

drop table user_review_readhit; -- 후기 조회수
drop table review_score;        -- 후기(공감)
drop table review;              -- 후기

drop table faq;
drop table comment_tb;
drop table board;
drop table board_cate;
drop table qna_comment;
drop table qna;

drop table performance_ex_like;		-- 공연좋아요 
drop table member;
drop table casting;					-- 캐스팅
drop table actor;					-- 배우

drop table performance;           -- 공연(상품)
drop table performance_detail_cate;
drop table performance_cate;
drop table hall;
drop table area;




CREATE TABLE member (
    mem_idx INT PRIMARY KEY AUTO_INCREMENT,         -- 회원번호
    mem_name VARCHAR(100) NOT NULL,                 -- 회원명
    mem_id VARCHAR(100) NOT NULL,                   -- 회원아이디
    mem_pwd VARCHAR(100) NOT NULL,                  -- 회원비밀번호
    mem_nickname VARCHAR(100) NOT NULL,             -- 회원닉네임
    mem_birth date NOT NULL,      	                -- 생년월일
    mem_phone VARCHAR(100) NOT NULL,                -- 핸드폰 번호
    mem_email VARCHAR(100) NOT NULL,                -- 이메일
    mem_zipcode CHAR(5),                            -- 우편번호
    mem_addr VARCHAR(100),                          -- 주소
    mem_ip VARCHAR(100) NOT NULL,                   -- 아이피
    mem_regdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,-- 등록일자
    mem_filename VARCHAR(100) DEFAULT 'basic.png',  -- 프로필이미지명
    mem_point INT DEFAULT 0,                        -- 회원보유포인트
    mem_grade VARCHAR(100) NOT NULL                 -- 회원등급('일반' or '관리자')
);
create table area (
	area_idx INT PRIMARY KEY AUTO_INCREMENT,   
    area_name varchar(100) not null
);
CREATE TABLE hall (
    hall_idx INT PRIMARY KEY AUTO_INCREMENT,                -- 공연장번호
    area_idx int not null,									-- 지역번호(FK)
    hall_name VARCHAR(100) NOT NULL,                        -- 공연장이름
    hall_area VARCHAR(100) NOT NULL,                        -- 공연장지역
    hall_addr VARCHAR(200) NOT NULL,                        -- 공연장주소
    hall_tel VARCHAR(100) NOT NULL,                         -- 공연장전화번호
    hall_site VARCHAR(100) NOT NULL,                        -- 공연장홈페이지
    hall_seat INT NOT NULL,                                 -- 공연장좌석수
    hall_image VARCHAR(100) NOT NULL DEFAULT 'no_image.png', -- 공연장이미지 (기본값: no_image.png)
	FOREIGN KEY (area_idx) REFERENCES area(area_idx) ON UPDATE CASCADE ON DELETE CASCADE -- 외래키 설정: performance_cate 테이블의 performance_cate_idx 참조
);
CREATE TABLE performance_cate (
    performance_cate_idx INT PRIMARY KEY AUTO_INCREMENT,-- 공연카테고리번호
    performance_cate_name VARCHAR(100) NOT NULL         -- 공연카테고리명
);
CREATE TABLE performance_detail_cate (
    performance_detail_cate_idx INT PRIMARY KEY AUTO_INCREMENT,                   -- 공연세부카테고리번호
    performance_cate_idx INT NOT NULL,                                            -- 공연카테고리번호(FK)
    performance_detail_cate_name VARCHAR(100) NOT NULL,                           -- 공연세부카테고리이름
    FOREIGN KEY (performance_cate_idx) REFERENCES performance_cate(performance_cate_idx) ON UPDATE CASCADE ON DELETE CASCADE -- 외래키 설정: performance_cate 테이블의 performance_cate_idx 참조
);

CREATE TABLE performance (
    performance_idx INT PRIMARY KEY AUTO_INCREMENT,                                                 			-- 공연번호
    performance_cate_idx INT NOT NULL,                                                             				-- 공연카테고리번호(FK)
    performance_detail_cate_idx INT NOT NULL,                                                       			-- 공연카테고리세부번호(FK)
    hall_idx INT NOT NULL,                                                                      				-- 공연장번호(FK)
    area_idx int not null,																						-- 지역번호(FK)
    performance_name VARCHAR(100) NOT NULL,                                                         			-- 공연이름
    performance_startday datetime NOT NULL,                                                     				-- 공연시작일자
    performance_endday datetime NOT NULL,                                                       				-- 공연종료일자
    performance_runtime VARCHAR(100) NOT NULL,                                                      			-- 공연진행시간
    performance_image VARCHAR(100) DEFAULT 'no_image.png',                                          			-- 공연이미지명
    performance_age INT NOT NULL,                                                                   			-- 최소공연관람나이		
    performance_state char(1) default 'w', 																		-- 공연테이블에 추가-- 상영상태 (상영 전: w, 상영 중: p, 상영 종료: f)
    performance_detail_info text NULL,                  														-- 공연상세정보
    performance_al			text null,																			-- 공지사항
    performance_detail_image VARCHAR(100) NULL,                 											-- 공연이미지명
	FOREIGN KEY (performance_cate_idx) REFERENCES performance_cate(performance_cate_idx) ON UPDATE CASCADE ON DELETE CASCADE,                   	-- 외래키 설정: performance_cate 테이블의 performance_cate_idx 참조
	FOREIGN KEY (area_idx) REFERENCES area(area_idx) ON UPDATE CASCADE ON DELETE CASCADE, -- 외래키 설정: performance_cate 테이블의 performance_cate_idx 참조
    FOREIGN KEY (hall_idx) REFERENCES hall(hall_idx) ON UPDATE CASCADE ON DELETE CASCADE,                                           				-- 외래키 설정: hall 테이블의 hall_idx 참조
    FOREIGN KEY (performance_detail_cate_idx) REFERENCES performance_detail_cate(performance_detail_cate_idx) ON UPDATE CASCADE ON DELETE CASCADE	-- 외래키 설정: performance_detail_cate 테이블의 performance_detail_cate_idx 참조
);

CREATE TABLE faq (
    faq_idx INT PRIMARY KEY AUTO_INCREMENT,             -- FAQ번호
    faq_title VARCHAR(200) NOT NULL,                    -- FAQ제목
    faq_content TEXT NOT NULL,                          -- FAQ내용
	faq_regdate	timestamp default current_timestamp		-- FAQ등록일자
);
CREATE TABLE board_cate (
    board_cate_idx INT PRIMARY KEY AUTO_INCREMENT,              -- 게시판카테고리번호
    board_cate_name VARCHAR(100) NOT NULL                       -- 게시판카테고리이름
);
CREATE TABLE board (
    board_idx INT PRIMARY KEY AUTO_INCREMENT,                  			-- 게시글번호
    board_cate_idx INT NOT NULL,                               			-- 게시판카테고리번호(FK)
    mem_idx INT NOT NULL,                                      			-- 회원번호(FK)
    board_name VARCHAR(100) NOT NULL,                          			-- 게시글이름
    board_content TEXT NOT NULL,                               			-- 게시글내용
    board_ip VARCHAR(100) NOT NULL,                            			-- 아이피
    board_regdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,         			-- 게시글 작성일자
    board_readhit INT default 0,                               			-- 조회수
    board_use CHAR(1) NOT NULL DEFAULT 'y',                    			-- 게시글 삭제유무(삭제시 'n'으로 변경)
    mem_nickname VARCHAR(100) NOT NULL,                                 -- 닉네임
    FOREIGN KEY (board_cate_idx) REFERENCES board_cate(board_cate_idx) ON UPDATE CASCADE ON DELETE CASCADE, -- 외래키 설정: board_cate 테이블의 board_cate_idx 참조
    FOREIGN KEY (mem_idx) REFERENCES member(mem_idx) ON UPDATE CASCADE ON DELETE CASCADE                   -- 외래키 설정: member 테이블의 mem_idx 참조
);
CREATE TABLE comment_tb (
    cmt_idx INT PRIMARY KEY AUTO_INCREMENT,                 -- 게시판댓글번호
    board_idx INT NOT NULL,                                 -- 게시글번호(FK)
    mem_idx INT NOT NULL,                                   -- 회원번호(FK)
    cmt_content VARCHAR(200) NOT NULL,                      -- 댓글내용
    cmt_ip VARCHAR(100) NOT NULL,                           -- 아이피
    cmt_regdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,        -- 댓글 작성일자
    mem_nickname VARCHAR(100) NOT NULL,                     -- 닉네님
    FOREIGN KEY (board_idx) REFERENCES board(board_idx) ON UPDATE CASCADE ON DELETE CASCADE,    -- 외래키 설정: board_cate 테이블의 board_cate_idx 참조
    FOREIGN KEY (mem_idx) REFERENCES member(mem_idx) ON UPDATE CASCADE ON DELETE CASCADE       -- 외래키 설정: member 테이블의 mem_idx 참조
);
CREATE TABLE qna (
    qna_idx INT PRIMARY KEY AUTO_INCREMENT,             -- Q&A번호
    mem_idx INT NOT NULL,                               -- 회원번호(FK)
    qna_title VARCHAR(100) NOT NULL,                    -- Q&A제목
    qna_content TEXT NOT NULL,                          -- Q&A내용
    mem_nickname VARCHAR(100) NOT NULL,                 -- 닉네임
    qna_regdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,    -- Q&A등록일자
    qna_use CHAR(1) DEFAULT 'n',                        -- 답변유무(답변시 'y'로 변경)
    FOREIGN KEY (mem_idx) REFERENCES member(mem_idx) ON UPDATE CASCADE ON DELETE CASCADE    -- 외래키 설정: member 테이블의 mem_idx 참조
);
create table qna_comment (
	qna_cmt_idx int primary key auto_increment,			-- 답변번호
    mem_idx int not null,								-- 회원번호(FK)
    qna_idx int not null,								-- Q&A번호(FK)
    qna_cmt_content text not null,						-- 답변내용
    qna_cmt_regdate timestamp default current_timestamp,-- 답변작성 일자
    mem_nickname varchar(100) not null,					-- 회원 닉네임
    foreign key (mem_idx) references member(mem_idx) ON UPDATE CASCADE ON DELETE CASCADE,	-- 외래키 설정: member 테이블의 mem_idx 참조
    foreign key (qna_idx) references qna(qna_idx) ON UPDATE CASCADE ON DELETE CASCADE		-- 외래키 설정: qna 테이블의 qna_idx 참조
);

CREATE TABLE review (
    review_idx INT PRIMARY KEY AUTO_INCREMENT,                  -- 후기번호
    mem_idx INT NOT NULL,                                       -- 회원번호(FK)
    performance_idx INT NOT NULL,                               -- 공연번호(FK)
	review_title VARCHAR(100) NOT NULL,                         -- 후기제목
    review_content VARCHAR(400) NOT NULL,                       -- 후기내용
    mem_nickname VARCHAR(100) NOT NULL,                         -- 회원닉네임
    review_regdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,         -- 작성일자
    review_readhit INT NOT NULL default 0,       		                    -- 조회수
    FOREIGN KEY (mem_idx) REFERENCES member(mem_idx) ON UPDATE CASCADE ON DELETE CASCADE,           -- 외래키 설정: member 테이블의 mem_idx 참조
    FOREIGN KEY (performance_idx) REFERENCES performance(performance_idx) ON UPDATE CASCADE ON DELETE CASCADE   -- 외래키 설정: performance 테이블의 performance_idx 참조
);

CREATE TABLE review_score (
    review_score_idx INT PRIMARY KEY AUTO_INCREMENT,                 		 -- 공감(후기)번호
    mem_idx INT NOT NULL,                                         			 -- 회원번호(FK)
    performance_idx INT NOT NULL,                                    		 -- 공연번호(FK)
    review_idx INT NOT NULL,                                         		 -- 후기번호(FK) (수정) 기존 공연번호
    review_score_point INT NOT NULL,			                       		 -- 평점
    FOREIGN KEY (mem_idx) REFERENCES member(mem_idx) ON UPDATE CASCADE ON DELETE CASCADE,           			 -- 외래키 설정: member 테이블의 mem_idx 참조
    FOREIGN KEY (performance_idx) REFERENCES performance(performance_idx) ON UPDATE CASCADE ON DELETE CASCADE,   -- 외래키 설정: performance 테이블의 performance_idx 참조
    FOREIGN KEY (review_idx) REFERENCES review(review_idx) ON UPDATE CASCADE ON DELETE CASCADE     	 		 -- 외래키 설정: review 테이블의 review_idx 참조
);

CREATE TABLE user_review_readhit (
    user_review_readhit_idx INT PRIMARY KEY AUTO_INCREMENT,  	-- 기본키
    mem_idx INT NOT NULL,                                 		-- 회원번호(FK)
    review_idx INT NOT NULL,                             		-- 후기번호(FK)
    FOREIGN KEY (mem_idx) REFERENCES member(mem_idx) ON UPDATE CASCADE ON DELETE CASCADE,     		-- 외래키 설정: member 테이블의 mem_idx 참조
    FOREIGN KEY (review_idx) REFERENCES review(review_idx) ON UPDATE CASCADE ON DELETE CASCADE 		-- 외래키 설정: review 테이블의 review_idx 참조
);
CREATE TABLE performance_date (
	performance_date_idx INT PRIMARY KEY AUTO_INCREMENT,            -- 공연날자번호
    performance_idx INT NOT NULL,									-- 공연번호(FK)
    performance_date_date DATETIME,									-- 공연날짜
    FOREIGN KEY (performance_idx) REFERENCES performance(performance_idx) ON UPDATE CASCADE ON DELETE CASCADE   -- 외래키 설정: performance 테이블의 performance_idx 참조
);
CREATE TABLE seat (
    seat_idx INT PRIMARY KEY AUTO_INCREMENT,                    -- 좌석번호
    performance_idx INT NOT NULL,                               -- 공연번호(FK)
    seat_grade varchar(100) not null,							-- 좌석등급
    seat_price INT NOT NULL,                                    -- 좌석가격
    FOREIGN KEY (performance_idx) REFERENCES performance(performance_idx) ON UPDATE CASCADE ON DELETE CASCADE  -- 외래키 설정: performance 테이블의 performance_idx 참조
	-- FOREIGN KEY (seat_grade_idx) REFERENCES seat_grdae(seat_grade_idx) ON UPDATE CASCADE ON DELETE CASCADE  -- 외래키 설정: seat_grdae 테이블의 seat_grade_idx 참조
);

CREATE TABLE s_hall (
    s_hall_idx INT PRIMARY KEY AUTO_INCREMENT,                  				-- 입력번호
    performance_date_idx INT NOT NULL,                              				-- 공연날짜번호(FK)
    seat_idx INT NOT NULL,                                      				-- 공연장번호(FK)
    s_hall_row_no INT NOT NULL,                                 				-- 행
    A INT NOT NULL DEFAULT 0,                            				-- 항목 A
    B INT NOT NULL DEFAULT 0,                            				-- 항목 B
    C INT NOT NULL DEFAULT 0,                            				-- 항목 C
    D INT NOT NULL DEFAULT 0,                            				-- 항목 D
    E INT NOT NULL DEFAULT 0,                            				-- 항목 E
    F INT NOT NULL DEFAULT 0,                            				-- 항목 F
    G INT NOT NULL DEFAULT 0,                            				-- 항목 G
    H INT NOT NULL DEFAULT 0,                            				-- 항목 H
    I INT NOT NULL DEFAULT 0,                            				-- 항목 I
    J INT NOT NULL DEFAULT 0,                            				-- 항목 J
    FOREIGN KEY (performance_date_idx) REFERENCES performance_date(performance_date_idx) ON UPDATE CASCADE ON DELETE CASCADE,  	-- 외래키 설정: performance_date 테이블의 performance_date_idx 참조(수정 hall_idx -> performance_idx)
    FOREIGN KEY (seat_idx) REFERENCES seat(seat_idx) ON UPDATE CASCADE ON DELETE CASCADE           				-- 외래키 설정: seat 테이블의 seat_idx 참조
);
CREATE TABLE m_hall (
    m_hall_idx INT PRIMARY KEY AUTO_INCREMENT,                  				-- 입력번호
    performance_date_idx INT NOT NULL,                              			-- 공연날짜번호(FK)
    seat_idx INT NOT NULL,                                      				-- 공연장번호(FK)
    m_hall_row_no INT NOT NULL,                                 				-- 행
    A INT NOT NULL DEFAULT 0,                            				-- 항목 A
    B INT NOT NULL DEFAULT 0,                            				-- 항목 B
    C INT NOT NULL DEFAULT 0,                            				-- 항목 C
    D INT NOT NULL DEFAULT 0,                            				-- 항목 D
    E INT NOT NULL DEFAULT 0,                            				-- 항목 E
    F INT NOT NULL DEFAULT 0,                            				-- 항목 F
    G INT NOT NULL DEFAULT 0,                            				-- 항목 G
    H INT NOT NULL DEFAULT 0,                            				-- 항목 H
    I INT NOT NULL DEFAULT 0,                            				-- 항목 I
    J INT NOT NULL DEFAULT 0,                            				-- 항목 J
    K INT NOT NULL DEFAULT 0,                            				-- 항목 F
    L INT NOT NULL DEFAULT 0,                            				-- 항목 G
    M INT NOT NULL DEFAULT 0,                            				-- 항목 H
    N INT NOT NULL DEFAULT 0,                            				-- 항목 I
    O INT NOT NULL DEFAULT 0,                            				-- 항목 J
    FOREIGN KEY (performance_date_idx) REFERENCES performance_date(performance_date_idx) ON UPDATE CASCADE ON DELETE CASCADE,  	-- 외래키 설정: performance_date 테이블의 performance_date_idx 참조(수정 hall_idx -> performance_idx)
    FOREIGN KEY (seat_idx) REFERENCES seat(seat_idx) ON UPDATE CASCADE ON DELETE CASCADE           				-- 외래키 설정: seat 테이블의 seat_idx 참조
);
CREATE TABLE l_hall (
    l_hall_idx INT PRIMARY KEY AUTO_INCREMENT,                  				-- 입력번호
    performance_date_idx INT NOT NULL,                              			-- 공연날짜번호(FK)
    seat_idx INT NOT NULL,                                      				-- 공연장번호(FK)
    l_hall_row_no INT NOT NULL,                                 				-- 행
    A INT NOT NULL DEFAULT 0,                            				-- 항목 A
    B INT NOT NULL DEFAULT 0,                            				-- 항목 B
    C INT NOT NULL DEFAULT 0,                            				-- 항목 C
    D INT NOT NULL DEFAULT 0,                            				-- 항목 D
    E INT NOT NULL DEFAULT 0,                            				-- 항목 E
    F INT NOT NULL DEFAULT 0,                            				-- 항목 F
    G INT NOT NULL DEFAULT 0,                            				-- 항목 G
    H INT NOT NULL DEFAULT 0,                            				-- 항목 H
    I INT NOT NULL DEFAULT 0,                            				-- 항목 I
    J INT NOT NULL DEFAULT 0,                            				-- 항목 J
    K INT NOT NULL DEFAULT 0,                            				-- 항목 F
    L INT NOT NULL DEFAULT 0,                            				-- 항목 G
    M INT NOT NULL DEFAULT 0,                            				-- 항목 H
    N INT NOT NULL DEFAULT 0,                            				-- 항목 I
    O INT NOT NULL DEFAULT 0,                            				-- 항목 J
    P INT NOT NULL DEFAULT 0,                            				-- 항목 F
    Q INT NOT NULL DEFAULT 0,                            				-- 항목 G
    R INT NOT NULL DEFAULT 0,                            				-- 항목 H
    S INT NOT NULL DEFAULT 0,                            				-- 항목 I
    T INT NOT NULL DEFAULT 0,                            				-- 항목 J
    FOREIGN KEY (performance_date_idx) REFERENCES performance_date(performance_date_idx) ON UPDATE CASCADE ON DELETE CASCADE,  	-- 외래키 설정: performance_date 테이블의 performance_date_idx 참조(수정 hall_idx -> performance_idx)
    FOREIGN KEY (seat_idx) REFERENCES seat(seat_idx) ON UPDATE CASCADE ON DELETE CASCADE            				-- 외래키 설정: seat 테이블의 seat_idx 참조
);
CREATE TABLE ticket (
    ticket_idx INT NOT NULL PRIMARY KEY,                        -- 구매내역번호
    mem_idx INT NOT NULL,                                       -- 회원번호
    performance_idx INT NOT NULL,                                   -- 공연번호
    ticket_buy_time DATETIME NOT NULL DEFAULT NOW(),            -- 구매시간
    FOREIGN KEY (mem_idx) REFERENCES member(mem_idx) ON UPDATE CASCADE ON DELETE CASCADE,           -- 외래키 설정: member 테이블의 mem_idx 참조 
    FOREIGN KEY (performance_idx) REFERENCES performance(performance_idx) ON UPDATE CASCADE ON DELETE CASCADE  -- 외래키 설정: performance 테이블의 performance_idx 참조
);

CREATE TABLE performance_ex_like (
	performance_ex_like_idx int AUTO_INCREMENT PRIMARY KEY not null,	-- 좋아요번호
	performance_idx 		INT NOT NULL,								-- 공연번호(FK)
    mem_idx 			INT NOT NULL,								-- 회원번호(FK)
    like_number			int not null default 0,						-- 좋아요 수
    FOREIGN KEY (performance_idx) REFERENCES performance(performance_idx) ON UPDATE CASCADE ON DELETE CASCADE,		-- 외래키 설정: performance 테이블의 performance_idx 참조
    FOREIGN KEY (mem_idx) REFERENCES member(mem_idx) ON UPDATE CASCADE ON DELETE CASCADE				-- 외래키 설정: member 테이블의 mem_idx 참조 
);
create table actor(
	actor_idx 		int AUTO_INCREMENT PRIMARY KEY not null,	-- 배우번호
    actor_name  	varchar(100) not null,						-- 배우이름
    actor_job		varchar(100) null,							-- 배우직업
    actor_body		varchar(100) null,							-- 신체조건
    actor_company	varchar(100) null,							-- 소속사
    actor_group		varchar(100) null,							-- 소속그룹
    actor_pic		varchar(100) not null						-- 배우이미지
);
create table casting(
	casting_idx 	int  AUTO_INCREMENT PRIMARY KEY not null,					-- 캐스팅번호
    actor_idx		int not null,												-- 배우번호(FK)
    performance_idx	int not null,												-- 공연번호(FK)
    casting_name	varchar(100) null,											-- 배역
    FOREIGN KEY (performance_idx) REFERENCES performance(performance_idx),		-- 외래키 설정: performance 테이블의 performance_idx 참조
    FOREIGN KEY (actor_idx) REFERENCES actor(actor_idx)							-- 외래키 설정: actor 테이블의 actor_idx 참조
);
create table cart(
	cart_idx					int AUTO_INCREMENT PRIMARY KEY,	-- 장바구니번호
    mem_idx						int not null,	-- 회원번호(FK)
    performance_idx				int not null,	-- 공연번호(FK)
    reserved_performance_date	varchar(100),	-- 공연날짜	
    FOREIGN KEY (mem_idx) REFERENCES member(mem_idx) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (performance_idx) REFERENCES performance(performance_idx) ON UPDATE CASCADE ON DELETE CASCADE
);
create table cart_seat(
	cart_seat_idx	int AUTO_INCREMENT PRIMARY KEY, -- 장바구니좌석일련번호
    cart_idx		int not null,					-- 장바구니일련번호(FK)
    seat_idx		int not null,					-- 좌석번호(FK)
    cart_seat_name	varchar(100),					-- 장바구니좌석
	FOREIGN KEY (cart_idx) REFERENCES cart(cart_idx) ON UPDATE CASCADE ON DELETE CASCADE,		-- 외래키 설정: performance 테이블의 performance_idx 참조
    FOREIGN KEY (seat_idx) REFERENCES seat(seat_idx) ON UPDATE CASCADE ON DELETE CASCADE		
);

CREATE OR REPLACE VIEW cartListViewM AS
SELECT DISTINCT
    p.performance_cate_idx, p.performance_detail_cate_idx, p.performance_name, p.performance_startday, p.performance_endday, p.performance_runtime, p.performance_image, p.performance_age, p.performance_state, 													
    p.performance_detail_info, p.performance_al, p.performance_detail_image,
    h.hall_idx, h.hall_name, h.hall_area, h.hall_addr, h.hall_tel, h.hall_site, h.hall_seat, h.hall_image,
    pd.performance_idx, pd.performance_date_date,
    s.seat_grade, s.seat_price,
    m.performance_date_idx, m.seat_idx, m.m_hall_idx, m.m_hall_row_no	
FROM m_hall m
INNER JOIN seat s ON m.seat_idx = s.seat_idx
INNER JOIN performance_date pd ON m.performance_date_idx = pd.performance_date_idx
INNER JOIN performance p ON pd.performance_idx = p.performance_idx  -- 수정: performance_idx로 조인
INNER JOIN hall h ON p.hall_idx = h.hall_idx
WHERE p.performance_cate_idx = 1;  -- 중형 공연장 (카테고리 1)만 필터링

CREATE OR REPLACE VIEW cartListViewS AS
SELECT DISTINCT
    p.performance_cate_idx, p.performance_detail_cate_idx, p.performance_name, p.performance_startday, p.performance_endday, p.performance_runtime, p.performance_image, p.performance_age, p.performance_state, 													
    p.performance_detail_info, p.performance_al, p.performance_detail_image,
    h.hall_idx, h.hall_name, h.hall_area, h.hall_addr, h.hall_tel, h.hall_site, h.hall_seat, h.hall_image,
    pd.performance_idx, pd.performance_date_date,
    s.seat_grade, s.seat_price,
    sh.performance_date_idx, sh.seat_idx, sh.s_hall_idx, sh.s_hall_row_no	
FROM s_hall sh
INNER JOIN seat s ON sh.seat_idx = s.seat_idx
INNER JOIN performance_date pd ON sh.performance_date_idx = pd.performance_date_idx
INNER JOIN performance p ON pd.performance_idx = p.performance_idx  -- 수정: performance_idx로 조인
INNER JOIN hall h ON p.hall_idx = h.hall_idx
WHERE p.performance_cate_idx = 2;  -- 소형 공연장 (카테고리 2)만 필터링

CREATE OR REPLACE VIEW cartListViewL AS
SELECT DISTINCT
    p.performance_cate_idx, p.performance_detail_cate_idx, p.performance_name, p.performance_startday, p.performance_endday, p.performance_runtime, p.performance_image, p.performance_age, p.performance_state, 													
    p.performance_detail_info, p.performance_al, p.performance_detail_image,
    h.hall_idx, h.hall_name, h.hall_area, h.hall_addr, h.hall_tel, h.hall_site, h.hall_seat, h.hall_image,
    pd.performance_idx, pd.performance_date_date,
    s.seat_grade, s.seat_price,
    l.performance_date_idx, l.seat_idx, l.l_hall_idx, l.l_hall_row_no	
FROM l_hall l
INNER JOIN seat s ON l.seat_idx = s.seat_idx
INNER JOIN performance_date pd ON l.performance_date_idx = pd.performance_date_idx
INNER JOIN performance p ON pd.performance_idx = p.performance_idx  -- 수정: performance_idx로 조인
INNER JOIN hall h ON p.hall_idx = h.hall_idx
WHERE p.performance_cate_idx = 3;  -- 대형 공연장 (카테고리 3)만 필터링

-- 주문
create table orders(
    order_idx       	      int AUTO_INCREMENT PRIMARY KEY,     	-- 주문 번호
    performance_idx 		  int not null,                                	-- 공연 번호(fk)
    mem_idx         		  int not null,                                	-- 회원 번호(fk)
    reserved_performance_date varchar(100) not null,						  	-- 공연 관람 날짜
    order_date      		  TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 	-- 주문 일시 -> 일정 시간 지난 후 결제 미완료 시 주문 취소
    order_amount			  int default 0,									-- 총 결제 금액
    payment_state  	      char(1) default 'n',					-- 'y' or 'n' y=결제 후, n="결제 전" 
    used_point				  int default 0,					-- 사용 포인트    	
    FOREIGN KEY (performance_idx) REFERENCES performance(performance_idx) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (mem_idx) REFERENCES member(mem_idx) ON UPDATE CASCADE ON DELETE CASCADE
);
-- 주문 좌석
create table orders_seat(
	order_seat_idx	int AUTO_INCREMENT PRIMARY KEY, -- 주문좌석일련번호
    order_idx		int not null,					-- 주문일련번호(FK)
    seat_idx		int not null,					-- 좌석번호(FK)
    order_seat_name	varchar(50),					-- 주문좌석이름
	FOREIGN KEY (order_idx) REFERENCES orders(order_idx) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (seat_idx) REFERENCES seat(seat_idx) ON UPDATE CASCADE ON DELETE CASCADE		
);
-- 결제
create table payment(
    payment_idx     int AUTO_INCREMENT PRIMARY KEY,     -- 결제 번호
    order_idx       int,                                -- 주문번호(fk)check
    payment_amount  int,                                -- 결제 금액
    payment_date    Timestamp DEFAULT CURRENT_TIMESTAMP,  -- 결제일시
    FOREIGN KEY (order_idx) REFERENCES orders(order_idx) ON UPDATE CASCADE ON DELETE CASCADE
);