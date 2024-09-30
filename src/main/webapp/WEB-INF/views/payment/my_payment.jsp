<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
   <!DOCTYPE html>
   <html>

   <head>
    <script>

     // 구매 내역 조회
     function myPayment() {
      $.ajax({
       url: '/payment/list.do',  // 좌석 예약 여부를 체크하는 컨트롤러 경로
       type: 'GET',
       data: {
        order_idx: order_idx,
        mem_idx: mem_idx
       },
       success: function (result) {
        // 응답이 성공적으로 돌아왔을 때, 내용을 .content에 삽입
        $('.content').html(response);
       },
       error: function (xhr, status, error) {
        console.error('AJAX 요청 실패:', status, error);
        $('.content').html('<p>구매 내역을 불러오는 데 실패했습니다.</p>');
       }
      });
     }
    </script>
   </head>

   <body>
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
           <th class="text-center">공연장</th>
           <th class="text-center">공연날짜</th>
           <th class="text-center">좌석정보</th>
           <th style="width: 15%;" class="text-center">가격</th>
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
            <td class="image" data-title="No"><img src="../resources/images/${ vo.performance_image }" alt="#"><br>
             <div style="max-width: 90px; font-weight: bold;">${ vo.performance_name }</div>
            </td>
            <!-- 공연장 -->
            <td class="price" data-title="Price">
             ${ vo.hall_name }
            </td>
            <!-- 공연날짜 -->
            <td class="price" data-title="Price">
             ${ vo.reserved_performance_date }
            </td>
            <!-- 예매 좌석정보 -->
            <td class="total-amount" data-title="Total">
             <c:forEach var="seat" items="${vo.seatList}">
              ${seat.cart_seat_name} <br />
             </c:forEach>
            </td>
            <!-- 금액 -->
            <td class="action" data-title="checkout">
             <span>
              <c:forEach var="seat" items="${vo.seatList}">
               ${seat.seat_grade}석 / ${seat.seat_price}원<br />
              </c:forEach>
             </span>
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
   </body>

   </html>