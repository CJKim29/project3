<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <title>Seat Booking</title>

            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

            <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
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
            </style>

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
            <div class="seat-container">
                <div class="seat2 seat-purple" data-color="purple" id="seat${i}"></div>vip석 : 20석<br />
                <div class="seat2 seat-green" data-color="green" id="seat${i}"></div>r석 : 20석<br />
                <div class="seat2 seat-blue" data-color="blue" id="seat${i}"></div>s석 : 20석<br />
                <div class="seat2 seat-orange" data-color="orange" id="seat${i}"></div>a석 : 40석<br />

                <br /><br />
                <input class="btn btn-success" type="button" value="예약"
                    onclick="location.href='concert_seat.do?concert_idx=${ vo.concert_idx }'">
            </div>

            <table class="table">
                <tr class="info">
                    <th>카테고리</th>
                    <th>공연명</th>
                    <th>공연장</th>
                    <th>공연날짜</th>
                    <th>좌석등급</th>
                    <th>다른 관람일자 선택</th>
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
                </tr>


            </table>
        </body>

        </html>