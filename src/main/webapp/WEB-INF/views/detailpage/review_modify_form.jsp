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
                    <title>${vo.performance_name} - 후기 수정</title>
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

                    <!-- Color CSS -->
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
                                                        <i class="ti-power-off"></i><a
                                                            href="../member/insert_form.do">회원가입</a>
                                                    </li>
                                                    <li>
                                                        <i class="ti-power-off"></i><a
                                                            href="../member/login_form.do">로그인</a>
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
                                            <a href=""><img src="../resources/template/images/logo_TIMOA1.png"
                                                    alt="logo" /></a>
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
                                        </div>
                                        <div class="col-lg-4 col-12">
                                            <div class="product-des"></div>
                                        </div>
                                    </div>

                                    <div class="nav-main">
                                        <ul class="nav nav-tabs" style="width: 100%;" id="myReview" role="tablist">
                                            <li class="nav-item">
                                                <a class="nav-link active" id="toggleReview"
                                                    href="javascript:void(0);">관람
                                                    후기
                                                    수정</a>
                                            </li>
                                        </ul>
                                    </div>
                                    <br /><br />
                                    <form id="ratingModifyForm" class="review-inner" method="POST"
                                        action="review_modify.do">
                                        <input type="hidden" name="performance_idx" id="performance_idx"
                                            value="${param.performance_idx}">
                                        <input type="hidden" name="review_idx" value="${ reviewVo.review_idx }">
                                        <input type="hidden" name="review_score_point" id="review_score_point"
                                            value="${ reviewVo.review_score_point }">
                                        <div class="ratings">
                                            <label>
                                                <input type="radio" name="review_score_point" value="5"
                                                    class="rating-radio" required>
                                                <span class="star" data-value="5">★★★★★</span>
                                            </label>
                                            <label>
                                                <input type="radio" name="review_score_point" value="4"
                                                    class="rating-radio" required>
                                                <span class="star" data-value="4">★★★★</span>
                                            </label>
                                            <label>
                                                <input type="radio" name="review_score_point" value="3"
                                                    class="rating-radio" required>
                                                <span class="star" data-value="3">★★★</span>
                                            </label>
                                            <label>
                                                <input type="radio" name="review_score_point" value="2"
                                                    class="rating-radio" required>
                                                <span class="star" data-value="2">★★</span>
                                            </label>
                                            <label>
                                                <input type="radio" name="review_score_point" value="1"
                                                    class="rating-radio" required>
                                                <span class="star" data-value="1">★</span>
                                            </label>
                                        </div>
                                        <div class="form">
                                            <div class="row">
                                                <div class="col-lg-6 col-12">
                                                    <div class="form-group">
                                                        <label>제목<span>*</span></label>
                                                        <input type="text" name="review_title" required="required"
                                                            value="${ reviewVo.review_title }">
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 col-12">
                                                    <div class="form-group">
                                                        <label>내용<span>*</span></label>
                                                        <textarea name="review_content"
                                                            rows="6">${ reviewVo.review_content }</textarea>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 col-12">
                                                    <div class="form-group button5" style="text-align: center;">
                                                        <button type="button" class="btn"
                                                            onclick="send(this.form)">수정완료</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                    <script>
                                        document.addEventListener('DOMContentLoaded', function () {
                                            // URL에서 review_score_point 값을 추출합니다.
                                            const urlParams = new URLSearchParams(window.location.search);
                                            const reviewScorePoint = urlParams.get('review_score_point');

                                            if (reviewScorePoint) {
                                                // 모든 라디오 버튼을 가져옵니다.
                                                var radios = document.getElementsByName('review_score_point');

                                                // review_score_point 값에 맞는 라디오 버튼을 체크합니다.
                                                radios.forEach(function (radio) {
                                                    if (radio.value === reviewScorePoint) {
                                                        radio.checked = true;
                                                    }
                                                });
                                            }
                                        });


                                    </script>
                                    <script type="text/javascript">
                                        function send(f) {
                                            let performance_idx = document.getElementById('performance_idx').value;
                                            let review_title = f.review_title.value.trim();
                                            let review_content = f.review_content.value.trim();

                                            // 라디오 버튼 체크 여부 확인
                                            let ratingChecked = false;
                                            let selectedRating = null; // 초기화

                                            let radios = document.getElementsByName('review_score_point');
                                            for (let i = 0; i < radios.length; i++) {
                                                if (radios[i].checked) {
                                                    ratingChecked = true;
                                                    selectedRating = radios[i].value; // 체크된 값 저장
                                                    break;
                                                }
                                            }

                                            if (!ratingChecked) {
                                                alert("평점을 선택하세요.");
                                                return;
                                            }

                                            if (review_title === "") {
                                                alert("제목을 입력하세요.");
                                                f.review_title.value = "";
                                                f.review_title.focus();
                                                return;
                                            }
                                            if (review_content === "") {
                                                alert("내용을 입력하세요.");
                                                f.review_content.value = "";
                                                f.review_content.focus();
                                                return;
                                            }

                                            // 선택된 값을 폼 필드에 설정
                                            document.getElementById('review_score_point').value = selectedRating;

                                            console.log("Review Score Point Field Value:", document.getElementById('review_score_point').value);

                                            f.submit();
                                        }
                                    </script>



                                    <!-- 관람 후기 -->
                                    <c:forEach var="review" items="${list_review}">
                                        <div class="single-rating">
                                            <div class="rating-author">
                                                <img src="../resources/images/${ review.mem_filename }">
                                            </div>
                                            <div class="rating-des">
                                                <div class="ratings">
                                                    <div class="rating-tag"
                                                        style="display: flex; justify-content: space-between; align-items: center; width: 100%;">
                                                        <ul class="rating">
                                                            <c:forEach var="i" begin="1"
                                                                end="${ review.review_score_point }">
                                                                <li><i class="fa fa-star"></i>
                                                                </li>
                                                            </c:forEach>
                                                            <c:forEach var="i" begin="1"
                                                                end="${ 5 - review.review_score_point }">
                                                                <li class="dark"><i class="fa fa-star-o"></i>
                                                                </li>
                                                            </c:forEach>
                                                        </ul>
                                                        <!-- <h6 style="width: 200px;">${review.mem_nickname }</h6> -->
                                                        <h6 style="width: 120px;">
                                                            ${fn:substring(review.mem_nickname,
                                                            0,
                                                            fn:length(review.mem_nickname)
                                                            - 2)}**</h6>
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
                                            </div>
                                        </div>
                                    </c:forEach>
                                    <!--/ End 관람 후기 -->
                                </div>
                            </div>
                        </div>
                        </div>
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

                    <jsp:include page="/WEB-INF/views/include/footer.jsp" />

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