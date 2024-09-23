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
     <!-- <link rel="stylesheet" href="../resources/template/css/jquery.fancybox.min.css"> -->
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
     <!-- <script src="../resources/template/js/ytplayer.min.js"></script> -->
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



     <!-- Color CSS -->
     <!-- <link rel="stylesheet" href="../resources/template/css/color/color1.css"> -->
     <!--<link rel="stylesheet" href="../resources/template/css/color/color2.css">-->
     <!--<link rel="stylesheet" href="../resources/template/css/color/color3.css">-->
     <!--<link rel="stylesheet" href="../resources/template/css/color/color4.css">-->
     <!--<link rel="stylesheet" href="../resources/template/css/color/color5.css">-->
     <!--<link rel="stylesheet" href="../resources/template/css/color/color6.css">-->
     <!--<link rel="stylesheet" href="../resources/template/css/color/color7.css">-->
     <!--<link rel="stylesheet" href="../resources/template/css/color/color8.css">-->
     <!--<link rel="stylesheet" href="../resources/template/css/color/color9.css">-->
     <!--<link rel="stylesheet" href="../resources/template/css/color/color10.css">-->
     <!--<link rel="stylesheet" href="../resources/template/css/color/color11.css">-->
     <link rel="stylesheet" href="../resources/template/css/color/color12.css">

     <link rel="stylesheet" href="#" id="colors">

     <!-- 아이콘css 다희추가 -->
     <link rel='stylesheet'
      href='https://cdn-uicons.flaticon.com/2.5.1/uicons-solid-rounded/css/uicons-solid-rounded.css'>
     <link rel='stylesheet'
      href='https://cdn-uicons.flaticon.com/2.6.0/uicons-regular-straight/css/uicons-regular-straight.css'>

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



     <script>
      function showLoc(performance_idx) {
       $("#myModal").modal({ backdrop: "static" });
       loadMap();
      }

      function handleLikeClick() {

       //로그인 상태 체크
       if ("${ empty user }" == "true") {

        if (confirm("좋아요는 로그인후 이용가능합니다\n로그인 하시겠습니까?") == false) return;
        //                                               현재url주소를 넘긴다
        location.href = "../member/login_form.do?url=" + encodeURIComponent(location.href);
        return;
       }

       location.href = "toggleLike.do?performance_idx=${param.performance_idx}";

      }

      function toggleText() {
       var moreText = document.getElementById("moreText");
       var btnText = document.getElementById("toggleButton");

       if (moreText.classList.contains("collapsed")) {
        moreText.classList.remove("collapsed");
        btnText.innerHTML = '닫기 <i id="more" class="fi fi-rs-angle-small-up"></i>';
       } else {
        moreText.classList.add("collapsed");
        btnText.innerHTML = '더보기 <i id="more" class="fi fi-rs-angle-small-down"></i>';
       }
      }

     </script>

     <script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=nd1wf0zz1p"></script>
     <script type="text/javascript"
      src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=nd1wf0zz1p&submodules=geocoder"></script>

     <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
     <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>

     <script src="https://unpkg.com/gijgo@1.9.14/js/gijgo.min.js" type="text/javascript"></script>
     <link href="https://unpkg.com/gijgo@1.9.14/css/gijgo.min.css" rel="stylesheet" type="text/css" />


     <script>
      var min_date;
      var max_date;
      $(document).ready(function () {
       var performance_idx = "${param.performance_idx}";
       console.log("performance_idx:", performance_idx);  // performance_idx가 올바르게 출력되는지 확인

       // AJAX 요청을 통해 서버에서 공연 날짜 데이터를 가져옴
       $.ajax({
        async: false,
        url: '/detail/getAvailableDates',  // 서버에 날짜 정보를 요청
        type: 'GET',
        data: { performance_idx: performance_idx },
        success: function (response) {
         console.log("서버로부터 날짜 데이터 수신:", response);

         var availableDates = response.availableDates;
         console.log("availableDates:", availableDates); // 여기에 추가

         // 날짜 리스트를 HTML에 출력 (디버깅용)
         var dateListHtml = "<ul>";
         availableDates.forEach(function (date) {
          dateListHtml += "<li>" + date + "</li>";
         });
         dateListHtml += "</ul>";
         $("#dateList").html(dateListHtml);

         // minDate와 maxDate 계산
         min_date = new Date(Math.min(...availableDates.map(date => new Date(date))));
         //min_date = availableDates[0];
         console.log(typeof (min_date));
         console.log(min_date);

         max_date = new Date(Math.max(...availableDates.map(date => new Date(date))));
         //console.log("가장 빠른 날짜 (min_date):", min_date.toISOString().split('T')[0]);
         console.log("가장 빠른 날짜 (min_date):", min_date);
         console.log("가장 늦은 날짜 (max_date):", max_date.toISOString().split('T')[0]);


         reserved_setting();


         // Datepicker 초기화 및 특정 날짜만 활성화
         $my('#datepicker').datepicker({
          beforeShowDay: function (date) {
           var formattedDate = $.datepicker.formatDate('yy-mm-dd', date);
           console.log("formattedDate:", formattedDate); // 여기서 출력
           if ($.inArray(formattedDate, availableDates) !== -1) {
            return [true, "available", ""];
           } else {
            return [false, "unavailable", ""];
           }
          }
         });

        },
        error: function (xhr, status, error) {
         console.error("AJAX 호출 실패:", error);
        }
       });
      });


     </script>

     <script>

      var $my = $.noConflict(true);
      $my(document).ready(function () {

       // page load 시 달력 열기
       $my('#datepicker').each(function () {
        $my(this).datepicker({
         showOnFocus: false // 달력을 클릭할 때만 열리게 하지 않음
        }).open(); // 페이지 로드 시 바로 달력을 열기
       });
      });

      function reserved_setting() {

       console.log(min_date);

       var oneDayBeforeMinDate = new Date(min_date);
       oneDayBeforeMinDate.setDate(min_date.getDate() - 1);

       // datepicker 초기화
       $my('#datepicker').datepicker({
        showOn: "button",
        buttonText: "Select date",
        format: "yyyy-mm-dd",
        minDate: oneDayBeforeMinDate,
        maxDate: max_date
       });

       // 좌석정보 버튼 클릭 시 선택된 날짜를 URL에 추가
       $my('input.reservation1').click(function () {
        var selected_date = $my('#datepicker').val();
        var performance_idx = $my(this).data('performanceIdx');

        if (!selected_date || selected_date.trim() === "") {
         alert('날짜를 선택해주세요.');
         return;
        }

        // 자식 창 열기
        var newWindow = window.open('/book/performance_seat.do?performance_idx=' + performance_idx + '&date=' + selected_date,
         'performance_seat_window',
         'width=800,height=660,location=no,status=no,scrollbars=yes');

        // 자식 창 핸들 저장
        window.performance_seat_window = newWindow;
       });



      }
     </script>
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

     <!-- Eshop Color Plate -->
     <div class="color-plate">
      <a class="color-plate-icon"><i class="ti-paint-bucket"></i></a>
      <h4>Eshop Colors</h4>
      <p>Here is some awesome color's available on Eshop Template.</p>
      <span class="color1"></span>
      <span class="color2"></span>
      <span class="color3"></span>
      <span class="color4"></span>
      <span class="color5"></span>
      <span class="color6"></span>
      <span class="color7"></span>
      <span class="color8"></span>
      <span class="color9"></span>
      <span class="color10"></span>
      <span class="color11"></span>
      <span class="color12"></span>
     </div>
     <!-- /End Color Plate -->

     <!-- Header -->

     <!-- 맨 위의 로그인, 마이페이지 버튼 부분  -->
     <header class="header shop">
      <!-- Topbar -->
      <div class="topbar">
       <div class="container">
        <div class="inner-content">
         <div class="row">
          <div class="col-lg-8 col-md-12 col-12">
           <!-- Top Left -->
           <div class="top-left">
            <ul class="list-main"></ul>
           </div>
           <!--/ End Top Left -->
          </div>
          <!-- Top Right -->
          <div class="right-content">
           <ul class="list-main">
            <!-- 로그인이 안된 경우 -->
            <c:if test="${ empty user }">
             <li>
              <i class="ti-power-off"></i><a href="../member/insert_form.do">회원가입</a>
             </li>
             <li>
              <i class="ti-power-off"></i><a href="../member/login_form.do">로그인</a>
             </li>
            </c:if>
            <!-- 로그인이 된 경우 -->
            <c:if test="${ not empty sessionScope.user }">
             <li>
              <i class="ti-power-off"></i><a href="#">회원정보</a>
             </li>
             <li>
              <b>${ user.mem_nickname }님</b>
              <a href="../member/logout.do">로그아웃</a>
             </li>
            </c:if>
            <li><i class="ti-user"></i> <a href="#">마이페이지</a></li>
           </ul>
          </div>
          <!-- End Top Right -->
         </div>
        </div>
       </div>
      </div>
      <!-- End Topbar -->
      <div class="middle-inner">
       <div class="container">
        <div class="row">
         <div class="col-lg-2 col-md-2 col-12">
          <!-- Logo  -->
          <div class="logo">
           <a href=""><img src="../resources/template/images/logo_TIMOA1.png" alt="logo" /></a>
          </div>
          <!--/ End Logo -->
          <div class="search-top">
           <div class="top-search">
            <a href="#0"><i class="ti-search"></i></a>
           </div>
           <!-- Search Form -->
           <div class="search-top">
            <form class="search-form">
             <input type="text" placeholder="Search here..." name="search" />
             <button value="search" type="submit">
              <i class="ti-search"></i>
             </button>
            </form>
           </div>
           <!--/ End Search Form -->
          </div>
          <!--  검색창 카테고리  -->
          <div class="mobile-nav"></div>
         </div>
         <div class="col-lg-8 col-md-7 col-12">
          <div class="search-bar-top">
           <div class="search-bar">
            <select>
             <option selected="selected">카테고리</option>
             <option>뮤지컬</option>
             <option>콘서트</option>
             <option>연극</option>
            </select>
            <!-- search 검색 -->
            <form>
             <input name="search" placeholder="찾으실 공연을 입력해주세요" type="search" />
             <button class="btnn"><i class="ti-search"></i></button>
            </form>
           </div>
          </div>
         </div>
         <div class="col-lg-2 col-md-3 col-12">
          <div class="right-bar">
           <!-- Search Form -->
           <!-- 장바구니 버튼 부분 -->
           <div class="sinlge-bar shopping">
            <a href="cart.html" class="single-icon"><i class="ti-bag"></i></a>
            <!-- Shopping Item -->
            <!-- 장바구니 부분 상세 삭제함 -->
           </div>
          </div>
         </div>
        </div>
       </div>
      </div>
      <!-- Header2 부분 검색창 바로 밑 -->
      <!-- 메인 카테고리 부분 -->
      <div class="header-inner">
       <div class="container">
        <div class="cat-nav-head">
         <div class="row">
          <div class="col-12">
           <div class="menu-area">
            <!-- Main Menu -->
            <nav class="navbar navbar-expand-lg">
             <div class="navbar-collapse">
              <div class="nav-inner">
               <ul class="nav main-menu menu navbar-nav">
                <li class="active"><a href="../main/list.do">Home</a>
                </li>
                <li><a href="../performance/list.do">뮤지컬</a>
                </li>
                <li><a href="">콘서트(보류)</a></li>
                <li><a href="">연극(보류)</a></li>
                <li>
                 <a href="">고객센터<i class="ti-angle-down"></i></a>
                 <ul class="dropdown">
                  <li><a href="board-List.html">공지사항</a></li>
                  <li><a href="../faq/list.do">FAQ</a></li>
                  <li>
                   <a href="../board/list.do">게시판 리스트</a>
                  </li>
                  <li><a href="board-main.html">게시판 상세</a></li>
                 </ul>
                </li>
               </ul>
              </div>
             </div>
            </nav>
            <!--/ End Main Menu -->
           </div>
          </div>
         </div>
        </div>
       </div>
      </div>
      <!--/ End Header Inner -->
     </header>
     <!--/ End Header -->

     <!-- Shop Single -->
     <section class="shop single section">
      <input type="hidden" name="performance_idx" value="${ vo.performance_idx }">
      <div class="container">
       <div class="row">
        <div class="col-12">
         <div class="row">
          <div class="col-lg-4 col-12">
           <!-- Product Slider -->
           <div class="product-gallery">
            <!-- Images slider -->
            <div style="width: 300px; height: 435px;">
             <img style="height: 433px;" class="hall_img" src="../resources/images/${ vo.performance_image }">
            </div>
            <!-- End Images slider -->
           </div>
           <!-- End Product slider -->
          </div>
          <div class="col-lg-4 col-12">
           <div class="product-des">
            <!-- Description -->
            <div class="short" style="display: inline-block; margin-top: 5px;">
             <h4>${vo.performance_name}</h4>
             <div class="rating-main">
              <ul class="rating">
               <c:forEach var="i" begin="1" end="5">
                <c:choose>
                 <c:when test="${ avgScore >= i }">
                  <li><i class="fa fa-star"></i></li>
                 </c:when>
                 <c:when test="${ avgScore >= i - 0.5 && avgScore < i }">
                  <li><i class="fa fa-star-half-o"></i></li>
                 </c:when>
                 <c:otherwise>
                  <li class="dark"><i class="fa fa-star-o" style="color: rgb(255,29,56) !important;"></i>
                  </li>
                 </c:otherwise>
                </c:choose>
               </c:forEach>
              </ul>
              <a href="#" class="total-review" id="totalReviewLink">관람
               후기(${fn:length(list_review)})</a>
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
             <p class="price"><span class="discount">장소</span> <a href="#"
               onclick="showLoc(`${vo.performance_idx}`)">${vo.hallVo.hall_name}<i class="fi fi-sr-caret-right"></i></a>
             </p>
             <p class="price"><span class="discount">공연기간</span>${fn:substringBefore(vo.performance_startday,
              ' ')}~${fn:substringBefore(vo.performance_endday, ' ')}
             </p>
             <p class="price"><span class="discount">공연시간</span>${vo.performance_runtime}분</p>
             <p class="price"><span class="discount">관람연령</span>${vo.performance_age}세 이상
              관람가능
             </p>
             <p class="price" style="display: grid; grid-template-columns: 18% 84%;">
              <span class="discount">가격</span>
              <c:forEach var="seat" items="${vo.seatList}">
               ${seat.seat_grade}석 : ${seat.seat_price}원<br>
              </c:forEach>
             </p>
            </div>
            <!--/ End Description -->
            <!-- Color -->
            <!-- <div class="color">
										<h4>Available Options <span>Color</span></h4>
										<ul>
											<li><a href="#" class="one"><i class="ti-check"></i></a></li>
											<li><a href="#" class="two"><i class="ti-check"></i></a></li>
											<li><a href="#" class="three"><i class="ti-check"></i></a></li>
											<li><a href="#" class="four"><i class="ti-check"></i></a></li>
										</ul>
									</div> -->
            <!--/ End Color -->
            <!-- Product Buy -->
            <div class="product-buy">
             <div class="add-to-cart">
              <input class="reservation1 btn btn-success" type="button" value="예매하기"
               data-performance-idx="${ vo.performance_idx }">
              <c:choose>
               <c:when test="${isLiked}">
                <button type="button" id="love" class="btn min" style="background-color: #ff1d38;"
                 onclick="handleLikeClick();">
                 <i class="ti-heart"></i> &nbsp;
                 <span>${ likeCount }</span>
                </button>
               </c:when>
               <c:otherwise>
                <button type="button" id="love" class="btn min" onclick="handleLikeClick();">
                 <i class="ti-heart"></i> &nbsp;
                 <span>${ likeCount }</span>
                </button>
               </c:otherwise>
              </c:choose>
              <!-- <i class="ti-heart"></i> -->
             </div>
            </div>
            <!--/ End Product Buy -->
           </div>
          </div>
          <div class="col-lg-2 col-12" style="margin-top: 23px;">
           <input id="datepicker" width="200" />
           <div id="dateList"></div> <!-- 날짜 리스트를 표시할 요소 추가 -->
          </div>






         </div>
         <div class="row">
          <div class="col-12">
           <div class="product-info">
            <div class="nav-main">
             <!-- Tab Nav -->
             <ul class="nav nav-tabs" id="myTab" role="tablist">
              <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#description" role="tab">공연정보</a>
              </li>
              <li class="nav-item">
               <a class="nav-link" id="reviews-tab" data-toggle="tab" href="#reviews" role="tab">관람 후기</a>
              </li>
              <button type="button"
               onclick="location.href='review_list.do?performance_idx=${param.performance_idx}'">ajax
               테스트</button>
              <input class="btn" type="button" onclick="performance_info();" value="공연정보">
              <input class="btn" type="button" onclick="review_list();" value="후기목록">
              <br /><br>
              <input id="search_text" class="form-control" value="${param.search_text}" style="
                  height: 40px;
                  margin-right: 5px;
                  font-size: 16px;
                  width: 200px;
                " />
              <input id="search_btn" type="button" class="btn" value="검색" onclick="find();"
               style="height: 40px; margin-right: 5px" />
              <a href="#" onclick="review_list();">&emsp;최신순&emsp;</a>
              <a href="#" onclick="review_old_list();">오래된순&emsp;</a>
              <a href="#" onclick="review_star_list();">별점순&emsp;</a>
              <script>
               // performance_info 함수 정의
               function performance_info() {
                // performance_idx를 JSP에서 받아오는 부분
                var performance_idx = "${param.performance_idx}";

                // AJAX 요청
                $.ajax({
                 url: "performance_info.do",  // 요청할 URL
                 type: "GET",                 // HTTP 메소드 (GET, POST)
                 data: {
                  performance_idx: performance_idx // 서버에 전달할 데이터
                 },
                 success: function (response) {
                  // 성공적으로 데이터를 받아왔을 때 처리
                  console.log("AJAX 성공:", response);

                  // 응답 데이터를 특정 div에 출력
                  $("#resultDiv").html(response);

                  // URL 업데이트
                  window.history.pushState({ page: 'performance_info' }, 'Performance Info', 'performance_info.do?performance_idx=' + performance_idx);
                 },
                 error: function (xhr, status, error) {
                  // 에러 발생 시 처리
                  console.error("AJAX 호출 실패:", error);
                 }
                });
               }

              </script>
              <!-- review_list 함수 정의 -->
              <script>
               function review_list(page) {
                var performance_idx = "${param.performance_idx}";
                var nowPage = page || 1;

                $.ajax({
                 url: "review_list.do",
                 type: "GET",
                 data: {
                  performance_idx: performance_idx,
                  page: nowPage
                 },
                 success: function (response) {
                  $("#resultDiv").html(response);
                  window.history.pushState(
                   { page: 'review_list', nowPage: nowPage },
                   'Review List',
                   'review_list.do?performance_idx=' + performance_idx + '&page=' + nowPage
                  );
                 },
                 error: function (xhr, status, error) {
                  console.error("AJAX 호출 실패:", error);
                 }
                });
               }

               $(document).on('click', '.paging-button', function (e) {
                e.preventDefault(); // 기본 링크 동작 방지
                var page = $(this).data('page'); // 클릭한 페이지 번호를 가져옴
                review_list(page); // 해당 페이지로 AJAX 요청
               });
              </script>

              <!-- review_old_list 함수 정의 -->
              <script>
               function review_old_list(page) {
                var performance_idx = "${param.performance_idx}";
                var nowPage = page || 1;

                $.ajax({
                 url: "review_old_list.do",  // 요청할 URL 수정
                 type: "GET",
                 data: {
                  performance_idx: performance_idx,
                  page: nowPage
                 },
                 success: function (response) {
                  $("#resultDiv").html(response);
                  window.history.pushState(
                   { page: 'review_old_list', nowPage: nowPage }, // state에 review_old_list로 이름 설정
                   'Review Old List',
                   'review_old_list.do?performance_idx=' + performance_idx + '&page=' + nowPage  // URL 변경
                  );
                 },
                 error: function (xhr, status, error) {
                  console.error("AJAX 호출 실패:", error);
                 }
                });
               }

               // 기존에 review_list로 호출하던 부분을 review_old_list로 변경
               $(document).on('click', '.paging-button', function (e) {
                e.preventDefault(); // 기본 링크 동작 방지
                var page = $(this).data('page'); // 클릭한 페이지 번호를 가져옴
                review_old_list(page); // 해당 페이지로 AJAX 요청
               });
              </script>

              <!-- review_star_list 함수 정의 -->
              <script>
               function review_star_list(page) {
                var performance_idx = "${param.performance_idx}";
                var nowPage = page || 1;

                $.ajax({
                 url: "review_star_list.do",  // 요청할 URL 수정
                 type: "GET",
                 data: {
                  performance_idx: performance_idx,
                  page: nowPage
                 },
                 success: function (response) {
                  $("#resultDiv").html(response);
                  window.history.pushState(
                   { page: 'review_star_list', nowPage: nowPage }, // state에 review_star_list 이름 설정
                   'Review Star List',
                   'review_star_list.do?performance_idx=' + performance_idx + '&page=' + nowPage  // URL 변경
                  );
                 },
                 error: function (xhr, status, error) {
                  console.error("AJAX 호출 실패:", error);
                 }
                });
               }

               // 기존에 review_list로 호출하던 부분을 review_star_list 변경
               $(document).on('click', '.paging-button', function (e) {
                e.preventDefault(); // 기본 링크 동작 방지
                var page = $(this).data('page'); // 클릭한 페이지 번호를 가져옴
                review_star_list(page); // 해당 페이지로 AJAX 요청
               });
              </script>

              <!-- 결과가 출력될 div -->
              <div id="resultDiv"></div>
             </ul>
             <!--/ End Tab Nav -->
            </div>

           </div>
          </div>
         </div>
        </div>
       </div>
      </div>
     </section>
     <!--/ End Shop Single -->

     <!-- Modal -->
     <div id="myModal" class="modal fade" role="dialog">
      <div class="modal-dialog" style="display: flex; align-items: center; justify-content: center;">

       <!-- Modal content-->
       <div class="modal-content" style="border-radius: 16px; width: 710px; height: 655px;">
        <div class="myModal-header">
         <button type="button" class="close" data-dismiss="modal" style="padding: 0 20px; margin-top: 18px;">X</button>
         <div style="top: 0; left: 0; padding: 0 20px; text-align: left; border-bottom: 1px solid #dde4ec; height: 50px;
				margin-top: 15px;">
          <h4 class="modal-title">공연장 정보</h4>
         </div>
        </div>
        <!-- 본문 -->
        <div class="modal-body" style="padding: 16px 25px 25px;">
         <div style="margin-bottom: 8px; font-weight: bold; font-size: 20px;">
          ${vo.hallVo.hall_name}
         </div>
         <div style="color: #666; font-size: 15px;">전화번호 : ${vo.hallVo.hall_tel}</div>
         <div style="color: #666; font-size: 15px;">주소 : ${vo.hallVo.hall_addr}</div>
         <div style="color: #666; font-size: 15px;"><a href="${vo.hallVo.hall_site}" target="_blank">홈페이지
           : ${vo.hallVo.hall_site}<i class="fi fi-sr-caret-right"
            style="display: inline-block; position: relative; top: 3px;"></i></a>
         </div>
         <div style="margin-top: 23px; border: 1px solid #ccc;">
          <div id="map" style="width:656px; height:339px;"></div>
          <input type="hidden" id="address" value="${vo.hallVo.hall_addr}">

          <script>
           function loadMap() {
            var address = document.getElementById('address').value;

            naver.maps.Service.geocode({
             query: address
            }, function (status, response) {
             if (status !== naver.maps.Service.Status.OK) {
              return alert('지도 위치를 찾을 수 없습니다.');
             }

             var result = response.v2.addresses[0];
             var latitude = result.y;
             var longitude = result.x;

             var mapOptions = {
              center: new naver.maps.LatLng(latitude, longitude),
              zoom: 17
             };

             var map = new naver.maps.Map('map', mapOptions);

             var marker = new naver.maps.Marker({
              position: new naver.maps.LatLng(latitude, longitude),
              map: map
             });
            });
           }

          </script>
         </div>
        </div>
       </div>

      </div>
     </div>


     <jsp:include page="/WEB-INF/views/include/footer.jsp" />



    </body>

    </html>