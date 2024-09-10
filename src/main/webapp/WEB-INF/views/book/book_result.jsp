<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <title>book result</title>
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

                <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                <script src="https://unpkg.com/gijgo@1.9.14/js/gijgo.min.js" type="text/javascript"></script>
                <link href="https://unpkg.com/gijgo@1.9.14/css/gijgo.min.css" rel="stylesheet" type="text/css" />
            </head>

            <body>
                <b>${ sessionScope.user.mem_name }</b>님 환영합니다<br>
                <b>${ sessionScope.user.mem_idx }</b>번 회원님 환영합니다
                <table class="table">
                    <tr class="info">
                        <th>공연명</th>
                        <th>공연장</th>
                        <th>공연날짜</th>
                        <th>예매 좌석정보</th>
                        <th>좌석가격</th>
                    </tr>

                    <tr>
                        <td>${ vo.concert_name }</td>
                        <td>${ vo.hallVo.hall_name }</td>
                        <td>${param.date}</td>
                        <td>
                            <c:forEach var="info" items="${seatInfo}">
                                ${info}<br />
                            </c:forEach>
                        </td>
                        <td>
                            <c:forEach var="seat" items="${vo.seatList}">
                                ${seat.seat_grade} : ${seat.seat_price} <br>
                            </c:forEach>
                        </td>
                    </tr>

                </table>
            </body>

            </html>