<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ taglib prefix="fn"
uri="http://java.sun.com/jsp/jstl/functions" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>좌석 예약</title>
    <link
      rel="icon"
      href="../resources/images/TIMOA_icon.png"
      type="image/png"
    />

    <link rel="stylesheet" href="../resources/css/book/book_seat_m.css" />

    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
    />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script
      src="https://unpkg.com/gijgo@1.9.14/js/gijgo.min.js"
      type="text/javascript"
    ></script>
    <link
      href="https://unpkg.com/gijgo@1.9.14/css/gijgo.min.css"
      rel="stylesheet"
      type="text/css"
    />

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
          // 클릭된 버튼의 행(row)과 열(column) 정보 추출
          var rowNo = $(this).data("row");
          var colNo = $(this).data("col");

          // 좌석 정보 문자열 생성
          var seatInfo = rowNo + "열 " + colNo + "석";
          var seatKey = rowNo + "-" + colNo;

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
        });
        window.submitBookForm = function () {
          var form = $("#bookForm");
          form.find('input[name="seatInfo"]').remove(); // 기존 입력값 제거
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
          const seatId = row + "-" + col;
          const index = selectedSeats.indexOf(seatId);
          if (index === -1) {
            selectedSeats.push(seatId);
          } else {
            selectedSeats.splice(index, 1);
          }
          console.log("Selected Seats Updated:", selectedSeats);
          updateSeatInfo();
        }

        function submitSeats() {
          if (selectedSeats.length === 0) {
            alert("좌석을 선택해 주세요.");
            return;
          }
          // Serialize selectedSeats as JSON
          document.getElementById("selectedSeats").value = JSON.stringify(
            selectedSeats.map((seat) => {
              const [row, col] = seat.split("-");
              return { row: parseInt(row), col: col };
            })
          );
          document.getElementById("seatForm").submit();
        }

        function updateSeatInfo() {
          const seatInfoContainer = document.querySelector(
            ".seat-info-container"
          );
          seatInfoContainer.innerHTML = "";
          selectedSeats.forEach((seatId) => {
            const [row, col] = seatId.split("-");
            const div = document.createElement("div");
            div.textContent = `Row: ${row}, Col: ${col}`;
            seatInfoContainer.appendChild(div);
          });
        }

        document.querySelectorAll(".seat").forEach((seat) => {
          seat.addEventListener("click", (event) => {
            const row = event.target.getAttribute("data-row");
            const col = event.target.getAttribute("data-col");
            toggleSeat(row, col);
            updateSeatInfo();
          });
        });

        document
          .querySelector(".btn-success")
          .addEventListener("click", submitSeats);
      });
    </script>
  </head>

  <body>
    <div id="seat-box">
      <div id="seat-box-header">
        <h3
          style="
            width: 150px;
            float: right;
            text-align: center;
            height: 45px;
            line-height: 45px;
            color: white;
            background-color: rgb(228, 64, 64);
            margin-right: 10px;
          "
        >
          좌석 선택
        </h3>
        <br /><br />
        <div
          class="seat-title"
          title="${ vo.performanceCateVo.performance_cate_name }&nbsp; - ${ vo.performance_name }
                &nbsp;&nbsp;&nbsp;&nbsp;${ vo.hallVo.hall_name }"
        >
          ${ vo.performanceCateVo.performance_cate_name }&nbsp; 「${
          vo.performance_name }」 &nbsp;&nbsp;&nbsp;&nbsp;${ vo.hallVo.hall_name
          } <br />
        </div>
        <div class="seat-container0">
          <p
            style="
              margin-top: 17px;
              color: white;
              background-color: rgb(51, 121, 181);
            "
          >
            다른 관람일자 선택
          </p>
          <input id="datepicker" width="120" value="${param.date}" />
          <input
            class="btn btn-primary"
            type="button"
            value="날짜 바꾸기"
            data-performance-idx="${ vo.performance_idx }"
            onclick="location.href='performance_seat.do?performance_idx=${ vo.performance_idx }&date=' + $('#datepicker').val()"
          />
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
                  <c:when test="${seat.m_hall_row_no <= 0}">
                    <!-- 기본 색상 클래스 유지 -->
                    <div
                      class="seat seat-row-${seat.m_hall_row_no} ${seat.m_hall_a == 0 ? 'available' : 'unavailable'}"
                      data-row="${seat.m_hall_row_no}"
                      data-col="m_hall_a"
                      data-seat="${seat.m_hall_a}"
                    ></div>
                    <div
                      class="seat seat-row-${seat.m_hall_row_no} ${seat.m_hall_b == 0 ? 'available' : 'unavailable'}"
                      data-row="${seat.m_hall_row_no}"
                      data-col="m_hall_b"
                      data-seat="${seat.m_hall_b}"
                    ></div>
                    <div
                      class="seat seat-row-${seat.m_hall_row_no} ${seat.m_hall_c == 0 ? 'available' : 'unavailable'}"
                      data-row="${seat.m_hall_row_no}"
                      data-col="m_hall_c"
                      data-seat="${seat.m_hall_c}"
                    ></div>
                    <div
                      class="seat seat-row-${seat.m_hall_row_no} ${seat.m_hall_d == 0 ? 'available' : 'unavailable'}"
                      data-row="${seat.m_hall_row_no}"
                      data-col="m_hall_d"
                      data-seat="${seat.m_hall_d}"
                    ></div>
                    <div
                      class="seat seat-row-${seat.m_hall_row_no} ${seat.m_hall_e == 0 ? 'available' : 'unavailable'}"
                      data-row="${seat.m_hall_row_no}"
                      data-col="m_hall_e"
                      data-seat="${seat.m_hall_e}"
                    ></div>
                    <div
                      class="seat seat-row-${seat.m_hall_row_no} ${seat.m_hall_f == 0 ? 'available' : 'unavailable'}"
                      data-row="${seat.m_hall_row_no}"
                      data-col="m_hall_f"
                      data-seat="${seat.m_hall_f}"
                    ></div>
                    <div
                      class="seat seat-row-${seat.m_hall_row_no} ${seat.m_hall_g == 0 ? 'available' : 'unavailable'}"
                      data-row="${seat.m_hall_row_no}"
                      data-col="m_hall_g"
                      data-seat="${seat.m_hall_g}"
                    ></div>
                    <div
                      class="seat seat-row-${seat.m_hall_row_no} ${seat.m_hall_h == 0 ? 'available' : 'unavailable'}"
                      data-row="${seat.m_hall_row_no}"
                      data-col="m_hall_h"
                      data-seat="${seat.m_hall_h}"
                    ></div>
                    <div
                      class="seat seat-row-${seat.m_hall_row_no} ${seat.m_hall_i == 0 ? 'available' : 'unavailable'}"
                      data-row="${seat.m_hall_row_no}"
                      data-col="m_hall_i"
                      data-seat="${seat.m_hall_i}"
                    ></div>
                    <div
                      class="seat seat-row-${seat.m_hall_row_no} ${seat.m_hall_j == 0 ? 'available' : 'unavailable'}"
                      data-row="${seat.m_hall_row_no}"
                      data-col="m_hall_j"
                      data-seat="${seat.m_hall_j}"
                    ></div>
                    <div
                      class="seat seat-row-${seat.m_hall_row_no} ${seat.m_hall_k == 0 ? 'available' : 'unavailable'}"
                      data-row="${seat.m_hall_row_no}"
                      data-col="m_hall_k"
                      data-seat="${seat.m_hall_k}"
                    ></div>
                    <div
                      class="seat seat-row-${seat.m_hall_row_no} ${seat.m_hall_l == 0 ? 'available' : 'unavailable'}"
                      data-row="${seat.m_hall_row_no}"
                      data-col="m_hall_l"
                      data-seat="${seat.m_hall_l}"
                    ></div>
                    <div
                      class="seat seat-row-${seat.m_hall_row_no} ${seat.m_hall_m == 0 ? 'available' : 'unavailable'}"
                      data-row="${seat.m_hall_row_no}"
                      data-col="m_hall_m"
                      data-seat="${seat.m_hall_m}"
                    ></div>
                    <div
                      class="seat seat-row-${seat.m_hall_row_no} ${seat.m_hall_n == 0 ? 'available' : 'unavailable'}"
                      data-row="${seat.m_hall_row_no}"
                      data-col="m_hall_n"
                      data-seat="${seat.m_hall_n}"
                    ></div>
                    <div
                      class="seat seat-row-${seat.m_hall_row_no} ${seat.m_hall_o == 0 ? 'available' : 'unavailable'}"
                      data-row="${seat.m_hall_row_no}"
                      data-col="m_hall_o"
                      data-seat="${seat.m_hall_o}"
                    ></div>
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
                            test="${seat.m_hall_row_no == 1 || seat.m_hall_row_no == 2 || seat.m_hall_row_no == 3 || seat.m_hall_row_no == 4 || seat.m_hall_row_no == 5 || seat.m_hall_row_no == 6}"
                          >
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
                            test="${seat.m_hall_row_no == 1 || seat.m_hall_row_no == 2 || seat.m_hall_row_no == 3 || seat.m_hall_row_no == 4}"
                          >
                            <c:set var="rowClass" value="seat-purple" />
                          </c:when>
                          <c:when
                            test="${seat.m_hall_row_no == 5 || seat.m_hall_row_no == 6 || seat.m_hall_row_no == 7 || seat.m_hall_row_no == 8 || seat.m_hall_row_no == 9}"
                          >
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
                            test="${seat.m_hall_row_no == 1 || seat.m_hall_row_no == 2 || seat.m_hall_row_no == 3}"
                          >
                            <c:set var="rowClass" value="seat-purple" />
                          </c:when>
                          <c:when
                            test="${seat.m_hall_row_no == 4 || seat.m_hall_row_no == 5 || seat.m_hall_row_no == 6 || seat.m_hall_row_no == 7}"
                          >
                            <c:set var="rowClass" value="seat-green" />
                          </c:when>
                          <c:when
                            test="${seat.m_hall_row_no == 8 || seat.m_hall_row_no == 9 || seat.m_hall_row_no == 10 || seat.m_hall_row_no == 11}"
                          >
                            <c:set var="rowClass" value="seat-blue" />
                          </c:when>
                          <c:otherwise>
                            <c:set var="rowClass" value="seat-orange" />
                          </c:otherwise>
                        </c:choose>
                      </c:when>
                      <c:when test="${fn:length(vo.seatList) == 5}">
                        <c:choose>
                          <c:when
                            test="${seat.m_hall_row_no == 1 || seat.m_hall_row_no == 2}"
                          >
                            <c:set var="rowClass" value="seat-purple" />
                          </c:when>
                          <c:when
                            test="${seat.m_hall_row_no == 3 || seat.m_hall_row_no == 4 || seat.m_hall_row_no == 5}"
                          >
                            <c:set var="rowClass" value="seat-green" />
                          </c:when>
                          <c:when
                            test="${seat.m_hall_row_no == 6 || seat.m_hall_row_no == 7 || seat.m_hall_row_no == 8}"
                          >
                            <c:set var="rowClass" value="seat-blue" />
                          </c:when>
                          <c:when
                            test="${seat.m_hall_row_no == 9 || seat.m_hall_row_no == 10 || seat.m_hall_row_no == 11}"
                          >
                            <c:set var="rowClass" value="seat-orange" />
                          </c:when>
                          <c:otherwise>
                            <c:set var="rowClass" value="seat-navy" />
                          </c:otherwise>
                        </c:choose>
                      </c:when>
                      <c:otherwise>
                        <c:choose>
                          <c:when
                            test="${seat.m_hall_row_no == 1 || seat.m_hall_row_no == 2}"
                          >
                            <c:set var="rowClass" value="seat-purple" />
                          </c:when>
                          <c:when
                            test="${seat.m_hall_row_no == 3 || seat.m_hall_row_no == 4 || seat.m_hall_row_no == 5}"
                          >
                            <c:set var="rowClass" value="seat-green" />
                          </c:when>
                          <c:when
                            test="${seat.m_hall_row_no == 6 || seat.m_hall_row_no == 7 || seat.m_hall_row_no == 8}"
                          >
                            <c:set var="rowClass" value="seat-blue" />
                          </c:when>
                          <c:when
                            test="${seat.m_hall_row_no == 9 || seat.m_hall_row_no == 10 || seat.m_hall_row_no == 11}"
                          >
                            <c:set var="rowClass" value="seat-orange" />
                          </c:when>
                          <c:when
                            test="${seat.m_hall_row_no == 12 || seat.m_hall_row_no == 13 || seat.m_hall_row_no == 14}"
                          >
                            <c:set var="rowClass" value="seat-orange" />
                          </c:when>
                          <c:otherwise>
                            <c:set var="rowClass" value="seat-black" />
                          </c:otherwise>
                        </c:choose>
                      </c:otherwise>
                    </c:choose>
                    <div
                      class="seat ${rowClass} seat-row-${seat.m_hall_row_no} ${seat.m_hall_a == 0 ? 'available' : 'unavailable'}"
                      data-row="${seat.m_hall_row_no}"
                      data-col="m_hall_a"
                      data-seat="${seat.m_hall_a}"
                    ></div>
                    <div
                      class="seat ${rowClass} seat-row-${seat.m_hall_row_no} ${seat.m_hall_b == 0 ? 'available' : 'unavailable'}"
                      data-row="${seat.m_hall_row_no}"
                      data-col="m_hall_b"
                      data-seat="${seat.m_hall_b}"
                    ></div>
                    <div
                      class="seat ${rowClass} seat-row-${seat.m_hall_row_no} ${seat.m_hall_c == 0 ? 'available' : 'unavailable'}"
                      data-row="${seat.m_hall_row_no}"
                      data-col="m_hall_c"
                      data-seat="${seat.m_hall_c}"
                    ></div>
                    <div
                      class="seat ${rowClass} seat-row-${seat.m_hall_row_no} ${seat.m_hall_d == 0 ? 'available' : 'unavailable'}"
                      data-row="${seat.m_hall_row_no}"
                      data-col="m_hall_d"
                      data-seat="${seat.m_hall_d}"
                    ></div>
                    <div
                      class="seat ${rowClass} seat-row-${seat.m_hall_row_no} ${seat.m_hall_e == 0 ? 'available' : 'unavailable'}"
                      data-row="${seat.m_hall_row_no}"
                      data-col="m_hall_e"
                      data-seat="${seat.m_hall_e}"
                    ></div>
                    <div
                      class="seat ${rowClass} seat-row-${seat.m_hall_row_no} ${seat.m_hall_f == 0 ? 'available' : 'unavailable'}"
                      data-row="${seat.m_hall_row_no}"
                      data-col="m_hall_f"
                      data-seat="${seat.m_hall_f}"
                    ></div>
                    <div
                      class="seat ${rowClass} seat-row-${seat.m_hall_row_no} ${seat.m_hall_g == 0 ? 'available' : 'unavailable'}"
                      data-row="${seat.m_hall_row_no}"
                      data-col="m_hall_g"
                      data-seat="${seat.m_hall_g}"
                    ></div>
                    <div
                      class="seat ${rowClass} seat-row-${seat.m_hall_row_no} ${seat.m_hall_h == 0 ? 'available' : 'unavailable'}"
                      data-row="${seat.m_hall_row_no}"
                      data-col="m_hall_h"
                      data-seat="${seat.m_hall_h}"
                    ></div>
                    <div
                      class="seat ${rowClass} seat-row-${seat.m_hall_row_no} ${seat.m_hall_i == 0 ? 'available' : 'unavailable'}"
                      data-row="${seat.m_hall_row_no}"
                      data-col="m_hall_i"
                      data-seat="${seat.m_hall_i}"
                    ></div>
                    <div
                      class="seat ${rowClass} seat-row-${seat.m_hall_row_no} ${seat.m_hall_j == 0 ? 'available' : 'unavailable'}"
                      data-row="${seat.m_hall_row_no}"
                      data-col="m_hall_j"
                      data-seat="${seat.m_hall_j}"
                    ></div>
                    <div
                      class="seat ${rowClass} seat-row-${seat.m_hall_row_no} ${seat.m_hall_k == 0 ? 'available' : 'unavailable'}"
                      data-row="${seat.m_hall_row_no}"
                      data-col="m_hall_k"
                      data-seat="${seat.m_hall_k}"
                    ></div>
                    <div
                      class="seat ${rowClass} seat-row-${seat.m_hall_row_no} ${seat.m_hall_l == 0 ? 'available' : 'unavailable'}"
                      data-row="${seat.m_hall_row_no}"
                      data-col="m_hall_l"
                      data-seat="${seat.m_hall_l}"
                    ></div>
                    <div
                      class="seat ${rowClass} seat-row-${seat.m_hall_row_no} ${seat.m_hall_m == 0 ? 'available' : 'unavailable'}"
                      data-row="${seat.m_hall_row_no}"
                      data-col="m_hall_m"
                      data-seat="${seat.m_hall_m}"
                    ></div>
                    <div
                      class="seat ${rowClass} seat-row-${seat.m_hall_row_no} ${seat.m_hall_n == 0 ? 'available' : 'unavailable'}"
                      data-row="${seat.m_hall_row_no}"
                      data-col="m_hall_n"
                      data-seat="${seat.m_hall_n}"
                    ></div>
                    <div
                      class="seat ${rowClass} seat-row-${seat.m_hall_row_no} ${seat.m_hall_o == 0 ? 'available' : 'unavailable'}"
                      data-row="${seat.m_hall_row_no}"
                      data-col="m_hall_o"
                      data-seat="${seat.m_hall_o}"
                    ></div>
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
                  <c:forEach
                    var="seat"
                    items="${vo.seatList}"
                    begin="0"
                    end="0"
                  >
                    <td>
                      <div
                        class="seat2 seat-purple"
                        data-color="purple"
                        id="seat${i}"
                      ></div>
                    </td>
                    <td>&nbsp;${seat.seat_grade}석&nbsp;&nbsp;</td>
                    <td style="text-align: right">
                      ${zeroCount1}석&nbsp;&nbsp;
                    </td>
                    <td style="text-align: right">
                      <fmt:formatNumber
                        type="number"
                        value="${seat.seat_price}"
                      />원
                    </td>
                  </c:forEach>
                </tr>
                <tr>
                  <c:forEach
                    var="seat"
                    items="${vo.seatList}"
                    begin="1"
                    end="1"
                  >
                    <td>
                      <div
                        class="seat2 seat-green"
                        data-color="green"
                        id="seat${i}"
                      ></div>
                    </td>
                    <td>&nbsp;${seat.seat_grade}석&nbsp;&nbsp;</td>
                    <td style="text-align: right">
                      ${zeroCount2}석&nbsp;&nbsp;
                    </td>
                    <td style="text-align: right">
                      <fmt:formatNumber
                        type="number"
                        value="${seat.seat_price}"
                      />원
                    </td>
                  </c:forEach>
                </tr>
                <tr>
                  <c:forEach
                    var="seat"
                    items="${vo.seatList}"
                    begin="2"
                    end="2"
                  >
                    <td>
                      <div
                        class="seat2 seat-blue"
                        data-color="blue"
                        id="seat${i}"
                      ></div>
                    </td>
                    <td>&nbsp;${seat.seat_grade}석&nbsp;&nbsp;</td>
                    <td style="text-align: right">
                      ${zeroCount3}석&nbsp;&nbsp;
                    </td>
                    <td style="text-align: right">
                      <fmt:formatNumber
                        type="number"
                        value="${seat.seat_price}"
                      />원
                    </td>
                  </c:forEach>
                </tr>
                <tr>
                  <c:forEach
                    var="seat"
                    items="${vo.seatList}"
                    begin="3"
                    end="3"
                  >
                    <td>
                      <div
                        class="seat2 seat-orange"
                        data-color="orange"
                        id="seat${i}"
                      ></div>
                    </td>
                    <td>&nbsp;${seat.seat_grade}석&nbsp;&nbsp;</td>
                    <td style="text-align: right">
                      ${zeroCount4}석&nbsp;&nbsp;
                    </td>
                    <td style="text-align: right">
                      <fmt:formatNumber
                        type="number"
                        value="${seat.seat_price}"
                      />원
                    </td>
                  </c:forEach>
                </tr>
                <tr>
                  <c:forEach
                    var="seat"
                    items="${vo.seatList}"
                    begin="4"
                    end="4"
                  >
                    <td>
                      <div
                        class="seat2 seat-navy"
                        data-color="navy"
                        id="seat${i}"
                      ></div>
                    </td>
                    <td>&nbsp;${seat.seat_grade}석&nbsp;&nbsp;</td>
                    <td style="text-align: right">
                      ${zeroCount5}석&nbsp;&nbsp;
                    </td>
                    <td style="text-align: right">
                      <fmt:formatNumber
                        type="number"
                        value="${seat.seat_price}"
                      />원
                    </td>
                  </c:forEach>
                </tr>
              </table>
              <br />
            </div>
          </div>
          <div id="seat-box-body-right-bottom">
            <div
              style="
                width: 240px;
                background-color: rgb(228, 64, 64);
                color: white;
                text-align: center;
              "
            >
              원하시는 좌석 위치를 선택해주세요.
            </div>
            <br />
            <div class="seat-container3">
              <p style="background-color: aquamarine; text-align: center">
                선택좌석
              </p>
              <!-- 예약 폼 -->
              <form id="seatForm" action="reserve_seats.do" method="post">
                <div
                  class="seat-info-container"
                  style="
                    background-color: #eeeeee;
                    height: 120px;
                    max-height: 150px;
                    overflow-y: auto;
                  "
                ></div>
                <input
                  type="hidden"
                  name="performance_idx"
                  value="${param.performance_idx}"
                />
                <input type="hidden" name="date" value="${param.date}" />
                <input type="hidden" id="seat_row" name="row" />
                <input type="hidden" id="seat_col" name="col" />
                <input type="hidden" name="seat_idx" value="${seat_idx}" />
                <input type="hidden" id="selectedSeats" name="selectedSeats" />
                <div style="display: flex; justify-content: center">
                  <input
                    type="button"
                    class="btn btn-success"
                    value="예약"
                    style="width: 110px"
                    onclick="submitSeats()"
                  />
                </div>
              </form>
            </div>
            <div class="seat-container4">
              <input
                class="btn btn-warning"
                type="button"
                value="좌석다시선택"
                onclick="redirectToCurrentPage()"
              />
              <br /><br /><br />
              <!-- 장바구니 담기 폼 -->
              <form id="bookForm" action="book_reservation.do" method="post">
                <input
                  type="hidden"
                  name="performance_idx"
                  value="${param.performance_idx}"
                />
                <input type="hidden" name="date" value="${param.date}" />
                <input
                  type="button"
                  class="btn btn-danger"
                  value="장바구니 담기"
                  onclick="submitBookForm()"
                />
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
