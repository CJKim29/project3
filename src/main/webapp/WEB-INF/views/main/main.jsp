<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">
<head>

<style>

.admin-btns {
    display: flex; /* 버튼들을 가로로 배치 */
    gap: 0px; /* 버튼 사이의 간격 */
}

.admin-btns .btn {
    font-size: 12px; /* 버튼 글자 크기 조정 */
    padding: 5px 10px; /* 버튼 안쪽 여백 조정 */
    height: 25px; /* 버튼 높이 조정 */
    line-height: 1; /* 줄 높이 조정 */
}

</style>

	
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
						 <a href="../detail/detail.do?performance_idx=4">
							<div class="big-content" style="background-image: url('/../resources/template/images/슬라이드용시카고2.png');">
							</div>
						</a>
						<a href="../detail/detail.do?performance_idx=8">
							<div class="big-content" style="background-image: url('/../resources/template/images/슬라이드용킹키부츠2.png');">
							</div>
						</a>
						<a href="../detail/detail.do?performance_idx=17">
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
								<ul class="nav nav-tabs" id="myTab" role="tablist">
									<li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#performance1" role="tab">로맨틱코미디</a></li>
									<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#performance2" role="tab">드라마</a></li>
									<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#performance3" role="tab">퍼포먼스</a></li>
									<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#performance4" role="tab">공포&스릴러</a></li>
									<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#performance5" role="tab">어린이</a></li>
								</ul>
								<!--/ End Tab Nav -->
							</div>
							<div class="tab-content" id="myTabContent">
								<!-- Start Single Tab -->
								 <!-- 뮤지컬 부분 -->
								  <!-- 이미지 수정필요 -->
								  <!-- 로맨틱코미디장르1 -->
								<div class="tab-pane fade show active" id="performance1" role="tabpanel">
									<div class="tab-single">
										<div class="row">
											<div class="col-xl-3 col-lg-4 col-md-4 col-12">
												<div class="single-product">
													<div class="product-img">
														<!-- 관리자 수정, 삭제 버튼 -->
														<div class="admin-btns">
															<a href="main_performance_modi.do" class="btn btn-warning btn-sm">수정</a>	
														</div>						
														<a href="../detail/detail.do?performance_idx=1">
															<!-- 이미지 크기는 550x750  -->
															<!-- 이미지 크기는 550x750  -->
															<img class="default-img" src="/../resources/template/images/장르용 써니텐.png" alt="#">
														</a>
													</div>
													<div class="product-content">
														<h3><a href="../detail/detail.do?performance_idx=1">뮤지컬 써니텐</a></h3>
														<div class="product-price">
															<span>2022.07.08 ~ OPEN RUN</span>
														</div>
													</div>
												</div>
											</div>
											<div class="col-xl-3 col-lg-4 col-md-4 col-12">
												<div class="single-product">
													<div class="product-img">
														<a href="../detail/detail.do?performance_idx=3">
															<img class="default-img" src="/../resources/template/images/장르용 김종욱 찾기.jpg" alt="#">
														</a>
													</div>
													<div class="product-content">
														<h3><a href="../detail/detail.do?performance_idx=3">뮤지컬 김종욱 찾기</a></h3>
														<div class="product-price">
															<span>2024.01.01 ~ OPEN RUN</span>
														</div>
													</div>
												</div>
											</div>
											<div class="col-xl-3 col-lg-4 col-md-4 col-12">
												<div class="single-product">
													<div class="product-img">
														<a href="../detail/detail.do?performance_idx=30">
															<img class="default-img" src="/../resources/template/images/장르용 라면.png" alt="#">
														</a>
													</div>
													<div class="product-content">
														<h3><a href="../detail/detail.do?performance_idx=30">연극 라면</a></h3>
														<div class="product-price">
															<span>2020.01.01 ~ OPEN RUN</span>
														</div>
													</div>
												</div>
											</div>
											<div class="col-xl-3 col-lg-4 col-md-4 col-12">
												<div class="single-product">
													<div class="product-img">
														<a href="../detail/detail.do?performance_idx=29">
															<img class="default-img" src="/../resources/template/images/장르용 은밀한연애.png" alt="#">
														</a>
													</div>
													<div class="product-content">
														<h3><a href="../detail/detail.do?performance_idx=29">연극 은밀한 연애</a></h3>
														<div class="product-price">
															<span>2024.06.15 ~ OPEN RUN</span>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!--/ End Single Tab -->

								<!-- 드라마 장르2 부분 -->
								<div class="tab-pane fade" id="performance2" role="tabpanel">
									<div class="tab-single">
										<div class="row">
											<div class="col-xl-3 col-lg-4 col-md-4 col-12">
												<div class="single-product">
													<div class="product-img">
														<a href="../detail/detail.do?performance_idx=4">
															<img class="default-img" src="/../resources/template/images/장르용 시카고.png" alt="#">
														</a>
													</div>
													<div class="product-content">
														<h3><a href="../detail/detail.do?performance_idx=4">뮤지컬 시카고</a></h3>
														<div class="product-price">
															<span>2024.06.07 ~2024.09.29</span>
														</div>
													</div>
												</div>
											</div>
											<div class="col-xl-3 col-lg-4 col-md-4 col-12">
												<div class="single-product">
													<div class="product-img">
														<a href="../detail/detail.do?performance_idx=5">
															<img class="default-img" src="/../resources/template/images/장르용 부치하난.png" alt="#">
														</a>
													</div>
													<div class="product-content">
														<h3><a href="../detail/detail.do?performance_idx=5">뮤지컬 부치하난</a></h3>
														<div class="product-price">
															<span>2024.09.17 ~2024.11.17</span>
														</div>
													</div>
												</div>
											</div>
											<div class="col-xl-3 col-lg-4 col-md-4 col-12">
												<div class="single-product">
													<div class="product-img">
														<a href="../detail/detail.do?performance_idx=9">
															<img class="default-img" src="/../resources/template/images/장르용 썸데이.png" alt="#">
														</a>
													</div>
													<div class="product-content">
														<h3><a href="../detail/detail.do?performance_idx=9">뮤지컬 썸데이</a></h3>
														<div class="product-price">
															<span>2023.09.01 ~ OPEN RUN</span>
														</div>
													</div>
												</div>
											</div>
											<div class="col-xl-3 col-lg-4 col-md-4 col-12">
												<div class="single-product">
													<div class="product-img">
														<a href="../detail/detail.do?performance_idx=7">
															<img class="default-img" src="/../resources/template/images/장르용 베르사유.png" alt="#">
														</a>
													</div>
													<div class="product-content">
														<h3><a href="../detail/detail.do?performance_idx=7">뮤지컬 베르사유의 장미</a></h3>
														<div class="product-price">
															<span>2024.07.16 ~2024.10.13</span>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!--/ End Single Tab -->

								<!-- 퍼포먼스 장르3 부분 -->
								<div class="tab-pane fade" id="performance3" role="tabpanel">
									<div class="tab-single">
										<div class="row">
											<div class="col-xl-3 col-lg-4 col-md-4 col-12">
												<div class="single-product">
													<div class="product-img">
														<a href="../detail/detail.do?performance_idx=18">
															<img class="default-img" src="/../resources/template/images/장르용 스파이.png" alt="#">
														</a>
													</div>
													<div class="product-content">
														<h3><a href="../detail/detail.do?performance_idx=18">뮤지컬 스파이</a></h3>
														<div class="product-price">
															<span>2024.08.06 ~ 2024.10.27</span>
														</div>
													</div>
												</div>
											</div>
											<div class="col-xl-3 col-lg-4 col-md-4 col-12">
												<div class="single-product">
													<div class="product-img">
														<a href="../detail/detail.do?performance_idx=17">
															<img class="default-img" src="/../resources/template/images/장르용 애니.png" alt="#">
														</a>
													</div>
													<div class="product-content">
														<h3><a href="../detail/detail.do?performance_idx=17">뮤지컬 애니</a></h3>
														<div class="product-price">
															<span>2024.10.01 ~ 2024.10.27</span>
														</div>
													</div>
												</div>
											</div>
											<div class="col-xl-3 col-lg-4 col-md-4 col-12">
												<div class="single-product">
													<div class="product-img">
														<a href="../detail/detail.do?performance_idx=19">
															<img class="default-img" src="/../resources/template/images/장르용 난타.png" alt="#">
														</a>
													</div>
													<div class="product-content">
														<h3><a href="../detail/detail.do?performance_idx=19">뮤지컬 난타</a></h3>
														<div class="product-price">
															<span>2022.07.08 ~ OPEN RUN</span>
														</div>
													</div>
												</div>
											</div>
											<div class="col-xl-3 col-lg-4 col-md-4 col-12">
												<div class="single-product">
													<div class="product-img">
														<a href="../detail/detail.do?performance_idx=21">
															<img class="default-img" src="/../resources/template/images/장르용 페인터즈.png" alt="#">
														</a>
													</div>
													<div class="product-content">
														<h3><a href="../detail/detail.do?performance_idx=21">뮤지컬 페인터즈</a></h3>
														<div class="product-price">
															<span>2024.03.25 ~ 2024.10.31</span>
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
														<a href="../detail/detail.do?performance_idx=15">
															<img class="default-img" src="/../resources/template/images/장르용 하데스.png" alt="#">
														</a>
													</div>
													<div class="product-content">
														<h3><a href="../detail/detail.do?performance_idx=15">뮤지컬 하데스타운</a></h3>
														<div class="product-price">
															<span>	2024.07.12 ~ 2024.10.06</span>
														</div>
													</div>
												</div>
											</div>
											<div class="col-xl-3 col-lg-4 col-md-4 col-12">
												<div class="single-product">
													<div class="product-img">
														<a href="../detail/detail.do?performance_idx=42">
															<img class="default-img" src="/../resources/template/images/장르용 그곳에.png" alt="#">
														</a>
													</div>
													<div class="product-content">
														<h3><a href="../detail/detail.do?performance_idx=42">연극 그곳에 있었다</a></h3>
														<div class="product-price">
															<span>2023.10.11 ~ 2024.09.30</span>
														</div>
													</div>
												</div>
											</div>
											<div class="col-xl-3 col-lg-4 col-md-4 col-12">
												<div class="single-product">
													<div class="product-img">
														<a href="../detail/detail.do?performance_idx=45">
															<img class="default-img" src="/../resources/template/images/장르용 크리미널.png" alt="#">
														</a>
													</div>
													<div class="product-content">
														<h3><a href="../detail/detail.do?performance_idx=45">연극 크리미널 시즌4</a></h3>
														<div class="product-price">
															<span>2023.06.14 ~ OPEN RUN</span>
														</div>
													</div>
												</div>
											</div>
											<div class="col-xl-3 col-lg-4 col-md-4 col-12">
												<div class="single-product">
													<div class="product-img">
														<a href="../detail/detail.do?performance_idx=44">
															<img class="default-img" src="/../resources/template/images/장르용 자취.png" alt="#">
														</a>
													</div>
													<div class="product-content">
														<h3><a href="../detail/detail.do?performance_idx=44">연극 자취</a></h3>
														<div class="product-price">
															<span>2020.02.28 ~ OPEN RUN</span>
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
														<a href="../detail/detail.do?performance_idx=22">
															<img class="default-img" src="/../resources/template/images/장르용 베베핀.png" alt="#">
														</a>
													</div>
													<div class="product-content">
														<h3><a href="../detail/detail.do?performance_idx=22">뮤지컬 베베핀</a></h3>
														<div class="product-price">
															<span>2024.09.01 ~ 2024.09.22</span>
														</div>
													</div>
												</div>
											</div>
											<div class="col-xl-3 col-lg-4 col-md-4 col-12">
												<div class="single-product">
													<div class="product-img">
														<a href="../detail/detail.do?performance_idx=48">
															<img class="default-img" src="/../resources/template/images/장르용 아빠와난.png" alt="#">
														</a>
													</div>
													<div class="product-content">
														<h3><a href="../detail/detail.do?performance_idx=48">연극 아빠와 난 초등 1학년</a></h3>
														<div class="product-price">
															<span>2024.10.11 ~ 2024.10.13</span>
														</div>
													</div>
												</div>
											</div>
											<div class="col-xl-3 col-lg-4 col-md-4 col-12">
												<div class="single-product">
													<div class="product-img">
														<a href="../detail/detail.do?performance_idx=23">
															<img class="default-img" src="/../resources/template/images/장르용 어린왕자.png" alt="#">
														</a>
													</div>
													<div class="product-content">
														<h3><a href="../detail/detail.do?performance_idx=23">뮤지컬 어린왕자</a></h3>
														<div class="product-price">
															<span>2024.08.02 ~ 2024.09.29</span>
														</div>
													</div>
												</div>
											</div>
											<div class="col-xl-3 col-lg-4 col-md-4 col-12">
												<div class="single-product">
													<div class="product-img">
														<a href="../detail/detail.do?performance_idx=24">
															<img class="default-img" src="/../resources/template/images/장르용 어린이캣.png" alt="#">
														</a>
													</div>
													<div class="product-content">
														<h3><a href="../detail/detail.do?performance_idx=24">뮤지컬 오리지널 어린이 캣</a></h3>
														<div class="product-price">
															<span>2024.10.30 ~ 2024.11.20</span>
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
	 <!-- 추천공연 end -->
	
	
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
				<c:forEach var="performance" items="${newPerformances}" varStatus="status">
				<c:if test="${status.index < 3}"> <!--공연정보 3개만 출력 -->
                <!-- Start Single List -->
				 <!-- 115x140 -->
				 <!-- 210x320 -->
                <div class="single-list me-3">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-12">
                            <div class="product-content">
								<!-- 상대경로${pageContext.request.contextPath} performance idx  -->
	                            <a href="${pageContext.request.contextPath}/detail/detail.do?performance_idx=${performance.performance_idx}">
									<img class="default-img" src="${pageContext.request.contextPath}/resources/images/${performance.performance_image}" alt="#" style="width: 210px; height: 320px;">
								</a>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-12 no-padding">
							<div class="content">
								<h6 class="title">NEW</h6><br>
								<p style="font-size: 12px;">${performance.performance_name}</p>
							</div>
						</div>
					</div>
				</div>
			</c:if>
		</c:forEach>
                <!-- End Single List -->
	 </div>
            <!-- 랭킹 섹션 -->
            <div class="col-lg-12 mt-4">
                <div class="shop-section-title">
                    <h1>랭킹</h1>
                </div>
            </div>
            <div class="d-flex overflow-auto">
				<c:forEach var="performance" items="${rankingPerformances}" varStatus="status">
				<c:if test="${status.index < 3}"> <!--랭킹정보 3개만 출력 -->
				<!-- 가로형 -->
                <!-- Start Single List -->
                <div class="single-list me-3">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-12">
                            <div class="product-content">
	                            <a href="${pageContext.request.contextPath}/detail/detail.do?performance_idx=${performance.performance_idx}">
									<img class="default-img" src="${pageContext.request.contextPath}/resources/images/${performance.performance_image}" alt="#">
								</a>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-12 no-padding">
							<div class="content">
								<h6 class="title">${performanceExLike.like_number} ${status.index + 1}st</h6><br>
								<p style="font-size: 12px;">${performance.performance_name}</p>
							</div>
						</div>
					</div>
				</div>
				</c:if>
				</c:forEach>
       	 </div>
   		 </div>
	</section>
<!-- End Shop Home List -->

	
	<!-- Start Shop Blog  -->
	<!-- 게시판부분 -->
	 <!-- 경로 재지정 필요함 -->
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