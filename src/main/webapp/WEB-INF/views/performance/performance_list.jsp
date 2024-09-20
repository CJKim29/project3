<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
      <!-- 원화 표시 기능 -->
      <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

        <!DOCTYPE html>
        <html lang="zxx">

        <head>
          <style>
            .mytitle {
              font-weight: bold !important;
              font-size: 25px !important;
            }

            /* 카테고리 선택 상단바 */
            .bread-inner li a {
              color: gray !important;
              /* font-size: 17px !important; */

              margin-left: 25px !important;
            }

            .bread-inner li a:hover {
              color: red !important;
            }

            .bread-inner li a:active,
            .bread-inner li a:focus {
              color: red !important;
            }

            .my_top_bar {
              padding: 0px !important;
              padding-top: 50px !important;
            }

            .admin_btn {
              float: right;
              margin-right: 10px;
            }

            /* 라디오 버튼 스타일 */
            .custom-radio-label {
              margin-right: 20px;
              /* 각 라디오 버튼 사이에 간격 추가 */
              font-size: 16px;
              /* 폰트 크기 조정 */
              color: #333;
              /* 텍스트 색상 */
              padding: 5px 10px;
              /* 동그란 배경을 위해 여백 추가 */
              transition: background-color 0.3s ease;
              /* 배경 변화 애니메이션 */
            }

            .custom-radio input[type="radio"] {
              margin-right: 5px;
              /* 버튼과 텍스트 사이 간격 */
            }

            .radio-group {
              display: flex;
              flex-wrap: wrap;

            }

            .radio-group input {
              margin-right: 5px;
            }

            .custom-control-label:hover {
              color: red;
              cursor: pointer;
              transition: 0.3s all ease-in-out;
            }

            label:checked {
              color: red;
            }

            input[type="radio"]:checked+label {
              color: red;
            }
          </style>

          <script src="../resources/template/js/jquery.min.js"></script>

          <!-- 카테고리 별 조회 -->
          <script>
            $(document).ready(function () {
              // 페이지가 로드될 때 바로 화면 출력되도록 search() 호출
              search();

              // 이름이 genre, hall_area인 input 태그가 클릭되면 search() 호출
              $(
                "input[name='performance_detail_cate_idx'],input[name='hall_area']"
              ).click(function () {
                search();
              });
            });

            function search() {
              // 체크된 value 값을 변수에 저장
              const performance_detail_cate_idx = $(
                "input[name='performance_detail_cate_idx']:checked"
              ).val();
              const hall_area = $("input[name='hall_area']:checked").val();

              const sort_options = $("#sort_options").val(); // sort_options 값 가져오기
              const sort_options_number = $("#sort_options_number").val(); // sort_options 값 가져오기

              //alert(genre + "/" + hall_area);
              // 전송 데이터 확인
              console.log({
                performance_detail_cate_idx,
                hall_area,
                sort_options,
                sort_options_number,
              });

              $.ajax({
                url: "category.do", // controller
                data: {
                  page: "${ empty param.page ? 1 : param.page }",
                  performance_detail_cate_idx: performance_detail_cate_idx,
                  hall_area: hall_area,
                  sort_options: sort_options,
                  sort_options_number: sort_options_number,
                }, //paramter 전달  category.do?performance_detail_cate_idx="all"
                success: function (res_data) {
                  $("#disp").html(res_data);
                },
                error: function (err) {
                  alert(err.responseText);
                },
              });
            }
          </script>

          <!-- 공연 추가 -->
          <script>
            function insert_form() {

              location.href = "insert_form.do"; // 공연 추가 폼으로 이동

            }
          </script>
        </head>

        <body class="js">
          <jsp:include page="/WEB-INF/views/include/header.jsp" />
          <!-- Breadcrumbs -->
          <div class="breadcrumbs">
            <div class="container">
              <div class="row">
                <div class="col-12">
                  <div class="bread-inner">

                    <!-- 공연 종류 라디오 버튼 -->
                    <div class="radio-group">
                      <div class="custom-control custom-radio custom-radio-label">
                        <input type="radio" id="all" name="performance_detail_cate_idx" value="0"
                          class="custom-control-input" checked />
                        <label class="custom-control-label" for="all">전체</label>
                      </div>
                      <div class="custom-control custom-radio custom-radio-label">
                        <input type="radio" id="romantic_comedy" name="performance_detail_cate_idx" value="1"
                          class="custom-control-input" />
                        <label class="custom-control-label" for="romantic_comedy">로맨틱코미디</label>
                      </div>
                      <div class="custom-control custom-radio custom-radio-label">
                        <input type="radio" id="drama" name="performance_detail_cate_idx" value="2"
                          class="custom-control-input" />
                        <label class="custom-control-label" for="drama">드라마</label>
                      </div>
                      <div class="custom-control custom-radio custom-radio-label">
                        <input type="radio" id="comic" name="performance_detail_cate_idx" value="3"
                          class="custom-control-input" />
                        <label class="custom-control-label" for="comic">코믹</label>
                      </div>
                      <div class="custom-control custom-radio custom-radio-label">
                        <input type="radio" id="thriller" name="performance_detail_cate_idx" value="4"
                          class="custom-control-input" />
                        <label class="custom-control-label" for="thriller">공포/스릴러</label>
                      </div>
                      <div class="custom-control custom-radio custom-radio-label">
                        <input type="radio" id="performance" name="performance_detail_cate_idx" value="5"
                          class="custom-control-input" />
                        <label class="custom-control-label" for="performance">퍼포먼스</label>
                      </div>
                      <div class="custom-control custom-radio custom-radio-label">
                        <input type="radio" id="kids" name="performance_detail_cate_idx" value="6"
                          class="custom-control-input" />
                        <label class="custom-control-label" for="kids">어린이</label>
                      </div>
                    </div>

                    <!-- 지역별 라디오 버튼 -->
                    <div class="radio-group">
                      <div class="custom-control custom-radio custom-radio-label">
                        <input type="radio" id="area_all" name="hall_area" value="all" class="custom-control-input"
                          checked />
                        <label class="custom-control-label" for="area_all">전체</label>
                      </div>
                      <div class="custom-control custom-radio custom-radio-label">
                        <input type="radio" id="seoul" name="hall_area" value="서울" class="custom-control-input" />
                        <label class="custom-control-label" for="seoul">서울</label>
                      </div>
                      <div class="custom-control custom-radio custom-radio-label">
                        <input type="radio" id="gyeonggi_incheon" name="hall_area" value="경기/인천"
                          class="custom-control-input" />
                        <label class="custom-control-label" for="gyeonggi_incheon">경기/인천</label>
                      </div>
                      <div class="custom-control custom-radio custom-radio-label">
                        <input type="radio" id="chungcheong_daejeon" name="hall_area" value="충청/대전"
                          class="custom-control-input" />
                        <label class="custom-control-label" for="chungcheong_daejeon">충청/대전</label>
                      </div>
                      <div class="custom-control custom-radio custom-radio-label">
                        <input type="radio" id="gyeongsang_daegu_busan" name="hall_area" value="경상/대구/부산"
                          class="custom-control-input" />
                        <label class="custom-control-label" for="gyeongsang_daegu_busan">경상/대구/부산</label>
                      </div>
                      <div class="custom-control custom-radio custom-radio-label">
                        <input type="radio" id="jeolla_gwangju" name="hall_area" value="전라/광주"
                          class="custom-control-input" />
                        <label class="custom-control-label" for="jeolla_gwangju">전라/광주</label>
                      </div>
                      <div class="custom-control custom-radio custom-radio-label">
                        <input type="radio" id="gangwon" name="hall_area" value="강원" class="custom-control-input" />
                        <label class="custom-control-label" for="gangwon">강원</label>
                      </div>
                      <div class="custom-control custom-radio custom-radio-label">
                        <input type="radio" id="jeju" name="hall_area" value="제주" class="custom-control-input" />
                        <label class="custom-control-label" for="jeju">제주</label>
                      </div>
                    </div>

                    <!-- <input type="radio" name="performance_detail_cate_idx" value="0" checked />전체
                    <input type="radio" name="performance_detail_cate_idx" value="1" />로맨틱코미디
                    <input type="radio" name="performance_detail_cate_idx" value="2" />드라마
                    <input type="radio" name="performance_detail_cate_idx" value="3" />코믹
                    <input type="radio" name="performance_detail_cate_idx" value="4" />공포/스릴러
                    <input type="radio" name="performance_detail_cate_idx" value="5" />퍼포먼스
                    <input type="radio" name="performance_detail_cate_idx" value="6" />어린이

                    <br />
                    <input type="radio" name="hall_area" value="all" checked />전체
                    <input type="radio" name="hall_area" value="서울" />서울
                    <input type="radio" name="hall_area" value="경기/인천" />경기/인천
                    <input type="radio" name="hall_area" value="충청/대전" />충청/대전
                    <input type="radio" name="hall_area" value="경상/대구/부산" />경상/대구/부산
                    <input type="radio" name="hall_area" value="전라/광주" />전라/광주
                    <input type="radio" name="hall_area" value="강원" />강원
                    <input type="radio" name="hall_area" value="제주" />제주 -->
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- End Breadcrumbs -->

          <!-- 정렬 상단바 -->
          <section class="product-area shop-sidebar shop section my_top_bar">
            <div class="container">
              <div class="row">
                <div class="col-xl-12">
                  <div class="row">
                    <div class="col-12">
                      <!-- Shop Top -->
                      <div class="shop-top">
                        <div class="shop-shorter">

                          <!-- 이미지 몇개씩 볼건지 -->
                          <div class="single-shorter">
                            <label>Show :</label>
                            <select id="sort_options_number" onchange="search();">
                              <option value="9" selected="selected">9</option>
                              <option value="15">15</option>
                              <option value="21">21</option>
                            </select>
                          </div>

                          <!-- 정렬 -->
                          <div class="single-shorter">
                            <label>Sort By :</label>
                            <select id="sort_options" onchange="search();">
                              <option value="s_best" selected="selected">인기순</option>
                              <option value="s_abc">
                                가나다순
                              </option>
                              <option value="s_new">최신순</option>
                            </select>
                          </div>
                        </div>

                        <!-- 이미지 정렬 방식 : 그리드 형식 or 리스트 형식 선택-->
                        <!-- <ul class="view-mode">
													<li class="active"><a href="list.do"><i
																class="fa fa-th-large"></i></a>
													</li>
													<li><a href="list.do"><i class="fa fa-th-list"></i></a></li>
												</ul> -->

                        <!-- 관리자 권한 버튼 -->
                        <!-- <input type="button" class="btn admin_btn" value="공연 삭제" onclick="location.href='list.do'" /> -->
                        <!-- <input type="button" class="btn admin_btn" value="공연 수정" onclick="location.href='list.do'" /> -->
                        <c:if test="${ user.mem_grade eq '관리자' }">
                          <input type="button" class="btn admin_btn" value="공연 추가" onclick="insert_form();" />
                        </c:if>

                      </div>
                      <!--/ End Shop Top -->
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </section>

          <!-- 컨텐츠 영역 -->
          <div id="disp"></div>

          <!-- Popper JS -->
          <script src="../resources/template/js/popper.min.js"></script>
          <!-- Bootstrap JS -->
          <script src="../resources/template/js/bootstrap.min.js"></script>
          <!-- Color JS -->
          <script src="../resources/template/js/colors.js"></script>
          <!-- Slicknav JS -->
          <script src="../resources/template/js/slicknav.min.js"></script>
          <!-- Owl Carousel JS -->
          <script src="../resources/template/js/owl-carousel.js"></script>
          <!-- Magnific Popup JS -->
          <script src="../resources/template/js/magnific-popup.js"></script>
          <!-- Fancybox JS -->
          <script src="../resources/template/js/facnybox.min.js"></script>
          <!-- Waypoints JS -->
          <script src="../resources/template/js/waypoints.min.js"></script>
          <!-- Countdown JS -->
          <script src="../resources/template/js/finalcountdown.min.js"></script>
          <!-- Nice Select JS -->
          <script src="../resources/template/js/nicesellect.js"></script>
          <!-- Ytplayer JS -->
          <script src="../resources/template/js/ytplayer.min.js"></script>
          <!-- Flex Slider JS -->
          <script src="../resources/template/js/flex-slider.js"></script>
          <!-- ScrollUp JS -->
          <script src="../resources/template/js/scrollup.js"></script>
          <!-- Onepage Nav JS -->
          <script src="../resources/template/js/onepage-nav.min.js"></script>
          <!-- Easing JS -->
          <script src="../resources/template/js/easing.js"></script>
          <!-- Active JS -->
          <script src="../resources/template/js/active.js"></script>
        </body>

        </html>