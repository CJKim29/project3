<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fn"
uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <title>티모아</title>
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
    <link rel="stylesheet" href="../resources/template/css/color/color1.css" />
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
    <!--<link rel="stylesheet" href="../resources/template/css/color/color12.css">-->

    <link rel="stylesheet" href="#" id="colors" />
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
    />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <style type="text/css">
      @font-face {
        font-family: "ONE-Mobile-POP";
        src: url("https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/ONE-Mobile-POP.woff")
          format("woff");
        font-weight: normal;
        font-style: normal;
      }

      * {
        font-family: "ONE-Mobile-POP";
        color: #f7230e;
      }

      th {
        color: black;
      }

      a {
        color: #f7230e;
        text-decoration: none;
      }

      a:hover {
        color: #f7230e;
        text-decoration: none;
      }

      .board_name {
        display: inline-block;

        overflow: hidden;
        white-space: nowrap;
        text-overflow: ellipsi;
        word-break: break-all;

        /* ellipsi 속성 */
      }
    </style>

    <script type="text/javascript">
      function insert_form() {
        // 로그인 여부 체크
        if ("${ empty user }" == "true") {
          if (
            confirm("글쓰기는 로그인 후 가능합니다 \n 로그인 하시겠습니까?") ==
            false
          )
            return;

          location.href = "../member/login_form.do";

          return;
        }
        location.href = "insert_form.do";
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
                      <i class="ti-power-off"></i
                      ><a href="../member/insert_form.do">회원가입</a>
                    </li>
                    <li>
                      <i class="ti-power-off"></i
                      ><a href="../member/login_form.do">로그인</a>
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
              <!-- Logo (여기 홈페이지 이름 적거나 사진으로 대체) -->
              <div class="logo">
                <a href="main.html"
                  ><img src="../resources/template/images/logo.png" alt="logo"
                /></a>
              </div>
              <!--/ End Logo -->
              <!-- Search Form -->
              <!-- 검색창 부분 -->
              <div class="search-top">
                <div class="top-search">
                  <a href="#0"><i class="ti-search"></i></a>
                </div>
                <!-- Search Form -->
                <div class="search-top">
                  <form class="search-form">
                    <input
                      type="text"
                      placeholder="Search here..."
                      name="search"
                    />
                    <button value="search" type="submit">
                      <i class="ti-search"></i>
                    </button>
                  </form>
                </div>
                <!--/ End Search Form -->
              </div>
              <!--/ End Search Form -->
              <div class="mobile-nav"></div>
            </div>
            <div class="col-lg-8 col-md-7 col-12">
              <div class="search-bar-top">
                <div class="search-bar">
                  <select>
                    <option selected="selected">All Category</option>
                    <option>뮤지컬</option>
                    <option>콘서트</option>
                    <option>연극</option>
                  </select>
                  <form>
                    <input
                      name="search"
                      placeholder="Search Products Here....."
                      type="search"
                    />
                    <button class="btnn"><i class="ti-search"></i></button>
                  </form>
                </div>
              </div>
            </div>
            <div class="col-lg-2 col-md-3 col-12">
              <div class="right-bar">
                <!-- Search Form -->
                <div class="sinlge-bar shopping">
                  <a href="#" class="single-icon"
                    ><i class="ti-bag"></i>
                    <span class="total-count">2</span></a
                  >
                  <!-- Shopping Item -->
                  <!-- 장바구니 부분 -->
                  <div class="shopping-item">
                    <div class="dropdown-cart-header">
                      <span>2 Items</span>
                      <a href="#">장바구니</a>
                    </div>
                    <ul class="shopping-list">
                      <li>
                        <a href="#" class="remove" title="Remove this item"
                          ><i class="fa fa-remove"></i
                        ></a>
                        <a class="cart-img" href="#"
                          ><img src="https://via.placeholder.com/70x70" alt="#"
                        /></a>
                        <h4><a href="#">Woman Ring</a></h4>
                        <p class="quantity">
                          1x - <span class="amount">$99.00</span>
                        </p>
                      </li>
                      <li>
                        <a href="#" class="remove" title="Remove this item"
                          ><i class="fa fa-remove"></i
                        ></a>
                        <a class="cart-img" href="#"
                          ><img src="https://via.placeholder.com/70x70" alt="#"
                        /></a>
                        <h4><a href="#">Woman Necklace</a></h4>
                        <p class="quantity">
                          1x - <span class="amount">$35.00</span>
                        </p>
                      </li>
                    </ul>
                    <div class="bottom">
                      <div class="total">
                        <span>Total</span>
                        <span class="total-amount">$134.00</span>
                      </div>
                      <a href="checkout.html" class="btn animate">Checkout</a>
                    </div>
                  </div>
                  <!--/ End Shopping Item -->
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- Header2 부분 검색창 바로 밑 -->
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
                          <li class="active">
                            <a href="#">Home<i class="ti-angle-down"></i></a>
                            <ul class="dropdown">
                              <li><a href="main.html">Main</a></li>
                              <li><a href="list.do">게시판</a></li>
                            </ul>
                          </li>
                          <li><a href="#">뮤지컬</a></li>
                          <li><a href="#">콘서트</a></li>
                          <li>
                            <a href="#"
                              >연극<i class="ti-angle-down"></i
                              ><span class="new">New</span></a
                            >
                            <ul class="dropdown">
                              <li><a href="shop-grid.html">Shop Grid</a></li>
                              <li><a href="shop-list.html">Shop List</a></li>
                              <li>
                                <a href="shop-single.html">shop Single</a>
                              </li>
                              <li><a href="cart.html">Cart</a></li>
                              <li><a href="checkout.html">Checkout</a></li>
                            </ul>
                          </li>
                          <li>
                            <a href="#">게시판<i class="ti-angle-down"></i></a>
                            <ul class="dropdown">
                              <li><a href="list.do">borad-List</a></li>
                              <li>
                                <a href="blog-grid-sidebar.html"
                                  >Blog Grid Sidebar</a
                                >
                              </li>
                              <li><a href="x_list.do">board-List</a></li>
                              <li>
                                <a href="blog-single-sidebar.html"
                                  >Blog Single Sidebar</a
                                >
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

    <!-- Breadcrumbs -->
    <div class="breadcrumbs">
      <div class="container">
        <div class="row">
          <div class="col-12">
            <div class="bread-inner">
              <ul class="bread-list">
                <li>
                  <a href="main.html">Home<i class="ti-arrow-right"></i></a>
                </li>
                <li class="active"><a href="list.do">게시판</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- End Breadcrumbs -->
    <!-- 여기까지가 헤더 부분 카테고리까지 -->

    <!-- Start Blog Grid -->
    <div class="blog-single shop-blog grid section" style="padding-top: 50px">
      <div class="container">
        <div class="row">
          <div class="col-12">
            <div style="text-align: right">
              <input
                class="btn"
                style="background: #f7230e; color: white"
                type="button"
                value="글쓰기"
                onclick="insert_form();"
              />
            </div>
            <!-- 게시판 테이블 구성하기  -->
            <table class="table" style="margin-bottom: 0">
              <tr style="background: #f7230e">
                <th>번호</th>
                <th style="width: 50%">제목</th>
                <th>카테고리</th>
                <th>작성자</th>
                <th>작성일자</th>
                <th>조회수</th>
              </tr>

              <tr>
                <!-- 데이터가 없는 경우 -->
                <c:if test="${ empty list }">
                  <tr>
                    <td colspan="5" align="center">
                      <font color="red">게시물이 없습니다</font>
                    </td>
                  </tr>
                </c:if>

                <!-- 데이터가 있는 경우-->
                <c:forEach var="vo" items="${ list }">
                  <tr>
                    <td>${ vo.board_idx }</td>

                    <td>
                      <!-- 답글이면 b_depth만큼 들여쓰기 -->
                      <c:forEach begin="1" end="${ vo.board_depth }">
                        &nbsp;&nbsp;&nbsp;
                      </c:forEach>

                      <!-- 답글이면 -->
                      <c:if test="${ vo.board_depth ne 0 }"> ㄴ </c:if>

                      <!-- 삭제된 게시물 -->
                      <c:if test="${ vo.board_use eq 'n' }">
                        <font color="red"
                          >(삭제된 게시물입니다.)
                          <span class="board_name">${ vo.board_name }</span>
                        </font>
                      </c:if>

                      <!-- 삭제안된 게시물 -->
                      <c:if test="${ vo.board_use eq 'y' }">
                        <span class="board_name">
                          <a href="view.do?board_idx=${ vo.board_idx }">
                            ${ vo.board_name }
                            <c:if test="${ vo.cmt_count ne 0 }">
                              <span class="badge" style="background: #f7230e"
                                >&nbsp;${ vo.cmt_count }</span
                              >
                            </c:if>
                          </a>
                        </span>
                      </c:if>
                    </td>
                    <td>${ vo.board_cate_name }</td>
                    <td>${ vo.mem_nickname }</td>
                    <td>${ vo.board_regdate }</td>
                    <td>${ vo.board_readhit }</td>
                  </tr>
                </c:forEach>
              </tr>
            </table>

            <!-- Pagination -->
            <div style="text-align: center">${ pageMenu }</div>
            <!--/ End Pagination -->
          </div>
        </div>
      </div>
    </div>
    <!--/ End Blog Grid -->

    <!-- Start Footer Area -->
    <footer class="footer">
      <!-- Footer Top -->
      <div class="footer-top section">
        <div class="container">
          <div class="row">
            <div class="col-lg-5 col-md-6 col-12">
              <!-- Single Widget -->
              <div class="single-footer about">
                <div class="logo">
                  <a href="index.html"
                    ><img src="../resources/template/images/logo2.png" alt="#"
                  /></a>
                </div>
                <p class="text">
                  Praesent dapibus, neque id cursus ucibus, tortor neque egestas
                  augue, magna eros eu erat. Aliquam erat volutpat. Nam dui mi,
                  tincidunt quis, accumsan porttitor, facilisis luctus, metus.
                </p>
                <p class="call">
                  Got Question? Call us 24/7<span
                    ><a href="tel:123456789">+0123 456 789</a></span
                  >
                </p>
              </div>
              <!-- End Single Widget -->
            </div>
            <div class="col-lg-2 col-md-6 col-12">
              <!-- Single Widget -->
              <div class="single-footer links">
                <h4>Information</h4>
                <ul>
                  <li><a href="#">About Us</a></li>
                  <li><a href="#">Faq</a></li>
                  <li><a href="#">Terms & Conditions</a></li>
                  <li><a href="#">Contact Us</a></li>
                  <li><a href="#">Help</a></li>
                </ul>
              </div>
              <!-- End Single Widget -->
            </div>
            <div class="col-lg-2 col-md-6 col-12">
              <!-- Single Widget -->
              <div class="single-footer links">
                <h4>Customer Service</h4>
                <ul>
                  <li><a href="#">Payment Methods</a></li>
                  <li><a href="#">Money-back</a></li>
                  <li><a href="#">Returns</a></li>
                  <li><a href="#">Shipping</a></li>
                  <li><a href="#">Privacy Policy</a></li>
                </ul>
              </div>
              <!-- End Single Widget -->
            </div>
            <div class="col-lg-3 col-md-6 col-12">
              <!-- Single Widget -->
              <div class="single-footer social">
                <h4>Get In Tuch</h4>
                <!-- Single Widget -->
                <div class="contact">
                  <ul>
                    <li>NO. 342 - London Oxford Street.</li>
                    <li>012 United Kingdom.</li>
                    <li>info@eshop.com</li>
                    <li>+032 3456 7890</li>
                  </ul>
                </div>
                <!-- End Single Widget -->
                <ul>
                  <li>
                    <a href="#"><i class="ti-facebook"></i></a>
                  </li>
                  <li>
                    <a href="#"><i class="ti-twitter"></i></a>
                  </li>
                  <li>
                    <a href="#"><i class="ti-flickr"></i></a>
                  </li>
                  <li>
                    <a href="#"><i class="ti-instagram"></i></a>
                  </li>
                </ul>
              </div>
              <!-- End Single Widget -->
            </div>
          </div>
        </div>
      </div>
      <!-- End Footer Top -->
      <div class="copyright">
        <div class="container">
          <div class="inner">
            <div class="row">
              <div class="col-lg-6 col-12">
                <div class="left">
                  <p>
                    Copyright © 2020
                    <a href="http://www.wpthemesgrid.com" target="_blank"
                      >Wpthemesgrid</a
                    >
                    - All Rights Reserved.
                  </p>
                </div>
              </div>
              <div class="col-lg-6 col-12">
                <div class="right">
                  <img
                    src="../resources/template/images/payments.png"
                    alt="#"
                  />
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </footer>
    <!-- /End Footer Area -->

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
