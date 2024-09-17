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
															<li class="active"><a href="../main/list.do">Home</a></li>
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
												<img style="height: 433px;" class="hall_img"
													src="../resources/images/${ vo.performance_image }">
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
														<li><i class="fa fa-star"></i></li>
														<li><i class="fa fa-star"></i></li>
														<li><i class="fa fa-star"></i></li>
														<li><i class="fa fa-star-half-o"></i></li>
														<li class="dark"><i class="fa fa-star-o"></i></li>
													</ul>
													<a href="#" class="total-review" id="totalReviewLink">관람 후기(${fn:length(list_review)})</a>
													<script>
														$(document).ready(function () {
															// '관람 후기' 탭을 활성화하고 표시하는 함수
															function activateReviewTab() {
																// 탭 메뉴의 '관람 후기'를 활성화
																$('#toggleReview').removeClass('active'); // '관람 후기 작성' 버튼 비활성화
																$('a[href="#reviews"]').tab('show'); // '관람 후기' 탭 활성화
															}

															// '관람 후기 작성' 버튼 클릭 시
															$('#toggleReview').on('click', function (e) {
																e.preventDefault(); // 링크의 기본 동작 방지
																// 로그인 여부 체크
																if ("${ empty user }" === "true") {
																	if (
																		confirm("관람 후기는 로그인 후 작성 가능합니다 \n 로그인 하시겠습니까?") ==
																		false
																	)
																		return;

																	location.href = "../member/login_form.do";

																	return;
																}

																// 탭 상태 업데이트
																activateReviewTab();
															});

															// '총 리뷰' 링크 클릭 시
															$('#totalReviewLink').on('click', function (e) {
																e.preventDefault(); // 링크의 기본 동작 방지

																// '관람 후기' 탭 활성화
																activateReviewTab();
															});
														});
													</script>
												</div>
												<p class="price"><span class="discount">장소</span> <a href="#"
														onclick="showLoc(`${vo.performance_idx}`)">${vo.hallVo.hall_name}<i
															class="fi fi-sr-caret-right"></i></a></p>
												<p class="price"><span
														class="discount">공연기간</span>${fn:substringBefore(vo.performance_startday,
													' ')}~${fn:substringBefore(vo.performance_endday, ' ')}
												</p>
												<p class="price"><span
														class="discount">공연시간</span>${vo.performance_runtime}분</p>
												<p class="price"><span
														class="discount">관람연령</span>${vo.performance_age}세 이상
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
													<a href="#" class="btn">예매하기</a>
													<c:choose>
														<c:when test="${isLiked}">
															<button type="button" id="love" class="btn min"
																style="background-color: #ff1d38;"
																onclick="handleLikeClick();">
																<i class="ti-heart"></i> &nbsp;
																<span>${ likeCount }</span>
															</button>
														</c:when>
														<c:otherwise>
															<button type="button" id="love" class="btn min"
																onclick="handleLikeClick();">
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
															href="#description" role="tab">공연정보</a></li>
													<li class="nav-item">
														<a class="nav-link" id="reviews-tab" data-toggle="tab"
															href="#reviews" role="tab">관람 후기</a>
													</li>
												</ul>
												<!--/ End Tab Nav -->
											</div>
											<div class="tab-content" id="myTabContent">
												<!-- Description Tab -->
												<div class="tab-pane fade show active" id="description" role="tabpanel">
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
																						<img id="actor_pic"
																							src="../resources/images/${castingVo.actorVo.actor_pic}">
																					</a>
																				</div>
																				<h6>${castingVo.casting_name}</h6>
																				<p style="color: #666666;">
																					${castingVo.actorVo.actor_name}</p>
																			</div>
																		</c:forEach>
																	</div>
																	<button onclick="toggleText()" id="toggleButton">더보기
																		<i id="more"
																			class="fi fi-rs-angle-small-down"></i>
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
																		<img
																			src="../resources/images/${vo.performance_detail_image}">
																	</div>
																</c:if>
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
																	<div class="avg-ratting"
																		style="display: flex; justify-content: space-between; align-items: center;">
																		<h6 style="width: 300px;"><span>관람
																				후기(${fn:length(list_review)})&emsp;</span><fmt:formatNumber value="${avgScore}" type="number" maxFractionDigits="2"/>/5</h6>
																		<div class="nav-main">
																			<ul class="nav nav-tabs"
																				style="width: 100%;" id="myReview"
																				role="tablist">
																				<li class="nav-item">
																					<a class="nav-link active"
																						id="toggleReview"
																						href="javascript:void(0);">관람 후기
																						작성</a>
																				</li>
																			</ul>
																		</div>
																	</div>
																	<!-- Review -->
																	<!-- <div class="review-inner">
																		<div class="ratings">
																			<ul class="rating">
																				<li><i class="fa fa-star"></i></li>
																				<li><i class="fa fa-star"></i></li>
																				<li><i class="fa fa-star"></i></li>
																				<li><i class="fa fa-star"></i></li>
																				<li><i class="fa fa-star"></i></li>
																			</ul>
																		</div>
																	</div> -->
																	<div class="comment-review" id="reviewForm"
																		style="display: none;">
																		<div class="add-review">
																			<h5>「${vo.performance_name}」 - 관람 후기 작성</h5>
																		</div>
																		<h4>평점</h4>
																		<form id="ratingForm" class="review-inner"
																			method="POST" action="review_insert.do">
																			<input type="hidden" name="performance_idx" id="performance_idx" value="${param.performance_idx}">
																			<div class="ratings">
																				<label>
																					<input type="radio"
																						name="review_score_point"
																						value="5" class="rating-radio"
																						required>
																					<span class="star"
																						data-value="5">★★★★★</span>
																				</label>
																				<label>
																					<input type="radio"
																						name="review_score_point"
																						value="4" class="rating-radio"
																						required>
																					<span class="star"
																						data-value="4">★★★★</span>
																				</label>
																				<label>
																					<input type="radio"
																						name="review_score_point"
																						value="3" class="rating-radio"
																						required>
																					<span class="star"
																						data-value="3">★★★</span>
																				</label>
																				<label>
																					<input type="radio"
																						name="review_score_point"
																						value="2" class="rating-radio"
																						required>
																					<span class="star"
																						data-value="2">★★</span>
																				</label>
																				<label>
																					<input type="radio"
																						name="review_score_point"
																						value="1" class="rating-radio"
																						required>
																					<span class="star"
																						data-value="1">★</span>
																				</label>
																			</div>
																			<!-- Form -->
																			<div class="form">
																				<div class="row">
																					<div class="col-lg-6 col-12">
																						<div class="form-group">
																							<label>제목<span>*</span></label>
																							<input type="text"
																								name="review_title"
																								required="required"
																								placeholder="">
																						</div>
																					</div>
																					<div class="col-lg-12 col-12">
																						<div class="form-group">
																							<label>내용<span>*</span></label>
																							<textarea
																								name="review_content"
																								rows="6"
																								placeholder=""></textarea>
																						</div>
																					</div>
																					<div class="col-lg-12 col-12">
																						<div class="form-group button5"
																							style="text-align: center;">
																							<button type="button"
																								class="btn"
																								onclick="send(this.form)">작성완료</button>
																						</div>
																					</div>
																				</div>
																			</div>
																		</form>
																	</div>
																	<!--/ End Form -->
																	<!-- 리뷰 토글 -->
																	<script>
																		document.getElementById("toggleReview").addEventListener("click", function () {
																			var reviewForm = document.getElementById("reviewForm");
																			if (reviewForm.style.display === "none") {
																				reviewForm.style.display = "block";
																			} else {
																				reviewForm.style.display = "none";
																			}
																		});
																	</script>
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
																						<li><i class="fa fa-star"></i>
																						</li>
																						<li><i class="fa fa-star"></i>
																						</li>
																						<li><i class="fa fa-star"></i>
																						</li>
																						<li><i class="fa fa-star"></i>
																						</li>
																						<li><i class="fa fa-star"></i>
																						</li>
																					</ul>
																					<h6 style="width: 200px;">${ review.mem_nickname }</h6>
																					<div class="reg-information"
																						style="text-align: right;">${ review.review_regdate }
																					</div>
																				</div>
																			</div>
																				<h6>${ review.review_title }</h6>
																				<p>${ review.review_content }</p>
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