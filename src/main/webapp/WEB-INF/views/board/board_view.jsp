<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
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

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>	

<style type="text/css">

@font-face {
	    font-family: 'ONE-Mobile-POP';
	    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/ONE-Mobile-POP.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	
	* {
		font-family: 'ONE-Mobile-POP';
		text-shadow: #f7941d;
		color: #f7941d;
	}
	
	textarea{
		resize: none;
	}
	
	h4{
		font-weight: bold;
	}
	
	.content{
		min-height: 120px;
	}
	
	
</style>


	<script type="text/javascript">

		function del() {
			
			if(confirm("정말 삭제하시겠습니까?")==false)return;
			
			location.href = "delete.do?board_idx=${ vo.board_idx }";
			
		}
		
		/* 댓글쓰기 기능 */
		function comment_insert() {
			
			// 로그인이 안되었으면
			if("${ empty user }" == "true"){
				if(confirm("로그인 후 댓글쓰기가 가능합니다. \n 로그인하시겠습니까?")==false) return;
				
				//alert(location.href);
				
				// 로그인 폼으로 이동
				location.href="../member/login_form.do";
				
				return;
			}
			
			// 댓글쓰기 작성 (ajax활용)
			let cmt_content = $("#cmt_content").val().trim();
			if(cmt_content=='') {
				alert("댓글을 입력하시오.");
				$("#cmt_content").val("");
				$("#cmt_content").focus();
				return;
			}
			
			// Ajax통해서 댓글 등록
			$.ajax({
				
				url		:	"../comment/insert.do",
				data	:	{
							 "cmt_content" : cmt_content,
							 "board_idx"	: "${ vo.board_idx }",
							 "mem_idx"	   : "${ user.mem_idx }",
							 "mem_nickname"	   : "${ user.mem_nickname }",
							},
				dataType:	"json",
				
				success	:	function(res_data){
					// res_data = {"result" : true}
					
					// 입력창에서 작성했던 글 지우기
					$("#cmt_content").val("");
					
					if(res_data.result==false){
						alert("댓글등록 실패!!");
						return;
					}
					alert("댓글이 등록되었습니다.");
          window.location.href = window.location.href;
					comment_list(1);
				},
				error	:	function(err){
					alert(err.responseText)
				}
			});
			
		} // end - comment_insert()
		
		var g_page = 1;
		// 댓글목록 요청
		function comment_list(page) {
			g_page = page;
			
			$.ajax({
				
				url		:	"../comment/list.do",
				data	:	{"board_idx":"${ vo.board_idx }",
							 "page" : page
							},
				success	:	function(res_data){
					
					$("#comment_display").html(res_data);
				},
				error	:	function(err){
					alert(err.responseText);
				}
				
			});
		} // end - comment_list()
			
		// 초기화 이벤트 : 시작시
		$(document).ready(function(){
			
			// 현재 게시물에 달린 댓글 목록 출력
			comment_list(1);
		});
			 
	
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
      <h4>test</h4>
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
                              <li><a href="list.do">board-List</a></li>
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
                  <a href="index1.html">Home<i class="ti-arrow-right"></i></a>
                </li>
                <li class="active"><a href="list.do">게시판</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- End Breadcrumbs -->

    <!-- Start Blog Single -->
    <section class="blog-single section" style="padding-top: 0">
      <div class="container">
        <div class="row">
          <div class="col-lg-10 offset-lg-1 col-12">
            <div class="blog-single-main">
              <div class="row">
                <div class="col-12">
                  <!-- <div class="image">
                    <img src="https://via.placeholder.com/950x460" alt="#" />
                    이후 삭제 
                    <div>진행중인 공연 이미지 넣기</div>
                  </div> -->
                  <div class="blog-detail">
                    <h2 class="blog-title">${ vo.board_name }</h2>
                    <div class="blog-meta">
                      <span class="author"
                        ><a href="#"><i class="fa fa-user"></i><b>${ vo.mem_nickname }</b>님의 글</a
                        ><a href="#"><i class="fa fa-calendar"></i>${ vo.board_regdate }</a
                        ><a href="#"
                          ><i class="fa fa-comments"></i>조회수 (${ vo.board_readhit })</a
                        ></span
                      >
                    </div>
                    <div class="content">
                      <p>${ vo.board_content }</p>
                      <blockquote>
                        <i class="fa fa-quote-left"></i> ${ vo.board_content }
                      </blockquote>
                    </div>
                  </div>
				  <div>
					<input class="btn" style="background: brown;" type="button" value="목록보기"
						   onclick="location.href='list.do'">
						   
					<!-- 로그인된 상태에서만 등록가능 -->	
					<c:if test="${ (not empty user) and (vo.board_depth le 1) }">  
						<input class="btn" style="background: #f7941d;" type="button" value="답글쓰기"
							   onclick="location.href='reply_form.do?board_idx=${ vo.board_idx }'">
					</c:if> 
					
					<!-- 글의 주인만 수정/삭제 -->
					<c:if test="${ vo.mem_idx eq user.mem_idx }">
						<input class="btn" style="background: tomato;" type="button" value="수정하기"
							   onclick="location.href='modify_form.do?board_idx=${ vo.board_idx }'">
						<input class="btn btn-danger" type="button" value="삭제하기"
							   onclick="del('${ vo.board_idx }');">
					</c:if>
				</div>
                </div>
				
                <div class="col-12">
                  <div class="comments">
            <h3 class="comment-title">댓글 (${ vo.cmt_count })</h3>
					  <!-- Single Comment -->
					  <div id="comment_display">	
					  </div>	
                    <!-- End Single Comment -->
                   
                  </div>
                </div>
                <div class="col-12">
                  <div class="reply">
                    <div class="reply-head">
                      <h2 class="reply-title">댓글 남기기</h2>
                      <!-- Comment Form -->
                      <form class="form" action="#">
                        <div class="row">
                          <div class="col-12">
                            <div class="form-group">
                              <label>Your Message<span>*</span></label>
                              <textarea rows="3" id="cmt_content" placeholder="로그인 후에 댓글쓰기가 가능합니다."></textarea>
                            </div>
                          </div>
                          <div class="col-12">
                            <div class="form-group button">
                              <input class="btn" type="button" onclick="comment_insert();" value="댓글쓰기">                                                              
                            </div>
                          </div>
                        </div>
                      </form>
                      <!-- End Comment Form -->
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--/ End Blog Single -->

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
