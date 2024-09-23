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

       f.action = "payment.do?performance_idx=" + "${param.performance_idx}" + "&date=" + "${param.date}";
       f.submit();
      }// end : send();

      function max_length(e) {

       if (e.value.length > e.maxLength) {

        e.value = e.value.slice(0, e.maxLength);

       }

      }// end : max_length
     </script>

    </head>

    <body>
     <form>
      <div id="seat-box">

       <div id="seat-box-header">
        <div class="seat-title" title="${ vo.performanceCateVo.performance_cate_name }&nbsp; - ${ vo.performance_name }
            &nbsp;&nbsp;&nbsp;&nbsp;${ vo.hallVo.hall_name }">
         ${ vo.performanceCateVo.performance_cate_name }&nbsp; 「${
         vo.performance_name }」 &nbsp;&nbsp;&nbsp;&nbsp;${ vo.hallVo.hall_name
         } <br />
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
          <!-- <td>
                                        <input type="number" name="mem_birth" id="mem_birth" placeholder="YYYYMMDD"
                                            onkeyup="check_birth();">
                                        <span id="birth_msg" style="display: block; min-height: 20px;"></span>
                                    </td> -->

          <td>${fn:substring(user.mem_birth, 0, 10)}</td>
         </tr>
         <tr>
          <td class="left">핸드폰 번호</td>
          <!-- <td>${user.mem_phone}</td> -->
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