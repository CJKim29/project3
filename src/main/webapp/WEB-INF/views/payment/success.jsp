<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

  <!DOCTYPE html>
  <html>

  <head>
   <meta charset="UTF-8">
   <title>Insert title here</title>
  </head>

  <body>

   <h3>결제가 완료되었습니다</h3>
   <c:forEach var="ordersVo" items="${ list }">
    <c:forEach var="ordersSeatVo" items="${ordersVo.seatList}">

     <div>주문번호 : ${ordersVo.order_idx}</div>
     <div>공연명 : ${ordersVo.performance_name}</div>
     <div>공연장 : ${ordersVo.hall_name}</div>
     <div>공연일자 : ${ordersVo.reserved_performance_date}</div>
     <div>좌석 : ${ordersSeatVo.seat_grade}, ${ordersSeatVo.order_seat_name}</div>
     <div>결제 일자 : ${ordersVo.order_date}</div>
     <div>결제 금액 : ${ordersVo.order_amount}원</div>
     <div>포인트 할인 : ${used_point2}</div>
     <div>예매자 정보</div>
     <div>예매자 이름 : ${user.mem_name}</div>
     <div>휴대폰 번호 : ${user.mem_phone}</div>

     <br>

    </c:forEach>
   </c:forEach>

   <!-- <input type="button" onclick="window.close();" value="홈으로" /> -->
   <input type="button" onclick="location.href='../main/list.do';" value="홈으로" />
   <div>결제 내역 보기</div>

  </body>

  </html>