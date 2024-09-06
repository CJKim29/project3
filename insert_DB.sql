-- member

insert into member values(1, '김관리', 'admin', 'admin', '관리자', '11111', '서울시 관악구', '0.0.0.1' , default, default, default, '관리자');
insert into member values(2, '일길동', 'one', '1234', 'one', '11111', '서울시 동작구', '0.0.0.1', default, default, default, '일반');

-- hall

insert into hall (hall_name, hall_area, hall_addr, hall_tel, hall_site, hall_seat, hall_image)
values('디큐브 링크아트센터', '서울', '서울시 구로구 경인로 662 7층', '02-2211-3000',
'http://www.d3art.co.kr', 100, '디큐브 링크아트센터.png');

insert into hall (hall_name, hall_area, hall_addr, hall_tel, hall_site, hall_seat, hall_image)
values('블루스퀘어 신한카드홀', '서울', '서울특별시 용산구 이태원로 294 블루스퀘어(한남동)',
'1544-1591', 'http://www.bluesquare.kr/index.asp', 100, '블루스퀘어 신한카드홀.png');

insert into hall (hall_name, hall_area, hall_addr, hall_tel, hall_site, hall_seat, hall_image)
values('샤롯데씨어터', '서울', '서울특별시 송파구 잠실동 40-1', '1644-0078',
'http://www.charlottetheater.co.kr', 100, '샤롯데씨어터.png');

insert into hall (hall_name, hall_area, hall_addr, hall_tel, hall_site, hall_seat, hall_image)
values('충무아트센터 대극장', '서울', '서울시 중구 퇴계로 387', '02-2230-6600',
'http://www.caci.or.kr', 100, '충무아트센터 대극장.png');

-- concert_cate

insert into concert_cate values(null, '뮤지컬');

-- concert

insert into concert values(null, 1, 1, '시카고', '2024-09-09', '2024-10-09', 145, '시카고.PNG', 14);
insert into concert values(null, 1, 2, '애니', '2024-10-01', '2024-10-27', 135, '애니.PNG', 5);
insert into concert values(null, 1, 3, '부치하난', '2024-10-17', '2024-11-05', 160, '부치하난.PNG', 14);
insert into concert values(null, 1, 4, '젠틀맨스 가이드', '2024-11-11', '2024-12-30', 150, '젠틀맨스 가이드.PNG', 14);

insert into concert(concert_cate_idx, hall_idx, concert_name, concert_startday, concert_endday, 
concert_runtime, concert_image, concert_age)
values(1,1,'스파이','2024.09.26', '2024.09.28', 120, '스파이.png', 14);

insert into concert(concert_cate_idx, hall_idx, concert_name, concert_startday, concert_endday, 
concert_runtime, concert_image, concert_age) 
values(1,3,'하데스타운','2024.07.12', '2024.10.06', 155, '하데스타운.png', 8);

insert into concert(concert_cate_idx, hall_idx, concert_name, concert_startday, concert_endday, 
concert_runtime, concert_image, concert_age) 
values(1,1,'광화문연가','2024.10.23', '2025.01.05', 160, '광화문연가.png', 8);

insert into concert(concert_cate_idx, hall_idx, concert_name, concert_startday, concert_endday, 
concert_runtime, concert_image, concert_age) 
values(1,4,'베르사유의 장미','2024.07.16', '2025.10.13', 150, '베르사유의 장미.png', 8);

insert into concert(concert_cate_idx, hall_idx, concert_name, concert_startday, concert_endday, 
concert_runtime, concert_image, concert_age) 
values(1,2,'킹키부츠','2024.09.07', '2025.11.10', 155, '킹키부츠.png', 8);

-- concert_date
insert into concert_date values (null, 6, '2024-09-20 19:30:00');

-- seat

insert into seat (concert_idx, seat_grade, seat_price) values (1, 'VIP', 160000);
insert into seat (concert_idx, seat_grade, seat_price) values (1, 'OP', 150000);
insert into seat (concert_idx, seat_grade, seat_price) values (1, 'R', 140000);
insert into seat (concert_idx, seat_grade, seat_price) values (1, 'S', 110000);
insert into seat (concert_idx, seat_grade, seat_price) values (1, 'A', 80000);

insert into seat (concert_idx, seat_grade, seat_price) values (2, 'VIP', 130000);
insert into seat (concert_idx, seat_grade, seat_price) values (2, 'R', 110000);
insert into seat (concert_idx, seat_grade, seat_price) values (2, '커플석', 110000);
insert into seat (concert_idx, seat_grade, seat_price) values (2, 'S', 90000);

insert into seat (concert_idx, seat_grade, seat_price) values (3, 'OP', 120000);
insert into seat (concert_idx, seat_grade, seat_price) values (3, 'VIP', 120000);
insert into seat (concert_idx, seat_grade, seat_price) values (3, 'R', 90000);
insert into seat (concert_idx, seat_grade, seat_price) values (3, 'S', 60000);

insert into seat (concert_idx, seat_grade, seat_price) values (4, 'VIP', 150000);
insert into seat (concert_idx, seat_grade, seat_price) values (4, 'OP', 130000);
insert into seat (concert_idx, seat_grade, seat_price) values (4, 'R', 130000);
insert into seat (concert_idx, seat_grade, seat_price) values (4, 'S', 90000);
insert into seat (concert_idx, seat_grade, seat_price) values (4, 'A', 60000);

insert into seat (concert_idx, seat_grade, seat_price) values (5, '한줄기의빛석', 70000);
insert into seat (concert_idx, seat_grade, seat_price) values (5, '스파이더맨인블랙석', 60000);
insert into seat (concert_idx, seat_grade, seat_price) values (5, '로마의대체휴일석', 50000);
insert into seat (concert_idx, seat_grade, seat_price) values (5, '미션임파서블드림석', 40000);
insert into seat (concert_idx, seat_grade, seat_price) values (5, '티파니에서야참을석', 30000);

insert into seat (concert_idx, seat_grade, seat_price) values (6, 'VIP', 170000);
insert into seat (concert_idx, seat_grade, seat_price) values (6, 'R', 140000);
insert into seat (concert_idx, seat_grade, seat_price) values (6, 'S', 110000);
insert into seat (concert_idx, seat_grade, seat_price) values (6, 'A', 80000);

insert into seat (concert_idx, seat_grade, seat_price) values (7, 'VIP', 160000);
insert into seat (concert_idx, seat_grade, seat_price) values (7, 'R', 130000);
insert into seat (concert_idx, seat_grade, seat_price) values (7, 'S', 100000);
insert into seat (concert_idx, seat_grade, seat_price) values (7, 'A', 70000);

insert into seat (concert_idx, seat_grade, seat_price) values (8, 'VIP', 170000);
insert into seat (concert_idx, seat_grade, seat_price) values (8, 'R', 140000);
insert into seat (concert_idx, seat_grade, seat_price) values (8, 'S', 110000);
insert into seat (concert_idx, seat_grade, seat_price) values (8, 'A', 80000);

insert into seat (concert_idx, seat_grade, seat_price) values (9, '밀라노석', 170000);
insert into seat (concert_idx, seat_grade, seat_price) values (9, 'VIP', 170000);
insert into seat (concert_idx, seat_grade, seat_price) values (9, 'R', 140000);
insert into seat (concert_idx, seat_grade, seat_price) values (9, 'S', 110000);
insert into seat (concert_idx, seat_grade, seat_price) values (9, 'A', 80000);

-- s_hall

insert into s_hall (concert_date_idx, seat_idx, s_hall_row_no) values(1, 1, 1);
insert into s_hall (concert_date_idx, seat_idx, s_hall_row_no) values(1, 1, 2);
insert into s_hall (concert_date_idx, seat_idx, s_hall_row_no) values(1, 2, 3);
insert into s_hall (concert_date_idx, seat_idx, s_hall_row_no) values(1, 2, 4);
insert into s_hall (concert_date_idx, seat_idx, s_hall_row_no) values(1, 3, 5);
insert into s_hall (concert_date_idx, seat_idx, s_hall_row_no) values(1, 3, 6);
insert into s_hall (concert_date_idx, seat_idx, s_hall_row_no) values(1, 4, 7);
insert into s_hall (concert_date_idx, seat_idx, s_hall_row_no) values(1, 4, 8);
insert into s_hall (concert_date_idx, seat_idx, s_hall_row_no) values(1, 4, 9);
insert into s_hall (concert_date_idx, seat_idx, s_hall_row_no) values(1, 4, 10);
