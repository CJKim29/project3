<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <!DOCTYPE html>
    <html lang="ko">

    <head>
     <!-- 부트스트랩 4 CSS 링크 -->
     <!-- <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet"> -->

     <style>

     </style>
    </head>

    <body>
     <!-- Shopping Cart -->
     <div class="shopping-cart section" style="padding-bottom: 100px;">
      <div class="container">
       <div class="row">
        <div class="col-12">
         <!-- Shopping Summery -->
         <h4 class="text-center mb-4">구매 내역</h4>
         <table class="table shopping-summery">
          <thead>
           <tr class="main-hading">
            <th class="text-center" style="width: 10%;">주문 번호</th>
            <th class="text-center" style="width: 15%;">공연</th>
            <th class="text-center" style="width: 20%;">공연장</th>
            <th class="text-center" style="width: 15%;">공연 날짜</th>
            <th class="text-center" style="width: 15%;">좌석 정보</th>
            <th class="text-center" style="width: 15%;">결제 금액</th>

           </tr>
          </thead>
          <tbody>
           <c:if test="${empty list}">
            <tr>
             <td colspan="6" class="empty-message">
              구매 내역이 없습니다
             </td>
            </tr>
           </c:if>

           <c:forEach var="ordersVo" items="${list}">
            <c:forEach var="ordersSeatVo" items="${ordersVo.seatList}">

             <tr>
              <!-- 주문번호 -->
              <td class="text-center">
               ${ordersVo.order_idx}
              </td>
              <!-- 공연 이미지 및 이름 -->
              <td class="text-center">
               <!-- <img src="../resources/images/${vo.performance_image}" alt="${vo.performance_name}"> -->
               <div>${ordersVo.performance_name}</div>
              </td>
              <!-- 공연장 -->
              <td class="text-center">
               ${ordersVo.hall_name}
              </td>
              <!-- 공연 날짜 -->
              <td class="text-center">
               ${ordersVo.reserved_performance_date}
              </td>
              <!-- 좌석 정보 -->
              <td class="text-center">
               ${ordersSeatVo.seat_grade}석 ${ordersSeatVo.order_seat_name}
              </td>
              <!-- 금액 -->
              <td class="text-center">
               <div><strong>
                 <fmt:formatNumber type="number" value="${ordersVo.order_amount}" />원
                </strong>
               </div>
              </td>
             </tr>
            </c:forEach>
           </c:forEach>
          </tbody>
         </table>
         <!-- End Shopping Summery -->
        </div>
       </div>
      </div>
     </div>
    </body>

    </html>