<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Insert title here</title>

            <!-- BootStrap 3.x-->
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

            <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
            <script src="https://unpkg.com/gijgo@1.9.14/js/gijgo.min.js" type="text/javascript"></script>
            <link href="https://unpkg.com/gijgo@1.9.14/css/gijgo.min.css" rel="stylesheet" type="text/css" />

            <style type="text/css">
                #box {
                    width: 600px;
                    margin: auto;
                    margin-top: 100px;
                }

                h4 {
                    font-weight: bold;
                    margin-bottom: 10px;
                }

                .content {
                    margin-bottom: 40px !important;
                }

                .btn_insert {
                    margin-left: 425px;
                }
            </style>

            <!-- 입력값 검증 - 잘못 입력, 미입력 시 안내 메세지 -->
            <!-- <script type="text/javascript">
                function send(f) {		/* 임의적으로 f라고 form의 이름을 적어줌 */

                    // 입력값 검증(잘못 입력 시 안 넘어가도록 입력값을 검증하자)
                    /* f안의 name의 value값 얻어와서 공백제거 */

                    let seat_grade = f.seat_grade.value.trim();
                    let seat_price = f.seat_price.value.trim();

                    if (seat_grade == '') {
                        alert("좌석 이름(등급)을 입력해주세요");
                        f.seat_grade.value = "";	/* 지우기 */
                        f.seat_grade.focus();
                        return;
                    }
                    if (seat_price == '') {
                        alert("가격을 입력해주세요");
                        f.seat_price.value = "";	/* 지우기 */
                        f.seat_price.focus();
                        return;
                    }

                    f.action = "modify_seat.do";	// 전송대상(PhotoInsertAction)
                    f.submit();	// 전송
                }
            </script> -->

            <script type="text/javascript">
                // 폼 전송 전 검증
                function send(f) {
                    // 모든 좌석 등급과 가격 입력 검증
                    let valid = true;
                    $('input[name="seat_grade[]"]').each(function () {
                        if ($(this).val().trim() === '') {
                            alert('좌석 이름(등급)을 입력해주세요');
                            $(this).focus();
                            valid = false;
                            return false;  // 반복문 종료
                        }
                    });

                    if (valid) {
                        $('input[name="seat_price[]"]').each(function () {
                            if ($(this).val().trim() === '') {
                                alert('가격을 입력해주세요');
                                $(this).focus();
                                valid = false;
                                return false;  // 반복문 종료
                            }
                        });
                    }

                    if (valid) {
                        f.action = "modify_seat.do"; // 전송 경로 설정
                        f.submit();  // 폼 전송
                    }
                }
            </script>
        </head>

        <body>
            <form>
                <!-- JSP에서 서버가 전달한 performance_idx 값을 해당 폼 필드의 value 속성에 넣음 -->
                <!-- performance_idx 값을 서버에서 폼으로 전달하여, 폼 전송 시 함께 performance_idx를 전송 -->
                <!-- 좌석 정보 수정 시 공연정보와 좌석정보 둘 다 필요함 -->
                <input type="hidden" name="performance_idx" value="${vo.performance_idx}">

                <div id="box">

                    <div class="panel panel-success">
                        <div class="panel-heading">공연 좌석 수정</div>
                        <div class="panel-body">

                            <div>
                                <c:forEach var="seat" items="${vo.seatList}">

                                    좌석 이름(등급)
                                    <input type="text" class="form-control" name="seat_grade[]"
                                        value="${seat.seat_grade}">
                                    <br>

                                    좌석 가격
                                    <input type="number" class="form-control" name="seat_price[]"
                                        value="${seat.seat_price}">

                                    <!-- 좌석 ID를 hidden으로 함께 전송 -->
                                    <input type="hidden" name="seat_idx[]" value="${seat.seat_idx}">
                                    <!-- <input type="button" class="btn" value="수정" onclick="send(this.form);"> -->
                                    <br>
                                    <hr>

                                </c:forEach>

                                <input class="btn btn-success" type="button" value="이전"
                                    onclick="location.href='list.do'">
                                <input class="btn btn-primary btn_insert" type="button" value="수정"
                                    onclick="send(this.form);">


                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </body>

        </html>