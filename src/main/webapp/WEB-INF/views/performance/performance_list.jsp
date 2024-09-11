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

              // // sort_options_number 선택이 변경되면 search() 호출 => 정렬(몇개씩 볼건지 )
              // $("#sort_options_number").change(function () {
              // 	search();
              // });

              // // sort_options 선택이 변경되면 search() 호출 => 정렬(최신순, ㄱㄴㄷ순..)
              // $("#sort_options").change(function () {
              // 	search();
              // });
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

          <script>
            // function filtering(performance_detail_cate_idx) {
            // 	// let performance_detail_cate_idx = $('#performance_detail_cate_idx').val() // performance_detail_cate_idx : <ul> id

            // 	//"location.href='category.do?performance_detail_cate_idx=${vo.performance_detail_cate_idx}'"
            // 	$.ajax({
            // 		url: "category.do",		// controller
            // 		data: { "performance_detail_cate_idx": performance_detail_cate_idx },	//paramter 전달  category.do?performance_detail_cate_idx="all"
            // 		// dataType: "json",
            // 		success: function (res_data) {

            // 			$("#disp").html(res_data);

            // 		},
            // 		error: function (err) {
            // 			alert(err.responseText);
            // 		}
            // 	});
            // }// end : filtering()

            // hall_idx를 통해 공연장 장소(hall_area) 사용
            // function filtering_area(hall_idx) {

            // 	let performance_detail_cate_idx = $('#performance_detail_cate_idx').val()

            // 	$.ajax({
            // 		url: "category_area.do",	// controller
            // 		data: {
            // 			"hall_idx": hall_idx,
            // 			"performance_detail_cate_idx": performance_detail_cate_idx
            // 		},				// 전달 할 parameter category_area.do?hall_idx=1
            // 		success: function (res_data) {
            // 			$("#disp").html(res_data);
            // 		},
            // 		error: function (err) {
            // 			alert(err.responseText);
            // 		}
            // 	});

            // }
          </script>

          <!-- 공연 추가 버튼 / 공연 가격 버튼 -->
          <script>
            function insert_form() {

              location.href = "insert_form.do"; // 공연 추가 폼으로 이동

            }

            function insert_form_price() {
              location.href = "insert_form_price.do";
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
                    <input type="radio" name="performance_detail_cate_idx" value="0" checked />전체
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
                    <input type="radio" name="hall_area" value="제주" />제주

                    <!-- <ul id="performance_detail_cate_idx">
											<li style="margin-left: 20px; font-weight: bold !important;" value=0>
												<a onclick="filtering(0);">장르 전체</a>
											</li>

											<li value=1>
												<a onclick="filtering(1);">
													로맨틱코미디
												</a>
											</li>

											<li value=2><a onclick="filtering(2);">드라마</a></li>
											<li value=3><a onclick="filtering(3);">코믹</a></li>
											<li value=4><a onclick="filtering(4);">공포/스릴러</a></li>
											<li value=5><a onclick="filtering(5);">퍼포먼스</a></li>
											<li value=6><a onclick="filtering(6);">어린이</a></li>
											<li value=7><a onclick="filtering(7);">기타</a></li>
										</ul> -->
                  </div>

                  <!-- <div class="bread-inner">
										<ul id="hall_idx">
											<li style="margin-left: 20px;"><a onclick="filtering_area(0);">지역 전체</a>
											</li>
											<li><a onclick="filtering_area(1);">서울</a></li>
											<li><a onclick="filtering_area(2);">경기/인천</a></li>
											<li><a onclick="filtering_area(3);">충청/대전</a></li>
											<li><a onclick="filtering_area(4);">경상/대구/부산</a></li>
											<li><a onclick="filtering_area(5);">전라/광주</a></li>
											<li><a onclick="filtering_area(6);">강원</a></li>
											<li><a onclick="filtering_area(7);">제주</a></li>
										</ul>
									</div> -->
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
                              <option selected="selected" value="s_abc">
                                가나다순
                              </option>
                              <option value="s_new">최신순</option>
                              <option value="s_best">인기순</option>
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
                          <input type="button" class="btn admin_btn" value="공연 가격 추가" onclick="insert_form_price();" />
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