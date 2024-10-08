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

               <link rel="stylesheet" href="../resources/css/book/book_seat_m.css" />

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
               <!-- <script>
      $(document).ready(function () {
       $("#datepicker").each(function () {
        $(this).datepicker({
         format: "yyyy-mm-dd",
         showOnFocus: false,
        });
       });
      });
     </script> -->
               <script>
                  var min_date;
                  var max_date;
                  $(document).ready(function () {
                     var performance_idx = "${param.performance_idx}";
                     console.log("performance_idx:", performance_idx);  // performance_idx가 올바르게 출력되는지 확인

                     // AJAX 요청을 통해 서버에서 공연 날짜 데이터를 가져옴
                     $.ajax({
                        async: false,
                        url: '/detail/getAvailableDates',  // 서버에 날짜 정보를 요청
                        type: 'GET',
                        data: { performance_idx: performance_idx },
                        success: function (response) {
                           console.log("서버로부터 날짜 데이터 수신:", response);

                           var availableDates = response.availableDates;
                           console.log("availableDates:", availableDates); // 여기에 추가

                           var first_date = response.first_date;
                           var last_date = response.last_date;
                           console.log("first_date :", first_date);
                           console.log("last_date :", last_date);

                           var firstDateObj = new Date(first_date); // first_date를 Date 객체로 변환

                           var today = new Date(); // 오늘 날짜

                           // 날짜 리스트를 HTML에 출력 (디버깅용)
                           var dateListHtml = "<ul>";
                           availableDates.forEach(function (date) {
                              dateListHtml += "<li>" + date + "</li>";
                           });
                           dateListHtml += "</ul>";
                           $("#dateList").html(dateListHtml);

                           // minDate와 maxDate 계산
                           min_date = (firstDateObj > today) ? firstDateObj : today;
                           //min_date = availableDates[0];
                           console.log(typeof (min_date));
                           console.log(min_date);

                           max_date = new Date(last_date);
                           //console.log("가장 빠른 날짜 (min_date):", min_date.toISOString().split('T')[0]);
                           console.log("가장 빠른 날짜 (min_date):", min_date);
                           console.log("가장 늦은 날짜 (max_date):", max_date.toISOString().split('T')[0]);


                           reserved_setting();


                           // Datepicker 초기화 및 특정 날짜만 활성화
                           $my('#datepicker').datepicker({
                              beforeShowDay: function (date) {
                                 var formattedDate = $.datepicker.formatDate('yy-mm-dd', date);
                                 console.log("formattedDate:", formattedDate); // 여기서 출력
                                 if ($.inArray(formattedDate, availableDates) !== -1) {
                                    return [true, "available", ""];
                                 } else {
                                    return [false, "unavailable", ""];
                                 }
                              }
                           });

                        },
                        error: function (xhr, status, error) {
                           console.error("AJAX 호출 실패:", error);
                        }
                     });
                  });
               </script>

               <script>

                  var $my = $.noConflict(true);

                  function reserved_setting() {

                     console.log(min_date);

                     var oneDayBeforeMinDate = new Date(min_date);
                     oneDayBeforeMinDate.setDate(min_date.getDate() - 1);

                     // datepicker 초기화
                     $my('#datepicker').datepicker({
                        showOn: "button",
                        buttonText: "Select date",
                        format: "yyyy-mm-dd",
                        minDate: oneDayBeforeMinDate,
                        maxDate: max_date
                     });
                  }
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
                        if (confirm("다른 사람이 해당 좌석을 구매할시, 장바구니 내역이 삭제될 수 있습니다. 담으시겠습니까?") == false) return;
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
                        form.find('input[name="selectedSeats"]').remove(); // selectedSeats hidden input도 제거
                        // 선택된 좌석이 없으면 경고창 표시
                        if (selectedSeats.length === 0) {
                           alert("좌석을 선택해 주세요.");
                           return;
                        }

                        // 선택된 좌석 정보를 `4열A석` 형식으로 변환하여 hidden input에 저장
                        selectedSeats.forEach((seat) => {
                           const [row, col] = seat.split("-");
                           const seatInfo = row + "열" + col + "석"; // 여기서 형식 변경

                           $("<input>")
                              .attr({
                                 type: "hidden",
                                 name: "seatInfo",
                                 value: seatInfo, // 변경된 좌석 정보 추가
                              })
                              .appendTo(form);
                        });

                        // 선택된 좌석을 JSON 형식으로 변환하여 hidden input에 추가
                        $("<input>")
                           .attr({
                              type: "hidden",
                              name: "selectedSeats", // 이 값을 서버에서 받을 변수 이름
                              value: JSON.stringify(
                                 selectedSeats.map((seat) => {
                                    const [row, col] = seat.split("-");
                                    return { row: parseInt(row), col: col.toUpperCase() };
                                 })
                              ),
                           })
                           .appendTo(form);

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
              color: rgb(51, 121, 181);
              font-weight: bold;
            ">
                           다른 관람일자 선택
                        </p>
                        <input id="datepicker" width="120" value="${param.date}" />
                        <input class="btn btn-primary" type="button" value="날짜 바꾸기"
                           data-performance-idx="${ vo.performance_idx }"
                           onclick="location.href='performance_seat.do?performance_idx=${ vo.performance_idx }&date=' + $('#datepicker').val()" />
                     </div>
                  </div>
                  <div id="seat-box-body-left">
                     <div class="seat-container">
                        <div id="seat-box-body-left-img">
                           <img src="/resources/images/무대.png" style="width: 469px" />
                        </div>
                        <div id="seat-box-body-left-button">
                           <strong style="margin-left: 10px">A&nbsp;&nbsp;&nbsp;&nbsp; B&nbsp;&nbsp;&nbsp;&nbsp;
                              C&nbsp;&nbsp;&nbsp;&nbsp; D&nbsp;&nbsp;&nbsp
                              E&nbsp;&nbsp;&nbsp;&nbsp; F&nbsp;&nbsp;&nbsp;&nbsp;
                              G&nbsp;&nbsp;&nbsp; H&nbsp;&nbsp;&nbsp;&nbsp;
                              I&nbsp;&nbsp;&nbsp;&nbsp; J&nbsp;&nbsp;&nbsp;&nbsp;
                              K&nbsp;&nbsp;&nbsp;&nbsp; L&nbsp;&nbsp;&nbsp;&nbsp;
                              M&nbsp;&nbsp;&nbsp;&nbsp; N&nbsp;&nbsp;&nbsp; O</strong>
                           <c:forEach var="seat" items="${seats}">
                              <div>
                                 <c:choose>
                                    <c:when test="${seat.m_hall_row_no <= 0}">
                                       <!-- 기본 색상 클래스 유지 -->
                                       <div
                                          class="seat seat-row-${seat.m_hall_row_no} ${seat.a == 0 ? 'available' : 'unavailable'}"
                                          data-row="${seat.m_hall_row_no}" data-col="a" data-seat="${seat.a}"></div>
                                       <div
                                          class="seat seat-row-${seat.m_hall_row_no} ${seat.b == 0 ? 'available' : 'unavailable'}"
                                          data-row="${seat.m_hall_row_no}" data-col="b" data-seat="${seat.b}"></div>
                                       <div
                                          class="seat seat-row-${seat.m_hall_row_no} ${seat.c == 0 ? 'available' : 'unavailable'}"
                                          data-row="${seat.m_hall_row_no}" data-col="c" data-seat="${seat.c}"></div>
                                       <div
                                          class="seat seat-row-${seat.m_hall_row_no} ${seat.d == 0 ? 'available' : 'unavailable'}"
                                          data-row="${seat.m_hall_row_no}" data-col="d" data-seat="${seat.d}"></div>
                                       <div
                                          class="seat seat-row-${seat.m_hall_row_no} ${seat.e == 0 ? 'available' : 'unavailable'}"
                                          data-row="${seat.m_hall_row_no}" data-col="e" data-seat="${seat.e}"></div>
                                       <div
                                          class="seat seat-row-${seat.m_hall_row_no} ${seat.f == 0 ? 'available' : 'unavailable'}"
                                          data-row="${seat.m_hall_row_no}" data-col="f" data-seat="${seat.f}"></div>
                                       <div
                                          class="seat seat-row-${seat.m_hall_row_no} ${seat.g == 0 ? 'available' : 'unavailable'}"
                                          data-row="${seat.m_hall_row_no}" data-col="g" data-seat="${seat.g}"></div>
                                       <div
                                          class="seat seat-row-${seat.m_hall_row_no} ${seat.h == 0 ? 'available' : 'unavailable'}"
                                          data-row="${seat.m_hall_row_no}" data-col="h" data-seat="${seat.h}"></div>
                                       <div
                                          class="seat seat-row-${seat.m_hall_row_no} ${seat.i == 0 ? 'available' : 'unavailable'}"
                                          data-row="${seat.m_hall_row_no}" data-col="i" data-seat="${seat.i}"></div>
                                       <div
                                          class="seat seat-row-${seat.m_hall_row_no} ${seat.j == 0 ? 'available' : 'unavailable'}"
                                          data-row="${seat.m_hall_row_no}" data-col="j" data-seat="${seat.j}"></div>
                                       <div
                                          class="seat seat-row-${seat.m_hall_row_no} ${seat.k == 0 ? 'available' : 'unavailable'}"
                                          data-row="${seat.m_hall_row_no}" data-col="k" data-seat="${seat.k}"></div>
                                       <div
                                          class="seat seat-row-${seat.m_hall_row_no} ${seat.l == 0 ? 'available' : 'unavailable'}"
                                          data-row="${seat.m_hall_row_no}" data-col="l" data-seat="${seat.l}"></div>
                                       <div
                                          class="seat seat-row-${seat.m_hall_row_no} ${seat.m == 0 ? 'available' : 'unavailable'}"
                                          data-row="${seat.m_hall_row_no}" data-col="m" data-seat="${seat.m}"></div>
                                       <div
                                          class="seat seat-row-${seat.m_hall_row_no} ${seat.n == 0 ? 'available' : 'unavailable'}"
                                          data-row="${seat.m_hall_row_no}" data-col="n" data-seat="${seat.n}"></div>
                                       <div
                                          class="seat seat-row-${seat.m_hall_row_no} ${seat.o == 0 ? 'available' : 'unavailable'}"
                                          data-row="${seat.m_hall_row_no}" data-col="o" data-seat="${seat.o}"></div>
                                       <strong>&nbsp;&nbsp;${seat.m_hall_row_no}열</strong>
                                    </c:when>
                                    <c:otherwise>
                                       <c:choose>
                                          <c:when test="${fn:length(vo.seatList) == 1}">
                                             <c:set var="rowClass" value="seat-purple" />
                                          </c:when>
                                          <c:when test="${fn:length(vo.seatList) == 2}">
                                             <c:choose>
                                                <c:when
                                                   test="${seat.m_hall_row_no == 1 || seat.m_hall_row_no == 2 || seat.m_hall_row_no == 3 || seat.m_hall_row_no == 4 || seat.m_hall_row_no == 5 || seat.m_hall_row_no == 6}">
                                                   <c:set var="rowClass" value="seat-purple" />
                                                </c:when>
                                                <c:otherwise>
                                                   <c:set var="rowClass" value="seat-green" />
                                                </c:otherwise>
                                             </c:choose>
                                          </c:when>
                                          <c:when test="${fn:length(vo.seatList) == 3}">
                                             <c:choose>
                                                <c:when
                                                   test="${seat.m_hall_row_no == 1 || seat.m_hall_row_no == 2 || seat.m_hall_row_no == 3 || seat.m_hall_row_no == 4}">
                                                   <c:set var="rowClass" value="seat-purple" />
                                                </c:when>
                                                <c:when
                                                   test="${seat.m_hall_row_no == 5 || seat.m_hall_row_no == 6 || seat.m_hall_row_no == 7 || seat.m_hall_row_no == 8 || seat.m_hall_row_no == 9}">
                                                   <c:set var="rowClass" value="seat-green" />
                                                </c:when>
                                                <c:otherwise>
                                                   <c:set var="rowClass" value="seat-blue" />
                                                </c:otherwise>
                                             </c:choose>
                                          </c:when>
                                          <c:when test="${fn:length(vo.seatList) == 4}">
                                             <c:choose>
                                                <c:when
                                                   test="${seat.m_hall_row_no == 1 || seat.m_hall_row_no == 2 || seat.m_hall_row_no == 3}">
                                                   <c:set var="rowClass" value="seat-purple" />
                                                </c:when>
                                                <c:when
                                                   test="${seat.m_hall_row_no == 4 || seat.m_hall_row_no == 5 || seat.m_hall_row_no == 6 || seat.m_hall_row_no == 7}">
                                                   <c:set var="rowClass" value="seat-green" />
                                                </c:when>
                                                <c:when
                                                   test="${seat.m_hall_row_no == 8 || seat.m_hall_row_no == 9 || seat.m_hall_row_no == 10 || seat.m_hall_row_no == 11}">
                                                   <c:set var="rowClass" value="seat-blue" />
                                                </c:when>
                                                <c:otherwise>
                                                   <c:set var="rowClass" value="seat-orange" />
                                                </c:otherwise>
                                             </c:choose>
                                          </c:when>
                                          <c:when test="${fn:length(vo.seatList) == 5}">
                                             <c:choose>
                                                <c:when test="${seat.m_hall_row_no == 1 || seat.m_hall_row_no == 2}">
                                                   <c:set var="rowClass" value="seat-purple" />
                                                </c:when>
                                                <c:when
                                                   test="${seat.m_hall_row_no == 3 || seat.m_hall_row_no == 4 || seat.m_hall_row_no == 5}">
                                                   <c:set var="rowClass" value="seat-green" />
                                                </c:when>
                                                <c:when
                                                   test="${seat.m_hall_row_no == 6 || seat.m_hall_row_no == 7 || seat.m_hall_row_no == 8}">
                                                   <c:set var="rowClass" value="seat-blue" />
                                                </c:when>
                                                <c:when
                                                   test="${seat.m_hall_row_no == 9 || seat.m_hall_row_no == 10 || seat.m_hall_row_no == 11}">
                                                   <c:set var="rowClass" value="seat-orange" />
                                                </c:when>
                                                <c:otherwise>
                                                   <c:set var="rowClass" value="seat-navy" />
                                                </c:otherwise>
                                             </c:choose>
                                          </c:when>
                                          <c:otherwise>
                                             <c:choose>
                                                <c:when test="${seat.m_hall_row_no == 1 || seat.m_hall_row_no == 2}">
                                                   <c:set var="rowClass" value="seat-purple" />
                                                </c:when>
                                                <c:when
                                                   test="${seat.m_hall_row_no == 3 || seat.m_hall_row_no == 4 || seat.m_hall_row_no == 5}">
                                                   <c:set var="rowClass" value="seat-green" />
                                                </c:when>
                                                <c:when
                                                   test="${seat.m_hall_row_no == 6 || seat.m_hall_row_no == 7 || seat.m_hall_row_no == 8}">
                                                   <c:set var="rowClass" value="seat-blue" />
                                                </c:when>
                                                <c:when
                                                   test="${seat.m_hall_row_no == 9 || seat.m_hall_row_no == 10 || seat.m_hall_row_no == 11}">
                                                   <c:set var="rowClass" value="seat-orange" />
                                                </c:when>
                                                <c:when
                                                   test="${seat.m_hall_row_no == 12 || seat.m_hall_row_no == 13 || seat.m_hall_row_no == 14}">
                                                   <c:set var="rowClass" value="seat-orange" />
                                                </c:when>
                                                <c:otherwise>
                                                   <c:set var="rowClass" value="seat-black" />
                                                </c:otherwise>
                                             </c:choose>
                                          </c:otherwise>
                                       </c:choose>
                                       <div
                                          class="seat ${rowClass} seat-row-${seat.m_hall_row_no} ${seat.a == 0 ? 'available' : 'unavailable'}"
                                          data-row="${seat.m_hall_row_no}" data-col="a" data-seat="${seat.a}"></div>
                                       <div
                                          class="seat ${rowClass} seat-row-${seat.m_hall_row_no} ${seat.b == 0 ? 'available' : 'unavailable'}"
                                          data-row="${seat.m_hall_row_no}" data-col="b" data-seat="${seat.b}"></div>
                                       <div
                                          class="seat ${rowClass} seat-row-${seat.m_hall_row_no} ${seat.c == 0 ? 'available' : 'unavailable'}"
                                          data-row="${seat.m_hall_row_no}" data-col="c" data-seat="${seat.c}"></div>
                                       <div
                                          class="seat ${rowClass} seat-row-${seat.m_hall_row_no} ${seat.d == 0 ? 'available' : 'unavailable'}"
                                          data-row="${seat.m_hall_row_no}" data-col="d" data-seat="${seat.d}"></div>
                                       <div
                                          class="seat ${rowClass} seat-row-${seat.m_hall_row_no} ${seat.e == 0 ? 'available' : 'unavailable'}"
                                          data-row="${seat.m_hall_row_no}" data-col="e" data-seat="${seat.e}"></div>
                                       <div
                                          class="seat ${rowClass} seat-row-${seat.m_hall_row_no} ${seat.f == 0 ? 'available' : 'unavailable'}"
                                          data-row="${seat.m_hall_row_no}" data-col="f" data-seat="${seat.f}"></div>
                                       <div
                                          class="seat ${rowClass} seat-row-${seat.m_hall_row_no} ${seat.g == 0 ? 'available' : 'unavailable'}"
                                          data-row="${seat.m_hall_row_no}" data-col="g" data-seat="${seat.g}"></div>
                                       <div
                                          class="seat ${rowClass} seat-row-${seat.m_hall_row_no} ${seat.h == 0 ? 'available' : 'unavailable'}"
                                          data-row="${seat.m_hall_row_no}" data-col="h" data-seat="${seat.h}"></div>
                                       <div
                                          class="seat ${rowClass} seat-row-${seat.m_hall_row_no} ${seat.i == 0 ? 'available' : 'unavailable'}"
                                          data-row="${seat.m_hall_row_no}" data-col="i" data-seat="${seat.i}"></div>
                                       <div
                                          class="seat ${rowClass} seat-row-${seat.m_hall_row_no} ${seat.j == 0 ? 'available' : 'unavailable'}"
                                          data-row="${seat.m_hall_row_no}" data-col="j" data-seat="${seat.j}"></div>
                                       <div
                                          class="seat ${rowClass} seat-row-${seat.m_hall_row_no} ${seat.k == 0 ? 'available' : 'unavailable'}"
                                          data-row="${seat.m_hall_row_no}" data-col="k" data-seat="${seat.k}"></div>
                                       <div
                                          class="seat ${rowClass} seat-row-${seat.m_hall_row_no} ${seat.l == 0 ? 'available' : 'unavailable'}"
                                          data-row="${seat.m_hall_row_no}" data-col="l" data-seat="${seat.l}"></div>
                                       <div
                                          class="seat ${rowClass} seat-row-${seat.m_hall_row_no} ${seat.m == 0 ? 'available' : 'unavailable'}"
                                          data-row="${seat.m_hall_row_no}" data-col="m" data-seat="${seat.m}"></div>
                                       <div
                                          class="seat ${rowClass} seat-row-${seat.m_hall_row_no} ${seat.n == 0 ? 'available' : 'unavailable'}"
                                          data-row="${seat.m_hall_row_no}" data-col="n" data-seat="${seat.n}"></div>
                                       <div
                                          class="seat ${rowClass} seat-row-${seat.m_hall_row_no} ${seat.o == 0 ? 'available' : 'unavailable'}"
                                          data-row="${seat.m_hall_row_no}" data-col="o" data-seat="${seat.o}"></div>
                                       <strong>&nbsp;&nbsp;${seat.m_hall_row_no}</strong>
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
                color: rgb(228, 64, 64);
                text-align: center;
                font-weight: bold;
              ">
                              원하시는 좌석 위치를 선택해주세요.
                           </div>
                           <br />

                           <div class="seat-container3">
                              <p style=" text-align: center">
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
                                 <input type="hidden" name="mem_idx" value="${user.mem_idx}" />
                                 <div style="display: flex; justify-content: center">
                                    <input type="button" class="btn btn-success" value="좌석선택완료" style="width: 110px"
                                       onclick="submitSeats()" />
                                 </div>
                              </form>
                           </div>

                           <div class="seat-container4">
                              <input class="btn btn-warning" type="button" value="좌석다시선택"
                                 onclick="redirectToCurrentPage()" />
                              <br /><br /><br />
                              <!-- 장바구니 담기 폼 -->
                              <form id="bookForm" action="../cart/insert.do" method="post">
                                 <input type="hidden" name="performance_idx" value="${param.performance_idx}" />
                                 <input type="hidden" name="mem_idx" value="${user.mem_idx}" />
                                 <input type="hidden" name="reserved_performance_date" value="${param.date}" />
                                 <input type="button" class="btn btn-danger" value="장바구니 담기"
                                    onclick="submitBookForm()" />
                              </form>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </body>

            </html>