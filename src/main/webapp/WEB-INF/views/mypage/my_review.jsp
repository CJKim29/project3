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

      #pageMenuContainer {
       display: flex;
       justify-content: center;
       align-items: center;
       margin: 0 auto;
       padding: 0;
      }

      .rating-author {
       border-radius: 0% !important;
       height: 80px !important;
      }
     </style>

     <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
     <script src="https://unpkg.com/gijgo@1.9.14/js/gijgo.min.js" type="text/javascript"></script>
     <link href="https://unpkg.com/gijgo@1.9.14/css/gijgo.min.css" rel="stylesheet" type="text/css" />

     <!-- Popper.js (Bootstrap 4의 tooltips, popovers에 필요) -->
     <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>

     <!-- Bootstrap 4 JavaScript -->
     <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


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
        <div class="row">
        </div>
        <!-- Description -->
        <div class="short" style="display: inline-block; margin-top: 5px;">
        </div>
        <!--/ End Description -->
       </div>
       <div class="row">
        <div class="col-12">
         <div class="product-info">
          <div class="nav-main">
          </div>
          <div class="tab-content" id="myTabContent">
           <!-- Reviews Tab -->
           <div class="tab-pane fade show active" id="reviews" role="tabpanel">
            <div class="tab-single review-panel">
             <div class="row">
              <div class="col-12">
               <div class="ratting-main">
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
                <!-- 관람 후기 -->
                <c:forEach var="review" items="${my_review_list}">
                 <p>해당 공연명 : <a
                   href="../detail/detail.do?performance_idx=${review.performance_idx}">${review.performance_name}</a>
                 </p>
                 <div class="single-rating">
                  <div class="rating-author">
                   <a href="../detail/detail.do?performance_idx=${review.performance_idx}"><img
                     src="../resources/images/${ review.performance_image }"></a>
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
                       <c:if test="${ review.mem_idx == user.mem_idx || user.mem_grade eq '관리자' }">
                        <li class="nav-item">
                         <a class="nav-link toggleReviewModify" href="javascript:void(0);"
                          onclick="window.location.href='../detail/review_modify_form.do?performance_idx=${ review.performance_idx }&review_idx=${ review.review_idx }&review_score_point=${ review.review_score_point }'">
                          수정
                         </a>
                        </li>
                        <li class="nav-item">
                         <a class="nav-link" href="javascript:void(0);"
                          onclick="reviewDelete('${review.performance_idx}', '${review.review_idx}', window.location.href)">삭제</a>
                        </li>

                       </c:if>
                       <script>
                        function reviewDelete(performance_idx, review_idx, currentUrl) {
                         if (confirm("정말 삭제하시겠습니까?") == false) return;

                         // 현재 페이지의 referer 값 (이전 페이지)
                         var referer = document.referrer;

                         // 리뷰 삭제 요청 시 referer 값도 전달
                         location.href = "../detail/review_delete.do?performance_idx=" + performance_idx +
                          "&review_idx=" + review_idx +
                          "&returnUrl=" + encodeURIComponent(currentUrl);
                        }
                       </script>

                      </ul>

                     </div>
                     <div class="reg-information" style="text-align: right;">
                      조회&nbsp;${ review.review_readhit }&emsp;${review.review_regdate }
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
                 <!-- Review Form -->
                 <div class="comment-review" id="reviewModifyForm" style="display: none;">
                  <div class="add-review">
                   <h5>「${vo.performance_name}」
                    - 관람 후기 수정
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
                       <button type="button" class="btn" onclick="send(this.form)">수정완료</button>
                      </div>
                     </div>
                    </div>
                   </div>
                  </form>
                 </div>
                 <!--/ End Form -->
                </c:forEach>
                <!--/ End 관람 후기 -->
               </div>
              </div>
             </div>
            </div>
            <!-- Data가 없는 경우 -->
            <c:if test="${ empty requestScope.my_review_list }">
             <div id="empty_msg" style="text-align: center; margin-top: 50px; font-size: 20px;">등록된 나의 후기가 없습니다</div>
            </c:if>
            <!-- Pagination -->
            <c:if test="${rowTotal > 0}">
             <div id="pageMenuContainer">${pageMenu}</div>
            </c:if>
            <!--/ End Pagination -->
           </div>
           <!--/ End Reviews Tab -->
          </div>
         </div>
        </div>
       </div>
      </div>
     </section>
     <!--/ End Shop Single -->
     </div>
     </div>
     </div>

     </div>
     </div>

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