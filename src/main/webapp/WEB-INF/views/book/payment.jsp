<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <!DOCTYPE html>
    <html>

    <head>
     <meta charset="UTF-8">
     <title>결제</title>
     <link rel="icon" href="../resources/images/TIMOA_icon.png" type="image/png" />

     <link rel="stylesheet" href="../resources/css/book/payment.css" />

     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
     <script src="https://unpkg.com/gijgo@1.9.14/js/gijgo.min.js" type="text/javascript"></script>
     <link href="https://unpkg.com/gijgo@1.9.14/css/gijgo.min.css" rel="stylesheet" type="text/css" />

    </head>

    <body>
     <form>
      <input type="hidden" name="performance_idx" value="${param.performance_idx}" />
      <input type="hidden" name="date" value="${param.date}" />
      <input type="hidden" name="selectedSeats" value="${param.selectedSeats}" />
      <input type="hidden" name="seatInfo" value="${param.seatInfo}" />
      <div id="seat-box">


       <div id="seat-box-header">
        <div class="seat-title" title="${ vo.performanceCateVo.performance_cate_name }&nbsp; - ${ vo.performance_name }
            &nbsp;&nbsp;&nbsp;&nbsp;${ vo.hallVo.hall_name }">

         ${ vo.performanceCateVo.performance_cate_name }&nbsp;
         「${vo.performance_name }」 &nbsp;&nbsp;&nbsp;&nbsp;
         ${ vo.hallVo.hall_name}
         <br>
        </div>
       </div>

       <div id="content_left">
        <div id="payment">
         <div class="content_title">결제 수단 선택</div>
         <input type="radio" name="performance_detail_cate_idx" value="0" checked />신용카드
         <input type="radio" name="performance_detail_cate_idx" value="0" />무통장입금
         <input type="radio" name="performance_detail_cate_idx" value="0" />카카오페이
        </div>

        <div id="agree">
         <div class="content_title">예매자 동의</div>
         <table class="table table-sm member_info">

          <tr>
           <th class="title">취소일</th>
           <th class="title">취소수수료</th>
          </tr>
          <tr>
           <td class="left">예매 후 1~7일</td>
           <td>없음</td>
          </tr>
          <tr>
           <td class="left">관람일 </td>
           <td>티켓 금액의 30%</td>
          </tr>

         </table>
        </div>

       </div>

       <div id="content_right">
        <div class="seat-container2">
         <table cellpadding="10" cellspacing="0" class="table table-bordered">

          <tr>
           <th colspan="4">예매 정보</th>
          </tr>
          <tr>
           <td>일시</td>
           <td>${param.date}</td>
          </tr>
          <tr>
           <td>선택 좌석</td>
           <td>
            <c:forEach var="info" items="${seatInfo}">
             ${info}석<br />
            </c:forEach>
           </td>

          </tr>
          <tr>
           <td>티켓 금액</td>
           <td>
            <c:forEach var="seat" items="${vo.seatList}">
             <fmt:formatNumber type="number" value="${seat.seat_price}" />원
             <br>
            </c:forEach>
           </td>
          </tr>
          <tr>
           <td>할인</td>
           <td>???</td>
          </tr>
          <tr>
           <td>총 결제 금액</td>
           <td>0원</td>
          </tr>
         </table>

         <br>

         <div>
          <input type="button" class="btn" value="이전"
           onclick="location.href='performance_seat.do?performance_idx=${param.performance_idx}&date=${param.date}'">
          <input type="button" class="btn" value="다음" onclick="send(this.form);">
         </div>
        </div>


       </div>
      </div>
     </form>
    </body>

    </html>