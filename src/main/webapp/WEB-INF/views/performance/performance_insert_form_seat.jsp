<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

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
        <script type="text/javascript">
            function send(f) {		/* 임의적으로 f라고 form의 이름을 적어줌 */

                // 입력값 검증(잘못 입력 시 안 넘어가도록 입력값을 검증하자)
                /* f안의 name의 value값 얻어와서 공백제거 */

                let seat_grade = f.seat_grade.value.trim();
                let seat_price = f.seat_price.value.trim();

                if (seat_grade == '') {
                    alert("좌석 등급을 입력해주세요");
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

                // f.method = "POST";	
                f.action = "insert_seat.do";	// 전송대상(PhotoInsertAction)
                f.submit();	// 전송
            }
        </script>

    </head>

    <body>
        <form>
            <!-- JSP에서 서버가 전달한 performance_idx 값을 해당 폼 필드의 value 속성에 넣음 -->
            <!-- performance_idx 값을 서버에서 폼으로 전달하여, 폼 전송 시 함께 performance_idx를 전송 -->
            <input type="hidden" name="performance_idx" value="${performance_idx}">

            <div id="box">

                <div class="panel panel-success">
                    <div class="panel-heading">공연 가격 등록</div>
                    <div class="panel-body">

                        <div>
                            <h4>좌석 등급</h4>
                            <div>*좌석 이름만 입력해주세요. ex) VIP석 -> VIP</div>
                            <input class="form-control content" rows="6" name="seat_grade">

                            <h4>가격</h4>
                            <div>*숫자만 입력해주세요. ex) 100,000원 -> 100000</div>
                            <input class="form-control content" type="number" name="seat_price">


                            <input class="btn btn-success" type="button" value="이전" onclick="location.href='list.do'">
                            <input class="btn btn-primary btn_insert" type="button" value="등록하기"
                                onclick="send(this.form);">


                        </div>
                    </div>
                </div>
            </div>
        </form>
    </body>

    </html>