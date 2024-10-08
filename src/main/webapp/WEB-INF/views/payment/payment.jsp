<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <!DOCTYPE html>
 <html lang="en">

 <head>

  <!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

  <script>
   var IMP = window.IMP;
   IMP.init("imp15578583"); // 가맹점 식별 코드

   function requestPay() {

    IMP.request_pay({
     // 결제 시 사용할 정보 입력
     pg: "{html5_inicis}.{INIpayTest}",      //{PG사코드}.{MID} 
     pay_method: "card",                     // 결제 방법
     merchant_uid: "${order_idx}",           // 주문번호 'p' + new Date().getTime()+'_'+memberId
     name: "${performance_name}",            // 상품명
     amount: "${order_amount}",            // 결제금액 
     buyer_email: "${mem_email}",            // 구매자 정보 필드는 필요에 따라 생략 가능
     buyer_name: "${mem_name}",
     buyer_tel: "${mem_phone}",
     buyer_addr: "${mem_addr}",
     buyer_postcode: "${mem_zipcode}"
    },
     function (rsp) { // callback
      $.ajax({
       type: 'POST',
       url: "payment.do",  //결제 금액을 보낼 url 설정 ex) "/user/mypage/charge/point"
       data: {

       },
       success: function (res_data) {
        if (rsp.paid_amount === res_data.response.amount) {
         alert("결제 성공");
        }
       },
       error: function (err) {
        alert("결제 실패");
       }
      });

      // 결제 이후 이동할 창 url 작성

     }
     // function (rsp) { // callback
     //  $.ajax({
     //   type: 'POST',
     //   url: '/verify/' + rsp.imp_uid  //충전 금액값을 보낼 url 설정 ex) "/user/mypage/charge/point"
     //  }).done(function (data) {
     //   if (rsp.paid_amount === data.response.amount) {
     //    alert("결제 성공");
     //   } else {
     //    alert("결제 실패");
     //   }
     //  });
     // }
    );
   }
  </script>
  <meta charset="UTF-8">
  <title>Sample Payment</title>
 </head>

 <body>
  <button onclick="requestPay()">결제하기</button> <!-- 결제하기 버튼 생성 -->
 </body>

 </html>