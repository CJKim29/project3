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

     <link rel="stylesheet" href="../resources/css/book/payment_check.css" />

     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
     <script src="https://unpkg.com/gijgo@1.9.14/js/gijgo.min.js" type="text/javascript"></script>
     <link href="https://unpkg.com/gijgo@1.9.14/css/gijgo.min.css" rel="stylesheet" type="text/css" />

     <script type="text/javascript">

      // DOMContentLoaded 이벤트로 감싸, DOM이 완전히 로드된 후에 실행되도록 함
      // document.addEventListener("DOMContentLoaded", function () {

      // 입력 확인
      function send(f) {
       let mem_phone = $("#mem_phone").val();
       let mem_phone_check = /^\d{7,8}$/;

       if (mem_phone == '') {
        alert("핸드폰 번호를 입력해주세요");
        f.mem_phone.focus();
        return;
       }

       if (mem_phone_check.test(mem_phone) == false) {
        alert("핸드폰 번호를 올바른 형식으로 입력해주세요\n * 7-8자리 숫자 입력");
        f.mem_phone.value = '';
        f.mem_phone.focus();
        return;
       }

       f.submit();
      }// end : send();
      // });

      // 핸드폰 번호 8자리까지 입력 가능
      function max_length(e) {

       if (e.value.length > e.maxLength) {
        e.value = e.value.slice(0, e.maxLength);
       }

      }// end : max_length

     </script>

     <!-- 포인트 관련 함수 -->
     <script type="text/javascript">

      document.addEventListener('DOMContentLoaded', function () {

       //DOMContentLoaded 이벤트 핸들러 안에 있는 usePointAll 함수를 전역 스코프에 다시 정의하여 HTML에서 직접 호출할 수 있도록 함
       // 모두 사용 버튼
       window.usePointAll = function () {

        // 보유 포인트를 JSP에서 가져와 숫자로 변환
        const availablePoints = parseInt("${mem_point}", 10);

        // 포인트 값을 모두 사용하여 input 필드에 포맷팅된 값 적용
        const formattedPoints = availablePoints.toLocaleString();

        document.getElementById('used_point').value = formattedPoints;

        // 사용 포인트 업데이트
        updateUsedPoints(formattedPoints);
        updateAvailablePoints(availablePoints);
       }// end : usePointAll()

       // 취소 버튼
       window.cancle = function () {

        // 'used_point' 필드의 값을 '0'으로 설정
        document.getElementById('used_point').value = '0';

        // '0'으로 설정된 값을 반영하여 보유 포인트 업데이트
        const totalPoints = parseInt("${mem_point}", 10);

        updateUsedPoints('0');
        updateAvailablePoints(totalPoints);
       }

       // 사용 포인트와 남은 포인트 업데이트 함수
       function updateUsedPoints(usedPoints) {
        document.getElementById('used_point2').textContent = usedPoints + "P";
        // hidden input의 값을 업데이트
        document.getElementById('hidden_used_point2').value = usedPoints.replace(/[^0-9]/g, ''); // 숫자만 남김
       }

       function updateAvailablePoints(totalPoints) {
        // 사용자가 입력한 포인트 값을 숫자로 변환 (쉼표 제거)
        const usedPoints = parseInt(document.getElementById('used_point').value.replace(/,/g, ''), 10) || 0;
        // 남은 포인트 계산
        const remainingPoints = totalPoints - usedPoints;

        // 남은 포인트를 포맷팅하여 표시
        document.getElementById('available_points').textContent = remainingPoints.toLocaleString() + "P";

       }// end : updateAvailablePoints()

       // 'used_point' input 필드에 'input' 이벤트 추가
       document.getElementById('used_point').addEventListener('input', function () {
        // 보유 포인트를 서버에서 받아옴
        const totalPoints = parseInt("${mem_point}", 10);
        let usedPoints = this.value.replace(/[^0-9]/g, '') || '0'; // 숫자 이외의 모든 문자를 제거, 빈칸 0으로 설정

        // if (usedPoints === '') {
        //  usedPoints = 0; // 입력 값이 없으면 0으로 설정
        // }

        //this.value = usedPoints.toLocaleString(); // 필드에 숫자만 입력되도록 반영

        if (parseInt(usedPoints, 10) > totalPoints) {
         usedPoints = totalPoints; // 보유 포인트를 초과하면 보유 포인트로 제한
        }

        this.value = parseInt(usedPoints, 10).toLocaleString(); // 포맷팅

        // 사용 포인트 업데이트
        updateUsedPoints(this.value);
        updateAvailablePoints(totalPoints);

       });

       document.getElementById('used_point').addEventListener('focus', function () {
        // 입력 필드가 포커스를 얻을 때, 값이 '0'이면 지워줌 (값을 입력할 수 있도록)
        if (this.value === '0') {
         this.value = '';
        }
       });

       document.getElementById('used_point').addEventListener('blur', function () {
        // 입력 필드가 포커스를 잃을 때, 값이 비어있다면 '0'을 설정
        if (this.value.trim() === '') {
         this.value = '0';
        }
        // 사용 포인트 업데이트
        updateUsedPoints(this.value);
        updateAvailablePoints(parseInt("${mem_point}", 10));
       });

       function TotalPayment() {
        // 티켓 금액 합산
        let ticketAmount = 0;
        const seatPricesElement = document.querySelector('#ticket_amount');

        // 요소 존재하는지 확인
        if (!seatPricesElement) {
         console.error("티켓 금액 요소를 찾을 수 없습니다.");
         return; // 함수 종료
        }

        // 모든 가격을 추출
        const prices = seatPricesElement.innerHTML.match(/\d+/g); // 모든 숫자 추출

        if (prices) {
         prices.forEach(function (price) {
          ticketAmount += parseInt(price.replace(/,/g, ''), 10); // 각 가격을 정수로 변환하여 합산
         });
        }

        // 사용 포인트 값 가져오기
        let usedPoints = parseInt(document.getElementById('used_point2').textContent.replace(/[^0-9]/g, ''), 10) || 0;

        // 총 결제 금액 계산
        let totalPayment = ticketAmount - usedPoints;

        // 총 결제 금액이 음수가 되지 않도록 처리
        if (totalPayment < 0) totalPayment = 0;

        // 총 결제 금액을 HTML에 반영
        document.getElementById('total_payment').textContent = totalPayment.toLocaleString() + "원";

        // hidden input의 값을 업데이트
        document.getElementById('hidden_total_payment').value = totalPayment.toLocaleString() + "원";

       }

       // 페이지 로드 시 초기 계산
       TotalPayment();

       // MutationObserver를 사용하여 'used_point2'의 변화를 감지
       const targetNode = document.getElementById('used_point2');
       const config = { characterData: true, childList: true, subtree: true };

       const callback = function (mutationsList) {
        // 각 mutation에 대해 처리
        for (let mutation of mutationsList) {
         if (mutation.type === 'childList' || mutation.type === 'characterData') {
          TotalPayment(); // 변화가 있을 때마다 총 결제 금액을 재계산
          break; // 여러 mutation을 처리할 필요가 없으므로 한 번만 재계산
         }
        }
       };

       const observer = new MutationObserver(callback);
       observer.observe(targetNode, config);
      });
     </script>

     <script>
      window.addEventListener('DOMContentLoaded', function () {
       // form 필드에 입력된 값을 JavaScript로 가져옴
       const performance_idx = document.querySelector('input[name="performance_idx"]');
       const performance_date = document.querySelector('input[name="date"]');
       const mem_idx = document.querySelector('input[name="mem_idx"]');
       const order_idx = document.querySelector('input[name="order_idx"]');
       const seatInfo = document.querySelector('input[name="seatInfo"]');
       const selectedSeats = document.querySelector('input[name="selectedSeats"]');

       // 값이 정상적으로 존재하는지 확인
       if (performance_idx && performance_date && mem_idx && order_idx && seatInfo && selectedSeats) {
        // 10초마다 서버에 체크 요청
        setInterval(function () {
         fetch('/book/checkOrderTimeout.do', {
          method: 'POST',
          headers: {
           'Content-Type': 'application/json',
          },
          body: JSON.stringify({
           performance_idx: performance_idx.value,        // 공연 인덱스
           performance_date: performance_date.value,      // 공연 날짜
           mem_idx: mem_idx.value,                        // 사용자 인덱스
           order_idx: order_idx.value,                    // 주문 인덱스
           seatInfo: JSON.parse(seatInfo.value || '[]'), // 좌석 정보 (JSON 문자열로 변환)
           selectedSeats: JSON.parse(selectedSeats.value || '[]') // 선택된 좌석 정보 (JSON 문자열로 변환)
          })
         })
          .then(response => {
           if (!response.ok) {
            console.error('Error checking order timeout');
           } else {
            console.log('Order timeout checked successfully');
           }
          })
          .catch(error => console.error('Error:', error));
        }, 10000);  // 10초마다 호출
       } else {
        console.error('필수 input 요소가 없습니다.');
       }
      });
     </script>
    </head>

    <body>

     <form action="agree.do" method="post">
      <input type="hidden" name="performance_idx" value="${param.performance_idx}">
      <input type="hidden" name="date" value="${param.date}">
      <input type="hidden" name="mem_idx" value="${user.mem_idx}">
      <input type="hidden" name="order_idx" value="${order_idx}">
      <input type="hidden" name="used_point2" id="hidden_used_point2"
       value="${param.used_point2 != null ? param.used_point2 : '0'}">
      <input type="hidden" name="total_payment" id="hidden_total_payment" value="${param.total_payment}">

      <input type="hidden" id="seatInfo" name="seatInfo" />
      <input type="hidden" id="selectedSeats" name="selectedSeats" />

      <div id="seat-box">

       <div id="seat-box-header">
        <div class="seat-title" title="${ vo.performanceCateVo.performance_cate_name }&nbsp; - ${ vo.performance_name }
            &nbsp;&nbsp;&nbsp;&nbsp;${ vo.hallVo.hall_name }">

         ${ vo.performanceCateVo.performance_cate_name }&nbsp;
         「${vo.performance_name }」
         &nbsp;&nbsp;&nbsp;&nbsp;${ vo.hallVo.hall_name} <br>
        </div>
       </div>

       <div id="content_left">

        <table class="table table-sm member_info">
         <tr>
          <th class="title">예매자 정보</th>
         </tr>

         <tr>
          <td class="left">이름</td>
          <td>${user.mem_name}</td>
         </tr>

         <tr>
          <td class="left">생년월일</td>
          <td>${fn:substring(user.mem_birth, 0, 10)}</td>
         </tr>

         <tr>
          <td class="left">핸드폰 번호</td>
          <td>
           <input style="width:50px; display: inline;" class="form-control" value="010" readonly="readonly">
           <input style="width:100px; display: inline;" class="form-control" id="mem_phone" type="number" maxlength="8"
            oninput="max_length(this);">
           <div class="message">*핸드폰 번호는 현장에서 본인 확인용으로 사용됩니다.</div>
          </td>
         </tr>

         <tr>
          <td class="left">이메일</td>
          <td>${user.mem_email}</td>
         </tr>

         <tr>
          <td class="left">포인트</td>
          <td>
           <!-- 숫자 fomatting 하기 위해 text로 사용(쉼표 때문에) -->
           <input type="text" id="used_point" class="form-control" value="0">

           <input type="button" class="btn X_btn" value="X" onclick="cancle();">
           <input type="button" class="btn btn-warning" value="모두 사용" onclick="usePointAll()">

           <div class="point_state">

            <span>*사용 가능</span>
            <span id="available_points">
             <fmt:formatNumber type="number" value="${mem_point}" />
            </span>

            <span>/보유
             <fmt:formatNumber type="number" value="${mem_point}" />P
            </span>

           </div>

          </td>
         </tr>
        </table>
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
            <c:forEach var="ordersVo" items="${list}">
             <c:forEach var="ordersSeatVo" items="${ordersVo.seatList}">
              ${ ordersSeatVo.seat_grade }등급 &nbsp; ${ ordersSeatVo.order_seat_name} <br>
             </c:forEach>
            </c:forEach>
           </td>
          </tr>

          <tr>
           <td>티켓 금액</td>
           <td id="ticket_amount">
            <c:forEach var="ordersVo" items="${list}">
             <c:forEach var="ordersSeatVo" items="${ordersVo.seatList}">
              ${ ordersSeatVo.seat_price }원<br>
             </c:forEach>
            </c:forEach>
           </td>
          </tr>

          <tr>
           <td>할인</td>
           <td><span id="used_point2"></span></td>
          </tr>

          <tr>
           <td>총 결제 금액</td>
           <td><span id="total_payment">0원</span></td>
          </tr>
         </table>

         <br>


         <input style="margin-left: 10px;" type="button" class="btn btns" value="이전"
          onclick="location.href='performance_seat.do?performance_idx=${param.performance_idx}&date=${param.date}'">

         <input style="margin-left: 30px;" type="button" class="btn btns" value="다음" onclick="send(this.form);">

        </div>
       </div>
      </div>
     </form>
    </body>

    </html>