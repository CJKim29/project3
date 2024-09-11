<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">
<head>

	
</head>
<body class="js">
	<jsp:include page="/WEB-INF/views/include/header.jsp"/>
	
	
	<!-- Start Area 2 -->
	<!-- 메인 슬라이드 부분 -->
	<section class="hero-area4">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="home-slider-4">
						<!-- url 이동 필요할듯 누르면 해당 상세 페이지로 -->
						 <!-- 이미지 크기는 1160x560  -->
						 <a href="">
							<div class="big-content" style="background-image: url('/../resources/template/images/슬라이드용시카고2.png');">
							</div>
						</a>
						<a href="">
							<div class="big-content" style="background-image: url('/../resources/template/images/슬라이드용킹키부츠2.png');">
							</div>
						</a>
						<a href="">
							<div class="big-content" style="background-image: url('/../resources/template/images/슬라이드바 애니2.png');">
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--/ End Hero Area 2 -->
	
	<!-- 랭킹, 콘서트 , 뮤지컬, 연극 넣을곳 -->
	
	<!-- Start Product Area -->
    <div class="product-area section">
            <div class="container">
				<div class="row">
					<div class="col-12">
						<div class="section-title">
							<h2>추천 공연</h2>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<div class="product-info">
							<div class="nav-main">
								<!-- Tab Nav -->
								 <!-- nav와 data-toggle을 이용한 부트스트랩 -->
								  <!-- 이미지 수정필요 -->
								<ul class="nav nav-tabs" id="myTab" role="tablist">
									<li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#performance1" role="tab">로맨틱코미디</a></li>
									<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#performance2" role="tab">드라마</a></li>
									<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#performance3" role="tab">코믹</a></li>
									<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#performance4" role="tab">공포&스릴러</a></li>
									<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#performance5" role="tab">어린이</a></li>
								</ul>
								<!--/ End Tab Nav -->
							</div>
							<div class="tab-content" id="myTabContent">
								<!-- Start Single Tab -->
								 <!-- 뮤지컬 부분 -->
								  <!-- 이미지 수정필요 -->
								  <!-- 장르1 -->
								<div class="tab-pane fade show active" id="performance1" role="tabpanel">
									<div class="tab-single">
										<div class="row">
											<div class="col-xl-3 col-lg-4 col-md-4 col-12">
												<div class="single-product">
													<div class="product-img">
														<a href="">
															<!-- 이미지 크기는 550x750  -->
															<img class="default-img" src="/../resources/template/images/장르용 시카고.png" alt="#">
														</a>
													</div>
													<div class="product-content">
														<h3><a href="product-details.html">뮤지컬 시카고</a></h3>
														<div class="product-price">
															<span>2024.06.07 ~ 2024.09.29</span>
														</div>
													</div>
												</div>
											</div>
											<div class="col-xl-3 col-lg-4 col-md-4 col-12">
												<div class="single-product">
													<div class="product-img">
														<a href="">
															<img class="default-img" src="/../resources/template/images/장르용 김종욱 찾기.jpg" alt="#">
														</a>
													</div>
													<div class="product-content">
														<h3><a href="product-details.html"> 뮤지컬 김종욱 찾기</a></h3>
														<div class="product-price">
															<span>날짜</span>
														</div>
													</div>
												</div>
											</div>
											<div class="col-xl-3 col-lg-4 col-md-4 col-12">
												<div class="single-product">
													<div class="product-img">
														<a href="product-details.html">
															<img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
														</a>
													</div>
													<div class="product-content">
														<h3><a href="product-details.html"></a></h3>
														<div class="product-price">
															<span>날짜</span>
														</div>
													</div>
												</div>
											</div>
											<div class="col-xl-3 col-lg-4 col-md-4 col-12">
												<div class="single-product">
													<div class="product-img">
														<a href="product-details.html">
															<img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
														</a>
													</div>
													<div class="product-content">
														<h3><a href="product-details.html">공연제목</a></h3>
														<div class="product-price">
															<span>날짜</span>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!--/ End Single Tab -->

								<!-- 장르2 부분 -->
								<div class="tab-pane fade" id="performance2" role="tabpanel">
									<div class="tab-single">
										<div class="row">
											<div class="col-xl-3 col-lg-4 col-md-4 col-12">
												<div class="single-product">
													<div class="product-img">
														<a href="product-details.html">
															<img class="default-img" src="/../resources/template/images/장르용 스파이.png" alt="#">
														</a>
													</div>
													<div class="product-content">
														<h3><a href="product-details.html">뮤지컬 스파이</a></h3>
														<div class="product-price">
															<span>2024.08.06 ~ 2024.10.27</span>
														</div>
													</div>
												</div>
											</div>
											<div class="col-xl-3 col-lg-4 col-md-4 col-12">
												<div class="single-product">
													<div class="product-img">
														<a href="product-details.html">
															<img class="default-img" src="/../resources/template/images/장르용 부치하난.png" alt="#">
														</a>
													</div>
													<div class="product-content">
														<h3><a href="product-details.html">뮤지컬 부치하난</a></h3>
														<div class="product-price">
															<span>2024.09.17 ~2024.11.17</span>
														</div>
													</div>
												</div>
											</div>
											<div class="col-xl-3 col-lg-4 col-md-4 col-12">
												<div class="single-product">
													<div class="product-img">
														<a href="product-details.html">
															<img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
														</a>
													</div>
													<div class="product-content">
														<h3><a href="product-details.html">공연제목</a></h3>
														<div class="product-price">
															<span>날짜</span>
														</div>
													</div>
												</div>
											</div>
											<div class="col-xl-3 col-lg-4 col-md-4 col-12">
												<div class="single-product">
													<div class="product-img">
														<a href="product-details.html">
															<img class="default-img" src="/../resources/template/images/장르용 베르사유.png" alt="#">
														</a>
													</div>
													<div class="product-content">
														<h3><a href="product-details.html">뮤지컬 베르사유의 장미</a></h3>
														<div class="product-price">
															<span>날짜</span>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!--/ End Single Tab -->

								<!-- 장르3 부분 -->
								<div class="tab-pane fade" id="performance3" role="tabpanel">
									<div class="tab-single">
										<div class="row">
											<div class="col-xl-3 col-lg-4 col-md-4 col-12">
												<div class="single-product">
													<div class="product-img">
														<a href="product-details.html">
															<img class="default-img" src="/../resources/template/images/장르용 젠틀맨.png" alt="#">
														</a>
													</div>
													<div class="product-content">
														<h3><a href="product-details.html">뮤지컬 젠틀맨스 가이드 : 사랑과 살인편</a></h3>
														<div class="product-price">
															<span>날짜</span>
														</div>
													</div>
												</div>
											</div>
											<div class="col-xl-3 col-lg-4 col-md-4 col-12">
												<div class="single-product">
													<div class="product-img">
														<a href="product-details.html">
															<img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
														</a>
													</div>
													<div class="product-content">
														<h3><a href="product-details.html">공연제목</a></h3>
														<div class="product-price">
															<span>날짜</span>
														</div>
													</div>
												</div>
											</div>
											<div class="col-xl-3 col-lg-4 col-md-4 col-12">
												<div class="single-product">
													<div class="product-img">
														<a href="product-details.html">
															<img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
														</a>
													</div>
													<div class="product-content">
														<h3><a href="product-details.html">공연제목</a></h3>
														<div class="product-price">
															<span>날짜</span>
														</div>
													</div>
												</div>
											</div>
											<div class="col-xl-3 col-lg-4 col-md-4 col-12">
												<div class="single-product">
													<div class="product-img">
														<a href="product-details.html">
															<img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
														</a>
													</div>
													<div class="product-content">
														<h3><a href="product-details.html">공연제목</a></h3>
														<div class="product-price">
															<span>날짜</span>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!--/ End Single Tab -->

								<!-- 장르4 부분 -->
								<div class="tab-pane fade" id="performance4" role="tabpanel">
									<div class="tab-single">
										<div class="row">
											<div class="col-xl-3 col-lg-4 col-md-4 col-12">
												<div class="single-product">
													<div class="product-img">
														<a href="product-details.html">
															<img class="default-img" src="/../resources/template/images/장르용 하데스.png" alt="#">
														</a>
													</div>
													<div class="product-content">
														<h3><a href="product-details.html">뮤지컬 하데스</a></h3>
														<div class="product-price">
															<span>날짜</span>
														</div>
													</div>
												</div>
											</div>
											<div class="col-xl-3 col-lg-4 col-md-4 col-12">
												<div class="single-product">
													<div class="product-img">
														<a href="product-details.html">
															<img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
														</a>
													</div>
													<div class="product-content">
														<h3><a href="product-details.html">공연제목</a></h3>
														<div class="product-price">
															<span>날짜</span>
														</div>
													</div>
												</div>
											</div>
											<div class="col-xl-3 col-lg-4 col-md-4 col-12">
												<div class="single-product">
													<div class="product-img">
														<a href="product-details.html">
															<img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
														</a>
													</div>
													<div class="product-content">
														<h3><a href="product-details.html">공연제목</a></h3>
														<div class="product-price">
															<span>날짜</span>
														</div>
													</div>
												</div>
											</div>
											<div class="col-xl-3 col-lg-4 col-md-4 col-12">
												<div class="single-product">
													<div class="product-img">
														<a href="product-details.html">
															<img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
														</a>
													</div>
													<div class="product-content">
														<h3><a href="product-details.html">공연제목</a></h3>
														<div class="product-price">
															<span>날짜</span>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!--/ End Single Tab -->
							

								<!-- 장르5 부분 -->
								<div class="tab-pane fade" id="performance5" role="tabpanel">
									<div class="tab-single">
										<div class="row">
											<div class="col-xl-3 col-lg-4 col-md-4 col-12">
												<div class="single-product">
													<div class="product-img">
														<a href="product-details.html">
															<img class="default-img" src="/../resources/template/images/장르용 애니.png" alt="#">
														</a>
													</div>
													<div class="product-content">
														<h3><a href="product-details.html">뮤지컬 애니</a></h3>
														<div class="product-price">
															<span>2024.10.01 ~2024.10.27</span>
														</div>
													</div>
												</div>
											</div>
											<div class="col-xl-3 col-lg-4 col-md-4 col-12">
												<div class="single-product">
													<div class="product-img">
														<a href="product-details.html">
															<img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
														</a>
													</div>
													<div class="product-content">
														<h3><a href="product-details.html">공연제목</a></h3>
														<div class="product-price">
															<span>날짜</span>
														</div>
													</div>
												</div>
											</div>
											<div class="col-xl-3 col-lg-4 col-md-4 col-12">
												<div class="single-product">
													<div class="product-img">
														<a href="product-details.html">
															<img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
														</a>
													</div>
													<div class="product-content">
														<h3><a href="product-details.html">공연제목</a></h3>
														<div class="product-price">
															<span>날짜</span>
														</div>
													</div>
												</div>
											</div>
											<div class="col-xl-3 col-lg-4 col-md-4 col-12">
												<div class="single-product">
													<div class="product-img">
														<a href="">
															<img class="default-img" src="https://via.placeholder.com/550x750" alt="#">
														</a>
													</div>
													<div class="product-content">
														<h3><a href="">공연제목</a></h3>
														<div class="product-price">
															<span>날짜</span>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!--/ End Single Tab -->

							
							</div>
						</div>
					</div>
				</div>
            </div>
    </div>
	<!-- End Product Area -->
	
	
<!-- 최신, 랭킹 별 공연 -->
<!-- Start Shop Home List -->
<section class="shop-home-list section">
    <div class="container">
        <div class="row">
            <!-- 최신 섹션 -->
            <div class="col-lg-12">
                <div class="shop-section-title">
                    <h1>최신</h1>
                </div>
            </div>
            <div class="d-flex overflow-auto">
                <!-- Start Single List -->
				 <!-- 115x140 -->
                <div class="single-list me-3">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-12">
                            <div class="product-content">
								<a href="#">
									<img class="default-img" src="https://via.placeholder.com/210x320" alt="#">
								</a>
								<!-- <a href="#" class="buy"></a> -->
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-12 no-padding">
                            <div class="content">
                                <h4 class="title"><a href="#">NEW</a></h4>
                                <p>제목</p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Single List -->
                <!-- Start Single List -->
                <div class="single-list me-3">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-12">
                            <div class="product-content">
								<a href="#">
									<img class="default-img" src="https://via.placeholder.com/210x320" alt="#">
								</a>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-12 no-padding">
                            <div class="content">
                                <h5 class="title"><a href="#">NEW</a></h5>
                                <p>제목</p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Single List -->
                <!-- Start Single List -->
                <div class="single-list me-3">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-12">
                            <div class="product-content">
								<a href="#">
									<img class="default-img" src="https://via.placeholder.com/210x320" alt="#">
								</a>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-12 no-padding">
                            <div class="content">
                                <h5 class="title"><a href="#">NEW</a></h5>
                                <p>제목</p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Single List -->
            </div>
            <!-- 랭킹 섹션 -->
            <div class="col-lg-12 mt-4">
                <div class="shop-section-title">
                    <h1>랭킹</h1>
                </div>
            </div>
            <div class="d-flex overflow-auto">
				<!-- 가로형 -->
                <!-- Start Single List -->
                <div class="single-list me-3">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-12">
                            <div class="product-content">
								<a href="#">
									<img class="default-img" src="https://via.placeholder.com/210x320" alt="#">
								</a>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-12 no-padding">
                            <div class="content">
                                <h5 class="title"><a href="#">1st</a></h5>
                                <p>제목</p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Single List -->
                <!-- Start Single List -->
                <div class="single-list me-3">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-12">
                            <div class="product-content">
								<a href="#">
									<img class="default-img" src="/../resources/template/images/랭킹용 인사이드미.png" alt="#">
								</a>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-12 no-padding">
                            <div class="content">
                                <h5 class="title"><a href="#">2st</a></h5>
                                <p>제목</p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Single List -->
                <!-- Start Single List -->
                <div class="single-list me-3">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-12">
                            <div class="product-content">
								<a href="#">
									<img class="default-img" src="https://via.placeholder.com/210x320" alt="#">
								</a>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-12 no-padding">
                            <div class="content">
                                <h5 class="title"><a href="#">3st</a></h5>
                                <p>제목</p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Single List -->
            </div>
        </div>
    </div>
</section>
<!-- End Shop Home List -->

	
	<!-- Start Shop Blog  -->
	<!-- 게시판부분 -->
	 <!-- 경로 재지정 필요 -->
	<section class="shop-blog section">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="section-title">
						<h2>고객센터</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 col-md-6 col-12">
					<!-- Start Single Blog  -->
					<div class="shop-single-blog">
						<div class="content">
							<p class="title">Q & A</p>
							<a href="../qna/list.do" class="more-btn"><i class="fa fa-bullhorn"></i></a>
						</div>
					</div>
					<!-- End Single Blog  -->
				</div>
				<div class="col-lg-4 col-md-6 col-12">
					<!-- Start Single Blog  -->
					<div class="shop-single-blog">
						<div class="content">
							<p class="title">FAQ</p>
							<a href="../faq/list.do" class="more-btn"><i class="fa fa-comments-o"></i></a>
						</div>
					</div>
					<!-- End Single Blog  -->
				</div>
				<div class="col-lg-4 col-md-6 col-12">
					<!-- Start Single Blog  -->
					<div class="shop-single-blog">
						<div class="content">
							<p class="title">게시판</p>
							<a href="../board/list.do" class="more-btn"><i class="fa fa-calendar"></i></a>
						</div>
					</div>
					<!-- End Single Blog  -->
				</div>
			</div>
		</div>
	</section>
	<!-- End Shop Blog  -->
	

	<!-- 밑의 푸터 부분 검은 공간 -->

	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>