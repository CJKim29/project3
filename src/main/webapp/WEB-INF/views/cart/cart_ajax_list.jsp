<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fn"
uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
  <head>
    <script>
// 장바구니 삭제 함수 (confirm 여부를 제어할 수 있음)
function cart_delete(cart_idx, showConfirm) {
    if (showConfirm && confirm("정말 삭제하시겠습니까?") == false) return;

    // 바로 삭제 요청
    location.href = "delete.do?cart_idx=" + cart_idx;
}

// 결제 전에 좌석 예약 여부를 체크하는 함수
function check_seat(cart_idx,performance_idx,date) {
  // 모든 좌석 정보를 가져옵니다.
  let seatElements = document.querySelectorAll('.seat-info');
  let seatInfo = [];

  // 각 좌석 이름을 배열에 추가
  seatElements.forEach(function(seat) {
    seatInfo.push(seat.textContent.trim());
  });

  // 좌석 정보를 쉼표로 구분된 문자열로 변환
  let seatInfoStr = seatInfo.join(',');

    $.ajax({
        url: '/cart/check_seat.do',  // 좌석 예약 여부를 체크하는 컨트롤러 경로
        type: 'GET',
        data: { cart_idx: cart_idx },
        success: function(result) {
            if (result === true) {
                alert("이미 예매된 좌석이 포함되어 있습니다. 해당 항목을 삭제합니다.");
                cart_delete(cart_idx, false);  // 바로 삭제 (confirm 메시지 없음)
            }
            
            else if (result === false) {
              location.href = "../book/reserve_seats.do?cart_idx=" + cart_idx + "&performance_idx=" + performance_idx + "&date=" + date + "&seatInfo=" + encodeURIComponent(seatInfoStr);;  // 예매 페이지로 이동
            }
        },
        error: function() {
            alert("좌석 예약 여부를 확인하는 중 오류가 발생했습니다.");
        }
    });
}
     </script> 
  </head>
  <body>
    <!-- Shopping Cart -->
    <div class="shopping-cart section" style="padding-bottom: 200px;">
      <div class="container">
        <div class="row">
          <div class="col-12">
            <!-- Shopping Summery -->
            <h4>장바구니</h4>
            <table class="table shopping-summery">
              <thead>
                <tr class="main-hading">
                   <th class="text-center">공연</th> 
                  <!-- <th class="text-center">공연명</th> -->
                  <th class="text-center">공연장</th>
                  <th class="text-center">공연날짜</th>
                  <th class="text-center">좌석정보</th>
                  <th class="text-center">가격</th>
                  <th class="text-center">결제/삭제</th>
                </tr>
              </thead>
              <tbody>
                <c:if test="${ empty list }">
                <font color="red">담긴 티켓이 없습니다.</font>
                  <tr>
                    <td colspan="5" align="center">
                    </td>
                  </tr>
                </c:if>
                 <c:forEach var="vo" items="${ list }">
                  <tr>
                    <td class="image" data-title="No"><img src="../resources/images/${ vo.performance_image }" alt="#"><br>
                      <div style="max-width: 90px; font-weight: bold;">${ vo.performance_name }</div></td> 

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
                        <span class="seat-info">${seat.cart_seat_name}</span><br />
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
                      <input type="hidden" name="performance_idx" value="${ vo.performance_idx }">
                      <input type="button" value="결제" onclick="check_seat('${ vo.cart_idx }', '${ vo.performance_idx }', '${ vo.reserved_performance_date }');">
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
  </body>
</html>