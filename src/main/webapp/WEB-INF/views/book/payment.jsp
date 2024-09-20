<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>결제</title>
            <link rel="icon" href="../resources/images/TIMOA_icon.png" type="image/png" />

            <link rel="stylesheet" href="../resources/css/book/payment.css" />

            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <script src="https://unpkg.com/gijgo@1.9.14/js/gijgo.min.js" type="text/javascript"></script>
            <link href="https://unpkg.com/gijgo@1.9.14/css/gijgo.min.css" rel="stylesheet" type="text/css" />


        </head>

        <body>

            <div id="seat-box">
                <div id="seat-box-header">
                    <!-- 
                <form id="seatForm" action="reserve_seats.do" method="post">
                    <input type="hidden" name="performance_idx" value="${param.performance_idx}" />
                    <input type="hidden" name="date" value="${param.date}" />
                    <input type="hidden" id="seat_row" name="row" />
                    <input type="hidden" id="seat_col" name="col" />
                    <input type="hidden" name="seat_idx" value="${seat_idx}" />
                    <input type="hidden" id="selectedSeats" name="selectedSeats" />
                </form> -->

                    <div class="seat-title" title="${ vo.performanceCateVo.performance_cate_name }&nbsp; - ${ vo.performance_name }
            &nbsp;&nbsp;&nbsp;&nbsp;${ vo.hallVo.hall_name }">
                        ${ vo.performanceCateVo.performance_cate_name }&nbsp; 「${
                        vo.performance_name }」 &nbsp;&nbsp;&nbsp;&nbsp;${ vo.hallVo.hall_name
                        } <br />
                    </div>

                </div>
                <div id="seat-box-body-left">
                    <div class="seat-container">

                        <table cellpadding="10" cellspacing="0" class="table table-bordered">
                            <tr>
                                <th colspan="4">예매자 정보</th>
                            </tr>
                            <tr>
                                <td>이름</td>
                                <td>${user.mem_name}</td>
                            </tr>
                            <tr>
                                <td>생년월일</td>
                                <td>${user.mem_birth}</td>
                            </tr>
                            <tr>
                                <td>핸드폰 번호</td>
                                <td>${user.mem_phone}</td>
                            </tr>
                            <tr>
                                <td>이메일</td>
                                <td>${user.mem_email}</td>
                            </tr>
                        </table>


                    </div>
                </div>
                <div id="seat-box-body-right">
                    <div class="seat-content">
                        <div id="seat-box-body-right-top">
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
                                        <td>${seatVo.seat_price}</td>
                                    </tr>
                                    <tr>
                                        <td>할인</td>
                                        <td>???</td>
                                    </tr>
                                    <tr>
                                        <td>총 결제 금액</td>
                                        <td>0원</td>
                                    </tr>


                                    <!-- <tr>
                                    <c:forEach var="seat" items="${vo.seatList}" begin="0" end="0">
                                        <td>
                                            <div class="seat2 seat-purple" data-color="purple" id="seat${i}"></div>
                                        </td>
                                        <td>&nbsp;${seat.seat_grade}석&nbsp;&nbsp;</td>
                                        <td style="text-align: right">
                                            ${zeroCount1}석&nbsp;&nbsp;
                                        </td>
                                        <td style="text-align: right">
                                            <fmt:formatNumber type="number" value="${seat.seat_price}" />원
                                        </td>
                                    </c:forEach>
                                </tr>
                                <tr>
                                    <c:forEach var="seat" items="${vo.seatList}" begin="1" end="1">
                                        <td>
                                            <div class="seat2 seat-green" data-color="green" id="seat${i}"></div>
                                        </td>
                                        <td>&nbsp;${seat.seat_grade}석&nbsp;&nbsp;</td>
                                        <td style="text-align: right">
                                            ${zeroCount2}석&nbsp;&nbsp;
                                        </td>
                                        <td style="text-align: right">
                                            <fmt:formatNumber type="number" value="${seat.seat_price}" />원
                                        </td>
                                    </c:forEach>
                                </tr>
                                <tr>
                                    <c:forEach var="seat" items="${vo.seatList}" begin="2" end="2">
                                        <td>
                                            <div class="seat2 seat-blue" data-color="blue" id="seat${i}"></div>
                                        </td>
                                        <td>&nbsp;${seat.seat_grade}석&nbsp;&nbsp;</td>
                                        <td style="text-align: right">
                                            ${zeroCount3}석&nbsp;&nbsp;
                                        </td>
                                        <td style="text-align: right">
                                            <fmt:formatNumber type="number" value="${seat.seat_price}" />원
                                        </td>
                                    </c:forEach>
                                </tr>
                                <tr>
                                    <c:forEach var="seat" items="${vo.seatList}" begin="3" end="3">
                                        <td>
                                            <div class="seat2 seat-orange" data-color="orange" id="seat${i}"></div>
                                        </td>
                                        <td>&nbsp;${seat.seat_grade}석&nbsp;&nbsp;</td>
                                        <td style="text-align: right">
                                            ${zeroCount4}석&nbsp;&nbsp;
                                        </td>
                                        <td style="text-align: right">
                                            <fmt:formatNumber type="number" value="${seat.seat_price}" />원
                                        </td>
                                    </c:forEach>
                                </tr>
                                <tr>
                                    <c:forEach var="seat" items="${vo.seatList}" begin="4" end="4">
                                        <td>
                                            <div class="seat2 seat-navy" data-color="navy" id="seat${i}"></div>
                                        </td>
                                        <td>&nbsp;${seat.seat_grade}석&nbsp;&nbsp;</td>
                                        <td style="text-align: right">
                                            ${zeroCount5}석&nbsp;&nbsp;
                                        </td>
                                        <td style="text-align: right">
                                            <fmt:formatNumber type="number" value="${seat.seat_price}" />원
                                        </td>
                                    </c:forEach>
                                </tr> -->
                                </table>
                                <br>
                                <div>
                                    <input type="button" class="btn" value="이전" style="width: 110px">
                                    <input type="button" class="btn" value="다음" style="width: 110px">
                                </div>
                            </div>
                        </div>
                        <div id="seat-box-body-right-bottom">


                            <!-- <div class="seat-container3">

                            <input type="hidden" name="performance_idx" value="${param.performance_idx}" />
                            <input type="hidden" name="date" value="${param.date}" />
                            <input type="hidden" id="seat_row" name="row" />
                            <input type="hidden" id="seat_col" name="col" />
                            <input type="hidden" name="seat_idx" value="${seat_idx}" />
                            <input type="hidden" id="selectedSeats" name="selectedSeats" />

                            <div style="display: flex; justify-content: center">
                                <input type="button" class="btn btn-success" value="좌석선택완료" style="width: 110px"
                                    onclick="submitSeats()" />
                            </div>
                            </form>
                        </div> -->

                            <!-- <div class="seat-container4">
                            <form id="bookForm" action="book_reservation.do" method="post">
                                <input type="hidden" name="performance_idx" value="${param.performance_idx}" />
                                <input type="hidden" name="date" value="${param.date}" />
                                <input type="button" class="btn btn-danger" value="장바구니 담기"
                                    onclick="submitBookForm(this.form)" />
                            </form>
                        </div> -->

                        </div>
                    </div>
                </div>
            </div>
        </body>

        </html>