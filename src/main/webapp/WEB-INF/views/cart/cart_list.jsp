<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fn"
uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="zxx">
  <head>
    <jsp:include page="/WEB-INF/views/include/header.jsp" />
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
                  <th class="text-center">공연날짜</th>
                  <th class="text-center">예매 좌석정보</th>
                  <th class="text-center">가격</th>
                  <th class="text-center">취소</th>
                </tr>
              </thead>
              <tbody>
                <c:if test="${ empty list }">
                  <tr>
                    <td colspan="5" align="center">
                      <font color="red">담긴 티켓이 없습니다</font>
                    </td>
                  </tr>
                </c:if>
                <c:forEach var="vo" items="${ list }">
                  <tr>
                    <!-- <td class="image" data-title="No"><img src="https://via.placeholder.com/100x100" alt="#"></td> -->
                    <!-- 제목 -->
                    <td class="product-des" data-title="Description">
                      <p class="product-name">
                        <a>${ vo.performance_name }</a>
                      </p>
                    </td>
                    <!-- 공연장 -->
                    <td class="price" data-title="Price">
                      <span>${ vo.hall_name }</span>
                    </td>
                    <!-- 공연날짜 -->
                    <td class="price" data-title="Price">
                      <span>${ param.date }</span>
                    </td>
                    <!-- 예매 좌석정보 -->
                    <td class="total-amount" data-title="Total">
                      <span
                        ><c:forEach var="info" items="${seatInfo}">
                          ${info}<br /> </c:forEach
                      ></span>
                    </td>
                    <!-- 금액 -->
                    <td class="action" data-title="checkout">금액</td>
                    <!-- 취소 -->
                    <td class="action" data-title="Remove">
                      <a href="#"><i class="ti-trash remove-icon"></i></a>
                    </td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
            <!--/ End Shopping Summery -->
          </div>
        </div>
      </div>
    </div>
    <!--/ End Shopping Cart -->

    <jsp:include page="/WEB-INF/views/include/footer.jsp" />
  </body>
</html>
