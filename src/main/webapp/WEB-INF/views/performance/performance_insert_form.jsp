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
                let performance_name = f.performance_name.value.trim();
                let performance_startday = f.performance_startday.value.trim();
                let performance_endday = f.performance_endday.value.trim();
                let performance_runtime = f.performance_runtime.value.trim();
                let photo = f.photo.value.trim();
                let performance_age = f.performance_age.value.trim();


                // 시작일자와 종료일자 비교
                let startDate = new Date(performance_startday);
                let endDate = new Date(performance_endday);

                if (endDate < startDate) {
                    alert("종료일자는 시작일자보다 늦어야 합니다.");
                    f.performance_endday.focus();
                    return;
                }

                if (performance_name == '') {
                    alert("공연명을 입력해주세요");
                    f.performance_name.value = "";	/* 지우기 */
                    f.performance_name.focus();
                    return;
                }
                if (performance_startday == '') {
                    alert("시작일자를 입력해주세요");
                    f.performance_startday.value = "";	/* 지우기 */
                    f.performance_startday.focus();
                    return;
                }
                if (performance_endday == '') {
                    alert("종료일자를 입력해주세요");
                    f.performance_endday.value = "";	/* 지우기 */
                    f.performance_endday.focus();
                    return;
                }
                if (performance_runtime == '') {
                    alert("관람 시간을 입력해주세요\n* 숫자만 입력 가능");
                    f.performance_runtime.value = "";	/* 지우기 */
                    f.performance_runtime.focus();
                    return;
                }
                if (photo == '') {
                    alert("공연이미지를 등록해주세요");
                    return;
                }
                if (performance_age == '') {
                    alert("관람 연령을 입력해주세요\n* 숫자만 입력 가능");
                    f.performance_age.value = "";	/* 지우기 */
                    f.performance_age.focus();
                    return;
                }

                // f.method = "POST";	
                f.action = "insert.do";	// 전송대상(PhotoInsertAction)
                f.submit();	// 전송
            }
        </script>


        <!-- 공연 카테고리 선택 시 실행 될 이벤트 -->
        <script>
            function select_d_cate() {
                let performance_cate_idx = document.getElementById("performance_cate_idx").value;
                let musical_theater_cate = document.getElementById("musical_theater_cate");
                let concert_cate = document.getElementById("concert_cate");

                if (performance_cate_idx === "1" || performance_cate_idx === "2") { // 뮤지컬 또는 연극 선택
                    musical_theater_cate.style.display = "block";
                    concert_cate.style.display = "none";

                } else if (performance_cate_idx === "3") { // 콘서트 선택
                    musical_theater_cate.style.display = "none";
                    concert_cate.style.display = "block";
                }
            }
        </script>


        <!-- 달력 -->
        <script>
            $(document).ready(function () {
                $('#datepicker_start').each(function () {
                    $(this).datepicker({
                        showOn: "button",
                        buttonText: "Select date",
                        format: "yyyy-mm-dd"
                    })
                });
            });

            $(document).ready(function () {
                $('#datepicker_end').each(function () {
                    $(this).datepicker({
                        showOn: "button",
                        buttonText: "Select date",
                        format: "yyyy-mm-dd"
                    })
                });
            });
        </script>




    </head>

    <body>
        <form method="POST" enctype="multipart/form-data"> <!-- file 업로드 시 꼭 작성해야 하는 것 -->
            <div id="box">

                <div class="panel panel-success">
                    <div class="panel-heading">공연 정보 등록</div>
                    <div class="panel-body">

                        <div>
                            <h4>공연 카테고리</h4>
                            <select class="form-control content" id="performance_cate_idx" name="performance_cate_idx"
                                onchange="select_d_cate();">
                                <option value="1">뮤지컬</option>
                                <option value="2">연극</option>
                                <option value="3">콘서트</option>
                            </select>

                            <!-- 세부 카테고리에서 기본으로 보이는 부분 -->
                            <div id="musical_theater_cate">
                                <!-- <c:choose>
                                <c:when test="${performance_cate_idx == 1 || performance_cate_idx == 2}"> -->
                                <h4>뮤지컬, 연극 세부 카테고리</h4>
                                <select class="form-control content" name="performance_detail_cate_idx">
                                    <option value="1">로맨틱코미디</option>
                                    <option value="2">드라마</option>
                                    <option value="3">코믹</option>
                                    <option value="4">공포/스릴러</option>
                                    <option value="5">퍼포머스</option>
                                    <option value="6">어린이</option>
                                </select>
                                <!-- </c:when> -->
                            </div>

                            <!-- 세부 카테고리 비활성화 => 공연 카테고리가 콘서트 일 경우에만 보이도록 -->
                            <div id="concert_cate" style="display: none;">
                                <!-- <c:otherwise> -->
                                <h4>콘서트 세부 카테고리</h4>
                                <select class="form-control content" name="performance_detail_cate_idx">
                                    <option value="1">발라드</option>
                                    <option value="2">락</option>
                                    <option value="3">힙합</option>
                                    <option value="4">트로트</option>
                                </select>
                                <!-- </c:otherwise>
                            </c:choose> -->
                            </div>

                            <h4>공연장</h4>
                            <select class="form-control content" name="hall_idx">
                                <option value="1">서울 - 디큐브 링크아트센터</option>
                                <option value="2">서울 - 블루스퀘어 신한카드홀</option>
                                <option value="3">서울 - 샤롯데씨어터</option>
                                <option value="4">서울 - 충무아트센터 대극장</option>
                            </select>

                            <h4>공연명</h4>
                            <input class="form-control content" rows="6" name="performance_name">

                            <h4>시작 일자</h4>
                            <input id="datepicker_start" class="content" name="performance_startday" width="276" />

                            <h4>종료 일자</h4>
                            <input id="datepicker_end" class="content" name="performance_endday" width="276" />

                            <h4>관람 시간</h4>
                            <div>*시간만 입력해주세요. ex) 60분 -> 60</div>
                            <input class="form-control content" type="number" name="performance_runtime">

                            <h4>공연 이미지</h4>
                            <input class="form-control content" type="file" name="photo">

                            <h4>최소 관람 연령</h4>
                            <div>*연령만 입력해주세요. ex) 12세 -> 12</div>
                            <input class="form-control content" type="number" name="performance_age">

                            <!-- <h4>좌석 별 가격</h4>
                            <div>*숫자만 입력해주세요. ex) 100,000원 -> 100000</div>
                            <input class="form-control content" type="number" name="performance_age"> -->



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