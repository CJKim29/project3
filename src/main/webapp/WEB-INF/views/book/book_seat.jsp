<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <title>Seat Booking</title>

                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

                <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                <script src="https://unpkg.com/gijgo@1.9.14/js/gijgo.min.js" type="text/javascript"></script>
                <link href="https://unpkg.com/gijgo@1.9.14/css/gijgo.min.css" rel="stylesheet" type="text/css" />
                <style>
                    /* 기본 좌석 버튼 스타일 */
                    .seat {
                        width: 10px;
                        height: 10px;
                        margin: 2px;
                        border: 1px solid black;
                        display: inline-block;
                        cursor: pointer;
                        margin-left: 20px;
                    }

                    .seat2 {
                        width: 10px;
                        height: 10px;
                        margin: 2px;
                        border: 1px solid black;
                        display: inline-block;
                        cursor: pointer;
                        margin-left: 20px;
                    }

                    /* .seat.available {
                        background-color: black;
                    } */

                    .seat.unavailable {
                        pointer-events: none;
                        background-color: white !important;
                    }

                    /* 색상 스타일 */
                    .seat-purple {
                        background-color: rgb(187, 73, 187);
                    }

                    .seat-green {
                        background-color: rgb(52, 199, 52);
                    }

                    .seat-blue {
                        background-color: rgb(40, 204, 216);
                    }

                    .seat-orange {
                        background-color: rgb(233, 174, 66);
                    }

                    .seat-navy {
                        background-color: rgb(38, 50, 223);
                    }

                    /* 좌석 컨테이너 스타일 */
                    .seat-container {
                        width: 500px;
                        display: inline-block;
                        vertical-align: top;
                        margin-right: 20px;
                    }

                    .seat-container2,
                    .seat-container3 {
                        width: 150px;
                        display: inline-block;
                        vertical-align: top;
                        margin-right: 20px;
                    }

                    .seat.seat-row-1,
                    .seat.seat-row-2 {
                        background-color: rgb(187, 73, 187);
                    }

                    .seat.seat-row-3,
                    .seat.seat-row-4 {
                        background-color: rgb(52, 199, 52);
                    }

                    .seat.seat-row-5,
                    .seat.seat-row-6 {
                        background-color: rgb(40, 204, 216);
                    }

                    /* .seat.seat-row-7,
                    .seat.seat-row-8,
                    .seat.seat-row-9,
                    .seat.seat-row-10 {
                        background-color: rgb(233, 174, 66);
                    } */
                </style>

                <!-- 버튼 클릭 -->
                <script>
                    $(document).ready(function () {
                        // 좌석 버튼 클릭 이벤트 처리
                        $('.seat').each(function () {
                            // 원래 색상 저장
                            var originalColor = $(this).css('background-color');
                            $(this).data('originalColor', originalColor);
                        });

                        $('.seat').click(function () {
                            // 저장된 원래 색상
                            var originalColor = $(this).data('originalColor');

                            // 현재 색상
                            var currentColor = $(this).css('background-color');

                            // 색상 토글
                            if (currentColor === originalColor) {
                                // 선택된 버튼의 색상을 회색으로 변경
                                $(this).css('background-color', 'gray');
                            } else {
                                // 원래 색상으로 변경
                                $(this).css('background-color', originalColor);
                            }
                        });
                    });
                </script>
                
                

                <!-- 달력 -->
                <script>
                    $(document).ready(function () {
                        $('#datepicker').each(function () {
                            $(this).datepicker({
                                format: "yyyy-mm-dd",
                                showOnFocus: false
                            });
                        });
                    });
                </script>

                <!-- 버튼 클릭시 예약 현황 띄우기 -->
                <script>
                    $(document).ready(function () {
                        // 클릭된 좌석 정보를 저장할 객체
                        var clickedSeats = {};

                        // 좌석 클릭 이벤트 핸들러
                        $('.seat').click(function () {
                            // 클릭된 버튼의 행(row)과 열(column) 정보 추출
                            var rowNo = $(this).data('row');
                            var colNo = $(this).data('col');

                            // 좌석 정보 문자열 생성
                            var seatInfo = rowNo + '열 ' + colNo + '석';
                            var seatKey = rowNo + '-' + colNo;

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
                            var resultHtml = '';
                            for (var key in clickedSeats) {
                                resultHtml += '<p>' + clickedSeats[key] + '</p>';
                            }
                            $('.seat-info-container').html(resultHtml);
                        });
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
                    document.addEventListener('DOMContentLoaded', function () {
                        let selectedSeats = [];

                        function toggleSeat(row, col) {
                            const seatId = row + '-' + col;
                            const index = selectedSeats.indexOf(seatId);
                            if (index === -1) {
                                selectedSeats.push(seatId);
                            } else {
                                selectedSeats.splice(index, 1);
                            }
                            console.log('Selected Seats Updated:', selectedSeats);

                            // 선택된 좌석의 row와 col 값을 숨겨진 입력 필드에 설정
                            document.getElementById('seat_row').value = row;
                            document.getElementById('seat_col').value = col;
                        }

                        function submitSeats() {
                            if (selectedSeats.length === 0) {
                                alert('좌석을 선택해 주세요.');
                                return;
                            }
                            // Serialize selectedSeats as JSON
                            document.getElementById('selectedSeats').value = JSON.stringify(selectedSeats.map(seat => {
                                const [row, col] = seat.split('-');
                                return { row: parseInt(row), col: col };
                            }));
                            document.getElementById('seatForm').submit();
                        }


                        function updateSeatInfo() {
                            const seatInfoContainer = document.querySelector('.seat-info-container');
                            seatInfoContainer.innerHTML = '';
                            selectedSeats.forEach(seatId => {
                                const [row, col] = seatId.split('-');
                                const div = document.createElement('div');
                                div.textContent = `Row: ${row}, Col: ${col}`;
                                seatInfoContainer.appendChild(div);
                            });
                        }

                        document.querySelectorAll('.seat').forEach(seat => {
                            seat.addEventListener('click', (event) => {
                                const row = event.target.getAttribute('data-row');
                                const col = event.target.getAttribute('data-col');
                                toggleSeat(row, col);
                                updateSeatInfo();
                            });
                        });

                        document.querySelector('.btn-success').addEventListener('click', submitSeats);
                    });

                </script>



            </head>

            <body>
                <h2 style="text-align: left; margin-left: 65px;">${param.date} 좌석 예약</h2>
                <div class="seat-container">
                    <c:forEach var="seat" items="${seats}">
                        <div>
                            <c:choose>
                                <c:when test="${seat.s_hall_row_no <= 6}">
                                    <!-- 기본 색상 클래스 유지 -->
                                    <div class="seat seat-row-${seat.s_hall_row_no} ${seat.s_hall_a == 0 ? 'available' : 'unavailable'}"
                                        data-row="${seat.s_hall_row_no}" data-col="s_hall_a"
                                        data-seat="${seat.s_hall_a}">
                                    </div>
                                    <div class="seat seat-row-${seat.s_hall_row_no} ${seat.s_hall_b == 0 ? 'available' : 'unavailable'}"
                                        data-row="${seat.s_hall_row_no}" data-col="s_hall_b"
                                        data-seat="${seat.s_hall_b}">
                                    </div>
                                    <div class="seat seat-row-${seat.s_hall_row_no} ${seat.s_hall_c == 0 ? 'available' : 'unavailable'}"
                                        data-row="${seat.s_hall_row_no}" data-col="s_hall_c"
                                        data-seat="${seat.s_hall_c}">
                                    </div>
                                    <div class="seat seat-row-${seat.s_hall_row_no} ${seat.s_hall_d == 0 ? 'available' : 'unavailable'}"
                                        data-row="${seat.s_hall_row_no}" data-col="s_hall_d"
                                        data-seat="${seat.s_hall_d}">
                                    </div>
                                    <div class="seat seat-row-${seat.s_hall_row_no} ${seat.s_hall_e == 0 ? 'available' : 'unavailable'}"
                                        data-row="${seat.s_hall_row_no}" data-col="s_hall_e"
                                        data-seat="${seat.s_hall_e}">
                                    </div>
                                    <div class="seat seat-row-${seat.s_hall_row_no} ${seat.s_hall_f == 0 ? 'available' : 'unavailable'}"
                                        data-row="${seat.s_hall_row_no}" data-col="s_hall_f"
                                        data-seat="${seat.s_hall_f}">
                                    </div>
                                    <div class="seat seat-row-${seat.s_hall_row_no} ${seat.s_hall_g == 0 ? 'available' : 'unavailable'}"
                                        data-row="${seat.s_hall_row_no}" data-col="s_hall_g"
                                        data-seat="${seat.s_hall_g}">
                                    </div>
                                    <div class="seat seat-row-${seat.s_hall_row_no} ${seat.s_hall_h == 0 ? 'available' : 'unavailable'}"
                                        data-row="${seat.s_hall_row_no}" data-col="s_hall_h"
                                        data-seat="${seat.s_hall_h}">
                                    </div>
                                    <div class="seat seat-row-${seat.s_hall_row_no} ${seat.s_hall_i == 0 ? 'available' : 'unavailable'}"
                                        data-row="${seat.s_hall_row_no}" data-col="s_hall_i"
                                        data-seat="${seat.s_hall_i}">
                                    </div>
                                    <div class="seat seat-row-${seat.s_hall_row_no} ${seat.s_hall_j == 0 ? 'available' : 'unavailable'}"
                                        data-row="${seat.s_hall_row_no}" data-col="s_hall_j"
                                        data-seat="${seat.s_hall_j}">
                                    </div>
                                    <strong>&nbsp;&nbsp;${seat.s_hall_row_no}열</strong>
                                </c:when>
                                <c:otherwise>
                                    <c:choose>
                                        <c:when test="${fn:length(vo.seatList) == 5}">
                                            <c:choose>
                                                <c:when test="${seat.s_hall_row_no == 9 || seat.s_hall_row_no == 10}">
                                                    <c:set var="rowClass" value="seat-navy" />
                                                </c:when>
                                                <c:otherwise>
                                                    <c:set var="rowClass" value="seat-orange" />
                                                </c:otherwise>
                                            </c:choose>
                                        </c:when>
                                        <c:otherwise>
                                            <c:choose>
                                                <c:when test="${fn:length(vo.seatList) == 4}">
                                                    <c:set var="rowClass" value="seat-orange" />
                                                </c:when>
                                                <c:otherwise>
                                                    <c:set var="rowClass" value="seat-orange" />
                                                </c:otherwise>
                                            </c:choose>
                                        </c:otherwise>
                                    </c:choose>
                                    <div class="seat ${rowClass} seat-row-${seat.s_hall_row_no} ${seat.s_hall_a == 0 ? 'available' : 'unavailable'}"
                                        data-row="${seat.s_hall_row_no}" data-col="s_hall_a"
                                        data-seat="${seat.s_hall_a}">
                                    </div>
                                    <div class="seat ${rowClass} seat-row-${seat.s_hall_row_no} ${seat.s_hall_b == 0 ? 'available' : 'unavailable'}"
                                        data-row="${seat.s_hall_row_no}" data-col="s_hall_b"
                                        data-seat="${seat.s_hall_b}">
                                    </div>
                                    <div class="seat ${rowClass} seat-row-${seat.s_hall_row_no} ${seat.s_hall_c == 0 ? 'available' : 'unavailable'}"
                                        data-row="${seat.s_hall_row_no}" data-col="s_hall_c"
                                        data-seat="${seat.s_hall_c}">
                                    </div>
                                    <div class="seat ${rowClass} seat-row-${seat.s_hall_row_no} ${seat.s_hall_d == 0 ? 'available' : 'unavailable'}"
                                        data-row="${seat.s_hall_row_no}" data-col="s_hall_d"
                                        data-seat="${seat.s_hall_d}">
                                    </div>
                                    <div class="seat ${rowClass} seat-row-${seat.s_hall_row_no} ${seat.s_hall_e == 0 ? 'available' : 'unavailable'}"
                                        data-row="${seat.s_hall_row_no}" data-col="s_hall_e"
                                        data-seat="${seat.s_hall_e}">
                                    </div>
                                    <div class="seat ${rowClass} seat-row-${seat.s_hall_row_no} ${seat.s_hall_f == 0 ? 'available' : 'unavailable'}"
                                        data-row="${seat.s_hall_row_no}" data-col="s_hall_f"
                                        data-seat="${seat.s_hall_f}">
                                    </div>
                                    <div class="seat ${rowClass} seat-row-${seat.s_hall_row_no} ${seat.s_hall_g == 0 ? 'available' : 'unavailable'}"
                                        data-row="${seat.s_hall_row_no}" data-col="s_hall_g"
                                        data-seat="${seat.s_hall_g}">
                                    </div>
                                    <div class="seat ${rowClass} seat-row-${seat.s_hall_row_no} ${seat.s_hall_h == 0 ? 'available' : 'unavailable'}"
                                        data-row="${seat.s_hall_row_no}" data-col="s_hall_h"
                                        data-seat="${seat.s_hall_h}">
                                    </div>
                                    <div class="seat ${rowClass} seat-row-${seat.s_hall_row_no} ${seat.s_hall_i == 0 ? 'available' : 'unavailable'}"
                                        data-row="${seat.s_hall_row_no}" data-col="s_hall_i"
                                        data-seat="${seat.s_hall_i}">
                                    </div>
                                    <div class="seat ${rowClass} seat-row-${seat.s_hall_row_no} ${seat.s_hall_j == 0 ? 'available' : 'unavailable'}"
                                        data-row="${seat.s_hall_row_no}" data-col="s_hall_j"
                                        data-seat="${seat.s_hall_j}">
                                    </div>
                                    <strong>&nbsp;&nbsp;${seat.s_hall_row_no}열</strong>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </c:forEach>
                </div>

                <div class="seat-container2">
                    <c:forEach var="seat" items="${vo.seatList}" begin="0" end="0">
                        <div class="seat2 seat-purple" data-color="purple" id="seat${i}"></div>${seat.seat_grade} :
                        ${zeroCount1}석<br />
                    </c:forEach>
                    <c:forEach var="seat" items="${vo.seatList}" begin="1" end="1">
                        <div class="seat2 seat-green" data-color="green" id="seat${i}"></div>${seat.seat_grade} :
                        ${zeroCount2}석<br />
                    </c:forEach>
                    <c:forEach var="seat" items="${vo.seatList}" begin="2" end="2">
                        <div class="seat2 seat-blue" data-color="blue" id="seat${i}"></div>${seat.seat_grade} :
                        ${zeroCount3}석<br />
                    </c:forEach>

                    <c:forEach var="seat" items="${vo.seatList}" begin="3" end="3">
                        <div class="seat2 seat-orange" data-color="orange" id="seat${i}"></div>${seat.seat_grade} :
                        ${zeroCount4}석<br />
                    </c:forEach>
                    <c:if test="${fn:length(vo.seatList) == 5}">
                        <c:forEach var="seat" items="${vo.seatList}" begin="4" end="4">
                            <div class="seat2 seat-navy" data-color="navy" id="seat${i}"></div>${seat.seat_grade} :
                            ${zeroCount5}석<br />
                        </c:forEach>
                    </c:if>
                </div>
                <div class="seat-container3">
                    <p>예약 현황</p>
                    <div class="seat-info-container" style="max-height: 150px; overflow-y: auto;"></div>
                </div>
                </div>
                <!-- 예약 현황 출력 -->
                <div class="seat-container3">
                    <input class="btn btn-warning" type="button" value="좌석다시선택" onclick="redirectToCurrentPage()">
                    <br /><br /><br />
                    <form id="seatForm" action="reserveSeats.do" method="post">
                        <input type="hidden" name="concert_idx" value="${param.concert_idx}">
                        <input type="hidden" name="date" value="${param.date}">
                        <input type="hidden" id="seat_row" name="row">
                        <input type="hidden" id="seat_col" name="col">
                        <input type="hidden" name="seat_idx" value="${seat_idx}">
                        <input type="hidden" id="selectedSeats" name="selectedSeats" />
                        <input type="button" class="btn btn-success" value="예약" onclick="submitSeats()">
                    </form>
                </div>

                <br /><br />
                <table class="table">
                    <tr class="info">
                        <th>카테고리</th>
                        <th>공연명</th>
                        <th>공연장</th>
                        <th>공연날짜</th>
                        <th>좌석등급</th>
                        <th>다른 관람일자</th>
                        <th>다른 관람일자 선택</th>
                        <th>테스트</th>
                    </tr>

                    <tr>
                        <td>${ vo.concertCateVo.concert_cate_name }</td>
                        <td>${ vo.concert_name }</td>
                        <td>${ vo.hallVo.hall_name }</td>
                        <td>${param.date}</td>
                        <td>
                            <c:forEach var="seat" items="${vo.seatList}">
                                ${seat.seat_grade} : ${seat.seat_price} <br>
                            </c:forEach>
                        </td>
                        <td>
                            <input id="datepicker" width="276" />
                        </td>
                        <td><input class="btn btn-success" type="button" value="날짜 바꾸기"
                                data-concert-idx="${ vo.concert_idx }"
                                onclick="location.href='concert_seat.do?concert_idx=${ vo.concert_idx }&date=' + $('#datepicker').val()">
                        </td>
                        <td>
                            <c:forEach var="seat" items="${vo.seatList}" varStatus="status">
                                <div class="seat2 seat-${status.index == 0 ? 'purple' : status.index == 1 ? 'green' : status.index == 2 ? 'blue' : 'orange'}"
                                    data-color="${status.index == 0 ? 'purple' : status.index == 1 ? 'green' : status.index == 2 ? 'blue' : 'orange'}"
                                    id="seat${status.index}">
                                </div>
                                ${seat.seat_grade} : ${status.index == 0 ? zeroCount1 : status.index == 1 ? zeroCount2 :
                                status.index == 2 ? zeroCount3 : status.index == 3 ? zeroCount4 : zeroCount5}석<br />
                            </c:forEach>
                        </td>
                    </tr>


                </table>
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
            </body>

            </html>