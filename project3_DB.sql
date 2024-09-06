-- 테이블 삭제 (위에서부터 아래로 지우기)
drop table ticket;              -- 구매내역
drop table concert_like;        -- 장바구니(찜)

drop table s_hall;              -- 소형공연장
drop table concert_date;		-- 공연날짜
drop table seat;                -- 좌석

drop table faq;                 -- FAQ
drop table qna;                 -- Q&A
drop table comment_tb;          -- 게시판 댓글
drop table board;               -- 게시판
drop table board_cate;          -- 게시판 카테고리

drop table preview_comment;     -- 기대평댓글
drop table preview;             -- 기대평
drop table review_like;         -- 후기(공감)
drop table review;              -- 후기

drop table concert_detail;      -- 공연상세정보
drop table concert;             -- 공연(상품)
drop table hall;                -- 공연장
drop table concert_detail_cate; -- 공연세부카테고리
drop table concert_cate;        -- 공연카테고리
drop table member;              -- 회원       

-- MySQL에서는 별도의 sequence를 추가하지 않고, pk에 AUTO_INCREMENT만 부여하면 됨
-- 테이블 추가 (위에서부터 아래로 만들기)
CREATE TABLE member (
    mem_idx INT PRIMARY KEY AUTO_INCREMENT,         -- 회원번호
    mem_name VARCHAR(100) NOT NULL,                 -- 회원명
    mem_id VARCHAR(100) NOT NULL,                   -- 회원아이디
    mem_pwd VARCHAR(100) NOT NULL,                  -- 회원비밀번호
    mem_nickname VARCHAR(100) NOT NULL,             -- 회원닉네임
    mem_zipcode CHAR(5),                            -- 우편번호
    mem_addr VARCHAR(100),                          -- 주소
    mem_ip VARCHAR(100) NOT NULL,                   -- 아이피
    mem_regdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,-- 등록일자
    mem_filename VARCHAR(100) DEFAULT 'basic.png',  -- 프로필이미지명
    mem_point INT DEFAULT 0,                        -- 회원보유포인트
    mem_grade VARCHAR(100) NOT NULL                 -- 회원등급('일반' or '관리자')
);
CREATE TABLE concert_cate (
    concert_cate_idx INT PRIMARY KEY AUTO_INCREMENT,-- 공연카테고리번호
    concert_cate_name VARCHAR(100) NOT NULL         -- 공연카테고리명
);
CREATE TABLE concert_detail_cate (
    concert_detail_cate_idx INT PRIMARY KEY AUTO_INCREMENT,                   -- 공연세부카테고리번호
    concert_cate_idx INT NOT NULL,                                            -- 공연카테고리번호(FK)
    concert_detail_cate_name VARCHAR(100) NOT NULL,                           -- 공연세부카테고리이름
    FOREIGN KEY (concert_cate_idx) REFERENCES concert_cate(concert_cate_idx)  -- 외래키 설정: concert_cate 테이블의 concert_cate_idx 참조
);
CREATE TABLE hall (
    hall_idx INT PRIMARY KEY AUTO_INCREMENT,                -- 공연장번호
    hall_name VARCHAR(100) NOT NULL,                        -- 공연장이름
    hall_area VARCHAR(100) NOT NULL,                        -- 공연장지역
    hall_addr VARCHAR(200) NOT NULL,                        -- 공연장주소
    hall_tel VARCHAR(100) NOT NULL,                         -- 공연장전화번호
    hall_site VARCHAR(100) NOT NULL,                        -- 공연장홈페이지
    hall_seat INT NOT NULL,                                 -- 공연장좌석수
    hall_image VARCHAR(100) NOT NULL DEFAULT 'no_image.png' -- 공연장이미지 (기본값: no_image.png)
);
CREATE TABLE concert (
    concert_idx INT PRIMARY KEY AUTO_INCREMENT,                                 -- 공연번호
    concert_cate_idx INT NOT NULL,                                              -- 공연카테고리번호(FK)
    hall_idx INT NOT NULL,                                                      -- 공연장번호(FK)
    concert_name VARCHAR(100) NOT NULL,                                         -- 공연이름
    concert_startday VARCHAR(100) NOT NULL,                                     -- 공연시작일자
    concert_endday VARCHAR(100) NOT NULL,                                       -- 공연종료일자
    concert_runtime VARCHAR(100) NOT NULL,                                      -- 공연진행시간
    concert_image VARCHAR(100) DEFAULT 'no_image.png',                          -- 공연이미지명
    concert_age INT NOT NULL,                                                   -- 최소공연관람나이
    FOREIGN KEY (concert_cate_idx) REFERENCES concert_cate(concert_cate_idx),   -- 외래키 설정: concert_cate 테이블의 concert_cate_idx 참조
    FOREIGN KEY (hall_idx) REFERENCES hall(hall_idx)                            -- 외래키 설정: hall 테이블의 hall_idx 참조
);
CREATE TABLE concert_detail (
    concert_detail_idx INT PRIMARY KEY AUTO_INCREMENT,          -- 공연상세정보번호
    concert_idx INT NOT NULL,                                   -- 공연번호(FK)
    concert_detail_info VARCHAR(300) NOT NULL,                  -- 공연상세정보
    concert_detail_image VARCHAR(100) NOT NULL,                 -- 공연이미지명
    FOREIGN KEY (concert_idx) REFERENCES concert(concert_idx)   -- 외래키 설정: concert 테이블의 concert_idx 참조
);
CREATE TABLE review (
    review_idx INT PRIMARY KEY AUTO_INCREMENT,                  -- 후기번호
    mem_idx INT NOT NULL,                                       -- 회원번호(FK)
    concert_idx INT NOT NULL,                                   -- 공연번호(FK)
    review_regdate DATETIME NOT NULL DEFAULT NOW(),             -- 작성일자
    review_ip VARCHAR(100) NOT NULL,                            -- 아이피
    review_content VARCHAR(400) NOT NULL,                       -- 후기내용
    mem_nickname VARCHAR(100) NOT NULL,                         -- 회원닉네임
    review_title VARCHAR(100) NOT NULL,                         -- 후기제목
    FOREIGN KEY (mem_idx) REFERENCES member(mem_idx),           -- 외래키 설정: member 테이블의 mem_idx 참조
    FOREIGN KEY (concert_idx) REFERENCES concert(concert_idx)   -- 외래키 설정: concert 테이블의 concert_idx 참조
);
CREATE TABLE review_like (
    review_like_idx INT PRIMARY KEY AUTO_INCREMENT,             -- 공감(후기)번호
    mem_idx INT NOT NULL,                                       -- 회원번호(FK)
    review_idx INT NOT NULL,                                    -- 후기번호(FK) (수정) 기존 공연번호
    like_use CHAR(1) NOT NULL DEFAULT 'n',                      -- 좋아요유무
    FOREIGN KEY (mem_idx) REFERENCES member(mem_idx),           -- 외래키 설정: member 테이블의 mem_idx 참조
    FOREIGN KEY (review_idx) REFERENCES review(review_idx)      -- 외래키 설정: review 테이블의 review_idx 참조
);
CREATE TABLE preview (
    preview_idx INT PRIMARY KEY AUTO_INCREMENT,                 -- 기대평개별번호
    mem_idx INT NOT NULL,                                       -- 회원번호(FK)
    concert_idx INT NOT NULL,                                   -- 공연번호(FK)
    preview_regdate DATETIME NOT NULL DEFAULT NOW(),            -- 작성일자
    preview_ip VARCHAR(100) NOT NULL,                           -- 아이피
    preview_content VARCHAR(400) NOT NULL,                      -- 내용
    mem_nickname VARCHAR(100) NOT NULL,                         -- 회원닉네임
    preview_title VARCHAR(100) NOT NULL,                        -- 제목
    FOREIGN KEY (mem_idx) REFERENCES member(mem_idx),           -- 외래키 설정: member 테이블의 mem_idx 참조
    FOREIGN KEY (concert_idx) REFERENCES concert(concert_idx)   -- 외래키 설정: concert 테이블의 concert_idx 참조
);
CREATE TABLE preview_comment (
    pre_cmt_idx INT PRIMARY KEY AUTO_INCREMENT,                 -- 기대평댓글번호
    mem_idx INT NOT NULL,                                       -- 회원번호(FK)
    concert_idx INT NOT NULL,                                   -- 공연번호(FK)
    preview_idx INT NOT NULL,                                   -- 기대평번호
    pre_cmt_content VARCHAR(200) NOT NULL,                      -- 내용
    pre_cmt_ip VARCHAR(100) NOT NULL,                           -- 아이피
    mem_nickname VARCHAR(100) NOT NULL,                         -- 회원닉네임
    FOREIGN KEY (mem_idx) REFERENCES member(mem_idx),           -- 외래키 설정: member 테이블의 mem_idx 참조
    FOREIGN KEY (concert_idx) REFERENCES concert(concert_idx)   -- 외래키 설정: concert 테이블의 concert_idx 참조
);
CREATE TABLE board_cate (
    board_cate_idx INT PRIMARY KEY AUTO_INCREMENT,              -- 게시판카테고리번호
    board_cate_name VARCHAR(100) NOT NULL                       -- 게시판카테고리이름
);
CREATE TABLE board (
    board_idx INT PRIMARY KEY AUTO_INCREMENT,                           -- 게시글번호
    board_cate_idx INT NOT NULL,                                        -- 게시판카테고리번호(FK)
    mem_idx INT NOT NULL,                                               -- 회원번호(FK)
    board_name VARCHAR(100) NOT NULL,                                   -- 게시글이름
    board_content TEXT NOT NULL,                                        -- 게시글내용
    board_ip VARCHAR(100) NOT NULL,                                     -- 아이피
    board_regdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,                  -- 게시글 작성일자
    board_readhit INT default 0,                                         -- 조회수
    board_use CHAR(1) NOT NULL DEFAULT 'y',                             -- 게시글 삭제유무(삭제시 'n'으로 변경)
    board_ref INT,                                             -- 참조글 번호
    board_step INT,                                            -- 글순서
    board_depth INT,                                           -- 글깊이
    mem_nickname VARCHAR(100) NOT NULL,                                 -- 닉네임
    FOREIGN KEY (board_cate_idx) REFERENCES board_cate(board_cate_idx), -- 외래키 설정: board_cate 테이블의 board_cate_idx 참조
    FOREIGN KEY (mem_idx) REFERENCES member(mem_idx)                    -- 외래키 설정: member 테이블의 mem_idx 참조
);
CREATE TABLE comment_tb (
    cmt_idx INT PRIMARY KEY AUTO_INCREMENT,                 -- 게시판댓글번호
    board_idx INT NOT NULL,                                 -- 게시글번호(FK)
    mem_idx INT NOT NULL,                                   -- 회원번호(FK)
    cmt_content VARCHAR(200) NOT NULL,                      -- 댓글내용
    cmt_ip VARCHAR(100) NOT NULL,                           -- 아이피
    cmt_regdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,        -- 댓글 작성일자
    mem_nickname VARCHAR(100) NOT NULL,                     -- 닉네님
    FOREIGN KEY (board_idx) REFERENCES board(board_idx),    -- 외래키 설정: board_cate 테이블의 board_cate_idx 참조
    FOREIGN KEY (mem_idx) REFERENCES member(mem_idx)        -- 외래키 설정: member 테이블의 mem_idx 참조
);
CREATE TABLE qna (
    qna_idx INT PRIMARY KEY AUTO_INCREMENT,             -- Q&A번호
    mem_idx INT NOT NULL,                               -- 회원번호(FK)
    qna_title VARCHAR(100) NOT NULL,                    -- Q&A제목
    qna_content TEXT NOT NULL,                          -- Q&A내용
    qna_nickname VARCHAR(100) NOT NULL,                 -- 닉네임
    qna_regdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,    -- Q&A등록일자
    qna_use CHAR(1) DEFAULT 'n',                        -- 답변유무(답변시 'y'로 변경)
    FOREIGN KEY (mem_idx) REFERENCES member(mem_idx)    -- 외래키 설정: member 테이블의 mem_idx 참조
);
CREATE TABLE faq (
    faq_idx INT PRIMARY KEY AUTO_INCREMENT,             -- FAQ번호
    mem_idx INT NOT NULL,                               -- 회원번호(FK)
    faq_title VARCHAR(100) NOT NULL,                    -- FAQ이름
    faq_content TEXT NOT NULL,                          -- FAQ내용
    FOREIGN KEY (mem_idx) REFERENCES member(mem_idx)    -- 외래키 설정: member 테이블의 mem_idx 참조
);
CREATE TABLE concert_date (
	concert_date_idx INT PRIMARY KEY AUTO_INCREMENT,            -- 공연날자번호
    concert_idx INT NOT NULL,									-- 공연번호(FK)
    concert_date_date DATETIME,									-- 공연날짜
    FOREIGN KEY (concert_idx) REFERENCES concert(concert_idx)   -- 외래키 설정: concert 테이블의 concert_idx 참조
);
CREATE TABLE seat (
    seat_idx INT PRIMARY KEY AUTO_INCREMENT,                    -- 좌석번호
    concert_idx INT NOT NULL,                                   -- 공연번호(FK)
    seat_grade VARCHAR(100) NOT NULL,                           -- 좌석등급
    seat_price INT NOT NULL,                                    -- 좌석가격
    FOREIGN KEY (concert_idx) REFERENCES concert(concert_idx)   -- 외래키 설정: concert 테이블의 concert_idx 참조
);
CREATE TABLE s_hall (
    s_hall_idx INT PRIMARY KEY AUTO_INCREMENT,                  -- 입력번호
    concert_date_idx INT NOT NULL,                              -- 공연날짜번호(FK)
    seat_idx INT NOT NULL,                                      -- 공연장번호(FK)
    s_hall_row_no INT NOT NULL,                                 -- 행
    s_hall_a INT NOT NULL DEFAULT 0,                            -- 항목 A
    s_hall_b INT NOT NULL DEFAULT 0,                            -- 항목 B
    s_hall_c INT NOT NULL DEFAULT 0,                            -- 항목 C
    s_hall_d INT NOT NULL DEFAULT 0,                            -- 항목 D
    s_hall_e INT NOT NULL DEFAULT 0,                            -- 항목 E
    s_hall_f INT NOT NULL DEFAULT 0,                            -- 항목 F
    s_hall_g INT NOT NULL DEFAULT 0,                            -- 항목 G
    s_hall_h INT NOT NULL DEFAULT 0,                            -- 항목 H
    s_hall_i INT NOT NULL DEFAULT 0,                            -- 항목 I
    s_hall_j INT NOT NULL DEFAULT 0,                            -- 항목 J
    FOREIGN KEY (concert_date_idx) REFERENCES concert_date(concert_date_idx),  -- 외래키 설정: concert_date 테이블의 concert_date_idx 참조(수정 hall_idx -> concert_idx)
    FOREIGN KEY (seat_idx) REFERENCES seat(seat_idx)            -- 외래키 설정: seat 테이블의 seat_idx 참조
);
CREATE TABLE concert_like (
    concert_like_idx INT PRIMARY KEY AUTO_INCREMENT,            -- 장바구니(찜)번호
    mem_idx INT NOT NULL,                                       -- 회원번호(FK)
    concert_idx INT NOT NULL,                                   -- 공연번호(FK)
    FOREIGN KEY (mem_idx) REFERENCES member(mem_idx),           -- 외래키 설정: member 테이블의 mem_idx 참조
    FOREIGN KEY (concert_idx) REFERENCES concert(concert_idx)   -- 외래키 설정: concert 테이블의 concert_idx 참조
);
CREATE TABLE ticket (
    ticket_idx INT NOT NULL PRIMARY KEY,                        -- 구매내역번호
    mem_idx INT NOT NULL,                                       -- 회원번호
    concert_idx INT NOT NULL,                                   -- 공연번호
    ticket_buy_time DATETIME NOT NULL DEFAULT NOW(),            -- 구매시간
    FOREIGN KEY (mem_idx) REFERENCES member(mem_idx),           -- 외래키 설정: member 테이블의 mem_idx 참조 
    FOREIGN KEY (concert_idx) REFERENCES concert(concert_idx)   -- 외래키 설정: concert 테이블의 concert_idx 참조
);