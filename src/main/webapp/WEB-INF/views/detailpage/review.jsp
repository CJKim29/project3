<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <!DOCTYPE html>
    <html lang="zxx">

    <head>
     <!-- Meta Tag -->
     <meta charset="utf-8">
     <meta http-equiv="X-UA-Compatible" content="IE=edge">
     <meta name='copyright' content=''>
     <meta http-equiv="X-UA-Compatible" content="IE=edge">
     <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
     <!-- Title Tag  -->
     <title>${vo.performance_name}</title>
     <link rel="icon" href="../resources/images/TIMOA_icon.png" type="image/png">
     <!-- Favicon -->
     <link rel="icon" type="image/png" href="../resources/template/images/favicon.png">
     <!-- Web Font -->
     <link
      href="https://fonts.googleapis.com/css?family=Poppins:200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap"
      rel="stylesheet">

     <link rel="stylesheet" href="../resources/css/detail/detailpage.css">
     <!-- StyleSheet -->

     <!-- Bootstrap -->
     <link rel="stylesheet" href="../resources/template/css/bootstrap.css">
     <!-- Magnific Popup -->
     <link rel="stylesheet" href="../resources/template/css/magnific-popup.min.css">
     <!-- Font Awesome -->
     <link rel="stylesheet" href="../resources/template/css/font-awesome.css">
     <!-- Fancybox -->
     <link rel="stylesheet" href="../resources/template/css/jquery.fancybox.min.css">
     <!-- Themify Icons -->
     <link rel="stylesheet" href="../resources/template/css/themify-icons.css">
     <!-- Nice Select CSS -->
     <link rel="stylesheet" href="../resources/template/css/niceselect.css">
     <!-- Animate CSS -->
     <link rel="stylesheet" href="../resources/template/css/animate.css">
     <!-- Flex Slider CSS -->
     <link rel="stylesheet" href="../resources/template/css/flex-slider.min.css">
     <!-- Owl Carousel -->
     <link rel="stylesheet" href="../resources/template/css/owl-carousel.css">
     <!-- Slicknav -->
     <link rel="stylesheet" href="../resources/template/css/slicknav.min.css">

     <!-- Eshop StyleSheet -->
     <link rel="stylesheet" href="../resources/template/css/reset.css">
     <link rel="stylesheet" href="../resources/template/css/style.css">
     <link rel="stylesheet" href="../resources/template/css/responsive.css">

     <link rel="stylesheet" href="../resources/template/css/color/color12.css">

     <link rel="stylesheet" href="#" id="colors">

     <style>
      .price a {
       font-weight: bold;
       color: #333333;
      }

      .price a:hover {
       text-decoration: none;
       color: #333333;
      }

      .material-symbols-outlined {
       font-variation-settings:
        'FILL' 100,
        'wght' 400,
        'GRAD' 0,
        'opsz' 24
      }

      .single-des h4 {
       font-weight: bold !important;
      }

      .single-des p {
       color: black;
       font-size: 15px;
      }

      #actor_pic {
       width: 100%;
       height: 100%;
       object-fit: cover;
      }

      #actor_box {
       width: 105px;
       height: 110px;
       border-radius: 70%;
       overflow: hidden;
       display: inline-block;
      }

      #casting_list {
       display: inline-block;
       margin: 0 36px 40px 0;
       text-align: center;
      }

      #toggleButton {
       width: 880px;
       height: 60px;
       background-color: #f4f6f9;
       color: #666;
       font-size: 16px;
       border: 0;
       border-bottom: 1px solid #dfe5ed;
       outline: none;
      }

      #more {
       position: relative;
       top: 2px;
      }

      .collapsed {
       height: 230px;
       overflow: hidden;
      }
     </style>

     <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
     <script src="https://unpkg.com/gijgo@1.9.14/js/gijgo.min.js" type="text/javascript"></script>
     <link href="https://unpkg.com/gijgo@1.9.14/css/gijgo.min.css" rel="stylesheet" type="text/css" />


    </head>

    <body class="js">

     <!-- Preloader -->
     <div class="preloader">
      <div class="preloader-inner">
       <div class="preloader-icon">
        <span></span>
        <span></span>
       </div>
      </div>
     </div>
     <!-- End Preloader -->


     <!-- Shop Single -->
     <section class="shop single section" style="padding: 0px 0 100px !important;">
      <input type="hidden" name="performance_idx" value="${ vo.performance_idx }">
      <div class="container">
       <div class="row">
        <div class="col-12">
         <div class="row">
          <div class="col-lg-4 col-12">
          </div>
          <div class="col-lg-4 col-12">
           <div class="product-des">
            <!-- Description -->
            <div class="short" style="display: inline-block; margin-top: 5px;">
            </div>
            <!--/ End Description -->
            <script>
             $(document).ready(function () {
              // '관람 후기' 작성 버튼 클릭 시 처리하는 함수
              $('#toggleReview').on('click', function (e) {
               e.preventDefault(); // 링크의 기본 동작 방지

               // 로그인 여부 체크
               if ("${empty user}" === "true") {
                // 로그인이 안된 경우
                if (confirm("관람 후기는 로그인 후 작성 가능합니다. \n 로그인 하시겠습니까?") === true) {
                 // 로그인을 하겠다고 선택한 경우 로그인 페이지로 이동
                 location.href = "../member/login_form.do";
                } else {
                 // 로그인을 하지 않겠다고 선택한 경우 아무 일도 일어나지 않음
                 return;
                }
               } else {
                // 로그인된 경우에만 후기 작성 여부 체크
                var mem_idx = "${user.mem_idx}"; // 로그인한 사용자의 mem_idx
                var performance_idx = "${param.performance_idx}"; // 공연 번호

                if (!performance_idx) {
                 console.error("Performance Index is missing.");
                 return;
                }

                console.log("Requesting review check with mem_idx: " + mem_idx + " and performance_idx: " + performance_idx);

                fetch(`/detail/review_check.do?mem_idx=${mem_idx}&performance_idx=${param.performance_idx}`)
                 .then(response => {
                  if (!response.ok) {
                   throw new Error("Network response was not ok.");
                  }
                  return response.json();
                 })
                 .then(hasReviewed => {
                  console.log("hasReviewed response: ", hasReviewed);
                  if (hasReviewed) {
                   alert("이미 후기를 작성한 사용자입니다.");
                  } else {
                   // 후기 작성이 가능한 경우에만 토글 처리
                   toggleReviewForm();
                  }
                 })
                 .catch(error => {
                  console.error("후기 작성 여부 확인 중 오류 발생:", error);
                 });
               }
              });

              // '총 리뷰' 링크 클릭 시
              $('#totalReviewLink').on('click', function (e) {
               e.preventDefault(); // 링크의 기본 동작 방지

               // 로그인된 경우에만 관람 후기 탭 활성화
               if ("${empty user}" !== "true") {
                activateReviewTab();
               } else {
                alert("로그인 후 리뷰를 작성하실 수 있습니다.");
               }
              });

              // 후기 작성 폼 토글 함수
              function toggleReviewForm() {
               var reviewForm = document.getElementById("reviewForm");
               if (reviewForm.style.display === "none") {
                reviewForm.style.display = "block";
               } else {
                reviewForm.style.display = "none";
               }
              }

              // '관람 후기' 탭을 활성화하고 표시하는 함수
              function activateReviewTab() {
               // 탭 메뉴의 '관람 후기'를 활성화
               $('#toggleReview').removeClass('active'); // '관람 후기 작성' 버튼 비활성화
               $('a[href="#reviews"]').tab('show'); // '관람 후기' 탭 활성화
              }
             });
            </script>
           </div>
          </div>
         </div>
         <div class="row">
          <div class="col-12">
           <div class="product-info">
            <div class="nav-main">
            </div>
            <div class="tab-content" id="myTabContent">
             <!-- Description Tab -->
             <div class="tab-pane fade" id="description" role="tabpanel">
              <div class="tab-single">
               <div class="row">
                <div class="col-12">
                 <div class="single-des" style="width: 880px;">
                  <div id="moreText" class="collapsed">
                   <h4>캐스팅</h4>
                   <c:forEach var="castingVo" items="${ list }">
                    <div id="casting_list">
                     <div id="actor_box">
                      <a href="#">
                       <img id="actor_pic" src="../resources/images/${castingVo.actorVo.actor_pic}">
                      </a>
                     </div>
                     <h6>${castingVo.casting_name}</h6>
                     <p style="color: #666666;">
                      ${castingVo.actorVo.actor_name}
                     </p>
                    </div>
                   </c:forEach>
                  </div>
                  <button onclick="toggleText()" id="toggleButton">더보기
                   <i id="more" class="fi fi-rs-angle-small-down"></i>
                  </button>
                 </div><br>

                 <c:if test="${vo.performance_detail_info != null}">
                  <div class="single-des">
                   <h4>공연시간 정보</h4>
                   <p>${vo.performance_detail_info}</p>
                  </div><br>
                 </c:if>
                 <c:if test="${vo.performance_al != null}">
                  <div class="single-des">
                   <h4>공지사항</h4>
                   <p>${vo.performance_al}</p>
                  </div><br>
                 </c:if>
                 <c:if test="${vo.performance_detail_image != null}">
                  <div class="single-des">
                   <h4>공연상세 / 캐스팅일정</h4>
                   <img src="../resources/images/${vo.performance_detail_image}">
                  </div>
                 </c:if>
                </div>
               </div>
              </div>
             </div>
             <!--/ End Description Tab -->
             <!-- Reviews Tab -->
             <div class="tab-pane fade show active" id="reviews" role="tabpanel">
              <div class="tab-single review-panel">
               <div class="row">
                <div class="col-12">
                 <div class="ratting-main">
                  <div class="avg-ratting" style="display: flex; justify-content: space-between; align-items: center;">
                   <h6 style="width: 500px;"><span>&emsp;관람
                     후기(${fn:length(list_review)})&emsp;</span>
                    <fmt:formatNumber value="${ avgScore }" type="number" maxFractionDigits="2" />/5
                   </h6>
                   <!-- <input id="search_text" class="form-control" value="${param.search_text}" style="
                  height: 40px;
                  margin-right: 5px;
                  font-size: 16px;
                  width: 200px;
                " /> -->
                   <!-- <input id="search_btn" type="button" class="btn" value="검색1" onclick="search();"
                    style="height: 40px; margin-right: 5px" /> -->
                   <!-- <input id="search_btn" type="button" class="btn" value="검색2" onclick="find();"
                    style="height: 40px; margin-right: 5px" /> -->
                   <a href="#" onclick="review_list('${param.performance_idx}',1);">최신글순&emsp;</a>
                   <a href="#" onclick="review_old_list('${param.performance_idx}',1);">오래된글순&emsp;</a>
                   <a href="#" onclick="review_star_list('${param.performance_idx}',1);">별점높은순&emsp;</a>
                   <a href="#" onclick="review_low_star_list('${param.performance_idx}',1);">별점낮은순&emsp;</a>
                   <a href="#" onclick="review_readhit_list('${param.performance_idx}',1);">조회순&emsp;</a>
                   <div class="nav-main">
                    <ul class="nav nav-tabs" style="width: 100%;" id="myReview" role="tablist">
                     <li class="nav-item">
                      <a class="nav-link active" id="toggleReview" href="javascript:void(0);">관람
                       후기
                       작성</a>
                     </li>
                    </ul>
                   </div>
                  </div>
                  <!-- Review Form -->
                  <div class="comment-review" id="reviewForm" style="display: none;">
                   <div class="add-review">
                    <h5>「${vo.performance_name}」 - 관람 후기 작성
                    </h5>
                   </div>
                   <h4>평점</h4>
                   <form id="ratingForm" class="review-inner" method="POST" action="review_insert.do">
                    <input type="hidden" name="performance_idx" id="performance_idx" value="${param.performance_idx}">
                    <div class="ratings">
                     <label>
                      <input type="radio" name="review_score_point" value="5" class="rating-radio" required>
                      <span class="star" data-value="5">★★★★★</span>
                     </label>
                     <label>
                      <input type="radio" name="review_score_point" value="4" class="rating-radio" required>
                      <span class="star" data-value="4">★★★★</span>
                     </label>
                     <label>
                      <input type="radio" name="review_score_point" value="3" class="rating-radio" required>
                      <span class="star" data-value="3">★★★</span>
                     </label>
                     <label>
                      <input type="radio" name="review_score_point" value="2" class="rating-radio" required>
                      <span class="star" data-value="2">★★</span>
                     </label>
                     <label>
                      <input type="radio" name="review_score_point" value="1" class="rating-radio" required>
                      <span class="star" data-value="1">★</span>
                     </label>
                    </div>
                    <!-- Form -->
                    <div class="form">
                     <div class="row">
                      <div class="col-lg-6 col-12">
                       <div class="form-group">
                        <label>제목<span>*</span></label>
                        <input type="text" name="review_title" required="required" placeholder="">
                       </div>
                      </div>
                      <div class="col-lg-12 col-12">
                       <div class="form-group">
                        <label>내용<span>*</span></label>
                        <textarea name="review_content" rows="6" placeholder=""></textarea>
                       </div>
                      </div>
                      <div class="col-lg-12 col-12">
                       <div class="form-group button5" style="text-align: center;">
                        <button type="button" class="btn" onclick="send(this.form)">작성완료</button>
                       </div>
                      </div>
                     </div>
                    </div>
                   </form>
                  </div>
                  <!--/ End Form -->
                  <!-- 후기 등록 -->
                  <script type="text/javascript">
                   function send(f) {
                    let performance_idx = document.getElementById('performance_idx').value;

                    let review_title = f.review_title.value.trim();
                    let review_content = f.review_content.value.trim();

                    // 라디오 버튼 체크 여부 확인
                    let ratingChecked = false;
                    let radios = document.getElementsByName('review_score_point');

                    for (let i = 0; i < radios.length; i++) {
                     if (radios[i].checked) {
                      ratingChecked = true;
                      break;
                     }
                    }

                    if (!ratingChecked) {
                     alert("평점을 선택하세요.");
                     return;
                    }


                    if (review_title == "") {
                     alert("제목을 입력하세요.");
                     f.review_title.value = "";
                     f.review_title.focus();
                     return;
                    }
                    if (review_content == "") {
                     alert("내용을 입력하세요.");
                     f.review_content.value = "";
                     f.review_content.focus();
                     return;
                    }

                    f.submit();
                   }
                  </script>
                  <!-- 관람 후기 -->
                  <c:forEach var="review" items="${review_row_list}">
                   <div class="single-rating">
                    <div class="rating-author">
                     <img src="../resources/images/${ review.mem_filename }">
                    </div>
                    <div class="rating-des">
                     <div class="ratings">
                      <div class="rating-tag"
                       style="display: flex; justify-content: space-between; align-items: center; width: 100%;">
                       <ul class="rating">
                        <c:forEach var="i" begin="1" end="${ review.review_score_point }">
                         <li><i class="fa fa-star"></i>
                         </li>
                        </c:forEach>
                        <c:forEach var="i" begin="1" end="${ 5 - review.review_score_point }">
                         <li class="dark"><i class="fa fa-star-o"></i>
                         </li>
                        </c:forEach>
                       </ul>
                       <!-- <h6 style="width: 200px;">${review.mem_nickname }</h6> -->
                       <h6 style="width: 120px;">
                        &emsp;${fn:substring(review.mem_nickname, 0, fn:length(review.mem_nickname) - 2)}**</h6>
                       <div class="nav-main">
                        <ul class="nav nav-tabs" style="width: 100%;" id="myReviewInside" role="tablist">
                         <li class="nav-item">
                          <a class="nav-link toggleReviewModify" href="javascript:void(0);">수정</a>
                         </li>
                         <li class="nav-item">
                          <a class="nav-link" id="toggleReviewDelete" href="javascript:void(0);">삭제</a>
                         </li>
                         <c:if test="${ review.mem_idx == user.mem_idx || user.mem_grade eq '관리자' }">
                          <button type="button"
                           onclick="window.location.href='review_modify_form.do?performance_idx=${ param.performance_idx }&review_idx=${ review.review_idx }&review_score_point=${ review.review_score_point }'">수정</button>
                          <button type="button"
                           onclick="reviewDelete('${ param.performance_idx }', '${ review.review_idx }')">삭제</button>
                         </c:if>
                         <script>
                          function reviewDelete(performance_idx, review_idx) {

                           if (confirm("정말 삭제하시겠습니까?") == false) return;

                           location.href = "review_delete.do?performance_idx=" + performance_idx + "&review_idx=" + review_idx;
                          }
                         </script>
                        </ul>
                        <!-- Review Form -->
                        <div class="comment-review" id="reviewModifyForm" style="display: none;">
                         <div class="add-review">
                          <h5>「${vo.performance_name}」
                           - 관람 후기 수정
                          </h5>
                         </div>
                         <h4>평점</h4>
                         <form id="ratingForm" class="review-inner" method="POST" action="review_insert.do">
                          <input type="hidden" name="performance_idx" id="performance_idx"
                           value="${param.performance_idx}">
                          <div class="ratings">
                           <label>
                            <input type="radio" name="review_score_point" value="5" class="rating-radio" required>
                            <span class="star" data-value="5">★★★★★</span>
                           </label>
                           <label>
                            <input type="radio" name="review_score_point" value="4" class="rating-radio" required>
                            <span class="star" data-value="4">★★★★</span>
                           </label>
                           <label>
                            <input type="radio" name="review_score_point" value="3" class="rating-radio" required>
                            <span class="star" data-value="3">★★★</span>
                           </label>
                           <label>
                            <input type="radio" name="review_score_point" value="2" class="rating-radio" required>
                            <span class="star" data-value="2">★★</span>
                           </label>
                           <label>
                            <input type="radio" name="review_score_point" value="1" class="rating-radio" required>
                            <span class="star" data-value="1">★</span>
                           </label>
                          </div>
                          <!-- Form -->
                          <div class="form">
                           <div class="row">
                            <div class="col-lg-6 col-12">
                             <div class="form-group">
                              <label>제목<span>*</span></label>
                              <input type="text" name="review_title" required="required" placeholder="">
                             </div>
                            </div>
                            <div class="col-lg-12 col-12">
                             <div class="form-group">
                              <label>내용<span>*</span></label>
                              <textarea name="review_content" rows="6" placeholder=""></textarea>
                             </div>
                            </div>
                            <div class="col-lg-12 col-12">
                             <div class="form-group button5" style="text-align: center;">
                              <button type="button" class="btn" onclick="send(this.form)">수정완료</button>
                             </div>
                            </div>
                           </div>
                          </div>
                         </form>
                        </div>
                        <!--/ End Form -->
                       </div>

                       <!-- 리뷰 수정 토글 -->
                       <script>
                        // 수정 버튼 클릭 이벤트
                        document.addEventListener("DOMContentLoaded", function () {
                         var modifyButtons = document.querySelectorAll(".toggleReviewModify");

                         modifyButtons.forEach(function (button) {
                          button.addEventListener("click", function () {
                           // 해당 버튼이 속한 리뷰 폼을 찾아서 표시/숨기기
                           var reviewForm = button.closest(".single-rating").querySelector("#reviewModifyForm");
                           if (reviewForm.style.display === "none" || reviewForm.style.display === "") {
                            reviewForm.style.display = "block";
                           } else {
                            reviewForm.style.display = "none";
                           }
                          });
                         });
                        });
                       </script>


                       <div class="reg-information" style="text-align: right;">
                        조회&nbsp;${
                        review.review_readhit
                        }&emsp;${
                        review.review_regdate
                        }
                       </div>
                      </div>
                     </div>
                     <div class="review-container">
                      <div class="review-list">
                       <h6 class="toggle-btn review_title"
                        onclick="toggleContent('review-${review.review_idx}', '${review.review_idx}')">
                        ${review.review_title}
                       </h6>

                       <p id="review-${review.review_idx}" class="review_content">
                        ${review.review_content}
                       </p>
                      </div>
                     </div>

                     <script type="text/javascript">
                      function toggleContent(id, review_idx) {
                       var content = document.getElementById(id);
                       if (content.classList.contains('show')) {
                        content.classList.remove('show');
                       } else {
                        content.classList.add('show');
                        console.log("Review ID in JS:", review_idx); // 여기서 review_idx 확인
                        // 로그인 상태 체크 후 조회수 증가 요청
                        var xhr = new XMLHttpRequest();
                        xhr.open('POST', '/detail/updateReadhit', true);
                        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                        xhr.onreadystatechange = function () {
                         if (xhr.readyState === 4 && xhr.status === 200) {
                          console.log("Response received:", xhr.responseText); // 응답 확인
                         }
                        };
                        xhr.send('review_idx=' + review_idx);
                       }
                      }
                     </script>

                    </div>
                   </div>
                  </c:forEach>
                  <!--/ End 관람 후기 -->
                 </div>
                </div>
               </div>
              </div>

              <!-- Pagination -->
              <div style="text-align: center !important; margin: auto;">${ pageMenu }</div>
              <!--/ End Pagination -->
             </div>
             <!--/ End Reviews Tab -->
            </div>
           </div>
          </div>
         </div>
        </div>
       </div>
      </div>
     </section>
     <!--/ End Shop Single -->



     <!-- Jquery -->
     <script src="../resources/template/js/jquery.min.js"></script>
     <script src="../resources/template/js/jquery-migrate-3.0.0.js"></script>
     <script src="../resources/template/js/jquery-ui.min.js"></script>
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