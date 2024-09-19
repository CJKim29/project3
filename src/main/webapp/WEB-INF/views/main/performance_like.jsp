<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">
<head>

	<jsp:include page="/WEB-INF/views/include/header.jsp"/>
</head>
<body class="js">
			
	<!-- Shopping Cart -->
	<div class="shopping-cart section">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<!-- Shopping Summery -->
					 <h4>장바구니</h4>
					<table class="table shopping-summery">
						<thead>
							<tr class="main-hading">
								<!-- <th class="text-center">공연</th> -->
								<th class="text-center">제목</th>
								<th class="text-center">좌석번호</th>
								<th class="text-center">수량</th>
								<th class="text-center">금액</th>  
								<th class="text-center">취소</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<!-- <td class="image" data-title="No"><img src="https://via.placeholder.com/100x100" alt="#"></td> -->
								<!-- 제목 -->
								<td class="product-des" data-title="Description">
									<p class="product-name"><a href="#">뮤지컬 제목</a></p>
								</td>
								<!-- 좌석번호 -->
								<td class="price" data-title="Price"><span>좌석</span></td>
								<!-- 수량 -->
								<td class="total-amount" data-title="Total"><span>0</span></td>
								<!-- 금액 -->
								<td class="action" data-title="checkout">금액</td>
								<!-- 취소 -->
								<td class="action" data-title="Remove"><a href="#"><i class="ti-trash remove-icon"></i></a></td>
							</tr>
						</tbody>
					</table>
					<!--/ End Shopping Summery -->
				</div>
			</div>
		</div>
	</div>
	<!--/ End Shopping Cart -->
			
		<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>