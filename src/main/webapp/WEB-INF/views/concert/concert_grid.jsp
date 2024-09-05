<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
			<!-- 원화 표시 기능 -->
			<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

				<!DOCTYPE html>
				<html lang="zxx">

				<head>

					<style>
						#mylogo a img {
							/* margin-bottom: 50px; */
							/* display: block; */
						}

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



						/* 방문 후 링크 상태*/
						/* .d_cate_list li a:visited {
						color: yellowgreen !important;
					} */

						.my_top_bar {
							padding: 0px !important;
							padding-top: 50px !important;
						}

						/* 컨텐츠 영역 start*/
						.concert_list {
							/* display: inline-block !important; */
							display: flex;
							flex-wrap: wrap;
							justify-content: space-between;
						}

						.content_wrap {
							width: 30%;
							/* 각 요소의 너비 설정 */
							margin-bottom: 20px;
							/* 아래쪽 여백 설정 */
						}

						.concert_img {

							margin: 50px 20px 20px 0px;

						}

						.concert_cate {
							font-size: 15px !important;
							color: gray;
						}

						.concert_name {
							font-size: 25px;
							font-weight: bold;
							margin-top: 20px;
							margin-bottom: 5px !important;
						}

						.concert_price {
							float: right !important;
							padding-right: 20px;
							font-size: 20px;
							font-weight: bold;
						}

						/* 컨텐츠 영역 end */
					</style>

					<script src="../resources/template/js/jquery.min.js"></script>



					<!-- 카테고리 별 조회 -->
					<script>

						$(document).ready(function () {
							// 페이지가 로드될 때 바로 화면 출력되도록 search() 호출
							search();

							// 이름이 genre, hall_area인 input 태그가 클릭되면 search() 호출
							$("input[name='concert_detail_cate_idx'],input[name='hall_area']").click(function () {
								search();
							});

							// sort_options_number 선택이 변경되면 search() 호출 => 정렬(몇개씩 볼건지 )
							$("#sort_options_number").change(function () {
								search();
							});

							// sort_options 선택이 변경되면 search() 호출 => 정렬(최신순, ㄱㄴㄷ순..)
							$("#sort_options").change(function () {
								search();
							});
						});

						function search() {

							// 체크된 value 값을 변수에 저장
							const concert_detail_cate_idx = $("input[name='concert_detail_cate_idx']:checked").val();
							const hall_area = $("input[name='hall_area']:checked").val();

							const sort_options = $("#sort_options").val();  // sort_options 값 가져오기
							const sort_options_number = $("#sort_options_number").val();  // sort_options 값 가져오기

							//alert(genre + "/" + hall_area);
							// 전송 데이터 확인
							console.log({
								concert_detail_cate_idx,
								hall_area,
								sort_options,
								sort_options_number
							});

							$.ajax({
								url: "category.do",		// controller
								data: {
									"concert_detail_cate_idx": concert_detail_cate_idx,
									"hall_area": hall_area,
									"sort_options": sort_options,
									"sort_options_number": sort_options_number
								},								  //paramter 전달  category.do?concert_detail_cate_idx="all"
								success: function (res_data) {

									$("#disp").html(res_data);

								},
								error: function (err) {
									alert(err.responseText);
								}
							});

						}
					</script>

					<script>
						// function filtering(concert_detail_cate_idx) {
						// 	// let concert_detail_cate_idx = $('#concert_detail_cate_idx').val() // concert_detail_cate_idx : <ul> id

						// 	//"location.href='category.do?concert_detail_cate_idx=${vo.concert_detail_cate_idx}'"
						// 	$.ajax({
						// 		url: "category.do",		// controller
						// 		data: { "concert_detail_cate_idx": concert_detail_cate_idx },	//paramter 전달  category.do?concert_detail_cate_idx="all"
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

						// 	let concert_detail_cate_idx = $('#concert_detail_cate_idx').val()

						// 	$.ajax({
						// 		url: "category_area.do",	// controller
						// 		data: {
						// 			"hall_idx": hall_idx,
						// 			"concert_detail_cate_idx": concert_detail_cate_idx
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

					<!-- Meta Tag -->
					<meta charset="utf-8">
					<meta http-equiv="X-UA-Compatible" content="IE=edge">
					<meta name='copyright' content=''>
					<meta http-equiv="X-UA-Compatible" content="IE=edge">
					<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
					<!-- Title Tag  -->
					<title>TIMOA - 티켓팅 사이트</title>
					<!-- Favicon -->
					<!-- <link rel="icon" type="image/png" href="../resources/template/images/favicon.png"> -->
					<link rel="icon" type="image/png" href="../resources/images/TIMOA_icon.png">
					<!-- <a href="main.html"><img src="../resources/images/logo_TIMOA2.PNG" alt="logo"></a> -->

					<!-- Web Font -->
					<link
						href="https://fonts.googleapis.com/css?family=Poppins:200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap"
						rel="stylesheet">

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
					<!-- Jquery Ui -->
					<link rel="stylesheet" href="../resources/template/css/jquery-ui.css">
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
					<div class="color-plate ">
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
										<!-- 사이트 로고 영역(이미지 넣어둠) -->
										<div class="logo" id="mylogo">
											<a href="main.html"><img src="../resources/images/logo_TIMOA2.PNG"
													alt="logo"></a>
										</div>
										<!--/ End Logo -->

										<!-- Search Form -->
										<!-- 검색창 부분 -->
										<div class="search-top">
											<div class="top-search"><a href="#0"><i class="ti-search"></i></a></div>
											<!-- Search Form -->
											<div class="search-top">
												<form class="search-form">
													<input type="text" placeholder="Search here..." name="search">
													<button value="search" type="submit"><i
															class="ti-search"></i></button>
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
													<input name="search" placeholder="Search Products Here....."
														type="search">
													<button class="btnn"><i class="ti-search"></i></button>
												</form>
											</div>
										</div>
									</div>
									<div class="col-lg-2 col-md-3 col-12">
										<div class="right-bar">
											<!-- Search Form -->
											<div class="sinlge-bar shopping">
												<a href="#" class="single-icon"><i class="ti-bag"></i> <span
														class="total-count">2</span></a>
												<!-- Shopping Item -->
												<!-- 장바구니 부분 -->
												<div class="shopping-item">
													<div class="dropdown-cart-header">
														<span>2 Items</span>
														<a href="#">장바구니</a>
													</div>
													<ul class="shopping-list">
														<li>
															<a href="#" class="remove" title="Remove this item"><i
																	class="fa fa-remove"></i></a>
															<a class="cart-img" href="#"><img
																	src="https://via.placeholder.com/70x70" alt="#"></a>
															<h4><a href="#">Woman Ring</a></h4>
															<p class="quantity">1x - <span class="amount">$99.00</span>
															</p>
														</li>
														<li>
															<a href="#" class="remove" title="Remove this item"><i
																	class="fa fa-remove"></i></a>
															<a class="cart-img" href="#"><img
																	src="https://via.placeholder.com/70x70" alt="#"></a>
															<h4><a href="#">Woman Necklace</a></h4>
															<p class="quantity">1x - <span class="amount">$35.00</span>
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
																<li><a href="#">Home<i class="ti-angle-down"></i></a>
																	<ul class="dropdown">
																		<li><a href="main.html">Main</a></li>
																	</ul>
																</li>
																<li class="active"><a href="list_grid.do">뮤지컬</a></li>
																<li><a href="#">콘서트</a></li>
																<li><a href="#">연극<i class="ti-angle-down"></i><span
																			class="new">New</span></a>
																	<ul class="dropdown">
																		<li><a href="shop-grid.html">Shop Grid</a></li>
																		<li><a href="shop-list.html">Shop List</a></li>
																		<li><a href="shop-single.html">shop Single</a>
																		</li>
																		<li><a href="cart.html">Cart</a></li>
																		<li><a href="checkout.html">Checkout</a></li>
																	</ul>
																</li>
																<li><a href="#">게시판<i class="ti-angle-down"></i></a>
																	<ul class="dropdown">
																		<li><a href="borad-List.html">borad-List</a>
																		</li>
																		<li><a href="blog-grid-sidebar.html">Blog Grid
																				Sidebar</a>
																		</li>
																		<li><a href="board-List.html">board-List</a>
																		</li>
																		<li><a href="blog-single-sidebar.html">Blog
																				Single
																				Sidebar</a></li>
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
					<!-- <div class="breadcrumbs">
					<div class="container">
						<div class="row">
							<div class="col-12">
								<div class="bread-inner">
									<ul class="bread-list">
										<li><a href="main.html">Home<i class="ti-arrow-right"></i></a></li>
										<li class="active"><a href="blog-single.html">Shop Grid</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div> -->
					<!-- End Breadcrumbs -->

					<!-- Breadcrumbs -->
					<div class="breadcrumbs">
						<div class="container">
							<div class="row">
								<div class="col-12">
									<div class="bread-inner">

										<input type="radio" name="concert_detail_cate_idx" value="0" checked>전체
										<input type="radio" name="concert_detail_cate_idx" value="1">로맨틱코미디
										<input type="radio" name="concert_detail_cate_idx" value="2">드라마
										<input type="radio" name="concert_detail_cate_idx" value="3">코믹
										<input type="radio" name="concert_detail_cate_idx" value="4">공포/스릴러
										<input type="radio" name="concert_detail_cate_idx" value="5">퍼포먼스
										<input type="radio" name="concert_detail_cate_idx" value="6">어린이
										<input type="radio" name="concert_detail_cate_idx" value="7">기타
										<br>
										<input type="radio" name="hall_area" value="all" checked>전체
										<input type="radio" name="hall_area" value="서울">서울
										<input type="radio" name="hall_area" value="경기/인천">경기/인천
										<input type="radio" name="hall_area" value="충청/대전">충청/대전
										<input type="radio" name="hall_area" value="경상/대구/부산">경상/대구/부산
										<input type="radio" name="hall_area" value="전라/광주">전라/광주
										<input type="radio" name="hall_area" value="강원">강원
										<input type="radio" name="hall_area" value="제주">제주


										<ul id="concert_detail_cate_idx">
											<li style="margin-left: 20px; font-weight: bold !important;" value=0>
												<a onclick="filtering(0);">장르 전체</a>
											</li>

											<li value=1>
												<a onclick="filtering(1);">
													<!-- <a onclick="$('#concert_detail_cate_idx').val('로맨틱코미디'); filtering();"> -->
													로맨틱코미디
												</a>
											</li>

											<li value=2><a onclick="filtering(2);">드라마</a></li>
											<li value=3><a onclick="filtering(3);">코믹</a></li>
											<li value=4><a onclick="filtering(4);">공포/스릴러</a></li>
											<li value=5><a onclick="filtering(5);">퍼포먼스</a></li>
											<li value=6><a onclick="filtering(6);">어린이</a></li>
											<li value=7><a onclick="filtering(7);">기타</a></li>
										</ul>

									</div>
									<br>
									<div class="bread-inner">
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
														<select id="sort_options_number">
															<option value="3" selected="selected">3</option>
															<option value="6">6</option>
															<option value="9">9</option>
														</select>
													</div>

													<!-- 정렬 -->
													<div class="single-shorter">
														<label>Sort By :</label>
														<select id="sort_options">
															<option selected="selected" value="s_abc">가나다순</option>
															<option value="s_new">최신순</option>
															<option value="s_best">인기순</option>
														</select>
													</div>
												</div>

												<!-- 이미지 정렬 방식 : 그리드 형식 or 리스트 형식 선택-->
												<ul class="view-mode">
													<li class="active"><a href="list_grid.do"><i
																class="fa fa-th-large"></i></a>
													</li>
													<li><a href="list.do"><i class="fa fa-th-list"></i></a></li>
												</ul>
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

					<!-- modal 삭제 -->

					<!-- footer 삭제 -->


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