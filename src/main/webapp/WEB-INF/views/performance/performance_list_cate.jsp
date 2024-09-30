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
                // LocalStorage에서 값 가져오기
                const saved_performance_detail_cate_idx = localStorage.getItem("performance_detail_cate_idx");
                const saved_hall_area = localStorage.getItem("hall_area");
                const saved_sort_options = localStorage.getItem("sort_options");
                const saved_sort_options_number = localStorage.getItem("sort_options_number") || 9; // 기본값 9 설정
                const saved_performance_cate_idx = localStorage.getItem("performance_cate_idx");
            
                // 가져온 값으로 필터 초기화
                if (saved_performance_detail_cate_idx) {
                    $("input[name='performance_detail_cate_idx'][value='" + saved_performance_detail_cate_idx + "']").prop("checked", true);
                }
                if (saved_hall_area) {
                    $("input[name='hall_area'][value='" + saved_hall_area + "']").prop("checked", true);
                }
                if (saved_sort_options) {
                    $("#sort_options").val(saved_sort_options);
                }
                if (saved_sort_options_number) {
                    $("#sort_options_number").val(saved_sort_options_number);
                }
            
                // 페이지가 로드될 때 바로 화면 출력되도록 search() 호출
                search();
            
                // 이름이 genre, hall_area인 input 태그가 클릭되면 search() 호출
                $("input[name='performance_detail_cate_idx'],input[name='hall_area']").click(function () {
                    search();
                });
            });
            </script>
            
            <script>
            function search() {
                // 체크된 value 값을 변수에 저장
                const performance_detail_cate_idx = $("input[name='performance_detail_cate_idx']:checked").val();
                const hall_area = $("input[name='hall_area']:checked").val();
                const sort_options = $("#sort_options").val(); 
                const sort_options_number = $("#sort_options_number").val();
            
                // JSP에서 직접 가져오는 performance_cate_idx
                const performance_cate_idx = "${param.performance_cate_idx}";
            
                // 필터 데이터를 LocalStorage에 저장
                localStorage.setItem("performance_detail_cate_idx", performance_detail_cate_idx);
                localStorage.setItem("hall_area", hall_area);
                localStorage.setItem("sort_options", sort_options);
                localStorage.setItem("sort_options_number", sort_options_number);
                localStorage.setItem("performance_cate_idx", performance_cate_idx);
            
                // 전송 데이터 확인
                console.log({
                    performance_detail_cate_idx,
                    hall_area,
                    sort_options,
                    sort_options_number,
                    performance_cate_idx // 확인을 위해 추가
                });
            
                $.ajax({
                    url: "cate.do", // controller
                    data: {
                        page: "${empty param.page ? 1 : param.page}",
                        performance_cate_idx: performance_cate_idx, 
                        performance_detail_cate_idx: performance_detail_cate_idx,
                        hall_area: hall_area,
                        sort_options: sort_options,
                        sort_options_number: sort_options_number,
                    },
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

<c:if test="${param.performance_cate_idx == 1}">
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
</c:if>
<c:if test="${param.performance_cate_idx == 2}">
  <div class="radio-group">
      <div class="custom-control custom-radio custom-radio-label">
          <input type="radio" id="all" name="performance_detail_cate_idx" value="0"
                 class="custom-control-input" checked />
          <label class="custom-control-label" for="all">전체</label>
      </div>
      <div class="custom-control custom-radio custom-radio-label">
          <input type="radio" id="romantic_comedy" name="performance_detail_cate_idx" value="7"
                 class="custom-control-input" />
          <label class="custom-control-label" for="romantic_comedy">로맨틱코미디</label>
      </div>
      <div class="custom-control custom-radio custom-radio-label">
          <input type="radio" id="drama" name="performance_detail_cate_idx" value="8"
                 class="custom-control-input" />
          <label class="custom-control-label" for="drama">드라마</label>
      </div>
      <div class="custom-control custom-radio custom-radio-label">
          <input type="radio" id="comic" name="performance_detail_cate_idx" value="9"
                 class="custom-control-input" />
          <label class="custom-control-label" for="comic">코믹</label>
      </div>
      <div class="custom-control custom-radio custom-radio-label">
          <input type="radio" id="thriller" name="performance_detail_cate_idx" value="10"
                 class="custom-control-input" />
          <label class="custom-control-label" for="thriller">공포/스릴러</label>
      </div>
      <div class="custom-control custom-radio custom-radio-label">
          <input type="radio" id="performance" name="performance_detail_cate_idx" value="11"
                 class="custom-control-input" />
          <label class="custom-control-label" for="performance">퍼포먼스</label>
      </div>
      <div class="custom-control custom-radio custom-radio-label">
          <input type="radio" id="kids" name="performance_detail_cate_idx" value="12"
                 class="custom-control-input" />
          <label class="custom-control-label" for="kids">어린이</label>
      </div>
  </div>
</c:if>

<c:if test="${param.performance_cate_idx == 3}">
  <div class="radio-group">
      <div class="custom-control custom-radio custom-radio-label">
          <input type="radio" id="all" name="performance_detail_cate_idx" value="0"
                 class="custom-control-input" checked />
          <label class="custom-control-label" for="all">전체</label>
      </div>
      <div class="custom-control custom-radio custom-radio-label">
          <input type="radio" id="ballad" name="performance_detail_cate_idx" value="13"
                 class="custom-control-input" />
          <label class="custom-control-label" for="ballad">발라드</label>
      </div>
      <div class="custom-control custom-radio custom-radio-label">
          <input type="radio" id="rock" name="performance_detail_cate_idx" value="14"
                 class="custom-control-input" />
          <label class="custom-control-label" for="rock">락</label>
      </div>
      <div class="custom-control custom-radio custom-radio-label">
          <input type="radio" id="hiphop" name="performance_detail_cate_idx" value="15"
                 class="custom-control-input" />
          <label class="custom-control-label" for="hiphop">힙합</label>
      </div>
      <div class="custom-control custom-radio custom-radio-label">
          <input type="radio" id="teuroteu" name="performance_detail_cate_idx" value="16"
                 class="custom-control-input" />
          <label class="custom-control-label" for="teuroteu">트로트</label>
      </div>
  </div>
</c:if>

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
                                <option value="9" ${sort_options_number == 9 ? 'selected' : ''}>9</option>
                                <option value="15" ${sort_options_number == 15 ? 'selected' : ''}>15</option>
                                <option value="21" ${sort_options_number == 21 ? 'selected' : ''}>21</option>
                            </select>
                        </div>
                        
                        <!-- 정렬 기준 -->
                        <!-- <div class="single-shorter">
                            <label>Sort By :</label>
                            <select id="sort_options" onchange="search();">
                                <option value="s_best" ${sort_options == 's_best' ? 'selected' : ''}>인기순</option>
                                <option value="s_abc" ${sort_options == 's_abc' ? 'selected' : ''}>가나다순</option>
                                <option value="s_new" ${sort_options == 's_new' ? 'selected' : ''}>최신순</option>
                            </select>
                        </div> -->

                        <div class="single-shorter"><label style="color: #ff1d38;">*최근 선택값으로 적용되니 원하시는 조건을 선택하세요.</label></div>
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

          <%@ include file="/WEB-INF/views/include/footer.jsp" %> 

        </body>

        </html>