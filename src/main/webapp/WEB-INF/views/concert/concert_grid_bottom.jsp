<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
			<!-- 원화 표시 기능 -->
			<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

				<!DOCTYPE html>
				<html lang="zxx">

				<head>

					<style>
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
							margin-bottom: 30px;
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

					<!-- 카테고리 별 조회
					<script>
						function filtering(f) {

							let concert_detail_cate_idx = f.concert_detail_cate_idx.value;

							//"location.href='category.do?concert_category=${vo.concert_detail_cate_idx}'"
							$.ajax({

								url: "category.do",		// controller
								data: { "concert_detail_cate_idx": concert_detail_cate_idx },	//paramter 전달  category.do?comtent_detail_cate_idx=1
								dataType: "json",
								success: function (res_data) {

									location.href = "category.do?comtent_detail_cate_idx=" + comtent_detail_cate_idx;

								},
								error: function (err) {
									alert(err.responseText);
								}
							});
						}
					</script> -->

					<!-- Meta Tag -->
					<meta charset="utf-8">
					<meta http-equiv="X-UA-Compatible" content="IE=edge">
					<meta name='copyright' content=''>
					<meta http-equiv="X-UA-Compatible" content="IE=edge">
					<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
					<!-- Title Tag  -->
					<title>Eshop - eCommerce HTML5 Template.</title>
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

					<!-- 헤더 삭제 -->

					<!-- 상단바 -->
					<!-- Product Style -->
					<section class="product-area shop-sidebar shop section">
						<div class="container">
							<div class="row">
								<!-- 정렬바 -->
								<!-- <div class="col-lg-9 col-md-8 col-12"> -->
								<div class="col-xl-12">
									<div class="row">
										<div class="col-12">

											<!-- Shop Top -->
											<div class="shop-top">
												<div class="shop-shorter">

													<!-- 이미지 몇개씩 볼건지
												<div class="single-shorter">
													<label>Show :</label>
													<select>
														<option selected="selected">09</option>
														<option>15</option>
														<option>25</option>
														<option>30</option>
													</select>
												</div> -->

													<!-- 정렬 -->
													<div class="single-shorter">
														<label>Sort By :</label>
														<select>
															<option selected="selected">인기순</option>
															<option>가나다순</option>
															<option>등록순</option>
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

									<!-- 공연 목록 출력 -->
									<div class="concert_list">
										<c:forEach var="vo" items="${ list }">
											<div content_wrap>
												<img class="concert_img" src="../resources/images/${ vo.concert_image }"
													onclick="location.href='detailpage.do?concert_idx=${vo.concert_idx}'">
												<div class="concert_content">
													<div class="concert_cate">${ vo.concertCateVo.concert_cate_name }
														> ${ vo.concertDetailCateVo.concert_detail_cate_name }</div>
													<div class="concert_name">${ vo.concert_name }</div>

													<!-- 지역 정보 -->
													<div>
														${vo.hallVo.hall_area} >
														${vo.hallVo.hall_name}
													</div>

													<!-- 가격 정보 -->
													<div class="concert_price">
														<c:forEach var="seat" items="${vo.seatList}" begin="0" end="0">
															<!-- 가격 표시 : 숫자 3자리마다 , 찍기 -->
															<!-- <fmt:setLocale value="ko_KR" /> -->
															<fmt:formatNumber type="number"
																value="${seat.seat_price}" />원
														</c:forEach>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>

									<!-- Data가 없는 경우 화면에 출력 될 정보 -->
									<c:if test="${ empty requestScope.list }">
										<div id="empty_msg">등록된 공연장 정보가 없습니다</div>
									</c:if>




									<!-- ---------------------이미지 영역 start-------------------- -->
									<!-- <div class="row">

							<div class="col-lg-4 col-md-6 col-12">
								<div class="single-product">
									<div class="product-img">
										<a href="product-details.html">
											<img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
											<img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
										</a>
										<div class="button-head">
											<div class="product-action">
												<a data-toggle="modal" data-target="#exampleModal" title="Quick View"
													href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
												<a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to
														Wishlist</span></a>
												<a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to
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
											<span>$29.00</span>
										</div>
									</div>
								</div>
							</div>

							<div class="col-lg-4 col-md-6 col-12">
								<div class="single-product">
									<div class="product-img">
										<a href="product-details.html">
											<img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
											<img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
										</a>
										<div class="button-head">
											<div class="product-action">
												<a data-toggle="modal" data-target="#exampleModal" title="Quick View"
													href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
												<a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to
														Wishlist</span></a>
												<a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to
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
											<span>$29.00</span>
										</div>
									</div>
								</div>
							</div>

							<div class="col-lg-4 col-md-6 col-12">
								<div class="single-product">
									<div class="product-img">
										<a href="product-details.html">
											<img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
											<img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
										</a>
										<div class="button-head">
											<div class="product-action">
												<a data-toggle="modal" data-target="#exampleModal" title="Quick View"
													href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
												<a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to
														Wishlist</span></a>
												<a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to
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
											<span>$29.00</span>
										</div>
									</div>
								</div>
							</div>

							<div class="col-lg-4 col-md-6 col-12">
								<div class="single-product">
									<div class="product-img">
										<a href="product-details.html">
											<img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
											<img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
											<span class="new">New</span>
										</a>
										<div class="button-head">
											<div class="product-action">
												<a data-toggle="modal" data-target="#exampleModal" title="Quick View"
													href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
												<a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to
														Wishlist</span></a>
												<a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to
														Compare</span></a>
											</div>
											<div class="product-action-2">
												<a title="Add to cart" href="#">Add to cart</a>
											</div>
										</div>
									</div>
									<div class="product-content">
										<h3><a href="product-details.html">Women Pant Collectons</a></h3>
										<div class="product-price">
											<span>$29.00</span>
										</div>
									</div>
								</div>
							</div>

							<div class="col-lg-4 col-md-6 col-12">
								<div class="single-product">
									<div class="product-img">
										<a href="product-details.html">
											<img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
											<img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
										</a>
										<div class="button-head">
											<div class="product-action">
												<a data-toggle="modal" data-target="#exampleModal" title="Quick View"
													href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
												<a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to
														Wishlist</span></a>
												<a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to
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
											<span>$29.00</span>
										</div>
									</div>
								</div>
							</div>

							<div class="col-lg-4 col-md-6 col-12">
								<div class="single-product">
									<div class="product-img">
										<a href="product-details.html">
											<img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
											<img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
											<span class="price-dec">30% Off</span>
										</a>
										<div class="button-head">
											<div class="product-action">
												<a data-toggle="modal" data-target="#exampleModal" title="Quick View"
													href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
												<a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to
														Wishlist</span></a>
												<a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to
														Compare</span></a>
											</div>
											<div class="product-action-2">
												<a title="Add to cart" href="#">Add to cart</a>
											</div>
										</div>
									</div>
									<div class="product-content">
										<h3><a href="product-details.html">Awesome Cap For Women</a></h3>
										<div class="product-price">
											<span>$29.00</span>
										</div>
									</div>
								</div>
							</div>

							<div class="col-lg-4 col-md-6 col-12">
								<div class="single-product">
									<div class="product-img">
										<a href="product-details.html">
											<img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
											<img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
										</a>
										<div class="button-head">
											<div class="product-action">
												<a data-toggle="modal" data-target="#exampleModal" title="Quick View"
													href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
												<a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to
														Wishlist</span></a>
												<a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to
														Compare</span></a>
											</div>
											<div class="product-action-2">
												<a title="Add to cart" href="#">Add to cart</a>
											</div>
										</div>
									</div>
									<div class="product-content">
										<h3><a href="product-details.html">Polo Dress For Women</a></h3>
										<div class="product-price">
											<span>$29.00</span>
										</div>
									</div>
								</div>
							</div>

							<div class="col-lg-4 col-md-6 col-12">
								<div class="single-product">
									<div class="product-img">
										<a href="product-details.html">
											<img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
											<img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
											<span class="out-of-stock">Hot</span>
										</a>
										<div class="button-head">
											<div class="product-action">
												<a data-toggle="modal" data-target="#exampleModal" title="Quick View"
													href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
												<a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to
														Wishlist</span></a>
												<a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to
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
							</div>

							<div class="col-lg-4 col-md-6 col-12">
								<div class="single-product">
									<div class="product-img">
										<a href="product-details.html">
											<img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
											<img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">
											<span class="new">New</span>
										</a>
										<div class="button-head">
											<div class="product-action">
												<a data-toggle="modal" data-target="#exampleModal" title="Quick View"
													href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
												<a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to
														Wishlist</span></a>
												<a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to
														Compare</span></a>
											</div>
											<div class="product-action-2">
												<a title="Add to cart" href="#">Add to cart</a>
											</div>
										</div>
									</div>
									<div class="product-content">
										<h3><a href="product-details.html">Women Pant Collectons</a></h3>
										<div class="product-price">
											<span>$29.00</span>
										</div>
									</div>
								</div>
							</div>

						</div> -->
									<!-- -------------------- 이미지 영역 end -------------------- -->

								</div>
							</div>
						</div>
					</section>
					<!--/ End Product Style 1  -->



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
													<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
														Mollitia
														iste
														laborum ad impedit pariatur esse optio tempora sint ullam autem
														deleniti
														nam
														in quos qui nemo ipsum numquam.</p>
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
																disabled="disabled" data-type="minus"
																data-field="quant[1]">
																<i class="ti-minus"></i>
															</button>
														</div>
														<input type="text" name="quant[1]" class="input-number"
															data-min="1" data-max="1000" value="1">
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
														<li><a class="facebook" href="#"><i
																	class="fa fa-facebook"></i></a>
														</li>
														<li><a class="twitter" href="#"><i
																	class="fa fa-twitter"></i></a>
														</li>
														<li><a class="youtube" href="#"><i
																	class="fa fa-pinterest-p"></i></a>
														</li>
														<li><a class="dribbble" href="#"><i
																	class="fa fa-google-plus"></i></a>
														</li>
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
												<a href="main.html"><img src="../resources/template/images/logo2.png"
														alt="#"></a>
											</div>
											<p class="text">Praesent dapibus, neque id cursus ucibus, tortor neque
												egestas
												augue,
												magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis,
												accumsan
												porttitor, facilisis luctus, metus.</p>
											<p class="call">Got Question? Call us 24/7<span><a
														href="tel:123456789">+0123
														456
														789</a></span></p>
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
												<li><a href="#"><i class="ti-facebook"></i></a></li>
												<li><a href="#"><i class="ti-twitter"></i></a></li>
												<li><a href="#"><i class="ti-flickr"></i></a></li>
												<li><a href="#"><i class="ti-instagram"></i></a></li>
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
												<p>Copyright © 2020 <a href="http://www.wpthemesgrid.com"
														target="_blank">Wpthemesgrid</a> - All Rights Reserved.</p>
											</div>
										</div>
										<div class="col-lg-6 col-12">
											<div class="right">
												<img src="../resources/template/images/payments.png" alt="#">
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