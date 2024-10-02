<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <!-- 원화 표시 기능 -->
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

   <!DOCTYPE html>
   <html lang="ko">

   <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>결제 완료</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
     .confirmation-container {
      max-width: 600px;
      margin: 0 auto;
      padding: 20px;
      text-align: center;
      border: 1px solid #f5f5f5;
      border-radius: 8px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
     }

     .confirmation-container .icon {
      font-size: 48px;
      color: #f05b5b;
      margin-bottom: 10px;
     }

     .confirmation-container h3 {
      font-size: 24px;
      font-weight: bold;
      margin-bottom: 20px;
     }

     .confirmation-container .details {
      text-align: left;
      margin-bottom: 20px;
     }

     .details div {
      margin-bottom: 10px;
      font-size: 16px;
     }

     .btn-custom {
      background-color: #f05b5b;
      color: white;
      border: none;
      border-radius: 25px;
      padding: 10px 20px;
      font-size: 16px;
     }

     .btn-custom:hover {
      background-color: #e04848;
     }

     .title {
      font-size: 20px !important;
      font-weight: bold;
     }
    </style>

    <script>
     function formatPoints(pointString) {
      // 숫자만 추출
      const numericValue = pointString.replace(/[^0-9]/g, '');

      // 세 자리마다 콤마 추가
      const formattedValue = Number(numericValue).toLocaleString();

      return formattedValue;
     }

     // 결제 일자에서 시간 제거
     function formatDate(dateString) {
      // 'YYYY-MM-DD HH:MM:SS' 형식의 문자열에서 날짜 부분만 추출
      return dateString.split(' ')[0];
     }

     // DOM이 로드된 후 포인트 포맷팅 및 날짜 포맷팅
     document.addEventListener("DOMContentLoaded", function () {
      const usedPointElement = document.getElementById("used-point");
      const usedPointValue = usedPointElement.textContent;

      // 포인트 포맷팅
      const formattedPoint = formatPoints(usedPointValue);
      usedPointElement.textContent = formattedPoint + 'P';

      const orderDateElement = document.getElementById("order-date");
      const orderDateValue = orderDateElement.textContent;

      // 결제 일자 포맷팅
      const formattedDate = formatDate(orderDateValue);
      orderDateElement.textContent = formattedDate;
     });

     // 다른 페이지 이동 시 새 창 닫고 원래 창에서 이동
     function redirectHome(url) {
      // 부모 창으로 리다이렉션
      window.opener.location.href = url;

      // 새 창 닫기
      window.close();
     }
    </script>

    <!-- 구매내역보기 버튼 클릭 시 마이페이지로 이동 -->
    <script>
     function goToMyPaymentList() {
      // 부모 창으로 리다이렉션할 URL, 상태를 쿼리 파라미터로 전달
      const url = '/mypage/mypage.do?show=paymentList&active=true';

      // 부모 창으로 리다이렉션
      window.opener.location.href = url;

      // 새 창 닫기 (부모 창이 열릴 때까지 약간의 지연을 줌)
      setTimeout(() => {
       window.close();
      }, 100);  // 100ms 정도의 지연을 줌
     }

    </script>

   </head>

   <body>
    <div class="confirmation-container">
     <div class="icon">
      <i class="fas fa-check-circle"></i>
     </div>
     <h3>결제가 완료되었습니다</h3>
     <hr>

     <div class="details">
      <c:forEach var="ordersVo" items="${list}">
       <c:forEach var="ordersSeatVo" items="${ordersVo.seatList}">
        <div class="title">주문 정보</div>
        <div>주문번호: <strong>${ordersVo.order_idx}</strong></div>
        <div>공연명: <strong>${ordersVo.performance_name}</strong></div>
        <div>공연장: <strong>${ordersVo.hall_name}</strong></div>
        <div>공연일자: <strong>${ordersVo.reserved_performance_date}</strong></div>
        <div>좌석: <strong>${ordersSeatVo.seat_grade}석 ${ordersSeatVo.order_seat_name}</strong></div>
        <div>결제 일자: <strong id="order-date">${ordersVo.order_date}</strong></div>
        <div>결제 금액: <strong>
          <fmt:formatNumber type="number" value="${ordersVo.order_amount}" />원
         </strong></div>

        <div>포인트 할인: <strong id="used-point">${used_point2}</strong></div>
        <br>
        <div>
         <div class="title">예매자 정보</div>
        </div>
        <div>이름: <strong>${user.mem_name}</strong></div>
        <div>휴대폰 번호: <strong>${user.mem_phone}</strong></div>
        <hr>
       </c:forEach>
      </c:forEach>
     </div>

     <button class="btn btn-custom" onclick="redirectHome('../main/list.do');">홈으로</button>

     <button id="viewPaymentList" class="btn btn-custom" onclick="goToMyPaymentList()">구매내역 보기</button>

    </div>
    </div>

    <!-- Bootstrap 4 JavaScript and FontAwesome for icons -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>



   </body>

   </html>