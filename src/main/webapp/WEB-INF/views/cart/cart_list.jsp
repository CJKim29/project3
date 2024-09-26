<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fn"
uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="zxx">
  <head>
    <jsp:include page="/WEB-INF/views/include/header.jsp" />
    <script>
// 장바구니 삭제 함수 (confirm 여부를 제어할 수 있음)
function cart_delete(cart_idx, showConfirm) {
    if (showConfirm && confirm("정말 삭제하시겠습니까?") == false) return;

    // 바로 삭제 요청
    location.href = "delete.do?cart_idx=" + cart_idx;
}

// 결제 전에 좌석 예약 여부를 체크하는 함수
function check_seat(cart_idx) {
    $.ajax({
        url: '/cart/check_seat.do',  // 좌석 예약 여부를 체크하는 컨트롤러 경로
        type: 'GET',
        data: { cart_idx: cart_idx },
        success: function(result) {
            // 서버에서 'reserved'를 반환하면 경고 메시지 및 장바구니 삭제
            if (result === 'reserved') {
                alert("이미 예매된 좌석이 포함되어 있습니다. 해당 항목을 삭제합니다.");
                cart_delete(cart_idx, false);  // 바로 삭제 (confirm 메시지 없음)
            }
            // 'available'을 반환하면 결제 페이지로 이동
            else if (result === 'available') {
                location.href = "/cart/payment.do?cart_idx=" + cart_idx;  // 결제 페이지로 이동(이후 경로 수정)
            }
        },
        error: function() {
            alert("좌석 예약 여부를 확인하는 중 오류가 발생했습니다.");
        }
    });
}
     </script> 
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
                   <th class="text-center">공연</th> 
                  <th class="text-center">공연명</th>
                  <th class="text-center">공연장</th>
                  <th class="text-center">공연날짜</th>
                  <th class="text-center">예매 좌석정보</th>
                  <th class="text-center">가격</th>
                  <th class="text-center">결제/삭제</th>
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
                    <td class="image" data-title="No"><img src="../resources/images/${ vo.performance_image }" alt="#"></td> 
                    <!-- 공연명 -->
                    <td class="product-des" data-title="Description">
                      <p class="product-name">
                        ${ vo.performance_name }
                        <!-- <a></a> -->
                      </p>
                    </td>
                    <!-- 공연장 -->
                    <td class="price" data-title="Price">
                        ${ vo.hall_name }
                      <!-- <span></span> -->
                    </td>
                    <!-- 공연날짜 -->
                    <td class="price" data-title="Price">
                      ${ vo.reserved_performance_date }
                      <!-- <span></span> -->
                    </td>
                    <!-- 예매 좌석정보 -->
                    <td class="total-amount" data-title="Total">
                      <c:forEach var="seat" items="${vo.seatList}">
                           ${seat.cart_seat_name} <br />
                      </c:forEach>
                    </td>
                    <!-- 금액 -->
                    <td class="action" data-title="checkout">
                      <span><c:forEach var="seat" items="${vo.seatList}">
                        ${seat.seat_grade}석 / ${seat.seat_price}원<br />
                      </c:forEach></span>
                    </td>
                    <!-- 결제/취소 -->
                    <td class="action" data-title="Remove">
                      <input type="button" value="결제" onclick="check_seat('${ vo.cart_idx }');">
                      <input type="button" value="삭제" onclick="cart_delete('${ vo.cart_idx }', true);">
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