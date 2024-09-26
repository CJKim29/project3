<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
     <meta charset="UTF-8" />
     <title>좌석 예약</title>
     <link rel="icon" href="../resources/images/TIMOA_icon.png" type="image/png" />

     <link rel="stylesheet" href="../resources/css/book/book_seat_s.css" />

     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
     <script src="https://unpkg.com/gijgo@1.9.14/js/gijgo.min.js" type="text/javascript"></script>
     <link href="https://unpkg.com/gijgo@1.9.14/css/gijgo.min.css" rel="stylesheet" type="text/css" />

     <!-- 버튼 클릭 -->
     <script>
      $(document).ready(function () {
       // 좌석 버튼 클릭 이벤트 처리
       $(".seat").each(function () {
        // 원래 색상 저장
        var originalColor = $(this).css("background-color");
        $(this).data("originalColor", originalColor);
       });
       $(".seat").click(function () {
        // 저장된 원래 색상
        var originalColor = $(this).data("originalColor");
        // 현재 색상
        var currentColor = $(this).css("background-color");
        // 색상 토글
        if (currentColor === originalColor) {
         // 선택된 버튼의 색상을 회색으로 변경
         $(this).css("background-color", "gray");
        } else {
         // 원래 색상으로 변경
         $(this).css("background-color", originalColor);
        }
       });
      });
     </script>
     <!-- 달력 -->
     <script>
      $(document).ready(function () {
       $("#datepicker").each(function () {
        $(this).datepicker({
         format: "yyyy-mm-dd",
         showOnFocus: false,
        });
       });
      });
     </script>
     <!-- 버튼 클릭시 선택좌석 띄우기 -->
     <script>
      $(document).ready(function () {
       // 클릭된 좌석 정보를 저장할 객체
       var clickedSeats = {};
       // 좌석 클릭 이벤트 핸들러
       $(".seat").click(function () {
        var selectedSeatCount = Object.keys(clickedSeats).length;
        // 클릭된 버튼의 행(row)과 열(column) 정보 추출
        var rowNo = $(this).data("row");
        var colNo = $(this).data("col").toUpperCase();
        // let index = colNo.lastIndexOf("_");
        // colNo = colNo.substring(index + 1).charCodeAt(0) - 96;
        // 좌석 정보 문자열 생성
        // var seatInfo = rowNo + "열 " + colNo + "석";
        var seatInfo = rowNo + "열" + colNo + "석";
        var seatKey = rowNo + "-" + colNo;
        // 이미 선택된 좌석이거나, 4좌석 이하인 경우에만 처리
        if (clickedSeats[seatKey] || selectedSeatCount < 4) {
         // 클릭 횟수 업데이트
         if (!clickedSeats[seatKey]) {
          clickedSeats[seatKey] = 0;
         }
         clickedSeats[seatKey]++;
         // 홀수 클릭이면 정보 추가, 짝수 클릭이면 정보 제거
         if (clickedSeats[seatKey] % 2 === 1) {
          // 홀수 클릭: 정보 추가
          clickedSeats[seatKey] = seatInfo;
         } else {
          // 짝수 클릭: 정보 제거
          delete clickedSeats[seatKey];
         }
         // 결과를 출력할 HTML 요소에 추가
         var resultHtml = "";
         for (var key in clickedSeats) {
          resultHtml += "<p>" + clickedSeats[key] + "</p>";
         }
         $(".seat-info-container").html(resultHtml);
        } else {
         alert("최대 4좌석까지만 선택할 수 있습니다. 다시 선택해주세요.");
         // 좌석다시선택
         redirectToCurrentPage();
        }
       });
       window.submitBookForm = function () {
        var form = $("#bookForm");
        form.find('input[name="seatInfo"]').remove(); // 기존 입력값 제거
        // 선택된 좌석이 있는지 확인
        if (Object.keys(clickedSeats).length === 0) {
         alert("좌석을 선택해주세요.");
         return; // 좌석을 선택하지 않으면 폼 제출을 막음
        }
        for (var key in clickedSeats) {
         $("<input>")
          .attr({
           type: "hidden",
           name: "seatInfo",
           value: clickedSeats[key],
          })
          .appendTo(form);
        }
        form.submit(); // 폼 제출
       };
      });
     </script>
     <!-- 좌석 다시 선택 -->
     <script>
      function redirectToCurrentPage() {
       // 현재 페이지의 URL로 redirect
       window.location.href = window.location.href;
      }
     </script>
     <!-- 좌석 예약 반영 -->
     <script>
      document.addEventListener("DOMContentLoaded", function () {
       let selectedSeats = [];
       function toggleSeat(row, col) {

        const seatId = row + "-" + col.toUpperCase();
         
        const index = selectedSeats.indexOf(seatId);
        if (index === -1) {
         selectedSeats.push(seatId);
        } else {
         selectedSeats.splice(index, 1);
        }
        console.log("Selected Seats Updated:", selectedSeats);
        updateSeatInfo();
       }
       window.submitSeats = function () {
        var form = $("#seatForm");
        // 이전에 추가된 좌석 정보를 제거
        form.find('input[name="seatInfo"]').remove();
        // 선택된 좌석이 없으면 경고창 표시
        if (selectedSeats.length === 0) {
         alert("좌석을 선택해 주세요.");
         return;
        }
        // 선택된 좌석 정보를 JSON 형식으로 hidden input에 저장
        document.getElementById("selectedSeats").value = JSON.stringify(
         selectedSeats.map((seat) => {
          console.log("Selected Seat Updated:", seat);

          const [row, col] = seat.split("-");
          return { row: parseInt(row), col: col.toUpperCase() }; // 열 정보를 대문자로 변환
         })
        );
        // 선택된 좌석 정보를 hidden input으로 추가
        selectedSeats.forEach((seat) => {
         $("<input>")
          .attr({
           type: "hidden",
           name: "seatInfo",
           value: seat, // 좌석 정보 추가
          })
          .appendTo(form);
        });
        // 폼 제출
        form.submit();
       };
       // 좌석 정보를 업데이트하는 함수
       function updateSeatInfo() {
        const seatInfoContainer = document.querySelector(
         ".seat-info-container"
        );
        seatInfoContainer.innerHTML = ""; // 이전 내용 제거
        selectedSeats.forEach((seatId) => {

         const [row, col] = seatId.split("-");

         const div = document.createElement("div");
         div.textContent = `Row: ${row}, Col: ${col}`; // 좌석 정보를 표시
         seatInfoContainer.appendChild(div);
        });
       }
       // 좌석 클릭 이벤트 추가
       document.querySelectorAll(".seat").forEach((seat) => {
        seat.addEventListener("click", (event) => {
         const row = event.target.getAttribute("data-row");
         const col = event.target.getAttribute("data-col");
         toggleSeat(row, col); // 좌석 선택/해제 기능
         updateSeatInfo(); // 선택된 좌석 정보 업데이트
        });
       });
       // 예약 버튼 클릭 시 폼 제출 함수 실행
       document
        .querySelector(".btn-success")
        .addEventListener("click", submitSeats);
      });
     </script>
    </head>

    <body>
     <div id="seat-box">
      <div id="seat-box-header">
       <h3 style="
            width: 150px;
            float: right;
            text-align: center;
            height: 45px;
            line-height: 45px;
            color: white;
            background-color: rgb(228, 64, 64);
            margin-right: 10px;
          ">
        좌석 선택
       </h3>
       <br /><br />
       <div class="seat-title" title="${ vo.performanceCateVo.performance_cate_name }&nbsp; - ${ vo.performance_name }
                            &nbsp;&nbsp;&nbsp;&nbsp;${ vo.hallVo.hall_name }">
        ${ vo.performanceCateVo.performance_cate_name }&nbsp; 「${
        vo.performance_name }」 &nbsp;&nbsp;&nbsp;&nbsp;${ vo.hallVo.hall_name
        } <br />
       </div>
       <div class="seat-container0">
        <p style="
              margin-top: 17px;
              color: white;
              background-color: rgb(51, 121, 181);
            ">
         다른 관람일자 선택
        </p>
        <input id="datepicker" width="120" value="${param.date}" />
        <input class="btn btn-primary" type="button" value="날짜 바꾸기" data-performance-idx="${ vo.performance_idx }"
         onclick="location.href='performance_seat.do?performance_idx=${ vo.performance_idx }&date=' + $('#datepicker').val()" />
       </div>
      </div>
      <div id="seat-box-body-left">
       <div class="seat-container">
        <div id="seat-box-body-left-img">
         <img src="/resources/images/무대.png" style="width: 469px" />
        </div>
        <div id="seat-box-body-left-button">
         <c:forEach var="seat" items="${seats}">
          <div>
           <c:choose>
            <c:when test="${seat.s_hall_row_no <= 0}">
             <!-- 기본 색상 클래스 유지 -->
             <div class="seat seat-row-${seat.s_hall_row_no} ${seat.a == 0 ? 'available' : 'unavailable'}"
              data-row="${seat.s_hall_row_no}" data-col="a" data-seat="${seat.a}"></div>
             <div class="seat seat-row-${seat.s_hall_row_no} ${seat.b == 0 ? 'available' : 'unavailable'}"
              data-row="${seat.s_hall_row_no}" data-col="b" data-seat="${seat.b}"></div>
             <div class="seat seat-row-${seat.s_hall_row_no} ${seat.c == 0 ? 'available' : 'unavailable'}"
              data-row="${seat.s_hall_row_no}" data-col="c" data-seat="${seat.c}"></div>
             <div class="seat seat-row-${seat.s_hall_row_no} ${seat.d == 0 ? 'available' : 'unavailable'}"
              data-row="${seat.s_hall_row_no}" data-col="d" data-seat="${seat.d}"></div>
             <div class="seat seat-row-${seat.s_hall_row_no} ${seat.e == 0 ? 'available' : 'unavailable'}"
              data-row="${seat.s_hall_row_no}" data-col="e" data-seat="${seat.e}"></div>
             <div class="seat seat-row-${seat.s_hall_row_no} ${seat.f == 0 ? 'available' : 'unavailable'}"
              data-row="${seat.s_hall_row_no}" data-col="f" data-seat="${seat.f}"></div>
             <div class="seat seat-row-${seat.s_hall_row_no} ${seat.g == 0 ? 'available' : 'unavailable'}"
              data-row="${seat.s_hall_row_no}" data-col="g" data-seat="${seat.g}"></div>
             <div class="seat seat-row-${seat.s_hall_row_no} ${seat.h == 0 ? 'available' : 'unavailable'}"
              data-row="${seat.s_hall_row_no}" data-col="h" data-seat="${seat.h}"></div>
             <div class="seat seat-row-${seat.s_hall_row_no} ${seat.i == 0 ? 'available' : 'unavailable'}"
              data-row="${seat.s_hall_row_no}" data-col="i" data-seat="${seat.i}"></div>
             <div class="seat seat-row-${seat.s_hall_row_no} ${seat.j == 0 ? 'available' : 'unavailable'}"
              data-row="${seat.s_hall_row_no}" data-col="j" data-seat="${seat.j}"></div>
             <strong>&nbsp;&nbsp;${seat.s_hall_row_no}열</strong>
            </c:when>
            <c:otherwise>
             <c:choose>
              <c:when test="${fn:length(vo.seatList) == 1}">
               <c:set var="rowClass" value="seat-purple" />
              </c:when>
              <c:when test="${fn:length(vo.seatList) == 2}">
               <c:choose>
                <c:when
                 test="${seat.s_hall_row_no == 1 || seat.s_hall_row_no == 2 || seat.s_hall_row_no == 3 || seat.s_hall_row_no == 4}">
                 <c:set var="rowClass" value="seat-purple" />
                </c:when>
                <c:otherwise>
                 <c:set var="rowClass" value="seat-green" />
                </c:otherwise>
               </c:choose>
              </c:when>
              <c:when test="${fn:length(vo.seatList) == 3}">
               <c:choose>
                <c:when test="${seat.s_hall_row_no == 1 || seat.s_hall_row_no == 2 || seat.s_hall_row_no == 3}">
                 <c:set var="rowClass" value="seat-purple" />
                </c:when>
                <c:when test="${seat.s_hall_row_no == 4 || seat.s_hall_row_no == 5 || seat.s_hall_row_no == 6}">
                 <c:set var="rowClass" value="seat-green" />
                </c:when>
                <c:otherwise>
                 <c:set var="rowClass" value="seat-blue" />
                </c:otherwise>
               </c:choose>
              </c:when>
              <c:when test="${fn:length(vo.seatList) == 5}">
               <c:choose>
                <c:when test="${seat.s_hall_row_no == 1 || seat.s_hall_row_no == 2}">
                 <c:set var="rowClass" value="seat-purple" />
                </c:when>
                <c:when test="${seat.s_hall_row_no == 3 || seat.s_hall_row_no == 4}">
                 <c:set var="rowClass" value="seat-green" />
                </c:when>
                <c:when test="${seat.s_hall_row_no == 5 || seat.s_hall_row_no == 6}">
                 <c:set var="rowClass" value="seat-blue" />
                </c:when>
                <c:when test="${seat.s_hall_row_no == 7 || seat.s_hall_row_no == 8}">
                 <c:set var="rowClass" value="seat-orange" />
                </c:when>
                <c:otherwise>
                 <c:set var="rowClass" value="seat-navy" />
                </c:otherwise>
               </c:choose>
              </c:when>
              <c:otherwise>
               <c:choose>
                <c:when test="${seat.s_hall_row_no == 1 || seat.s_hall_row_no == 2}">
                 <c:set var="rowClass" value="seat-purple" />
                </c:when>
                <c:when test="${seat.s_hall_row_no == 3 || seat.s_hall_row_no == 4}">
                 <c:set var="rowClass" value="seat-green" />
                </c:when>
                <c:when test="${seat.s_hall_row_no == 5 || seat.s_hall_row_no == 6}">
                 <c:set var="rowClass" value="seat-blue" />
                </c:when>
                <c:otherwise>
                 <c:set var="rowClass" value="seat-orange" />
                </c:otherwise>
               </c:choose>
              </c:otherwise>
             </c:choose>
             <div class="seat ${rowClass} seat-row-${seat.s_hall_row_no} ${seat.a == 0 ? 'available' : 'unavailable'}"
              data-row="${seat.s_hall_row_no}" data-col="a" data-seat="${seat.a}"></div>
             <div class="seat ${rowClass} seat-row-${seat.s_hall_row_no} ${seat.b == 0 ? 'available' : 'unavailable'}"
              data-row="${seat.s_hall_row_no}" data-col="b" data-seat="${seat.b}"></div>
             <div class="seat ${rowClass} seat-row-${seat.s_hall_row_no} ${seat.c == 0 ? 'available' : 'unavailable'}"
              data-row="${seat.s_hall_row_no}" data-col="c" data-seat="${seat.c}"></div>
             <div class="seat ${rowClass} seat-row-${seat.s_hall_row_no} ${seat.d == 0 ? 'available' : 'unavailable'}"
              data-row="${seat.s_hall_row_no}" data-col="d" data-seat="${seat.d}"></div>
             <div class="seat ${rowClass} seat-row-${seat.s_hall_row_no} ${seat.e == 0 ? 'available' : 'unavailable'}"
              data-row="${seat.s_hall_row_no}" data-col="e" data-seat="${seat.e}"></div>
             <div class="seat ${rowClass} seat-row-${seat.s_hall_row_no} ${seat.f == 0 ? 'available' : 'unavailable'}"
              data-row="${seat.s_hall_row_no}" data-col="f" data-seat="${seat.f}"></div>
             <div class="seat ${rowClass} seat-row-${seat.s_hall_row_no} ${seat.g == 0 ? 'available' : 'unavailable'}"
              data-row="${seat.s_hall_row_no}" data-col="g" data-seat="${seat.g}"></div>
             <div class="seat ${rowClass} seat-row-${seat.s_hall_row_no} ${seat.h == 0 ? 'available' : 'unavailable'}"
              data-row="${seat.s_hall_row_no}" data-col="h" data-seat="${seat.h}"></div>
             <div class="seat ${rowClass} seat-row-${seat.s_hall_row_no} ${seat.i == 0 ? 'available' : 'unavailable'}"
              data-row="${seat.s_hall_row_no}" data-col="i" data-seat="${seat.i}"></div>
             <div class="seat ${rowClass} seat-row-${seat.s_hall_row_no} ${seat.j == 0 ? 'available' : 'unavailable'}"
              data-row="${seat.s_hall_row_no}" data-col="j" data-seat="${seat.j}"></div>
             <strong>&nbsp;&nbsp;${seat.s_hall_row_no}</strong>
            </c:otherwise>
           </c:choose>
          </div>
         </c:forEach>
        </div>
       </div>
      </div>
      <div id="seat-box-body-right">
       <div class="seat-content">
        <div id="seat-box-body-right-top">
         <div class="seat-container2">
          <table cellpadding="10" cellspacing="0">
           <tr>
            <th colspan="4">&emsp;&emsp;&nbsp;&nbsp;좌석등급/잔여석</th>
           </tr>
           <tr>
            <c:forEach var="seat" items="${seatList}" begin="0" end="0">
             <td>
              <div class="seat2 seat-purple" data-color="purple"></div>
             </td>
             <td>&nbsp;${seat.seat_grade}석&nbsp;&nbsp;</td>
             <td style="text-align: right">
              ${seat.remaining_seats}석&nbsp;&nbsp;
             </td>
             <td style="text-align: right">
              <fmt:formatNumber type="number" value="${seat.seat_price}" />원
             </td>
            </c:forEach>
           </tr>
           <tr>
            <c:forEach var="seat" items="${seatList}" begin="1" end="1">
             <td>
              <div class="seat2 seat-green" data-color="green"></div>
             </td>
             <td>&nbsp;${seat.seat_grade}석&nbsp;&nbsp;</td>
             <td style="text-align: right">
              ${seat.remaining_seats}석&nbsp;&nbsp;
             </td>
             <td style="text-align: right">
              <fmt:formatNumber type="number" value="${seat.seat_price}" />원
             </td>
            </c:forEach>
           </tr>
           <tr>
            <c:forEach var="seat" items="${seatList}" begin="2" end="2">
             <td>
              <div class="seat2 seat-blue" data-color="blue"></div>
             </td>
             <td>&nbsp;${seat.seat_grade}석&nbsp;&nbsp;</td>
             <td style="text-align: right">
              ${seat.remaining_seats}석&nbsp;&nbsp;
             </td>
             <td style="text-align: right">
              <fmt:formatNumber type="number" value="${seat.seat_price}" />원
             </td>
            </c:forEach>
           </tr>
           <tr>
            <c:forEach var="seat" items="${seatList}" begin="3" end="3">
             <td>
              <div class="seat2 seat-orange" data-color="orange"></div>
             </td>
             <td>&nbsp;${seat.seat_grade}석&nbsp;&nbsp;</td>
             <td style="text-align: right">
              ${seat.remaining_seats}석&nbsp;&nbsp;
             </td>
             <td style="text-align: right">
              <fmt:formatNumber type="number" value="${seat.seat_price}" />원
             </td>
            </c:forEach>
           </tr>
           <tr>
            <c:forEach var="seat" items="${seatList}" begin="4" end="4">
             <td>
              <div class="seat2 seat-navy" data-color="navy"></div>
             </td>
             <td>&nbsp;${seat.seat_grade}석&nbsp;&nbsp;</td>
             <td style="text-align: right">
              ${seat.remaining_seats}석&nbsp;&nbsp;
             </td>
             <td style="text-align: right">
              <fmt:formatNumber type="number" value="${seat.seat_price}" />원
             </td>
            </c:forEach>
           </tr>
          </table>
          <br />
         </div>
        </div>
        <div id="seat-box-body-right-bottom">
         <div style="
                width: 240px;
                background-color: rgb(228, 64, 64);
                color: white;
                text-align: center;
              ">
          원하시는 좌석 위치를 선택해주세요.
         </div>
         <br />

         <div class="seat-container3">
          <p style="background-color: aquamarine; text-align: center">
           선택좌석
          </p>

          <!-- 예약 폼 -->
          <form id="seatForm" action="reserve_seats.do" method="post">
           <div class="seat-info-container" style="
                    background-color: #eeeeee;
                    height: 120px;
                    max-height: 150px;
                    overflow-y: auto;
                  "></div>
           <input type="hidden" name="performance_idx" value="${param.performance_idx}" />
           <input type="hidden" name="date" value="${param.date}" />
           <input type="hidden" id="seat_row" name="row" />
           <input type="hidden" id="seat_col" name="col" />
           <input type="hidden" name="seat_idx" value="${seat_idx}" />
           <input type="hidden" id="selectedSeats" name="selectedSeats" />
           <div style="display: flex; justify-content: center">
            <input type="button" class="btn btn-success" value="좌석선택완료" style="width: 110px" onclick="submitSeats()" />
           </div>
          </form>
         </div>
         <div class="seat-container4">
          <input class="btn btn-warning" type="button" value="좌석다시선택" onclick="redirectToCurrentPage()" />
          <br /><br /><br />
          <!-- 장바구니 담기 폼 -->
          <form id="bookForm" action="../cart/insert.do" method="post">
           <input type="hidden" name="performance_idx" value="${param.performance_idx}" />
           <input type="hidden" name="mem_idx" value="${user.mem_idx}" />
           <input type="hidden" name="reserved_performance_date" value="${param.date}" />
           <input type="button" class="btn btn-danger" value="장바구니 담기" onclick="submitBookForm()" />
          </form>
         </div>
        </div>
       </div>
      </div>
      <!-- 나중에 참고할 일 생길까봐 남겨 놓는 버튼 생성 코드 -->
      <!-- <div class="seat-container">
                    <%-- 100개의 좌석 버튼 생성 --%>
                        <c:forEach var="i" begin="1" end="100">
                            <c:choose>
                                <c:when test="${i <= 20}">
                                    <div class="seat seat-purple" data-color="purple" id="seat${i}"></div>
                                </c:when>
                                <c:when test="${i <= 40}">
                                    <div class="seat seat-green" data-color="green" id="seat${i}"></div>
                                </c:when>
                                <c:when test="${i <= 60}">
                                    <div class="seat seat-blue" data-color="blue" id="seat${i}"></div>
                                </c:when>
                                <c:otherwise>
                                    <div class="seat seat-orange" data-color="orange" id="seat${i}"></div>
                                </c:otherwise>
                            </c:choose>
                            <%-- 10개의 버튼마다 줄 바꿈 --%>
                                <c:if test="${i % 10 == 0}">
                                    <br />
                                </c:if>
                        </c:forEach>
                </div> -->
      <!-- 나중에 참고할 일 생길까봐 남겨 놓는 잔여 좌석 코드 
                    <c:forEach var="seat" items="${vo.seatList}" varStatus="status">
                        <div class="seat2 seat-${status.index == 0 ? 'purple' : status.index == 1 ? 'green' : status.index == 2 ? 'blue' : 'orange'}"
                            data-color="${status.index == 0 ? 'purple' : status.index == 1 ? 'green' : status.index == 2 ? 'blue' : 'orange'}"
                            id="seat${status.index}">
                        </div>
                        ${seat.seat_grade} : ${status.index == 0 ? zeroCount1 : status.index == 1 ? zeroCount2 :
                        status.index == 2 ? zeroCount3 : status.index == 3 ? zeroCount4 : zeroCount5}석<br />
                    </c:forEach> 
                -->
     </div>
    </body>

    </html>