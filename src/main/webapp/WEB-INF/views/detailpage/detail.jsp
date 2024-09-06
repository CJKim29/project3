<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
				<title>Eshop - eCommerce HTML5 Template.</title>
				<!-- Favicon -->
				<link rel="icon" type="image/png" href="../resources/template/images/favicon.png">
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

				<!-- 아이콘css 다희추가 -->
				<link rel='stylesheet'
					href='https://cdn-uicons.flaticon.com/2.5.1/uicons-solid-rounded/css/uicons-solid-rounded.css'>

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
				</style>

				<script>
					function showLoc(concert_idx) {
						$("#myModal").modal({ backdrop: "static" });
						loadMap();
					}

					// function showLove(){
					// 	var love = {
					// 		concert_idx : concert_idx,
					// 		mem_idx 	: mem_idx
					// 	};
					//}

				</script>
				<script type="text/javascript"
					src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=nd1wf0zz1p"></script>
				<script type="text/javascript"
					src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=nd1wf0zz1p&submodules=geocoder"></script>

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
							<!-- Logo  -->
							<div class="logo">
							  <a href=""
								><img
								  src="../resources/template/images/logo_TIMOA1.png"
								  alt="logo"
							  /></a>
							</div>
							<!--/ End Logo -->
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
								  <input
									name="search"
									placeholder="찾으실 공연을 입력해주세요"
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
							  <!-- 장바구니 버튼 부분 -->
							  <div class="sinlge-bar shopping">
								<a href="cart.html" class="single-icon"
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
										<li class="active"><a href="">Home</a></li>
										<li><a href="../main/sample.jsp">뮤지컬</a></li>
										<li><a href="">콘서트(보류)</a></li>
										<li><a href="">연극(보류)</a></li>
										<li>
										  <a href="">고객센터<i class="ti-angle-down"></i></a>
										  <ul class="dropdown">
											<li><a href="board-List.html">공지사항</a></li>
											<li><a href="board-List.html">FAQ</a></li>
											<li>
											  <a href="board-List.html">게시판 리스트</a>
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
					<input type="hidden" name="concert_idx" value="${ vo.concert_idx }">
					<div class="container">
						<div class="row">
							<div class="col-12">
								<div class="row">
									<div class="col-lg-4 col-12">
										<!-- Product Slider -->
										<div class="product-gallery">
											<!-- Images slider -->
											<div style="width: 300px; height: 435px;">
												<img style="height: 433px;" class="hall_img"
													src="../resources/images/${ vo.concert_image }">
											</div>
											<!-- End Images slider -->
										</div>
										<!-- End Product slider -->
									</div>
									<div class="col-lg-4 col-12">
										<div class="product-des">
											<!-- Description -->
											<div class="short" style="display: inline-block; margin-top: 5px;">
												<h4>${vo.concert_name}</h4>
												<div class="rating-main">
													<ul class="rating">
														<li><i class="fa fa-star"></i></li>
														<li><i class="fa fa-star"></i></li>
														<li><i class="fa fa-star"></i></li>
														<li><i class="fa fa-star-half-o"></i></li>
														<li class="dark"><i class="fa fa-star-o"></i></li>
													</ul>
													<a href="#" class="total-review">(102) Review</a>
												</div>
												<p class="price"><span class="discount">장소</span> <a href="#"
														onclick="showLoc(`${vo.concert_idx}`)">${vo.hallVo.hall_name}<i
															class="fi fi-sr-caret-right"></i></a></p>
												<p class="price"><span
														class="discount">공연기간</span>${vo.concert_startday}~${vo.concert_endday}
												</p>
												<p class="price"><span
														class="discount">공연시간</span>${vo.concert_runtime}분</p>
												<p class="price"><span class="discount">관람연령</span>${vo.concert_age}세 이상
													관람가능
												</p>
												<p class="price" style="display: grid; grid-template-columns: 18% 84%;">
													<span class="discount">가격</span>
													<c:forEach var="seat" items="${vo.seatList}">
														${seat.seat_grade} : ${seat.seat_price}원<br>
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
													<a href="#" class="btn">예매하기</a>
													<button type="button" id="love" class="btn min">
														<i class="ti-heart"></i>
													</button>
													<!-- <i class="ti-heart"></i> -->
													<!-- <i class="fa-solid fa-heart" style="color: #ffffff;"></i> -->
												</div>
											</div>
											<!--/ End Product Buy -->
										</div>
									</div>
									<div class="col-lg-2 col-12" style="margin-top: 23px;">
										<input id="datepicker" width="200" />
									</div>

									<script>
										var $my = $.noConflict(true);
										$my(document).ready(function () {
											$my('#datepicker').each(function () {
												$my(this).datepicker({
													showOnFocus: false // 달력을 클릭할 때만 열리게 하지 않음
												}).open();// 페이지 로드 시 바로 달력을 열기
											});
										});
									</script>



								</div>
								<div class="row">
									<div class="col-12">
										<div class="product-info">
											<div class="nav-main">
												<!-- Tab Nav -->
												<ul class="nav nav-tabs" id="myTab" role="tablist">
													<li class="nav-item"><a class="nav-link active" data-toggle="tab"
															href="#description" role="tab">Description</a></li>
													<li class="nav-item"><a class="nav-link" data-toggle="tab"
															href="#reviews" role="tab">Reviews</a></li>
												</ul>
												<!--/ End Tab Nav -->
											</div>
											<div class="tab-content" id="myTabContent">
												<!-- Description Tab -->
												<div class="tab-pane fade show active" id="description" role="tabpanel">
													<div class="tab-single">
														<div class="row">
															<div class="col-12">
																<div class="single-des">
																	<p>simply dummy text of the printing and typesetting
																		industry.
																		Lorem Ipsum has been the industry's standard
																		dummy text
																		ever
																		since the 1500s, when an unknown printer took a
																		galley
																		of
																		type and scrambled it to make a type specimen
																		book. It
																		has
																		survived not only five centuries, but also the
																		leap into
																		electronic typesetting, remaining essentially
																		unchanged.
																		It
																		was popularised in the 1960s with the release of
																		Letraset
																		sheets containing Lorem Ipsum passages, and more
																		recently
																		with deskto</p>
																</div>
																<div class="single-des">
																	<p>Suspendisse consequatur voluptates lorem nobis
																		accumsan
																		natus
																		mattis. Optio pede, optio qui metus, delectus!
																		Ultricies
																		impedit, minus tempor fuga, quasi, pede felis
																		commodo
																		bibendum voluptas nisi? Voluptatem risus tempore
																		tempora.
																		Quaerat aspernatur? Error praesent laoreet, cras
																		in
																		fames
																		hac ea, massa montes diamlorem nec quaerat, quos
																		occaecati
																		leo nam aliquet corporis, ab recusandae
																		parturient,
																		etiam
																		fermentum, a quasi possimus commodi, mollis
																		voluptate
																		mauris
																		mollis, quisque donec</p>
																</div>
																<div class="single-des">
																	<h4>Product Features:</h4>
																	<ul>
																		<li>long established fact.</li>
																		<li>has a more-or-less normal distribution.
																		</li>
																		<li>lmany variations of passages of. </li>
																		<li>generators on the Interne.</li>
																	</ul>
																</div>
															</div>
														</div>
													</div>
												</div>
												<!--/ End Description Tab -->
												<!-- Reviews Tab -->
												<div class="tab-pane fade" id="reviews" role="tabpanel">
													<div class="tab-single review-panel">
														<div class="row">
															<div class="col-12">
																<div class="ratting-main">
																	<div class="avg-ratting">
																		<h4>4.5 <span>(Overall)</span></h4>
																		<span>Based on 1 Comments</span>
																	</div>
																	<!-- Single Rating -->
																	<div class="single-rating">
																		<div class="rating-author">
																			<img src="https://via.placeholder.com/200x200"
																				alt="#">
																		</div>
																		<div class="rating-des">
																			<h6>Naimur Rahman</h6>
																			<div class="ratings">
																				<ul class="rating">
																					<li><i class="fa fa-star"></i></li>
																					<li><i class="fa fa-star"></i></li>
																					<li><i class="fa fa-star"></i></li>
																					<li><i
																							class="fa fa-star-half-o"></i>
																					</li>
																					<li><i class="fa fa-star-o"></i>
																					</li>
																				</ul>
																				<div class="rate-count">
																					(<span>3.5</span>)</div>
																			</div>
																			<p>Duis tincidunt mauris ac aliquet congue.
																				Donec
																				vestibulum consequat cursus. Aliquam
																				pellentesque
																				nulla dolor, in imperdiet.</p>
																		</div>
																	</div>
																	<!--/ End Single Rating -->
																	<!-- Single Rating -->
																	<div class="single-rating">
																		<div class="rating-author">
																			<img src="https://via.placeholder.com/200x200"
																				alt="#">
																		</div>
																		<div class="rating-des">
																			<h6>Advin Geri</h6>
																			<div class="ratings">
																				<ul class="rating">
																					<li><i class="fa fa-star"></i></li>
																					<li><i class="fa fa-star"></i></li>
																					<li><i class="fa fa-star"></i></li>
																					<li><i class="fa fa-star"></i></li>
																					<li><i class="fa fa-star"></i></li>
																				</ul>
																				<div class="rate-count">
																					(<span>5.0</span>)</div>
																			</div>
																			<p>Duis tincidunt mauris ac aliquet congue.
																				Donec
																				vestibulum consequat cursus. Aliquam
																				pellentesque
																				nulla dolor, in imperdiet.</p>
																		</div>
																	</div>
																	<!--/ End Single Rating -->
																</div>
																<!-- Review -->
																<div class="comment-review">
																	<div class="add-review">
																		<h5>Add A Review</h5>
																		<p>Your email address will not be published.
																			Required
																			fields
																			are marked</p>
																	</div>
																	<h4>Your Rating</h4>
																	<div class="review-inner">
																		<div class="ratings">
																			<ul class="rating">
																				<li><i class="fa fa-star"></i></li>
																				<li><i class="fa fa-star"></i></li>
																				<li><i class="fa fa-star"></i></li>
																				<li><i class="fa fa-star"></i></li>
																				<li><i class="fa fa-star"></i></li>
																			</ul>
																		</div>
																	</div>
																</div>
																<!--/ End Review -->
																<!-- Form -->
																<form class="form" method="post" action="mail/mail.php">
																	<div class="row">
																		<div class="col-lg-6 col-12">
																			<div class="form-group">
																				<label>Your Name<span>*</span></label>
																				<input type="text" name="name"
																					required="required" placeholder="">
																			</div>
																		</div>
																		<div class="col-lg-6 col-12">
																			<div class="form-group">
																				<label>Your Email<span>*</span></label>
																				<input type="email" name="email"
																					required="required" placeholder="">
																			</div>
																		</div>
																		<div class="col-lg-12 col-12">
																			<div class="form-group">
																				<label>Write a
																					review<span>*</span></label>
																				<textarea name="message" rows="6"
																					placeholder=""></textarea>
																			</div>
																		</div>
																		<div class="col-lg-12 col-12">
																			<div class="form-group button5">
																				<button type="submit"
																					class="btn">Submit</button>
																			</div>
																		</div>
																	</div>
																</form>
																<!--/ End Form -->
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

				<!-- Start Most Popular -->
				<div class="product-area most-popular related-product section">
					<div class="container">
						<div class="row">
							<div class="col-12">
								<div class="section-title">
									<h2>Related Products</h2>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-12">
								<div class="owl-carousel popular-slider">
									<!-- Start Single Product -->
									<div class="single-product">
										<div class="product-img">
											<a href="product-details.html">
												<img class="default-img" src="https://via.placeholder.com/550x750"
													alt="#">
												<img class="hover-img" src="https://via.placeholder.com/550x750"
													alt="#">
												<span class="out-of-stock">Hot</span>
											</a>
											<div class="button-head">
												<div class="product-action">
													<a data-toggle="modal" data-target="#exampleModal"
														title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
															Shop</span></a>
													<a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to
															Wishlist</span></a>
													<a title="Compare" href="#"><i
															class="ti-bar-chart-alt"></i><span>Add to
															Compare</span></a>
												</div>
												<div class="product-action-2">
													<a title="Add to cart" href="#">Add to cart</a>
												</div>
											</div>
										</div>
										<div class="product-content">
											<h3><a href="product-details.html">Black Sunglass For Women</a></h3>
											<div class="product-price">
												<span class="old">$60.00</span>
												<span>$50.00</span>
											</div>
										</div>
									</div>
									<!-- End Single Product -->
									<!-- Start Single Product -->
									<div class="single-product">
										<div class="product-img">
											<a href="product-details.html">
												<img class="default-img" src="https://via.placeholder.com/550x750"
													alt="#">
												<img class="hover-img" src="https://via.placeholder.com/550x750"
													alt="#">
											</a>
											<div class="button-head">
												<div class="product-action">
													<a data-toggle="modal" data-target="#exampleModal"
														title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
															Shop</span></a>
													<a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to
															Wishlist</span></a>
													<a title="Compare" href="#"><i
															class="ti-bar-chart-alt"></i><span>Add to
															Compare</span></a>
												</div>
												<div class="product-action-2">
													<a title="Add to cart" href="#">Add to cart</a>
												</div>
											</div>
										</div>
										<div class="product-content">
											<h3><a href="product-details.html">Women Hot Collection</a></h3>
											<div class="product-price">
												<span>$50.00</span>
											</div>
										</div>
									</div>
									<!-- End Single Product -->
									<!-- Start Single Product -->
									<div class="single-product">
										<div class="product-img">
											<a href="product-details.html">
												<img class="default-img" src="https://via.placeholder.com/550x750"
													alt="#">
												<img class="hover-img" src="https://via.placeholder.com/550x750"
													alt="#">
												<span class="new">New</span>
											</a>
											<div class="button-head">
												<div class="product-action">
													<a data-toggle="modal" data-target="#exampleModal"
														title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
															Shop</span></a>
													<a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to
															Wishlist</span></a>
													<a title="Compare" href="#"><i
															class="ti-bar-chart-alt"></i><span>Add to
															Compare</span></a>
												</div>
												<div class="product-action-2">
													<a title="Add to cart" href="#">Add to cart</a>
												</div>
											</div>
										</div>
										<div class="product-content">
											<h3><a href="product-details.html">Awesome Pink Show</a></h3>
											<div class="product-price">
												<span>$50.00</span>
											</div>
										</div>
									</div>
									<!-- End Single Product -->
									<!-- Start Single Product -->
									<div class="single-product">
										<div class="product-img">
											<a href="product-details.html">
												<img class="default-img" src="https://via.placeholder.com/550x750"
													alt="#">
												<img class="hover-img" src="https://via.placeholder.com/550x750"
													alt="#">
											</a>
											<div class="button-head">
												<div class="product-action">
													<a data-toggle="modal" data-target="#exampleModal"
														title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
															Shop</span></a>
													<a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to
															Wishlist</span></a>
													<a title="Compare" href="#"><i
															class="ti-bar-chart-alt"></i><span>Add to
															Compare</span></a>
												</div>
												<div class="product-action-2">
													<a title="Add to cart" href="#">Add to cart</a>
												</div>
											</div>
										</div>
										<div class="product-content">
											<h3><a href="product-details.html">Awesome Bags Collection</a></h3>
											<div class="product-price">
												<span>$50.00</span>
											</div>
										</div>
									</div>
									<!-- End Single Product -->
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- End Most Popular Area -->

				<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
										class="ti-close" aria-hidden="true"></span></button>
							</div>
							<div class="modal-body">
								<div class="row no-gutters">
									<div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
										<!-- Product Slider -->
										<div class="product-gallery">
											<div class="quickview-slider-active">
												<div class="single-slider">
													<img src="https://via.placeholder.com/569x528" alt="#">
												</div>
												<div class="single-slider">
													<img src="https://via.placeholder.com/569x528" alt="#">
												</div>
												<div class="single-slider">
													<img src="https://via.placeholder.com/569x528" alt="#">
												</div>
												<div class="single-slider">
													<img src="https://via.placeholder.com/569x528" alt="#">
												</div>
											</div>
										</div>
										<!-- End Product slider -->
									</div>
									<div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
										<div class="quickview-content">
											<h2>Flared Shift Dress</h2>
											<div class="quickview-ratting-review">
												<div class="quickview-ratting-wrap">
													<div class="quickview-ratting">
														<i class="yellow fa fa-star"></i>
														<i class="yellow fa fa-star"></i>
														<i class="yellow fa fa-star"></i>
														<i class="yellow fa fa-star"></i>
														<i class="fa fa-star"></i>
													</div>
													<a href="#"> (1 customer review)</a>
												</div>
												<div class="quickview-stock">
													<span><i class="fa fa-check-circle-o"></i> in stock</span>
												</div>
											</div>
											<h3>$29.00</h3>
											<div class="quickview-peragraph">
												<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia
													iste
													laborum
													ad impedit pariatur esse optio tempora sint ullam autem deleniti nam
													in quos
													qui
													nemo ipsum numquam.</p>
											</div>
											<div class="size">
												<div class="row">
													<div class="col-lg-6 col-12">
														<h5 class="title">Size</h5>
														<select>
															<option selected="selected">s</option>
															<option>m</option>
															<option>l</option>
															<option>xl</option>
														</select>
													</div>
													<div class="col-lg-6 col-12">
														<h5 class="title">Color</h5>
														<select>
															<option selected="selected">orange</option>
															<option>purple</option>
															<option>black</option>
															<option>pink</option>
														</select>
													</div>
												</div>
											</div>
											<div class="quantity">
												<!-- Input Order -->
												<div class="input-group">
													<div class="button minus">
														<button type="button" class="btn btn-primary btn-number"
															disabled="disabled" data-type="minus" data-field="quant[1]">
															<i class="ti-minus"></i>
														</button>
													</div>
													<input type="text" name="quant[1]" class="input-number" data-min="1"
														data-max="1000" value="1">
													<div class="button plus">
														<button type="button" class="btn btn-primary btn-number"
															data-type="plus" data-field="quant[1]">
															<i class="ti-plus"></i>
														</button>
													</div>
												</div>
												<!--/ End Input Order -->
											</div>
											<div class="add-to-cart">
												<a href="#" class="btn">Add to cart</a>
												<a href="#" class="btn min"><i class="ti-heart"></i></a>
												<a href="#" class="btn min"><i class="fa fa-compress"></i></a>
											</div>
											<div class="default-social">
												<h4 class="share-now">Share:</h4>
												<ul>
													<li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a>
													</li>
													<li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a>
													</li>
													<li><a class="youtube" href="#"><i
																class="fa fa-pinterest-p"></i></a></li>
													<li><a class="dribbble" href="#"><i
																class="fa fa-google-plus"></i></a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Modal end -->

				<!-- Modal -->
				<div id="myModal" class="modal fade" role="dialog">
					<div class="modal-dialog" style="display: flex; align-items: center; justify-content: center;">

						<!-- Modal content-->
						<div class="modal-content" style="border-radius: 16px; width: 710px; height: 655px;">
							<div class="myModal-header">
								<button type="button" class="close" data-dismiss="modal"
									style="padding: 0 20px; margin-top: 18px;">X</button>
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
								<div style="color: #666; font-size: 15px;"><a href="${vo.hallVo.hall_site}"
										target="_blank">홈페이지
										: ${vo.hallVo.hall_site}<i class="fi fi-sr-caret-right"
											style="display: inline-block; position: relative; top: 3px;"></i></a></div>
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

				<jsp:include page="/WEB-INF/views/include/footer.jsp"/>

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