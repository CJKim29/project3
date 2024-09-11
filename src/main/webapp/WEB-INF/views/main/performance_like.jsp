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
								<th>공연</th>
								<th>제목</th>
								<th class="text-center">가격</th>
								<th class="text-center">수량</th>
								<th class="text-center">금액</th> 
								<th class="text-center">예매</th> 
								<th class="text-center"><i class="ti-trash remove-icon"></i></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="image" data-title="No"><img src="https://via.placeholder.com/100x100" alt="#"></td>
								<td class="product-des" data-title="Description">
									<p class="product-name"><a href="#">뮤지컬 제목</a></p>
									<p class="product-des"></p>
								</td>
								<td class="price" data-title="Price"><span>가격 </span></td>
								<!-- 금액 -->
								<td class="total-amount" data-title="Total"><span>0</span></td>
								<!-- 예매버튼 -->
								<td class="action" data-title="checkout"><a href="#">예매하기</a></td>
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