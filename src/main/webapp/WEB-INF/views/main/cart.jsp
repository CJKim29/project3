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
								<th class="text-center">공연명</th>
								<th class="text-center">공연장</th>
								<th class="text-center">공연시작날짜</th>
								<th class="text-center">예매 좌석정보</th> 
								<th class="text-center">가격</th> 
								<th class="text-center">취소</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${cartItems}">
                                <tr>
                                    <td class="text-center">${item.performanceName}</td>
                                    <td class="text-center">${item.hallName}</td>
                                    <td class="text-center">${item.reserved_performace_date}</td>
                                    <td class="text-center">${item.cart_seat_name}</td>
                                    <td class="text-center">${item.price}</td>
                                    <td class="text-center">
                                        <a href="removeFromCart.do?itemId=${item.id}" class="btn btn-danger">취소</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty cartItems}">
                                <tr>
                                    <td colspan="6" class="text-center">장바구니가 비어 있습니다.</td>
                                </tr>
                            </c:if>
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