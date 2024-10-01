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
											<c:if test="${not empty randomRomanticPerformances}">
												<c:forEach var="performance" items="${randomRomanticPerformances}">
													<div class="col-xl-3 col-lg-4 col-md-4 col-12">
														<div class="single-product">
															<div class="product-img">
																<a href="../detail/detail.do?performance_idx=${performance.performance_idx}">
																	<img class="default-img" src="${pageContext.request.contextPath}/resources/images/${performance.performance_image}" alt="${performance.performance_name}" style="width: 250px; height: 380px;">
																</a>
															</div>
															<div class="product-content">
																<div>
																	<h3>
																		<span style="font-size: small;">[${performance.performance_cate_name}]</span>
																		<a href="../detail/detail.do?performance_idx=${performance.performance_idx}">
																			${performance.performance_name}
																		</a>
																	</h3>
																</div>
																<div class="product-price">
																	<span>${performance.hallVo.hall_area} &gt; ${performance.hallVo.hall_name}</span>
																</div>
															</div>
														</div>
													</div>
												</c:forEach>
											</c:if>
											<c:if test="${empty randomRomanticPerformances}">
												<p>공연 정보가 없습니다.</p>
											</c:if>
										</div>
									</div>
								</div>
								
								
								<!--/ End Single Tab -->

								<!-- 드라마 장르2 부분 -->
								<div class="tab-pane fade" id="performance2" role="tabpanel">
									<div class="tab-single">
										<div class="row">
											<c:if test="${not empty randomDramaPerformances}">
											<c:forEach var="performance" items="${randomDramaPerformances}">
											<div class="col-xl-3 col-lg-4 col-md-4 col-12">
												<div class="single-product">
													<div class="product-img">
														<a href="../detail/detail.do?performance_idx=${performance.performance_idx}">
															<img class="default-img" src="${pageContext.request.contextPath}/resources/images/${performance.performance_image}" alt="${performance.performance_name}" style="width: 250px; height: 380px;">
														</a>
													</div>
													<div class="product-content">
														<h3>
															<span style="font-size: small;">[${performance.performance_cate_name}]</span>
															<a href="../detail/detail.do?performance_idx=${performance.performance_idx}">
																${performance.performance_name}
															</a>
														</h3>
														<div class="product-price">
															<span>${performance.hallVo.hall_area} &gt; ${performance.hallVo.hall_name}</span>
														</div>
													</div>
												</div>
											</div>
											</c:forEach>
											</c:if>
											<c:if test="${empty randomDramaPerformances}">
												<p>공연 정보가 없습니다.</p>
											</c:if>
										</div>
									</div>
								</div>
								<!--/ End Single Tab -->

								<!-- 퍼포먼스 장르3 부분 -->
								<div class="tab-pane fade" id="performance3" role="tabpanel">
									<div class="tab-single">
										<div class="row">
											<c:if test="${not empty randomPerformancePerformances}">
											<c:forEach var="performance" items="${randomPerformancePerformances}">
											<div class="col-xl-3 col-lg-4 col-md-4 col-12">
												<div class="single-product">
													<div class="product-img">
														<a href="../detail/detail.do?performance_idx=${performance.performance_idx}">
															<img class="default-img" src="${pageContext.request.contextPath}/resources/images/${performance.performance_image}" alt="${performance.performance_name}" style="width: 250px; height: 380px;">
														</a>
													</div>
													<div class="product-content">
														<h3>
															<span style="font-size: small;">[${performance.performance_cate_name}]</span>
															<a href="../detail/detail.do?performance_idx=${performance.performance_idx}">
																${performance.performance_name}
															</a>
														</h3>
														<div class="product-price">
															<span>${performance.hallVo.hall_area} &gt; ${performance.hallVo.hall_name}</span>
														</div>
													</div>
												</div>
											</div>
											</c:forEach>
											</c:if>
												<c:if test="${empty randomDramaPerformances}">
													<p>공연 정보가 없습니다.</p>
												</c:if>
										</div>
									</div>
								</div>
								<!--/ End Single Tab -->

								<!-- 장르4 부분 -->
								<div class="tab-pane fade" id="performance4" role="tabpanel">
									<div class="tab-single">
										<div class="row">
											<c:if test="${not empty randomHorrorPerformances}">
											<c:forEach var="performance" items="${randomHorrorPerformances}">
											<div class="col-xl-3 col-lg-4 col-md-4 col-12">
												<div class="single-product">
													<div class="product-img">
														<a href="../detail/detail.do?performance_idx=${performance.performance_idx}">
															<img class="default-img" src="${pageContext.request.contextPath}/resources/images/${performance.performance_image}" alt="${performance.performance_name}" style="width: 250px; height: 380px;">
														</a>
													</div>
													<div class="product-content">
														<h3>
															<span style="font-size: small;">[${performance.performance_cate_name}]</span>
															<a href="../detail/detail.do?performance_idx=${performance.performance_idx}">
																${performance.performance_name}
															</a>
														</h3>
														<div class="product-price">
															<span>${performance.hallVo.hall_area} &gt; ${performance.hallVo.hall_name}</span>
														</div>
													</div>
												</div>
											</div>
											</c:forEach>
											</c:if>
												<c:if test="${empty randomDramaPerformances}">
													<p>공연 정보가 없습니다.</p>
												</c:if>
										</div>
									</div>
								</div>
								<!--/ End Single Tab -->
							

								<!-- 장르5 부분 -->
								<div class="tab-pane fade" id="performance5" role="tabpanel">
									<div class="tab-single">
										<div class="row">
											<c:if test="${not empty randomChildrenPerformances}">
											<c:forEach var="performance" items="${randomChildrenPerformances}">
											<div class="col-xl-3 col-lg-4 col-md-4 col-12">
												<div class="single-product">
													<div class="product-img">
														<a href="../detail/detail.do?performance_idx=${performance.performance_idx}">
															<img class="default-img" src="${pageContext.request.contextPath}/resources/images/${performance.performance_image}" alt="${performance.performance_name}" style="width: 250px; height: 380px;">
														</a>
													</div>
													<div class="product-content">
														<h3>
															<span style="font-size: small;">[${performance.performance_cate_name}]</span>
															<a href="../detail/detail.do?performance_idx=${performance.performance_idx}">
																${performance.performance_name}
															</a>
														</h3>
														<div class="product-price">
															<span>${performance.hallVo.hall_area} &gt; ${performance.hallVo.hall_name}</span>
														</div>
													</div>
												</div>
											</div>
											</c:forEach>
											</c:if>
												<c:if test="${empty randomDramaPerformances}">
													<p>공연 정보가 없습니다.</p>
												</c:if>
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
									<img class="default-img" src="${pageContext.request.contextPath}/resources/images/${performance.performance_image}" alt="performance_name">
								</a>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-12 no-padding">
							<div class="content">
								<h6 class="title">NEW</h6><br>
								<p id="performanceTitle_${performance.performance_idx}" style="font-size: 14px; color: black;">${performance.performance_name}</p>
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
									<img class="default-img" src="${pageContext.request.contextPath}/resources/images/${performance.performance_image}" alt="performance_name">
								</a>
							</div>
						</div>
						<div class="col-lg-6 col-md-6 col-12 no-padding">
							<div class="content">
								<h6 class="title">${performanceExLike.like_number} ${status.index + 1}등</h6><br>
								<p style="font-size: 15px; color: black;">${performance.performance_name}</p>
							</div>
						</div>
					</div>
				</div>
				</c:if>
				</c:forEach>
       	 	 </div>
   		 </div>
		</div>
	</section>
<!-- End Shop Home List -->

	
	<!-- Start Shop Blog  -->
	<!-- 게시판부분 -->
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

	
<script>
    function formatTitle(title) {
        const splitIndex = Math.floor(title.length / 2); // 중간 인덱스
        const firstPart = title.substring(0, splitIndex).trim();
        const secondPart = title.substring(splitIndex).trim();

        // 길이가 너무 길어지지 않도록 조정 (예: 20자 기준)
        if (firstPart.length > 10) {
            return firstPart.substring(0, 10) + "..<br>" + secondPart;
        }
        return firstPart + "<br>" + secondPart;
    }

    document.querySelectorAll('[id^="performanceTitle_"]').forEach((element) => {
        const title = element.innerText; // 현재 제목
        element.innerHTML = formatTitle(title); // 줄 바꿈 적용
    });
</script>

	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>