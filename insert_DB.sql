-- member
insert into member values(null, '김관리', 'admin', 'admin', '관리자', '1998-03-31', '01012345678', 'admin@naver.com', '11111', '서울시 관악구', '0.0.0.1' , default, default, 1000000, '관리자');
insert into member values(null, '일길동', 'one', '1234', 'one', '2000-09-20', '01011115678', 'one@naver.com', '11111', '서울시 동작구', '0.0.0.1', default, default, 5000, '일반');

-- hall 
-- 뮤지컬(1-중)
-- 서울
insert into area values(null, '서울');
insert into area values(null, '경기/인천');
insert into area values(null, '충청/대전');
insert into area values(null, '경상/대구/부산');
insert into area values(null, '전라/광주');
insert into area values(null, '강원');
insert into area values(null, '제주');

insert into hall (area_idx, hall_name, hall_area, hall_addr, hall_tel, hall_site, hall_seat, hall_image)
values(1, '디큐브 링크아트센터', '서울', '서울시 구로구 경인로 662 7층', '02-2211-3000',
'http://www.d3art.co.kr', 225, '디큐브 링크아트센터.png');
insert into hall (area_idx, hall_name, hall_area, hall_addr, hall_tel, hall_site, hall_seat, hall_image)
values(1, '블루스퀘어 신한카드홀', '서울', '서울특별시 용산구 이태원로 294 블루스퀘어(한남동)', '1544-1591',
'http://www.bluesquare.kr/index.asp', 225, '블루스퀘어 신한카드홀.png');
insert into hall (area_idx, hall_name, hall_area, hall_addr, hall_tel, hall_site, hall_seat, hall_image)
values(1, '샤롯데씨어터', '서울', '서울특별시 송파구 잠실동 40-1', '1644-0078',
'http://www.charlottetheater.co.kr', 225, '샤롯데씨어터.png');
insert into hall (area_idx, hall_name, hall_area, hall_addr, hall_tel, hall_site, hall_seat, hall_image)
values(1, '충무아트센터 대극장', '서울', '서울시 중구 퇴계로 387', '02-2230-6600',
'http://www.caci.or.kr', 225, '충무아트센터 대극장.png');
-- 경기/인천
insert into hall (area_idx, hall_name, hall_area, hall_addr, hall_tel, hall_site, hall_seat, hall_image)
values(2, '고양아람누리 아람극장', '경기/인천', '경기도 고양시 일산동구 마두동 816, 817번지', '1577-7766',
'http://www.artgy.or.kr/', 225, '고양아람누리 아람극장.PNG');
insert into hall (area_idx, hall_name, hall_area, hall_addr, hall_tel, hall_site, hall_seat, hall_image)
values(2, '경기아트센터 대극장', '경기/인천', '경기도 수원시 팔달구 효원로307번길 20 경기아트센터', '031-230-3400',
'http://www.ggac.or.kr', 225, '경기아트센터.PNG');
-- 충청/대전
insert into hall (area_idx, hall_name, hall_area, hall_addr, hall_tel, hall_site, hall_seat, hall_image)
values(3, '천안예술의전당', '충청/대전', '충남 천안시 동남구 성남면 종합휴양지로 185', '1566-0155',
'http://www.cnac.or.kr', 225, '천안예술의전당.PNG');
-- 경상/대구/부산
insert into hall (area_idx, hall_name, hall_area, hall_addr, hall_tel, hall_site, hall_seat, hall_image)
values(4, '부산드림씨어터', '경상/대구/부산', '부산광역시 남구 전포대로 133(문현동) 드림씨어터', '1833-3755',
'https://www.dreamtheatre.co.kr/', 225, '부산 드림씨어터.PNG');
insert into hall (area_idx, hall_name, hall_area, hall_addr, hall_tel, hall_site, hall_seat, hall_image)
values(4, '창원 성산아트홀 대극장', '경상/대구/부산', '경상남도 창원시 의창구 중앙대로 181 (용호동 2)', '055-268-7900',
'http://www.cwcf.or.kr/facility/facility_sungsan.asp', 225, '창원 성산아트홀.PNG');
-- 전라/광주
insert into hall (area_idx, hall_name, hall_area, hall_addr, hall_tel, hall_site, hall_seat, hall_image)
values(5, '한국소리문화의전당 모악당', '전라/광주', '전라북도 전주시 덕진구 덕진동1가 산1-1', '063-270-8000',
'http://www.sori21.co.kr/', 225, '한국소리문화전당.PNG');
insert into hall (area_idx, hall_name, hall_area, hall_addr, hall_tel, hall_site, hall_seat, hall_image)
values(5, '광주예술의전당 대극장', '전라/광주', '광주광역시 북구 북문대로 60(운암동) 광주예술의전당', '062-613-8333',
'https://gjart.gwangju.go.kr/ko/cmd.do?opencode=p07052', 225, '광주예술의전당.PNG');
-- 강원
insert into hall (area_idx, hall_name, hall_area, hall_addr, hall_tel, hall_site, hall_seat, hall_image)
values(6, '춘천 봄내극장', '강원', '강원특별자치도 춘천시 서부대성로 71(옥천동) 춘천 봄내극장', '033-253-7111',
'https://bomnae.chuncheon.go.kr/', 225, '춘천 봄내극장.PNG');
-- 제주
insert into hall (area_idx, hall_name, hall_area, hall_addr, hall_tel, hall_site, hall_seat, hall_image)
values(7, '제주 한라아트홀', '제주', '제주 제주시 한라대학로 38 (노형동) 한라아트홀 대극장(한라대학교)', '033-253-7111',
'https://www.chu.ac.kr/', 225, '제주 한라아트홀.PNG');

insert into hall (area_idx, hall_name, hall_area, hall_addr, hall_tel, hall_site, hall_seat, hall_image)
values(1, '시윤아트홀', '서울', '서울특별시 종로구 대학로 116(동숭동) 지하1층 시윤아트홀', '02-1661-3123',
'https://www.playdb.co.kr/placedb/PlacedbInfo.asp?PlacecCD=6526', 100, '시윤아트홀.PNG');
insert into hall (area_idx, hall_name, hall_area, hall_addr, hall_tel, hall_site, hall_seat, hall_image)
values(1, '서연아트홀', '서울', '서울특별시 종로구 창경궁로 258-9 (명륜2가) 서연아트홀', '070-5180-5956',
'https://blog.naver.com/ddanent', 100, '서연아트홀.PNG');
insert into hall (area_idx, hall_name, hall_area, hall_addr, hall_tel, hall_site, hall_seat, hall_image)
values(1, '해피씨어터', '서울', '서울시 종로구 동숭동 1-60번지 지하 1층', '02-742-7611',
'https://blog.naver.com/mcc1612', 100, '해피씨어터.PNG');
insert into hall (area_idx, hall_name, hall_area, hall_addr, hall_tel, hall_site, hall_seat, hall_image)
values(1, '산울림 소극장', '서울', '서울시 마포구 서교동 327-9', '02-334-5915',
'http://perform.kcaf.or.kr/sanwoollim/', 100, '산울림 소극장.PNG');
-- 경기/인천
insert into hall (area_idx, hall_name, hall_area, hall_addr, hall_tel, hall_site, hall_seat, hall_image)
values(2, '수원SK아트리움', '경기/인천', '경기도 수원시 장안구 정자동 600-30 (이목로 24-25)', '0507-1346-1864',
'http://suwonskartrium.or.kr', 100, '수원 SK 아트리움.PNG');
insert into hall (area_idx, hall_name, hall_area, hall_addr, hall_tel, hall_site, hall_seat, hall_image)
values(2, '광교 매직앤조이', '경기/인천', '경기 수원시 영통구 광교중앙로 124 , 갤러리아 광교 10층 매직앤조이', '031-250-5300',
'https://www.mirinemagic.com/', 100, '광교 매직앤조이.PNG');
-- 충청/대전
insert into hall (area_idx, hall_name, hall_area, hall_addr, hall_tel, hall_site, hall_seat, hall_image)
values(3, '이수아트홀', '충청/대전', '대전광역시 서구 탄방동 748 , 정우빌딩 지하 1층', '0507-1378-4325',
'https://www.instagram.com/open_daham/', 100, '작은극장 다함.PNG');
insert into hall (area_idx, hall_name, hall_area, hall_addr, hall_tel, hall_site, hall_seat, hall_image)
values(3, '작은극장 다함', '충청/대전', '대전광역시 동구 대전로448번길 70 (가오동)', '0507-1468-2117',
'https://isuart.modoo.at/', 100, '이수아트홀.PNG');
-- 경상/대구/부산
insert into hall (area_idx, hall_name, hall_area, hall_addr, hall_tel, hall_site, hall_seat, hall_image)
values(4, '문화예술전용극장 CT', '경상/대구/부산', '대구광역시 중구 남일동 109-2 제일빌딩 지하 1층', '053-256-0369',
'https://m.cafe.daum.net/artCT/UrK0?boardType=', 100, '문화예술전용극장 CT.PNG');
insert into hall (area_idx, hall_name, hall_area, hall_addr, hall_tel, hall_site, hall_seat, hall_image)
values(4, '부산메트로홀', '경상/대구/부산', '부산시 수영구 수영로576, 광안역 안 B1층 (5번 출구 안)', '1600-0316',
'https://blog.naver.com/playthebusan', 100, '부산 메트로홀.PNG');
-- 전라/광주
insert into hall (area_idx, hall_name, hall_area, hall_addr, hall_tel, hall_site, hall_seat, hall_image)
values(5, '전주 한해랑아트홀', '전라/광주', '전라북도 전주시 완산구 효자동2가 1155-10 돌핀빌딩 3층 301호 한해랑아트홀', '1644-4356',
'https://www.cusmore.com/h/16444356', 100, '전주 한해랑아트홀.PNG');
insert into hall (area_idx, hall_name, hall_area, hall_addr, hall_tel, hall_site, hall_seat, hall_image)
values(5, '상무지구 기분좋은극장', '전라/광주', '광주광역시 서구 상무중앙로 90 대교빌딩 7층 (우리은행 상무지점 건물)', '1600-6689',
'http://www.goplay.co.kr/', 100, '기분좋은극장.PNG');
-- 강원/제주 x

-- 콘서트(3-대)
-- 서울
insert into hall (area_idx, hall_name, hall_area, hall_addr, hall_tel, hall_site, hall_seat, hall_image)
values(1, '올림픽 공원', '서울', '서울특별시 송파구 올림픽로 424 (방이동 88-2) 올림픽공원', '02-410-1114',
'https://www.inspirekorea.com/ko/entertainment/inspire.arena/inspire.arena', 400, '올림픽공원.PNG');
insert into hall (area_idx, hall_name, hall_area, hall_addr, hall_tel, hall_site, hall_seat, hall_image)
values(1, '신한카드 SOL 페이 스퀘어 라이브홀', '서울', '서울특별시 마포구 양화로 45 메세나폴리스 2 층 (서교동 490)', '1588-1555',
'http://www.solpay.square.com', 400, '신한카드 SOL페이 스퀘어 라이브홀.PNG');
insert into hall (area_idx, hall_name, hall_area, hall_addr, hall_tel, hall_site, hall_seat, hall_image)
values(1, '연세대학교 대강당', '서울', '서울특별시 서대문구 신촌동 134 연세대학교 대강당', '02-2123-2114',
'http://ycac.yonsei.ac.kr/', 400, '연세대학교 대강당.PNG');
insert into hall (area_idx, hall_name, hall_area, hall_addr, hall_tel, hall_site, hall_seat, hall_image)
values(1, '마포아트센터 아트홀 맥', '서울', '서울특별시 마포구 대흥로20길 28(대흥동) 아트홀맥', '02-3274-8600',
'https://www.mfac.or.kr/', 400, '마포아트센터.PNG');
-- 경기/인천
insert into hall (area_idx, hall_name, hall_area, hall_addr, hall_tel, hall_site, hall_seat, hall_image)
values(2, '고양종합운동장 주경기장', '경기/인천', '경기도 고양시 일산서구 대화동 2320', '031-929-4861',
'https://www.gys.or.kr/subpage/index/293', 400, '고양종합운동장.PNG');
insert into hall (area_idx, hall_name, hall_area, hall_addr, hall_tel, hall_site, hall_seat, hall_image)
values(2, '인스파이어 아레나', '경기/인천', '인천광역시 중구 공항문화로 127(운서동)', '032-580-9000',
'https://www.inspirekorea.com/ko/entertainment/inspire.arena/inspire.arena', 400, '인스파이어 아레나.PNG');
-- 충청/대전
insert into hall (area_idx, hall_name, hall_area, hall_addr, hall_tel, hall_site, hall_seat, hall_image)
values(3, '대전 컨벤션센터 제2전시장', '충청/대전', '대전광역시 유성구 엑스포로 107(도룡동) 제2전시장', '042-250-1100',
'https://www.dcckorea.or.kr/index.do', 400, '대전 컨벤션센터.PNG');
-- 경상/대구/부산
insert into hall (area_idx, hall_name, hall_area, hall_addr, hall_tel, hall_site, hall_seat, hall_image)
values(4, '구미문화예술회관 대공연장', '경상/대구/부산', '경상북도 구미시 송정대로 89 구미시문화예술회관(송정동 75번지)', '054-480-4560',
'https://www.gumi.go.kr/arts/main.do', 400, '구미문화예술회관.PNG');
insert into hall (area_idx, hall_name, hall_area, hall_addr, hall_tel, hall_site, hall_seat, hall_image)
values(4, '경남문화예술회관 대공연장', '경상/대구/부산', '경상남도 진주시 강남로 215 (칠암동)', '032-580-9000',
'https://artcenter.gyeongnam.go.kr/concert/concertScheduleList.md', 400, '경남문화예술회관.PNG');
-- 전라/광주
insert into hall (area_idx, hall_name, hall_area, hall_addr, hall_tel, hall_site, hall_seat, hall_image)
values(5, 'GS칼텍스 예율마루', '전라/광주', '전라남도 여수시 예울마루로 100 (시전동 1002)', '1544-7669',
'http://www.yeulmaru.org/', 400, '예울마루.PNG');
insert into hall (area_idx, hall_name, hall_area, hall_addr, hall_tel, hall_site, hall_seat, hall_image)
values(5, '전북대학교 삼성문화회관', '전라/광주', '전라북도 전주시 덕진구 백제대로 567(금암동) 삼성문화회관', '063-270-2089',
'https://cnucc.jbnu.ac.kr/', 400, '삼성문화회관.PNG');
-- 강원
insert into hall (area_idx, hall_name, hall_area, hall_addr, hall_tel, hall_site, hall_seat, hall_image)
values(6, '백령아트센터', '강원', '강원 춘천시 강원대학길 1', '033-250-7201',
'https://kwbc.kangwon.ac.kr/', 400, '백령아트센터.PNG');

-- performance_cate
insert into performance_cate values(null, '뮤지컬');
insert into performance_cate values(null, '연극');
insert into performance_cate values(null, '콘서트');

-- performance_detail_cate
-- 뮤지컬
insert into performance_detail_cate values(null, 1, '로맨틱코미디');
insert into performance_detail_cate values(null, 1, '드라마');
insert into performance_detail_cate values(null, 1, '코믹');
insert into performance_detail_cate values(null, 1, '공포/스릴러');
insert into performance_detail_cate values(null, 1, '퍼포먼스');
insert into performance_detail_cate values(null, 1, '어린이');
-- 연극
insert into performance_detail_cate values(null, 2, '로맨틱코미디');
insert into performance_detail_cate values(null, 2, '드라마');
insert into performance_detail_cate values(null, 2, '코믹');
insert into performance_detail_cate values(null, 2, '공포');
insert into performance_detail_cate values(null, 2, '퍼포먼스');
insert into performance_detail_cate values(null, 2, '어린이');
-- 콘서트
insert into performance_detail_cate values(null, 3, '발라드');
insert into performance_detail_cate values(null, 3, '락');
insert into performance_detail_cate values(null, 3, '힙합');
insert into performance_detail_cate values(null, 3, '트로트');



-- performance
-- 뮤지컬
-- 1.로맨틱코미디                         장르 공연장
insert into performance values(null, 1, 1, 5, 2, '써니텐', '2024-09-09', '2024-10-09', 100, '써니텐.jpg', 8, 'p', null, null, null);
insert into performance values(null, 1, 1, 2, 1, '인사이드미', '2024-09-06', '2024-10-10', 110, '인사이드미.jpg', 10, 'p', null, null, null);
insert into performance values(null, 1, 1, 8, 4, '김종욱 찾기', '2024-10-01', '2024-12-09', 100, '김종욱 찾기.jpg', 7, 'p', null, null, null);

-- 2.드라마
insert into performance values(null, 1, 1, 1, 1, '시카고', '2024-09-09', '2024-10-09', 145, '시카고.PNG', 14, 'p', null, null, null);
insert into performance values(null, 1, 2, 3, 1, '부치하난', '2024-09-17', '2024-11-17', 160, '부치하난.PNG', 14, 'p', "화,수,목 19:30 / 금 15:00, 19:30 / 토 15:00, 19:30 / 일,공휴일 14:00, 18:30 / 월 공연없음<br>
* 공연없음 : 9/17(화) 14:00, 9/20(금) 15:00, 9/29(일) 14:00, 18:30 , 10/4(금) 15:00", null, 'sangse5.jpg');
insert into performance values(null, 1, 2, 1, 1, '광화문연가', '2024-10-23', '2025-01-05', 160, '광화문연가.png', 8, 'w', null, null, null);
insert into performance values(null, 1, 2, 4, 1, '베르사유의 장미', '2024-07.16', '2025-10-13', 150, '베르사유의 장미.png', 8, 'p', null, null, null);
insert into performance values(null, 1, 2, 2, 1, '킹키부츠', '2024-09-07', '2025-11-10', 155, '킹키부츠.png', 8, 'p', null, null, null);
insert into performance values(null, 1, 2, 9, 4, '썸데이', '2024-09-01', '2024-10-31', 100, '썸데이.PNG', 7, 'p', null, null, null);
insert into performance values(null, 1, 2, 10, 5, '어서 오세요, 휴남동 서점입니다', '2024-10-05', '2024-11-10', 100, '어서 오세요, 휴남동 서점입니다.PNG', 7, 'p', "수-목 19:30│금 16:30, 19:30│토 14:00, 17:00│일 14:00│월-화 휴관<br>
*10/9(수) 14:00, 17:00<br>
*10/30(수) 16:30, 19:30", "*10/18(금) 16:30 -> 15:30 변경<br>
해당 회차 학생 단체 관람 예정입니다. 예매 시 참고부탁드립니다.", 'sangse10.jpg');

-- 3.코믹
insert into performance values(null, 1, 3, 2, 1, '젠틀맨스 가이드', '2024-07-06', '2024-10-20', 150, '젠틀맨스 가이드.PNG', 14, 'p', null, null, null);
insert into performance values(null, 1, 3, 3, 1, '뱀프X헌터', '2024-9-15', '2024-12-21', 90, '뱀프X헌터.jpg', 12, 'p', null, null, null);
insert into performance values(null, 1, 3, 5, 2, '프리즌', '2010-09-01', '2024-12-30', 90, '프리즌.jpg', 9, 'p', null, null, null);
insert into performance values(null, 1, 3, 7, 3, '인피니티 플라잉', '2024-03-23', '2024-11-30', 80, '인피니티 플라잉.PNG', 3, 'p', null, null, null);

-- 4.공포/스릴러
insert into performance values(null, 1, 4, 3, 1, '하데스타운', '2024-07-12', '2024-10-06', 155, '하데스타운.png', 8, 'p', null, null, null);
insert into performance values(null, 1, 4, 11, 5, '진짜나쁜소녀', '2024-05-08', '2024-10-30', 100, '진짜나쁜소녀.PNG', 16, 'p', "[9월]<br>
화~목 19:30<br>
금요일 16:00 19:30<br>
토요일 15:00 19:00<br>
일요일&공휴일 15:00<br><br>
 
*9/15(일) 15:00<br>
*9/16(월)~9/17(화) 공연 없음<br>
*9/18(수) 15:00<br>
*매 주 월요일 공연 없음", null, 'sangse16.jpg');

-- 5.퍼포먼스
insert into performance values(null, 1, 5, 3, 1, '애니', '2024-10-01', '2024-10-27', 135, '애니.PNG', 5, 'p', null, null, null);
insert into performance values(null, 1, 5, 2, 1, '스파이', '2024-09-26', '2024-10-28', 120, '스파이.png', 14, 'p', null, null, null);
insert into performance values(null, 1, 5, 13, 7, '난타', '2024-09-26', '2024-11-20', 90, '난타.jpg', 1, 'p', null, null, null);
insert into performance values(null, 1, 5, 1, 1, '와일드', '2024-08-16', '2024-12-31', 75, '와일드.jpg', 19, 'p', null, null, null);
insert into performance values(null, 1, 5, 4, 1, '페인터즈', '2024-09-26', '2024-10-21', 75, '페인터즈.jpg', 1, 'p', "예매가능시간: 전일17시(월~토 관람 시)까지/전일 11시(일요일 관람 시)까지<br><br>

공연 시간 : 월요일~일요일 14시, 17시, 20시", null, 'sangse21.jpg');
-- 6.어린이
insert into performance values(null, 1, 6, 9, 4, '베베핀 뮤지컬', '2024-09-21', '2024-09-22', 65, '베베핀 뮤지컬.jpg', 1, 'f', null, null, null);
insert into performance values(null, 1, 6, 3, 1, '어린왕자', '2024-08-02', '2024-09-29', 50, '어린왕자.jpg', 3, 'f', null, null, null);
insert into performance values(null, 1, 6, 5, 2, '오리지널 어린이 캣', '2024-10-30', '2024-11-20', 70, '오리지널 어린이 캣.jpg', 3, 'w', null, null, null);
insert into performance values(null, 1, 6, 6, 2, '인어공주', '2024-09-26', '2024-12-26', 50, '인어공주.jpg', 1, 'p', null, null, null);
insert into performance values(null, 1, 6, 1, 1, '피노키오', '2024-03-23', '2024-10-28', 75, '피노키오.jpg', 1, 'p', null, null, null);

-- 연극
-- 1.로맨틱코미디                         장르 공연장
insert into performance values(null, 2, 7, 22, 4, '행복총량의 법칙', '2024-08-17', '2024-10-30', 90, '행복총량의 법칙.jpg', 8, 'p', null, null, null);
insert into performance values(null, 2, 7, 15, 1, '비누향기', '2024-10-10', '2024-12-20', 110, '비누향기.jpg', 12, 'w', null, null, null);
insert into performance values(null, 2, 7, 14, 1, '은밀한 연애', '2024-03-12', '2024-10-31', 75, '은밀한 연애.PNG', 12, 'p', "[9월]<br>
화, 수, 목 오후 3시, 5시 / 월, 금 오후 3시, 5시, 7시 30분 / 토요일 오후 1시, 3시, 5시, 7시 / 일요일, 공휴일 오후 2시, 4시<br><br>

[10월]<br>
평일 오후 3시, 5시, 7시 30분 / 토요일 오후 1시, 3시, 5시, 7시 / 일요일, 공휴일 오후 2시, 4시<br>
<10월 16일 (수), 10월 23일 (수), 10월 30일 (수) 15시, 17시 공연 없음>", "- 공연 30분 전 매표소 오픈 / 10분 전 입장 가능합니다.", 'sangse29.jpg');
insert into performance values(null, 2, 7, 16, 1, '라면', '2024-04-04', '2024-10-31', 100, '라면.PNG', 11, 'p', null, null, null);
insert into performance values(null, 2, 7, 14, 1, '핫식스', '2017-09-14', '2024-10-31', 120, '핫식스.PNG', 19, 'p', "［9월 공연시간］<br>
월화수목 : 4시30분<br>
금 : 3시20분, 6시30분<br>
토일 : 1시20분, 4시30분, 7시10분<br><br>
 
*9/16(월) : 1시20분, 4시30분, 7시10분<br>
*9/17(화) : 공연없음<br>
*9/18(수) : 1시20분, 4시30분, 7시10분<br><br>

［ 10월 공연시간 ］ <br>
월화수목 : 4시30분<br>
금 : 3시20분, 6시30분<br>
토일 : 1시30분, 4시40분, 7시30분<br><br>
 
*10/1(화) : 1시30분, 4시40분, 7시30분<br>
*10/2(수) : 3시20분, 6시30분<br>
*10/3(목) : 1시30분, 4시40분, 7시30분<br>
*10/9(수) : 1시30분, 4시40분, 7시30분", null, 'sangse31.jpg'
);
-- 2.드라마
insert into performance values(null, 2, 8, 16, 1, '버나르도&프란시스코', '2024-08-17', '2024-10-13', 95, '버나르도&프란시스코.PNG', 7, 'p', "평일 20시 / 토,공휴일 14시, 18시 / 일요일 16시<br>
* 월요일, 9월 17일 공연 없음", "※ 매수제한: 회차별 1인 4매<br><br>

※ 9월10일(화) ~ 9월15일(일) 페어 엽서 증정 이벤트", 'sangse32.jpg');
insert into performance values(null, 2, 8, 15, 1, '나와 할아버지', '2024-09-24', '2024-11-24', 90, '나와 할아버지.PNG', 10, 'p', null, null, null);
insert into performance values(null, 2, 8, 18, 2, '이방인', '2024-08-23', '2024-09-22', 100, '이방인.PNG', 15, 'f', "평일 8시 | 토 3시, 7시 | 일 및 공휴일 3시 | 화 쉼", "* 9월 6일(금) 8시 회차는 '2024 야간 공연 관람권 사업'으로 인하여 미오픈됩니다.<br>
* 9월 21일(토) 3시 회차는 단체 관람으로 인해 일부 좌석이 마감되었습니다.<br>
예매 시 참고 부탁드립니다. 감사합니다.", 'sanagse34.jpg');
insert into performance values(null, 2, 8, 20, 3, '로스트', '2024-09-11', '2025-01-05', 60, '로스트.PNG', 15, 'p', "평일(월~금): 19:30<br>
토/일/공휴일: 15:30", null, 'sangse35.jpg');
insert into performance values(null, 2, 8, 19, 2, '불편한 편의점', '2023-04-08', '2024-11-17', 100, '불편한 편의점.PNG', 7, 'p', "* 수-금 19:30 │ 토 14:00, 17:00 │ 일 14:00 │ 월, 화 휴관<br><br>

* 추석: 9/16(월) 14:00, 17:00 │ 9/17(화) 14:00 │ 9/18(수) 14:00<br>
* 10/3 (목, 개천절) 14:00│10/9 (수, 한글날) 14:00", "［청소년/학교 및 일반 단체 관람일자］<br>
아래 회차는 청소년/학교 및 일반 단체 관람객이 함께합니다.<br>
일반 예매 및 관람에 참고 부탁드립니다.<br><br>
 
9/4(수) 19:30<br>
9/7(토) 14:00<br>
10/18(금) 19:30<br>
10/19(토) 14:00", 'sangse36.jpg');
-- 3.코믹
insert into performance values(null, 2, 9, 17, 1, '2호선 세입자', '2024-11-11', '2024-12-30', 100, '2호선 세입자.jpg', 14, 'w', null, null, null);
insert into performance values(null, 2, 9, 23, 4, '런투패밀리', '2024-08-02', '2024-12-30', 90, '런투패밀리.jpg', 9, 'p', null, null, null);
insert into performance values(null, 2, 9, 18, 2, '죽여주는 이야기', '2023-07-01', '2024-11-13', 100, '죽여주는 이야기.PNG', 8, 'p', null, null, null);
insert into performance values(null, 2, 9, 16, 1, '오백에 삼십', '2015-11-21', '2024-10-31', 100, '오백에 삼십.PNG', 11, 'p', null, null, null);
insert into performance values(null, 2, 9, 21, 3, '너의 목소리가 들려', '2018-12-06', '2024-10-20', 100, '너의 목소리가 들려.PNG', 12, 'p', null, null, null);

-- 4.공포/스릴러
insert into performance values(null, 2, 10, 14, 1, '그곳에 있었다', '2023-09-01', '2024-10-16', 70, '그곳에 있었다.jpg', 13, 'p', null, null, null);
insert into performance values(null, 2, 10, 25, 5, '쉬어매드니스', '2024-07-25', '2024-10-17', 110, '쉬어매드니스.jpg', 16, 'p', null, null, null);
insert into performance values(null, 2, 10, 24, 5, '자취', '2020-02-28', '2024-10-18', 80, '자취.jpg', 13, 'p', null, null, null);
insert into performance values(null, 2, 10, 18, 2, '크리미널 시즌4', '2024-07-12', '2024-10-09', 90, '크리미널 시즌4.jpg', 13, 'p', null, null, null);
insert into performance values(null, 2, 10, 19, 2, '오마이갓', '2017-07-01', '2024-11-15', 90, '오마이갓.PNG', 12, 'p', "［ 9월 공연시간 ］<br>
월화수목금 : 3시30분, 5시20분<br>
토 : 1시40분, 3시30분, 5시20분, 7시10분<br>
일 : 2시, 3시50분, 5시40분<br><br>

*9/10(화) : 3시 단독대관 회차 마감<br>
*9/15(일) : 1시40분, 3시30분, 5시20분, 7시10분<br>
*9/16(월) : 1시40분, 3시30분, 5시20분, 7시10분<br>
*9/17(화) : 공연없음<br>
*9/18(수) : 2시, 3시50분, 5시40분<br><br>

［10월 공연시간］<br>
월화수목 : 5시<br>
금 : 3시30분, 5시20분<br>
토 : 1시40분, 3시30분, 5시20분, 7시10분<br>
일 : 2시, 3시50분, 5시40분<br><br>
 
*10/1(화) : 2시, 3시50분, 5시40분<br>
*10/2(수) : 3시30분, 5시20분<br>
*10/3(목) : 1시40분, 3시30분, 5시20분, 7시10분<br>
*10/9(수) : 2시, 3시50분, 5시40분", null, 'sangse46.jpg');
-- 5.퍼포먼스

-- 6.어린이
insert into performance values(null, 2, 12, 16, 1, '북극곰예술여행', '2019-07-20', '2024-10-30', 60, '북극곰 예술여행.PNG', 2, 'p', null, null, null);
insert into performance values(null, 2, 12, 15, 1, '아빠와 난 초등1학년', '2024-10-11', '2024-10-13', 60, '아빠와 난 초등1학년.PNG', 3, 'w', null, null, null);
insert into performance values(null, 2, 12, 14, 1, '시간을 파는 상점', '2016-10-08', '2024-10-27', 90, '시간을 파는 상점.PNG', 8, 'p', "［9~10월 공연 시간］<br>
금: 17:00<br>
토: 11:00, 13:00, 15:00, 17:00<br>
일: 11:00, 13:00, 15:00<br><br>

*특이회차<br>
9월 15일: 11:00, 13:00, 15:00, 17:00<br>
9월 16일: 11:00, 13:00, 15:00, 17:00<br>
9월 17일: 13:00, 15:00<br>
9월 18일: 11:00, 13:00, 15:00<br><br>

10월 1일: 11:00, 13:00, 15:00, 17:00<br>
10월 2일: 11:00, 13:00, 15:00<br>
10월 3일: 11:00, 13:00, 15:00, 17:00<br>
10월 4일: 11:00, 13:00, 15:00<br><br>

10월 9일: 11:00, 13:00, 15:00", null, 'sangse49.jpg');
insert into performance values(null, 2, 12, 20, 3, '난 토마토 절대 안 먹어', '2024-11-08', '2024-11-09', 50, '난 토마토 절대 안 먹어.PNG', 3, 'w', null, null, null);
insert into performance values(null, 2, 12, 23, 4, '따라가면 안돼', '2024-10-01', '2024-10-02', 50, '따라가면 안돼.PNG', 3, 'f', null, null, null);

-- 발라드
insert into performance values(null, 3, 13, 27, 1, '2024 린(LYn) 콘서트 〈HOME〉', '2024-10-05', '2024-10-06', 100, '2024 린(LYn) 콘서트 〈HOME〉.png', 7, 'w', "1회차: 2024년 10월 5일(토) 오후 3시<br>
2회차: 2024년 10월 5일(토) 오후 7시<br>
3회차: 2024년 10월 6일(일) 오후 4시", "※ 티켓분실 및 미지참시 재발권 및 입장은 절대불가하오니 티켓보관에 유의하시기 바랍니다.<br>
※ 미취학아동이 관람할 경우, 현장에서 나이 확인이 가능한 증빙서류를 지참하시기 바랍니다.", 'sangse52.jpg');
insert into performance values(null, 3, 13, 30, 2, '사나사숲 콘서트', '2024-10-19', '2024-10-19', 100, '사나사숲 콘서트.png', 6, 'w', "토요일 PM 7 : 00 ~ 9 : 00", "***가을맞이(추석 포함) <파격 할인 행사>를 펼칩니다. 많은 팬분들께 양평 사나사 계곡과 용문산 숲의 아름다움 속에서 '발라드 음악의 정수'를 즐길 수 있는 기회를

드리고 싶습니다 (기존 예매한 고객분들께도 할인 가격으로 동등하게 할 것임). 마감 전에 빨리 티켓 예매해 주세요!!!<br><br>

*사나사숲콘서트는 여타 지역 할인 행사와 달리 외부 지원(지자체, 문화재단 등)이 일체 없음.<br><br>

기산음악박물관 야외음악당은 '자연의 숲 뷰(view)'가 장점임<br><br>

일찍 오시는 분들은 용문산 사나사계곡 ~ 사나사까지 ASMR을 들으며 왕복 40분 산책의 묘미가 있음.<br><br>

일반석은 1)고정 플라스틱 의자 좌석, 2)돌계단 좌석, 3)잔디밭(방석 제공) 좌석의 세 종류가 있으며 선착순 입장 순서대로 착석.<br><br>

VIP 좌석은 3층 카페의 테라스에 위치하여 남한강과 숲 뷰(view)가 아름다우며, 커피와 조각 케이크를 제공할 예정.<br><br>

자가용 주차장은 주차 요원의 안내에 따라 1)사나사계곡 공용 주차장, 2)다목적 광장 공용 주차장, 3)'더 그림' 주차장의 3곳 총 400여 대 주차가 가능함.<br><br>

공연 일시및 시간은 2024년 10월 19일(토) PM 7 : 00 ~ 9 : 00(총 120분)<br><br>

폭염이 점차 사라지고 선선한 가을이 왔습니다.<br><br>

가을의 정취를 느끼시려면 '양평 사나사숲'으로 달려와서 <사나사숲 콘서트>를 즐겨주세요.<br><br>

**여전히 최고 고음가수 Tears의 소찬휘님/ 뮤지컬 [영웅] 출연으로 떠오른 신데렐라 EXID의 솔지님/<br><br>

드라마 <상속자들>OST를 불러 레전드로 등극했던 2AM의 이창민님/ '멜론 차트 100'에 6개월째 연속<br><br>

올라있는 <슬픈 초대장>의 순순희님의 달콤한 발라드를 자연의 아름다움 속에서 감상하세요!!!", 'sangse53.jpg');
insert into performance values(null, 3, 13, 28, 1, '윤시내 콘서트', '2024-11-23', '2024-11-23', 120, '윤시내 콘서트.png', 8, 'w', null, null, null);
insert into performance values(null, 3, 13, 29, 1, '이광조 콘서트 the vocalist', '2024-10-05', '2024-10-05', 120, '이광조 콘서트 the vocalist.png', 7, 'w', "2024년 10월 05일 토요일 18:00", null, 'sangse55.jpg');
-- 락
insert into performance values(null, 3, 14, 31, 2, '나이트레이지 내한 첫 서울공연 on HELLRIDE 26', '2024-10-26', '2024-10-26', 210, '나이트레이지 내한 첫 서울공연 on HELLRIDE 26.png', 1, 'w', null, null, null);
insert into performance values(null, 3, 14, 26, 1, '리플렉스 단독공연', '2024-10-05', '2024-10-05', 150, '리플렉스 단독공연.png', 1, 'w', null, null, null);
insert into performance values(null, 3, 14, 35, 5, '블랙홀 정홍일 Twin Concert', '2024-10-12', '2024-10-12', 150, '블랙홀 정홍일 Twin Concert.png', 1, 'w', null, null, null);
insert into performance values(null, 3, 14, 35, 5, '점프투게더', '2024-10-05', '2024-10-05', 200, '점프투게더.png', 1, 'w', null, null, null);
insert into performance values(null, 3, 14, 31, 2, 'Legend Blues Band 신촌블루스 - 화성', '2024-10-26', '2024-10-26', 90, 'Legend Blues Band 신촌블루스 - 화성.png', 7, 'w', null, null, null);
insert into performance values(null, 3, 14, 29, 1, 'SOUND ATTACK Vol.3', '2024-09-20', '2024-09-20', 130, 'SOUND ATTACK Vol.3.png', 1, 'f', null, null, null);
-- 힙합
insert into performance values(null, 3, 15, 30, 2, 'NOWITZKI LIVE', '2024-09-21', '2024-09-22', 100, 'NOWITZKI LIVE.png', 14, 'f', "9월 21일 토요일 오후 5시<br>
9월 22일 일요일 오후 5시", null, 'sangse62.jpg');
insert into performance values(null, 3, 15, 31, 2, '2024 어텐션 라이브 #2 - 용인', '2024-09-28', '2024-09-28', 90, '2024 어텐션 라이브2 - 용인.png', 8, 'f', null, null, null);
insert into performance values(null, 3, 15, 33, 4, 'COUNTDOWN', '2024-10-19', '2024-10-19', 100, 'COUNTDOWN.png', 15, 'w', null, null, null);
insert into performance values(null, 3, 15, 28, 1, 'Super Rookie Challenge', '2024-09-13', '2024-09-13', 180, 'Super Rookie Challenge.png', 1, 'f', null, null, null);
-- 트로트
insert into performance values(null, 3, 16, 31, 2, '2024 장윤정 라이브 콘서트 - 성남', '2024-10-19', '2024-10-19', 120, '2024 장윤정 라이브 콘서트 - 성남.png', 8, 'w', "2024년 10월 19일(토) 오후 2시, 6시", "※ 티켓분실 및 미지참시 재발권 및 입장은 절대불가하오니 티켓보관에 유의하시기 바랍니다.<br>
※ 8세이상 초등학생이 관람 할 경우, 현장에서 나이 확인이 가능한 증빙서류를 지참하시기 바랍니다.<br>
※ 10매이상 예매를 원할경우 인터파크 고객센터(1544-1555)로 문의바랍니다.", 'sangse66.jpg');
insert into performance values(null, 3, 16, 33, 4, 'ASAC 송년콘서트 〈김연자 데뷔 50주년 콘서트-블링블링 아모르파티〉-안산', '2024-12-21', '2024-12-21', 120, 'ASAC 송년콘서트 〈김연자 데뷔 50주년 콘서트-블링블링 아모르파티〉-안산.png', 7, 'w', null, null, null);
insert into performance values(null, 3, 16, 30, 2, '〈10월의 봄〉 정훈희x송창식with 함춘호 콘서트 - 고양', '2024-10-05', '2024-10-05', 120, '〈10월의 봄〉 정훈희x송창식with 함춘호 콘서트 - 고양.png', 7, 'w', null, null, null);
insert into performance values(null, 3, 16, 34, 4, '〈미스트롯3〉 전국투어 콘서트 - 진주', '2024-09-28', '2024-09-28', 150, '〈미스트롯3〉 전국투어 콘서트 - 진주.png', 8, 'f', "공연일정 : 2024년 9월 28일(토) / 1일 2회 공연<br>
공연시간 : (토) 오후 1시, 6시", "※ 티켓분실 및 미지참시 재발권 및 입장은 절대불가하오니 티켓보관에 유의하시기 바랍니다.<br>
※ 만 7세 이상 초등학생이 관람 할 경우, 현장에서 나이 확인이 가능한 증빙서류를 지참하시기 바랍니다.<br>
※ 5매이상 예매를 원할경우 인터파크 고객센터(1544-1555)로 문의바랍니다.", 'sangse69.jpg');
insert into performance values(null, 3, 16, 37, 6, '2024 심수봉 전국투어콘서트 : 꽃길 - 군포', '2024-11-23', '2024-11-23', 120, '2024 심수봉 전국투어콘서트 꽃길 - 군포.png', 8, 'w', null, null, null);
insert into performance values(null, 3, 16, 35, 5, '2024 오누이 “우리들의 학창시절” 〈김용임,진성〉 - 여수', '2024-09-14', '2024-09-14', 120, '2024 오누이 “우리들의 학창시절” 〈김용임,진성〉 - 여수.png', 7, 'f', null, null, null);
insert into performance values(null, 3, 16, 36, 5, '2024 오누이 시즌2 “우리들의 무명시절” 〈김용임,진성〉 - 전주', '2024-10-12', '2024-10-12', 120, '2024 오누이 시즌2 “우리들의 무명시절” 〈김용임,진성〉 - 전주.png', 7, 'w', null, null, null);
insert into performance values(null, 3, 16, 33, 4, '2024 장윤정 라이브 콘서트 - 대구', '2024-09-28', '2024-09-28', 120, '2024 장윤정 라이브 콘서트 - 대구.png', 8, 'f', null, null, null);
insert into performance values(null, 3, 16, 34, 4, '2024 주현미 콘서트 〈The Original〉 - 부산', '2024-10-13', '2024-10-13', 100, '2024 주현미 콘서트 〈The Original〉 - 부산.png', 7, 'w', null, null, null);
insert into performance values(null, 3, 16, 33, 4, '2024 주현미 콘서트 〈The Original〉 - 구미', '2024-10-03', '2024-10-03', 100, '2024 주현미 콘서트 〈The Original〉 - 구미.png', 7, 'f', null, null, null);
insert into performance values(null, 3, 16, 29, 1, '2024 추석특집 주현미 콘서트 〈The Original〉', '2024-09-21', '2024-09-21', 100, '2024 추석특집 주현미 콘서트 〈The Original〉.png', 7, 'f', null, null, null);
insert into performance values(null, 3, 16, 31, 2, '7080 낭만 극장쇼 - 용인', '2024-08-10', '2024-12-07', 60, '7080 낭만 극장쇼 - 용인.png', 15, 'p', null, null, null);
insert into performance values(null, 3, 16, 35, 5, '박인희 앵콜＂ 콘서트', '2024-09-21', '2024-09-21', 120, '박인희 앵콜 콘서트.png', 7, 'f', null, null, null);
insert into performance values(null, 3, 16, 36, 5, '정태춘,박은옥 콘서트 - 전주', '2024-09-28', '2024-09-28', 120, '정태춘,박은옥 콘서트 - 전주.png', 7, 'f', null, null, null);
insert into performance values(null, 3, 16, 34, 4, '진성 30주년 기념 콘서트 〈진성 빅쇼〉 - 부산', '2024-09-21', '2024-09-21', 120, '진성 30주년 기념 콘서트 〈진성 빅쇼〉 - 부산.png', 12, 'f', "2024년 9월 21일(토) 14:00 / 18:00", null, 'sangse80.jpg');
insert into performance values(null, 3, 16, 34, 4, '진성 30주년 기념 콘서트 〈진성 빅쇼〉 - 울산', '2024-10-05', '2024-10-05', 120, '진성 30주년 기념 콘서트 〈진성 빅쇼〉 - 울산.png', 12, 'w', "2024년 10월 5일 [토요일] 1회차 : 14시 / 2회차 : 18시", null, 'sangse81.jpg');
insert into performance values(null, 3, 16, 31, 2, '진성 30주년 기념 콘서트 〈진성 빅쇼〉 - 인천', '2024-11-30', '2024-11-30', 120, '진성 30주년 기념 콘서트 〈진성 빅쇼〉 - 인천.png', 12, 'w', "2024년 11월 30일(토) 14:00 / 18:00", null, 'sangse82.jpg');
insert into performance values(null, 3, 16, 34, 4, '진성 30주년 기념 콘서트 〈진성 빅쇼〉 - 창원', '2024-09-28', '2024-09-28', 120, '진성 30주년 기념 콘서트 〈진성 빅쇼〉 - 창원.png', 12, 'f', "2024년 09월 28일 [토요일] 1회차: 14:00시 / 2회차: 18:00시", null, 'sangse83.jpg');
insert into performance values(null, 3, 16, 30, 2, '추가열과 이상우의 포크콘서트 - 연천', '2024-10-12', '2024-10-12', 120, '추가열과 이상우의 포크콘서트 - 연천.png', 8, 'w', null, null, null);
insert into performance values(null, 3, 16, 37, 6, '포크 포에버', '2024-09-22', '2024-09-22', 120, '포크 포에버.png', 8, 'f', null, null, null);

-- seat
-- 뮤지컬 (로맨틱코미디)
insert into seat (performance_idx, seat_grade, seat_price) values (1, '전', 55000); -- 써니텐
insert into seat (performance_idx, seat_grade, seat_price) values (2, '전', 50000); -- 인사이드미
insert into seat (performance_idx, seat_grade, seat_price) values (3, 'OP', 120000); -- 김종욱 찾기
-- 뮤지컬 (드라마)
insert into seat (performance_idx, seat_grade, seat_price) values (4, 'VIP', 160000); -- 시카고	
insert into seat (performance_idx, seat_grade, seat_price) values (4, 'OP', 150000);
insert into seat (performance_idx, seat_grade, seat_price) values (4, 'R', 140000);
insert into seat (performance_idx, seat_grade, seat_price) values (4, 'S', 110000);
insert into seat (performance_idx, seat_grade, seat_price) values (4, 'A', 80000);		

insert into seat (performance_idx, seat_grade, seat_price) values (5, 'OP', 120000); -- 부치하난
insert into seat (performance_idx, seat_grade, seat_price) values (5, 'VIP', 120000);
insert into seat (performance_idx, seat_grade, seat_price) values (5, 'R', 90000);
insert into seat (performance_idx, seat_grade, seat_price) values (5, 'S', 60000);
insert into seat (performance_idx, seat_grade, seat_price) values (6, 'VIP', 160000); -- 광화문연가
insert into seat (performance_idx, seat_grade, seat_price) values (6, 'R', 130000);
insert into seat (performance_idx, seat_grade, seat_price) values (6, 'S', 100000);
insert into seat (performance_idx, seat_grade, seat_price) values (6, 'A', 70000);
insert into seat (performance_idx, seat_grade, seat_price) values (7, 'VIP', 170000); -- 베르사유의 장미
insert into seat (performance_idx, seat_grade, seat_price) values (7, 'R', 140000);
insert into seat (performance_idx, seat_grade, seat_price) values (7, 'S', 110000);
insert into seat (performance_idx, seat_grade, seat_price) values (7, 'A', 80000);
insert into seat (performance_idx, seat_grade, seat_price) values (8, '밀라노', 170000); -- 킹키부츠
insert into seat (performance_idx, seat_grade, seat_price) values (8, 'VIP', 170000); 
insert into seat (performance_idx, seat_grade, seat_price) values (8, 'R', 140000);
insert into seat (performance_idx, seat_grade, seat_price) values (8, 'S', 110000);
insert into seat (performance_idx, seat_grade, seat_price) values (8, 'A', 80000);
insert into seat (performance_idx, seat_grade, seat_price) values (9, '전', 55000); -- 썸데이
insert into seat (performance_idx, seat_grade, seat_price) values (10, '전', 60000); -- 어서 오세요, 휴남동 서점입니다
-- 뮤지컬 (코믹)
insert into seat (performance_idx, seat_grade, seat_price) values (11, 'VIP', 150000); -- 젠틀맨스 가이드
insert into seat (performance_idx, seat_grade, seat_price) values (11, 'OP', 130000);
insert into seat (performance_idx, seat_grade, seat_price) values (11, 'R', 130000);
insert into seat (performance_idx, seat_grade, seat_price) values (11, 'S', 90000);
insert into seat (performance_idx, seat_grade, seat_price) values (11, 'A', 60000);
insert into seat (performance_idx, seat_grade, seat_price) values (12, '전', 60000); -- 뱀프 X 헌터
insert into seat (performance_idx, seat_grade, seat_price) values (13, '전', 50000); -- 프리즌
insert into seat (performance_idx, seat_grade, seat_price) values (14, 'R', 30000); -- 인피니티 플라잉
insert into seat (performance_idx, seat_grade, seat_price) values (14, 'S', 20000);
-- 뮤지컬 (공포)
insert into seat (performance_idx, seat_grade, seat_price) values (15, 'VIP', 170000); -- 하데스타운
insert into seat (performance_idx, seat_grade, seat_price) values (15, 'R', 140000);
insert into seat (performance_idx, seat_grade, seat_price) values (15, 'S', 110000);
insert into seat (performance_idx, seat_grade, seat_price) values (15, 'A', 80000);
insert into seat (performance_idx, seat_grade, seat_price) values (16, '전', 60000); -- 진짜나쁜소녀
-- 뮤지컬 (퍼포먼스)
insert into seat (performance_idx, seat_grade, seat_price) values (17, 'VIP', 130000); -- 애니
insert into seat (performance_idx, seat_grade, seat_price) values (17, 'R', 110000);
insert into seat (performance_idx, seat_grade, seat_price) values (17, '커플', 110000);
insert into seat (performance_idx, seat_grade, seat_price) values (17, 'S', 90000);
insert into seat (performance_idx, seat_grade, seat_price) values (18, '한줄기의빛', 70000); -- 스파이
insert into seat (performance_idx, seat_grade, seat_price) values (18, '스파이더맨인블랙', 60000); 
insert into seat (performance_idx, seat_grade, seat_price) values (18, '로마의대체휴일', 50000);
insert into seat (performance_idx, seat_grade, seat_price) values (18, '미션임파서블드림', 40000);
insert into seat (performance_idx, seat_grade, seat_price) values (18, '티파니에서야참을', 30000);
insert into seat (performance_idx, seat_grade, seat_price) values (19, 'VIP', 70000); -- 난타
insert into seat (performance_idx, seat_grade, seat_price) values (19, 'S', 60000);
insert into seat (performance_idx, seat_grade, seat_price) values (19, 'A', 50000);
insert into seat (performance_idx, seat_grade, seat_price) values (20, 'WILD EVENT', 125000); -- 와일드
insert into seat (performance_idx, seat_grade, seat_price) values (20, 'WILD WILD', 99000); 
insert into seat (performance_idx, seat_grade, seat_price) values (20, 'WILD', 77000);
insert into seat (performance_idx, seat_grade, seat_price) values (20, 'R', 66000);
insert into seat (performance_idx, seat_grade, seat_price) values (20, '시야방해', 60000);
insert into seat (performance_idx, seat_grade, seat_price) values (21, 'VIP', 70000); -- 페인터즈
insert into seat (performance_idx, seat_grade, seat_price) values (21, 'R', 50000);
-- 뮤지컬(어린이)
insert into seat (performance_idx, seat_grade, seat_price) values (22, 'VIP', 66000); -- 베베핀 뮤지컬
insert into seat (performance_idx, seat_grade, seat_price) values (22, 'R', 55000);
insert into seat (performance_idx, seat_grade, seat_price) values (23, '전', 30000); -- 어린왕자
insert into seat (performance_idx, seat_grade, seat_price) values (24, 'R', 66000); -- 오리지널 어린이 캣
insert into seat (performance_idx, seat_grade, seat_price) values (24, 'S', 44000);
insert into seat (performance_idx, seat_grade, seat_price) values (25, '전', 30000); -- 인어공주
insert into seat (performance_idx, seat_grade, seat_price) values (26, '전', 40000); -- 피노키오

-- 연극(로맨틱코미디)
insert into seat (performance_idx, seat_grade, seat_price) values (27, '전', 40000); -- 행복총량의 법칙
insert into seat (performance_idx, seat_grade, seat_price) values (28, '전', 50000); -- 비누향기
insert into seat (performance_idx, seat_grade, seat_price) values (29, '전', 40000); -- 은밀한 연애
insert into seat (performance_idx, seat_grade, seat_price) values (30, '전', 60000); -- 행복총량의 법칙
insert into seat (performance_idx, seat_grade, seat_price) values (31, '전', 80000); -- 핫식스
-- 연극(드라마)
insert into seat (performance_idx, seat_grade, seat_price) values (32, 'R', 55000); -- 버나르도 & 프란시스코
insert into seat (performance_idx, seat_grade, seat_price) values (32, 'S', 44000);
insert into seat (performance_idx, seat_grade, seat_price) values (33, '전', 55000); -- 나와 할아버지
insert into seat (performance_idx, seat_grade, seat_price) values (34, '전', 50000); -- 이방인
insert into seat (performance_idx, seat_grade, seat_price) values (35, '전', 40000); -- 로스트
insert into seat (performance_idx, seat_grade, seat_price) values (36, '올웨이즈', 60000); -- 불편한 편의점
insert into seat (performance_idx, seat_grade, seat_price) values (36, '파라솔', 60000); 
-- 연극(코믹)
insert into seat (performance_idx, seat_grade, seat_price) values (37, '세입자', 40000); -- 2호선 세입자
insert into seat (performance_idx, seat_grade, seat_price) values (37, '일반', 40000); 
insert into seat (performance_idx, seat_grade, seat_price) values (38, '전', 40000); -- 런투패밀리
insert into seat (performance_idx, seat_grade, seat_price) values (39, '안락사', 50000); -- 죽여주는 이야기
insert into seat (performance_idx, seat_grade, seat_price) values (39, '마돈나', 50000); 
insert into seat (performance_idx, seat_grade, seat_price) values (39, '바보레옹', 50000); 
insert into seat (performance_idx, seat_grade, seat_price) values (39, '배려', 50000); 
insert into seat (performance_idx, seat_grade, seat_price) values (40, '일반', 50000); -- 오백에 삼십
insert into seat (performance_idx, seat_grade, seat_price) values (41, '일반', 80000); -- 너의 목소리가 들려
-- 연극(공포)
insert into seat (performance_idx, seat_grade, seat_price) values (42, 'VIP', 21000); -- 그곳에 있었다
insert into seat (performance_idx, seat_grade, seat_price) values (42, 'R', 20000);
insert into seat (performance_idx, seat_grade, seat_price) values (42, 'S', 19000);
insert into seat (performance_idx, seat_grade, seat_price) values (42, 'A', 18000);
insert into seat (performance_idx, seat_grade, seat_price) values (43, '전', 60000); -- 쉬어매드니스
insert into seat (performance_idx, seat_grade, seat_price) values (44, 'VIP', 50000);  -- 자취
insert into seat (performance_idx, seat_grade, seat_price) values (44, 'R', 50000);
insert into seat (performance_idx, seat_grade, seat_price) values (44, 'S', 50000);
insert into seat (performance_idx, seat_grade, seat_price) values (44, 'A', 50000);
insert into seat (performance_idx, seat_grade, seat_price) values (45, '일반', 45000); -- 크리미널 시즌4
insert into seat (performance_idx, seat_grade, seat_price) values (46, '일반', 80000); -- 오마이갓
-- 연극(퍼포먼스)
-- 연극(어린이)
insert into seat (performance_idx, seat_grade, seat_price) values (47, '일반', 22900); -- 북극곰예술여행
insert into seat (performance_idx, seat_grade, seat_price) values (48, '전', 20000); -- 아빠와 난 초등1학년
insert into seat (performance_idx, seat_grade, seat_price) values (49, '전', 45000); -- 시간을 파는 상점
insert into seat (performance_idx, seat_grade, seat_price) values (50, '전', 10000); -- 난 토마토 절대 안 먹어
insert into seat (performance_idx, seat_grade, seat_price) values (51, '전', 10000); -- 따라가면 안돼
-- 콘서트
insert into seat (performance_idx, seat_grade, seat_price) values (52, '전', 132000);
insert into seat (performance_idx, seat_grade, seat_price) values (53, 'VIP', 150000);
insert into seat (performance_idx, seat_grade, seat_price) values (53, '일반', 70000);
insert into seat (performance_idx, seat_grade, seat_price) values (54, 'R', 132000);
insert into seat (performance_idx, seat_grade, seat_price) values (54, 'S', 121000);
insert into seat (performance_idx, seat_grade, seat_price) values (54, 'A', 110000);
insert into seat (performance_idx, seat_grade, seat_price) values (55, 'R', 110000);
insert into seat (performance_idx, seat_grade, seat_price) values (55, 'S', 99000);
-- 락
insert into seat (performance_idx, seat_grade, seat_price) values (56, '전', 50000);
insert into seat (performance_idx, seat_grade, seat_price) values (57, '스탠딩', 35000);
insert into seat (performance_idx, seat_grade, seat_price) values (58, '전', 88000);
insert into seat (performance_idx, seat_grade, seat_price) values (59, '전', 65000);
insert into seat (performance_idx, seat_grade, seat_price) values (60, 'R', 50000);
insert into seat (performance_idx, seat_grade, seat_price) values (60, 'S', 30000);
insert into seat (performance_idx, seat_grade, seat_price) values (61, '전', 40000);
-- 힙합
insert into seat (performance_idx, seat_grade, seat_price) values (62, '스탠딩', 132000);
insert into seat (performance_idx, seat_grade, seat_price) values (63, '전', 30000);
insert into seat (performance_idx, seat_grade, seat_price) values (64, '전', 10000);
insert into seat (performance_idx, seat_grade, seat_price) values (65, '전', 15000);
-- 트로트
insert into seat (performance_idx, seat_grade, seat_price) values (66, 'VIP', 143000);
insert into seat (performance_idx, seat_grade, seat_price) values (66, 'R', 132000);
insert into seat (performance_idx, seat_grade, seat_price) values (66, 'S', 121000);
insert into seat (performance_idx, seat_grade, seat_price) values (67, 'R', 140000);
insert into seat (performance_idx, seat_grade, seat_price) values (67, 'S', 120000);
insert into seat (performance_idx, seat_grade, seat_price) values (67, 'A', 100000);
insert into seat (performance_idx, seat_grade, seat_price) values (67, 'B', 70000);
insert into seat (performance_idx, seat_grade, seat_price) values (68, 'R', 132000);
insert into seat (performance_idx, seat_grade, seat_price) values (68, 'S', 110000);
insert into seat (performance_idx, seat_grade, seat_price) values (68, 'A', 88000);
insert into seat (performance_idx, seat_grade, seat_price) values (69, 'SR', 154000);
insert into seat (performance_idx, seat_grade, seat_price) values (69, 'R', 132000);
insert into seat (performance_idx, seat_grade, seat_price) values (69, 'S', 111000);
insert into seat (performance_idx, seat_grade, seat_price) values (70, 'R', 121000);
insert into seat (performance_idx, seat_grade, seat_price) values (70, 'S', 110000);
insert into seat (performance_idx, seat_grade, seat_price) values (71, 'VIP', 132000);
insert into seat (performance_idx, seat_grade, seat_price) values (71, 'R', 110000);
insert into seat (performance_idx, seat_grade, seat_price) values (72, 'VIP', 132000);
insert into seat (performance_idx, seat_grade, seat_price) values (72, 'R', 110000);
insert into seat (performance_idx, seat_grade, seat_price) values (72, 'S', 99000);
insert into seat (performance_idx, seat_grade, seat_price) values (73, 'VIP', 143000);
insert into seat (performance_idx, seat_grade, seat_price) values (73, 'R', 132000);
insert into seat (performance_idx, seat_grade, seat_price) values (73, 'S', 121000);
insert into seat (performance_idx, seat_grade, seat_price) values (74, 'R', 121000);
insert into seat (performance_idx, seat_grade, seat_price) values (74, 'S', 110000);
insert into seat (performance_idx, seat_grade, seat_price) values (74, 'A', 99000);
insert into seat (performance_idx, seat_grade, seat_price) values (75, 'R', 121000);
insert into seat (performance_idx, seat_grade, seat_price) values (75, 'S', 110000);
insert into seat (performance_idx, seat_grade, seat_price) values (76, 'R', 132000);
insert into seat (performance_idx, seat_grade, seat_price) values (76, 'S', 121000);
insert into seat (performance_idx, seat_grade, seat_price) values (76, 'A', 110000);
insert into seat (performance_idx, seat_grade, seat_price) values (77, '전', 10000);
insert into seat (performance_idx, seat_grade, seat_price) values (78, 'R', 132000);
insert into seat (performance_idx, seat_grade, seat_price) values (78, 'S', 121000);
insert into seat (performance_idx, seat_grade, seat_price) values (78, 'A', 110000);
insert into seat (performance_idx, seat_grade, seat_price) values (79, 'VIP', 119000);
insert into seat (performance_idx, seat_grade, seat_price) values (79, 'R', 109000);
insert into seat (performance_idx, seat_grade, seat_price) values (79, 'S', 99000);
insert into seat (performance_idx, seat_grade, seat_price) values (80, 'R', 121000);
insert into seat (performance_idx, seat_grade, seat_price) values (80, 'S', 110000);
insert into seat (performance_idx, seat_grade, seat_price) values (80, 'A', 99000);
insert into seat (performance_idx, seat_grade, seat_price) values (81, 'R', 121000);
insert into seat (performance_idx, seat_grade, seat_price) values (81, 'S', 110000);
insert into seat (performance_idx, seat_grade, seat_price) values (81, 'A', 99000);
insert into seat (performance_idx, seat_grade, seat_price) values (82, 'R', 121000);
insert into seat (performance_idx, seat_grade, seat_price) values (82, 'S', 110000);
insert into seat (performance_idx, seat_grade, seat_price) values (83, 'R', 121000);
insert into seat (performance_idx, seat_grade, seat_price) values (83, 'S', 110000);
insert into seat (performance_idx, seat_grade, seat_price) values (83, 'A', 99000);
insert into seat (performance_idx, seat_grade, seat_price) values (84, 'R', 40000);
insert into seat (performance_idx, seat_grade, seat_price) values (84, 'S', 30000);
insert into seat (performance_idx, seat_grade, seat_price) values (84, 'A', 10000);
insert into seat (performance_idx, seat_grade, seat_price) values (85, 'R', 110000);
insert into seat (performance_idx, seat_grade, seat_price) values (85, 'S', 99000);


-- performance_date                  날짜   공연  
insert into performance_date values (null, 27, '2024-09-30 19:30:00'); -- 연극 (s_hall)
insert into performance_date values (null, 1, '2024-09-30 19:30:00'); -- 뮤지컬 (m_hall)
insert into performance_date values (null, 52, '2024-09-30 19:30:00'); -- 콘서트 (l_hall)
insert into performance_date values (null, 4, '2024-09-30 19:30:00'); -- 뮤지컬 (m_hall)
-- s_hall
																	 -- 날짜 좌석 행
insert into s_hall (performance_date_idx, seat_idx, s_hall_row_no) values(1, 68, 1);
insert into s_hall (performance_date_idx, seat_idx, s_hall_row_no) values(1, 68, 2);
insert into s_hall (performance_date_idx, seat_idx, s_hall_row_no) values(1, 68, 3);
insert into s_hall (performance_date_idx, seat_idx, s_hall_row_no) values(1, 68, 4);
insert into s_hall (performance_date_idx, seat_idx, s_hall_row_no) values(1, 68, 5);
insert into s_hall (performance_date_idx, seat_idx, s_hall_row_no) values(1, 68, 6);
insert into s_hall (performance_date_idx, seat_idx, s_hall_row_no) values(1, 68, 7);
insert into s_hall (performance_date_idx, seat_idx, s_hall_row_no) values(1, 68, 8);
insert into s_hall (performance_date_idx, seat_idx, s_hall_row_no) values(1, 68, 9);
insert into s_hall (performance_date_idx, seat_idx, s_hall_row_no) values(1, 68, 10);
																	 -- 날짜 좌석 행
insert into m_hall (performance_date_idx, seat_idx, m_hall_row_no) values(2, 1, 1);
insert into m_hall (performance_date_idx, seat_idx, m_hall_row_no) values(2, 1, 2);
insert into m_hall (performance_date_idx, seat_idx, m_hall_row_no) values(2, 1, 3);
insert into m_hall (performance_date_idx, seat_idx, m_hall_row_no) values(2, 1, 4);
insert into m_hall (performance_date_idx, seat_idx, m_hall_row_no) values(2, 1, 5);
insert into m_hall (performance_date_idx, seat_idx, m_hall_row_no) values(2, 1, 6);
insert into m_hall (performance_date_idx, seat_idx, m_hall_row_no) values(2, 1, 7);
insert into m_hall (performance_date_idx, seat_idx, m_hall_row_no) values(2, 1, 8);
insert into m_hall (performance_date_idx, seat_idx, m_hall_row_no) values(2, 1, 9);
insert into m_hall (performance_date_idx, seat_idx, m_hall_row_no) values(2, 1, 10);
insert into m_hall (performance_date_idx, seat_idx, m_hall_row_no) values(2, 1, 11);
insert into m_hall (performance_date_idx, seat_idx, m_hall_row_no) values(2, 1, 12);
insert into m_hall (performance_date_idx, seat_idx, m_hall_row_no) values(2, 1, 13);
insert into m_hall (performance_date_idx, seat_idx, m_hall_row_no) values(2, 1, 14);
insert into m_hall (performance_date_idx, seat_idx, m_hall_row_no) values(2, 1, 15);
																	 -- 날짜 좌석 행
insert into m_hall (performance_date_idx, seat_idx, m_hall_row_no) values(4, 4, 1);
insert into m_hall (performance_date_idx, seat_idx, m_hall_row_no) values(4, 4, 2);
insert into m_hall (performance_date_idx, seat_idx, m_hall_row_no) values(4, 5, 3);
insert into m_hall (performance_date_idx, seat_idx, m_hall_row_no) values(4, 5, 4);
insert into m_hall (performance_date_idx, seat_idx, m_hall_row_no) values(4, 5, 5);
insert into m_hall (performance_date_idx, seat_idx, m_hall_row_no) values(4, 6, 6);
insert into m_hall (performance_date_idx, seat_idx, m_hall_row_no) values(4, 6, 7);
insert into m_hall (performance_date_idx, seat_idx, m_hall_row_no) values(4, 6, 8);
insert into m_hall (performance_date_idx, seat_idx, m_hall_row_no) values(4, 7, 9);
insert into m_hall (performance_date_idx, seat_idx, m_hall_row_no) values(4, 7, 10);
insert into m_hall (performance_date_idx, seat_idx, m_hall_row_no) values(4, 7, 11);
insert into m_hall (performance_date_idx, seat_idx, m_hall_row_no) values(4, 8, 12);
insert into m_hall (performance_date_idx, seat_idx, m_hall_row_no) values(4, 8, 13);
insert into m_hall (performance_date_idx, seat_idx, m_hall_row_no) values(4, 8, 14);
insert into m_hall (performance_date_idx, seat_idx, m_hall_row_no) values(4, 8, 15);

insert into l_hall (performance_date_idx, seat_idx, l_hall_row_no) values(3, 105, 1);
insert into l_hall (performance_date_idx, seat_idx, l_hall_row_no) values(3, 105, 2);
insert into l_hall (performance_date_idx, seat_idx, l_hall_row_no) values(3, 105, 3);
insert into l_hall (performance_date_idx, seat_idx, l_hall_row_no) values(3, 105, 4);
insert into l_hall (performance_date_idx, seat_idx, l_hall_row_no) values(3, 105, 5);
insert into l_hall (performance_date_idx, seat_idx, l_hall_row_no) values(3, 105, 6);
insert into l_hall (performance_date_idx, seat_idx, l_hall_row_no) values(3, 105, 7);
insert into l_hall (performance_date_idx, seat_idx, l_hall_row_no) values(3, 105, 8);
insert into l_hall (performance_date_idx, seat_idx, l_hall_row_no) values(3, 105, 9);
insert into l_hall (performance_date_idx, seat_idx, l_hall_row_no) values(3, 105, 10);
insert into l_hall (performance_date_idx, seat_idx, l_hall_row_no) values(3, 105, 11);
insert into l_hall (performance_date_idx, seat_idx, l_hall_row_no) values(3, 105, 12);
insert into l_hall (performance_date_idx, seat_idx, l_hall_row_no) values(3, 105, 13);
insert into l_hall (performance_date_idx, seat_idx, l_hall_row_no) values(3, 105, 14);
insert into l_hall (performance_date_idx, seat_idx, l_hall_row_no) values(3, 105, 15);
insert into l_hall (performance_date_idx, seat_idx, l_hall_row_no) values(3, 105, 16);
insert into l_hall (performance_date_idx, seat_idx, l_hall_row_no) values(3, 105, 17);
insert into l_hall (performance_date_idx, seat_idx, l_hall_row_no) values(3, 105, 18);
insert into l_hall (performance_date_idx, seat_idx, l_hall_row_no) values(3, 105, 19);
insert into l_hall (performance_date_idx, seat_idx, l_hall_row_no) values(3, 105, 20);

-- board_cate
insert into board_cate values(null, '뮤지컬');
insert into board_cate values(null, '연극');
insert into board_cate values(null, '콘서트');

-- qna
insert into qna values(null, 1, "qna테스트", "테스트입니다.", "관리자", default, default);

-- board
insert into board values(null, 1, 1, '뮤지컬로 글쓰기', '테스트', '0.0.0.1', now(), 6, 'y', '관리자');
insert into board values(null, 2, 1, '연극으로 글쓰기', '테스트', '0.0.0.1', now(), 3, 'y', '관리자');
insert into board values(null, 3, 1, '콘서트로 글쓰기', '테스트', '0.0.0.1', now(), 8, 'y', '관리자');
insert into board values(null, 1, 2, '뮤지컬로 글쓰기', '테스트', '0.0.0.1', now(), 1, 'y', 'one');
insert into board values(null, 2, 2, '연극으로 글쓰기', '테스트', '0.0.0.1', now(), 2, 'y', 'one');
insert into board values(null, 3, 2, '콘서트로 글쓰기', '테스트', '0.0.0.1', now(), 5, 'y', 'one');
insert into board values(null, 1, 1, '페이징 테스트용', '테스트', '0.0.0.1', now(), 7, 'y', '관리자');
insert into board values(null, 2, 1, '페이징 테스트용', '테스트', '0.0.0.1', now(), 9, 'y', '관리자');
insert into board values(null, 3, 1, '페이징 테스트용', '테스트', '0.0.0.1', now(), 0, 'y', '관리자');
insert into board values(null, 2, 1, '페이징 테스트용', '테스트', '0.0.0.1', now(), 4, 'y', '관리자');

-- faq
insert into faq values(null, '회원가입을 꼭 해야 하나요?', '티모아가 제공하는 다양한 서비스를 이용하기 위해서는 회원가입이 필요합니다. 단순히 정보를 확인하는 것은 회원이 아니어도 가능하지만,
티켓 예매, 초대 이벤트 참여 등의 활동을 위해 회원가입이 필요해요!<br><br>
* [비회원]은 티켓을 예매하실 수 없어요😭<br><br>
혹시 내 개인정보가 다른 곳에 이용될지 걱정이라면 안심하세요!<br>
티모아는 티켓 이용에 필요한 최소한의 정보만 입력하면 간편하게 회원가입이 가능하답니다.<br><br>
더욱 다양한 혜택을 위해 회원가입을 하러 가볼까요?😉<br><br>
<a href="../member/insert_form.do">회원가입 하러가기</a>', default);
insert into faq values(null, '티켓은 어떻게 예매하나요?', '먼저 티모아가 제공하는 리스트와 정렬, 추천 기능을 최대한 활용해 보세요! 달력 기능을 이용하면 내가 원하는 날짜에 관람 가능한 티켓만 확인할 수도 있어요.<br><br>
원하는 티켓을 선택했다면 [상세페이지]에서 더욱 자세한 정보를 확인할 수 있어요. 안내사항을 꼼꼼히 확인한 뒤, 원하는 [날짜/시간/권종]을 선택해주세요. (일부 티켓은 이용 날짜가 정해져 있지 않아요)<br><br>
자, 이제 거의 다 했어요!<br><br>
티켓 수량을 선택하고 [예매하기] 버튼을 눌러주세요. 이용자 정보를 입력하고 결제를 진행하면, 짜잔! 티켓 예매가 완료됩니다.<br><br>
완료와 함께 티모아 홈페이지에서 예매내역을 안내해드릴거에요! 세부사항 및 주의사항을 다시 한번 확인주세요!', default);
insert into faq values(null, '티켓 예매내역은 어떻게 확인하나요?', '우측 상단의 [마이페이지] 버튼을 클릭해보세요. [예매내역] 메뉴를 통해 예매가 완료된 티켓을 확인할 수 있답니다.<br><br>
잠깐!🤚<br>
결제가 정상적으로 완료되지 않은 경우에는 예매 내역이 보이지 않아요!<br>
다시 한번 결제를 시도해보시거나 1:1문의를 이용해주세요.', default);
insert into faq values(null, '티켓을 선물하거나 양도할 수 있나요?', '이미 예매한 티켓을 타인에게 양도🚫하는 것은 불가합니다.', default);
insert into faq values(null,  '티켓은 어떻게 사용하나요?', '티켓 결제를 완료하면 실시간으로 예매가 확정됩니다. 예매내역은 [마이페이지] 메뉴에서 확인할 수 있고, [예매내역]에서 [이용정보]를 클릭하면 예매한 티켓에 대한 안내사항과 장소 등 상세 정보를 확인할 수 있어요.<br><br>
두근두근 관람 당일💌<br><br>
일반적으로 이용 시작 30분~1시간 전부터 공연·전시장마다 준비된 매표소에서 실물티켓을 배부해요. 예매처인 [타임티켓]을 말씀하시고 예매내역을 제시하거나, 이용자 이름/휴대폰번호 확인 후 티켓을 수령할 수 있어요.', default);
insert into faq values(null, '공연 시간에 늦을 것 같아요 ㅠㅠ', '대부분의 연극/뮤지컬은 명시된 시작 시간 이후 입장이 불가합니다. 공연은 정시에 시작되며 이후 입장할 경우 극의 흐름 및 타관객들에게 방해가 될 수 있기에 지연입장을 🙅엄격히🙅 제한하고 있어요.<br><br>
주차문제, 장소착오 등 개인적인 사유로 인해 [단 1분]이라도 지각한 경우 공연장 입장은 물론 환불/변경이 불가하며, 해당 티켓은 더 이상 이용할 수 없으니 공연 시간에 늦지 않도록 유의해주세요!', default);
insert into faq values(null, '공연이 취소됐어요!', '예기치 못한 공연장의 문제나 배우의 사정, 천재지변으로 인해 부득이하게 공연이 취소될 수 있어요. 주최 측의 사유나 결정으로 공연이 취소될 경우 예매한 티켓에 대해 전액 환불이 진행됩니다.<br><br>
공연 취소, 변경이 발생할 경우 주관사에서 고객님께 전화나 문자로 연락을 드려요. 주관사의 연락을 받을 수 있도록 티켓 예매시 연락처를 정확히 기재해주세요.', default);
insert into faq values(null, '기간 내에 사용하지 못한 티켓은 어떻게 하나요?', '지정된 [관람일자나 유효기간이 경과]한 경우, 명시된 환불 규정에 따라 환불 및 변경이 불가합니다.<br><br>
특히 주차 문제, 장소 착오, 교통정체로 인한 지각이나 이용 연령 착오 등 개인적인 사유로 관람을 하지 못한 경우에도 환불/변경이 불가하며, 해당 티켓은 더 이상 이용할 수 없으니 꼭 주의해주세요!<br><br>
다만, 공연장 사정으로 인해 공연이 취소되거나 티켓을 사용하지 못한 경우에는 전액 환불이 진행됩니다.',default);
insert into faq values(null, '고객센터 운영 시간은 어떻게 되나요?', '티모아 고객센터는 평일 9시 30분 부터 18시 30분까지 운영됩니다.<br><br> 
단, 12시 30분부터 1시 30분까지는 점심시간으로 응대가 어려우며, 주말 및 공휴일에는 고객센터를 운영하지 않는 점 양해 부탁드려요.<br><br>
운영시간 외 또는 주말/공휴일에는 [Q&A 메뉴]를 통해 문의사항을 남겨주시면, 영업일(평일) 기준으로 24시간 내에 개별적으로 답변을 드립니다😊<br><br>
📞 고객센터 전화번호 : 0000-0000<br>
📧 이메일 문의 : kckpc@timoa.co.kr', default);
insert into faq values(null, '개인정보 변경은 어떻게 하나요?', '회원가입 시 입력한 개인 정보(비밀번호, 휴대폰 번호 등)를 변경하고 싶은 경우 [마이티켓>회원정보수정]에서 변경할 수 있어요.<br><br>
또한, 예매시 이용자명/연락처를 잘못 입력했다면 반드시 고객센터 또는 [Q&A 메뉴]를 통해 정정을 요청해주셔야 해요. 그렇지 않으면 티켓 이용이 불가할 수 있으며, 오타나 오기재로 인한 피해는 별도로 보상되지 않으니 유의해주세요!', default);

-- actor
insert into actor values(null, '정택운', '가수', '183 cm ,63 kg', '젤리피쉬엔터테인먼트㈜', '빅스', '정택운.gif');

-- casting
insert into casting values(null, 1, 5, '부치하난&누리');

