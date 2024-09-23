<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
			<!-- 원화 표시 기능 -->
			<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

				<!DOCTYPE html>
				<html lang="ko">

				<head>

					<style>
						#performance_list {
							display: flex;
							flex-wrap: wrap;
							justify-content: space-between;
							margin-bottom: 100px !important;
						}

						.content_wrap {
							width: 30% !important;
							/* 각 요소의 너비 설정 */
							margin-bottom: 50px !important;

							/* display: flex;
							flex-direction: column;
							align-items: center; */
							/* 컨텐츠를 중앙 정렬 */
						}

						.performance_img {
							width: 100%;
							/* 컨테이너에 맞춰 이미지 크기를 동일하게 */
							height: 500px;
							/* 이미지 높이 고정 */
							object-fit: cover;
							/* 이미지가 크기에 맞춰 잘리더라도 동일한 비율 유지 */
							margin-bottom: 20px;
						}

						.performance_cate {
							font-size: 15px !important;
							color: gray;
							margin-bottom: 10px;
						}

						.performance_name {
							font-size: 23px;
							font-weight: bold;
							margin-top: 10px;
							margin-bottom: 10px !important;

							overflow: hidden;
							white-space: nowrap;
							text-overflow: ellipsis;
							word-break: break-all;
							line-height: 30px;
							/* 공연명 위에 잘리는 현상 해결 위함*/

						}

						.area {
							margin-bottom: 10px;
						}

						.performance_price {
							font-size: 20px;
							font-weight: bold;
							margin-bottom: 10px;
							text-align: right;

						}

						.admin_btns {
							display: flex;
							justify-content: space-around;
							/* 버튼을 가로로 정렬하고 고르게 배치 */
							width: 100%;
							/* 버튼 컨테이너의 너비를 100%로 설정 */
						}

						.admin_btns input {
							padding: 10px 5px 10px 5px;

							flex: 1;
							/* 버튼 크기 동일하게 설정 */
							margin: 0 3px;
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
					</style>

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

						// 공연 삭제
						function del(performance_idx) {
							if (confirm("정말 삭제하시겠습니까?") == false) return;
							location.href = "delete.do?performance_idx=" + performance_idx;
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

									<div id="performance_list">

										<c:forEach var="vo" items="${ performance_list }">
											<div class="content_wrap">
												<img class="performance_img"
													src="../resources/images/${ vo.performance_image }"
													onclick="location.href='../detail/detail.do?performance_idx=${vo.performance_idx}'">

												<div>공연상태 : ${vo.performance_state}</div>
												<div class="performance_cate">
													${vo.performanceCateVo.performance_cate_name }
													&gt; ${ vo.performanceDetailCateVo.performance_detail_cate_name
													}
												</div>

												<div class="performance_name" title="${vo.performance_name}">${
													vo.performance_name}</div>

												<!-- 지역 정보 -->
												<div class="area">
													${vo.hallVo.hall_area} &gt;
													${vo.hallVo.hall_name}
												</div>

												<!-- 가격 정보 -->
												<div class="performance_price">
													<c:forEach var="seat" items="${vo.seatList}" begin="0" end="0">
														<!-- 가격 표시 : 숫자 3자리마다 , 찍기 -->
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
									<c:if test="${ empty requestScope.performance_list }">
										<div id="empty_msg">
											<div class="empty_msg1">이용 가능한 티켓이 없습니다</div>
											<div class="empty_msg2">다른 검색 조건으로 조회해보세요!</div>
										</div>
									</c:if>

									<!-- PageMenu -->
									<div style="text-align: center; margin: auto">${ pageMenu }</div>

									<jsp:include page="/WEB-INF/views/include/footer.jsp" />
				</body>

				</html>