<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <title>Seat Booking</title>
            <!-- jQuery 라이브러리 추가 -->
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

            <style>
                /* 버튼의 기본 스타일 */
                .seat {
                    width: 30px;
                    height: 30px;
                    margin: 5px;
                    background-color: white;
                    border: 1px solid black;
                    display: inline-block;
                    cursor: pointer;
                }

                /* 좌석 컨테이너 스타일 */
                .seat-container {
                    width: 500px;
                    /* 10개의 버튼이 한 줄에 위치하도록 설정 */
                    margin: 0 auto;
                }
            </style>

            <script>
                $(document).ready(function () {
                    // 좌석 버튼 클릭 이벤트 처리
                    $('.seat').click(function () {
                        // 클릭된 버튼의 배경색을 토글
                        if ($(this).css('background-color') === 'rgb(0, 0, 0)') {
                            $(this).css('background-color', 'white');
                        } else {
                            $(this).css('background-color', 'black');
                        }
                    });
                });
            </script>
        </head>

        <body>
            <h1 style="text-align: center;">좌석 예약</h1>
            <div class="seat-container">
                <%-- 100개의 좌석 버튼 생성 --%>
                    <c:forEach var="i" begin="1" end="100">
                        <div class="seat" id="seat${i}"></div>
                        <%-- 10개의 버튼마다 줄 바꿈 --%>
                            <c:if test="${i % 10 == 0}">
                                <br />
                            </c:if>
                    </c:forEach>
            </div>
        </body>

        </html>