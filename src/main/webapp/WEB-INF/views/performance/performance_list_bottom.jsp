<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
			<!-- 원화 표시 기능 -->
			<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

				<!DOCTYPE html>
				<html lang="ko">

				<head>

					<style>
						/* 컨텐츠 영역 start*/
						.performance_list {

							display: flex;
							flex-wrap: wrap;
							justify-content: space-between;
							margin-bottom: 100px !important;
						}

						.content_wrap {
							width: 30% !important;
							/* 각 요소의 너비 설정 */
							margin-bottom: 50px !important;
							/* 아래쪽 여백 설정 */
						}

						.performance_img {

							margin: 0px 20px 20px 20px;

							width: 450px;
							height: 500px;
							object-fit: fill;


						}

						.performance_cate {
							font-size: 15px !important;
							color: gray;
							margin-bottom: 10px;
						}

						.performance_name {
							/* width: 300px !important; */
							font-size: 23px;
							font-weight: bold;
							margin-top: 20px;
							margin-bottom: 10px !important;

							overflow: hidden;
							white-space: nowrap;
							text-overflow: ellipsis;
							word-break: break-all;

						}

						.area {
							margin-bottom: 10px;
						}

						.performance_price {
							font-size: 20px;
							font-weight: bold;
							margin-bottom: 10px;
							margin-left: 240px;
						}

						.admin_btns input {
							/* width: 100px; */
							/* text-align: left !important; */
							padding: 7px;

						}

						/* 조회 데이터 없음 메세지 */
						#empty_msg {
							height: 100px;
							margin-bottom: 100px;
							text-align: center;
						}

						.empty_msg1 {
							margin-bottom: 20px;
							font-size: 25px;
							font-weight: bold;
						}

						.empty_msg2 {
							font-size: 17px;
						}

						/* 컨텐츠 영역 end */
					</style>

					<!-- 카테고리 별 조회
					<script>
						function filtering(f) {

							let performance_detail_cate_idx = f.performance_detail_cate_idx.value;

							//"location.href='category.do?performance_category=${vo.performance_detail_cate_idx}'"
							$.ajax({

								url: "category.do",		// controller
								data: { "performance_detail_cate_idx": performance_detail_cate_idx },	//paramter 전달  category.do?comtent_detail_cate_idx=1
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

					<script>

						//공연 좌석 정보 추가
						function insert_form_seat(performance_idx) {
							location.href = "insert_form_seat.do?performance_idx=" + performance_idx; // 공연 추가 폼으로 이동
						}

						// 공연 수정
						function modify_form(performance_idx) {
							location.href = "modify_form.do?performance_idx=" + performance_idx;

						}

						// 공연 좌석 수정
						function modify_form_seat(performance_idx) {
							location.href = "modify_form_seat.do?performance_idx=" + performance_idx;
						}
					</script>

				</head>

				<body class="js">

					<!-- 상단바 -->
					<!-- Product Style -->
					<section class="product-area shop-sidebar shop section my_top_bar">
						<div class="container">
							<div class="row">
								<!-- 정렬바 -->
								<!-- <div class="col-lg-9 col-md-8 col-12"> -->
								<div class="col-xl-12">
									<div class="row">
										<div class="col-12">

										</div>
									</div>

									<!-- 공연 목록 출력 -->
									<div class="performance_list">
										<c:forEach var="vo" items="${ list }">
											<div class="content_wrap">
												<img class="performance_img"
													src="../resources/images/${ vo.performance_image }"
													onclick="location.href='detailpage.do?performance_idx=${vo.performance_idx}'">


												<div class="performance_cate">${
													vo.performanceCateVo.performance_cate_name }
													> ${ vo.performanceDetailCateVo.performance_detail_cate_name }
												</div>
												<div class="performance_name" title="${vo.performance_name}">${
													vo.performance_name}</div>

												<!-- 지역 정보 -->
												<div class="area">
													${vo.hallVo.hall_area} >
													${vo.hallVo.hall_name}
												</div>

												<!-- 가격 정보 -->
												<div class="performance_price">
													<c:forEach var="seat" items="${vo.seatList}" begin="0" end="0">
														<!-- 가격 표시 : 숫자 3자리마다 , 찍기 -->
														<!-- <fmt:setLocale value="ko_KR" /> -->
														<fmt:formatNumber type="number" value="${seat.seat_price}" />원
													</c:forEach>
												</div>

												<!-- 관리자 권한 버튼 -->
												<div class="admin_btns">
													<c:if test="${ user.mem_grade eq '관리자' }">
														<input type="button" class="btn" value="좌석 등록"
															onclick="insert_form_seat('${vo.performance_idx}');" />

														<input type="button" class="btn" value="공연 수정"
															onclick="modify_form('${vo.performance_idx}');" />

														<!-- <input type="button" class="btn" value="좌석 수정"
															onclick="modify_form_seat('${vo.performance_idx}');" /> -->
														<input class="btn" type="button" value="좌석 수정"
															onclick="location.href='modify_form_seat.do?performance_idx=${ vo.performance_idx }'">

														<input type="button" class="btn" value="공연 삭제"
															onclick="del('${vo.performance_idx}');" />
													</c:if>
												</div>
											</div>
										</c:forEach>
									</div>

									<!-- Data가 없는 경우 화면에 출력 될 정보 -->
									<c:if test="${ empty requestScope.list }">
										<div id="empty_msg">
											<div class="empty_msg1">이용 가능한 티켓이 없습니다</div>
											<div class="empty_msg2">다른 검색 조건으로 조회해보세요!</div>
										</div>
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

					<jsp:include page="/WEB-INF/views/include/footer.jsp" />
				</body>

				</html>