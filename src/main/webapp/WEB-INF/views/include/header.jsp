<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">
  <head>
    <!-- Meta Tag -->
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="copyright" content="" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <!-- Title Tag  -->
    <title>TIMOA</title>
    <!-- Favicon -->
    <link
      rel="icon"
      type="image/png"
      href="../resources/template/images/favicon.png"
    />
    <!-- Web Font -->
    <link
      href="https://fonts.googleapis.com/css?family=Poppins:200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap"
      rel="stylesheet"
    />

    <!-- StyleSheet -->

    <!-- Bootstrap -->
    <link rel="stylesheet" href="../resources/template/css/bootstrap.css" />
    <!-- Magnific Popup -->
    <link
      rel="stylesheet"
      href="../resources/template/css/magnific-popup.min.css"
    />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../resources/template/css/font-awesome.css" />
    <!-- Fancybox -->
    <link
      rel="stylesheet"
      href="../resources/template/css/jquery.fancybox.min.css"
    />
    <!-- Themify Icons -->
    <link rel="stylesheet" href="../resources/template/css/themify-icons.css" />
    <!-- Nice Select CSS -->
    <link rel="stylesheet" href="../resources/template/css/niceselect.css" />
    <!-- Animate CSS -->
    <link rel="stylesheet" href="../resources/template/css/animate.css" />
    <!-- Flex Slider CSS -->
    <link
      rel="stylesheet"
      href="../resources/template/css/flex-slider.min.css"
    />
    <!-- Owl Carousel -->
    <link rel="stylesheet" href="../resources/template/css/owl-carousel.css" />
    <!-- Slicknav -->
    <link rel="stylesheet" href="../resources/template/css/slicknav.min.css" />

    <!-- Eshop StyleSheet -->
    <link rel="stylesheet" href="../resources/template/css/reset.css" />
    <link rel="stylesheet" href="../resources/template/css/style.css" />
    <link rel="stylesheet" href="../resources/template/css/responsive.css" />

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
    <link rel="stylesheet" href="../resources/template/css/color/color12.css" />

    <link rel="stylesheet" href="#" id="colors" />


  </head>
  <body class="js">


    <!-- Header -->

    <!-- 상단 위의 로그인, 마이페이지 버튼 부분  -->
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
                      <i class="ti-power-off"></i>
                      <a href="../member/insert_form.do">회원가입</a>
                    </li>
                    <li>
                      <i class="ti-power-off"></i
                      ><a href="../member/login_form.do">로그인</a>
                    </li>
                  </c:if>
                  <!-- 로그인이 된 경우 -->
                  <c:if test="${ not empty sessionScope.user }">
                    <li>
                      <b>${ user.mem_nickname }님</b>
                      <a href="../member/logout.do">로그아웃</a>
                    </li>
                    <li><i class="ti-user"></i> <a href="../mypage/mypage.do">마이페이지</a></li>
                  </c:if>
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
                <a href="../main/list.do"
                  ><img
                    src="../resources/template/images/logo_TIMOA1.png"
                    alt="logo"
                /></a>
              </div>
              <!--/ End Logo -->
              <div class="search-top">
                <div class="top-search">
                  <a href=""><i class="ti-search"></i></a>
                </div>
                <!-- Search Form -->
                 <!-- 헤더메인검색창부분 -->
                <div class="search-top">
                  <form class="search-form" action="" method="get">
                    <input
                      type="text"
                      placeholder="여기가 검색부분..."
                      name="search"
                    />
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
                    <option>통합검색</option>
                  </select>
                  <!-- search 검색 -->
                  <form id="searchForm" action="../performance/performance_search.do" method="GET">
                    <input
                      id="searchInput"
                      name="search"
                      placeholder="찾으실 공연을 입력해주세요"
                      type="search"
                      required
                    />
                    <button class="btnn" type="submit"><i class="ti-search"></i></button>
                  </form>
                </div>
              </div>
            </div>
            <div class="col-lg-2 col-md-3 col-12">
              <div class="right-bar">
                <!-- Search Form -->
                <!-- 장바구니 버튼 부분 -->
                 <!-- 마이페이지생성시 마이페이지로 띄도록 이동 -->
                <div class="sinlge-bar shopping">
                  <a href="../main/performance_like.do" class="single-icon"
                    ><i class="ti-bag"></i
                  ></a>
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
                          <li class="active"><a href="../main/list.do">Home</a></li>
                          <li><a href="../performance/list.do">뮤지컬</a></li>
                          <li><a href="../performance/list.do">콘서트</a></li>
                          <li><a href="../performance/list.do">연극</a></li>
                          <li>
                            <a href="../faq/list.do">고객센터<i class="ti-angle-down"></i></a>
                            <ul class="dropdown">
                              <li><a href="../qna/list.do">Q&A</a></li>
                              <li><a href="../faq/list.do">FAQ</a></li>
                              <li>
                                <a href="../board/list.do">게시판 리스트</a>
                              </li>                              
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
