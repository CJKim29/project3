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

     <!-- CSS 연결 -->
     <link rel="stylesheet" href="../resources/css/book/payment_agree.css" />

     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
     <script src="https://unpkg.com/gijgo@1.9.14/js/gijgo.min.js" type="text/javascript"></script>
     <link href="https://unpkg.com/gijgo@1.9.14/css/gijgo.min.css" rel="stylesheet" type="text/css" />

     <!-- jQuery -->
     <!-- <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script> -->
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
          url: "/payment/payment.do",  //결제 금액을 보낼 url 설정 ex) "/user/mypage/charge/point"
          data: {
           test: "test"
           // imp_uid: rsp.imp_uid, // 아임포트 결제 완료 후 응답 받은 imp_uid
           // order_idx: rsp.merchant_uid, // 주문번호
           // order_amount: rsp.paid_amount // 결제된 금액
          },
          success: function (res_data) {

           console.log("서버 응답 데이터:", res_data); // 응답 전체를 출력
           // 필요한 데이터가 어디에 있는지 확인

           // rsp.paid_amount: 아임포트에서 받은 응답. 실제 결제된 금액
           // res_data.response.amount: 서버에서 받은 응답 데이터. 결제 요청을 처리한 결과에서 사용자가 요청한 금액이 저장된 부분
           // if (res_data && res_data.response && res_data.response.amount) {
           //  if (rsp.paid_amount === res_data.response.amount) {
           //   alert("결제 성공");
           //   //결제 성공 후 이동할 페이지
           //   location.href = "/payment/success";

           //  } else {
           //   alert("결제 금액 불일치");
           //  }
           // }
           // else {
           //  console.error("응답 데이터가 예상과 다릅니다.");
           //  alert("결제 실패!!!");
           // }
          },
          error: function (err) {
           console.error("AJAX 요청 실패: ", err);
           alert("결제 실패");
          }
         });

        }

       );
      }
     </script>

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
         <br>
         <input type="radio" name="performance_detail_cate_idx" value="0" checked />신용카드
         <input type="radio" name="performance_detail_cate_idx" value="0" />무통장입금
         <input type="radio" name="performance_detail_cate_idx" value="0" />카카오페이
        </div>

        <div id="agree">
         <!-- <div class="content_title">예매자 동의</div> -->
         <!-- <input type="checkbox"></input> -->
         <div class="title2"> 취소 수수료 안내 </div>
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
           <td class="left">예매 후 8일 ~ 관람일 1일 전 </td>
           <td>티켓 금액의 30%</td>
          </tr>

         </table>

         <div class="title2"> 개인정보 제3자 정보 제공 </div>
         <!-- <input type="button" class="btn" value="▼" onclick="toggleContent()" /> -->
         <div class="personal_info">
          (주)인터파크트리플은 기획사와 이용자 간의 상품 거래를 중개하는 통신판매중개자입니다. 거래관계가 이루어진 이후의 고객을때 및 공연정보 안내 등을 위하여
          관련한 정보는 필요한 범위 내에서 거래
          당사자에게 아래와 같이 제 공됩니다.
          개인정보 제공 동의
          에 제공합니다.
          인터파크트리플은 개인정보보호법에 따라 이용자의 개인정보에 있어 아래와 같이 알리고 동의를 받아 상품의 기획사
          2 개인정보 제공받는자 주식회사 라이브러리컴퍼니
          개인정보 이용 목적
          기획사 : 티켓 현장발권, 캐스팅 변경, 공연취소 등에 대한 고객 안내, 티켓 정당 예매 확인 및 관련 업무 수행
          개인정보 제공 함목
          성명, 아이디, 전화번호, 휴대폰번호, 이메일주소, 주문/배송 정보, 예매번호
          개인정보 보유 및 이용 기간
          개인정보 이용목적 달성 시까지(단, 관계 법령의 규정에 의해 보존의 필요가 있는 경우 및 사전 동의를 득한 경우 해당 보유기간까지)
          ※ 위 개인정보 제공에 대한 동의를 거부할 권리가 있으며, 만약 동의를 거부할 경우 티켓 예매서비스 이용에 제한을 받을 수 있습니다.
          04 배송선택/주문자화
          뚜
          일시
          선택좌~
          (2석)
          티켓금0
          수수료
          배송료
          할인
          할인쿠폰
          취소기한
          취소수수
          총 결제는
          모두 동의합니다.

         </div>
         <input type="checkbox" class="checkbox" name="agreement" />
         <span>(필수) 취소수수료/취소기한을 확인하였으며, 동의합니다</span>
         <br>
         <input type="checkbox" class="checkbox" name="agreement" />
         <span>(필수) 제3자 정보 제공 내용에 동의합니다</span>
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
          <input type="button" id="next_btn" class="btn" value="결제하기" onclick="requestPay();">
         </div>
        </div>
       </div>
      </div>
     </form>
    </body>
    <script type="text/javascript">

     // 체크박스 동의 여부 확인
     document.getElementById('next_btn').addEventListener('click', function (event) {
      const checkboxes = document.querySelectorAll('input[name="agreement"]');
      let allChecked = true;

      checkboxes.forEach(function (checkbox) {
       if (!checkbox.checked) {
        allChecked = false;
       }
      });

      if (!allChecked) {
       alert('취소수수료/취소기한 및 제3자 정보 제공 내용에 동의하셔야 결제가 가능합니다\n 내용을 확인하시고 동의하기에 체크해주세요');
       event.preventDefault();  // 다음 페이지로 이동을 막음
      }
     });

    </script>

    </html>