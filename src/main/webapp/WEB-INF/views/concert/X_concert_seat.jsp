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

                    .seat.available {
                        background-color: black;
                    }

                    .seat.unavailable {
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

                    /* 좌석 컨테이너 스타일 */
                    .seat-container {
                        width: 500px;
                        display: inline-block;
                        vertical-align: top;
                        margin-right: 20px;
                    }

                    .seat.seat-row-1,
                    .seat.seat-row-2 {
                        background-color: rgb(187, 73, 187);
                        /* Purple */
                    }

                    .seat.seat-row-3,
                    .seat.seat-row-4 {
                        background-color: rgb(52, 199, 52);
                        /* Green */
                    }

                    .seat.seat-row-5,
                    .seat.seat-row-6 {
                        background-color: rgb(40, 204, 216);
                        /* Blue */
                    }

                    .seat.seat-row-7,
                    .seat.seat-row-8,
                    .seat.seat-row-9,
                    .seat.seat-row-10 {
                        background-color: rgb(233, 174, 66);
                        /* Orange */
                    }

                    /* ... 각 row별로 색상을 추가로 정의 */
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
                                // 색상을 하얀색으로 변경
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

            </head>

            <body>
                <h1 style="text-align: left; margin-left: 100px;">좌석 예약</h1>
                <div class="seat-container">
                    <c:forEach var="seat" items="${seats}">
                        <div>
                            <!-- Row별로 동적으로 클래스 할당 -->
                            <div
                                class="seat seat-row-${seat.s_hall_row_no} ${seat.s_hall_a == 0 ? 'available' : 'unavailable'}">
                            </div>
                            <div
                                class="seat seat-row-${seat.s_hall_row_no} ${seat.s_hall_b == 0 ? 'available' : 'unavailable'}">
                            </div>
                            <div
                                class="seat seat-row-${seat.s_hall_row_no} ${seat.s_hall_c == 0 ? 'available' : 'unavailable'}">
                            </div>
                            <div
                                class="seat seat-row-${seat.s_hall_row_no} ${seat.s_hall_d == 0 ? 'available' : 'unavailable'}">
                            </div>
                            <div
                                class="seat seat-row-${seat.s_hall_row_no} ${seat.s_hall_e == 0 ? 'available' : 'unavailable'}">
                            </div>
                            <div
                                class="seat seat-row-${seat.s_hall_row_no} ${seat.s_hall_f == 0 ? 'available' : 'unavailable'}">
                            </div>
                            <div
                                class="seat seat-row-${seat.s_hall_row_no} ${seat.s_hall_g == 0 ? 'available' : 'unavailable'}">
                            </div>
                            <div
                                class="seat seat-row-${seat.s_hall_row_no} ${seat.s_hall_h == 0 ? 'available' : 'unavailable'}">
                            </div>
                            <div
                                class="seat seat-row-${seat.s_hall_row_no} ${seat.s_hall_i == 0 ? 'available' : 'unavailable'}">
                            </div>
                            <div
                                class="seat seat-row-${seat.s_hall_row_no} ${seat.s_hall_j == 0 ? 'available' : 'unavailable'}">
                            </div>
                            <strong>&nbsp;&nbsp;Row ${seat.s_hall_row_no}</strong>
                        </div>
                    </c:forEach>
                </div>
                <div class="seat-container">
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
                            <div class="seat2 seat-orange" data-color="orange" id="seat${i}"></div>
                            ${seat.seat_grade} : ${zeroCount5}석<br />
                        </c:forEach>
                    </c:if>

                    <br /><br />
                    <input class="btn btn-success" type="button" value="예약"
                        onclick="location.href='concert_seat.do?concert_idx=${ vo.concert_idx }'">
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
                <div class="seat-container">
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
                </div>
            </body>

            </html>