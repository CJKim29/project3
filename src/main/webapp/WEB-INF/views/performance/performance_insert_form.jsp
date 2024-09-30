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

            #image-preview {

                margin: 5px 0px 20px 5px;
            }

            /* 자동완성 커스텀 */
            input:autofill,
            input:autofill:hover,
            input:autofill:focus,
            input:autofill:active {
                -webkit-text-fill-color: rgb(26, 24, 24);
                transition: background-color 5000s ease-in-out 0s;
            }

            .btn {
                width: 80px;
                font-weight: bold;
                padding-top: 10px;
                padding-bottom: 10px;
            }

            .btn:hover {
                background-color: #ff1d38;
                color: #fff;
                transition: 0.4s all ease-in-out;
            }

            /* 버튼 클릭 후 남아있는 효과 지우기 */
            .btn:focus {
                border: none;
                outline: none;
            }

            .btn_insert {
                float: right;
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
                    alert("종료 일자는 시작 일자보다 늦어야 합니다.");
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
                    alert("시작 일자를 입력해주세요");
                    f.performance_startday.value = "";	/* 지우기 */
                    f.performance_startday.focus();
                    return;
                }
                if (performance_endday == '') {
                    alert("종료 일자를 입력해주세요");
                    f.performance_endday.value = "";	/* 지우기 */
                    f.performance_endday.focus();
                    return;
                }
                if (performance_runtime == '') {
                    alert("관람 시간을 입력해주세요\n*숫자만 입력 가능");
                    f.performance_runtime.value = "";	/* 지우기 */
                    f.performance_runtime.focus();
                    return;
                }
                if (photo == '') {
                    alert("공연이미지를 등록해주세요");
                    return;
                }
                if (performance_age == '') {
                    alert("관람 연령을 입력해주세요\n*숫자만 입력 가능");
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
            function selectDetailCate() {
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

        <!-- 이미지 선택 - 선택 파일 미리보기-->
        <script type="text/javascript">

            function previewImage(event) {
                var reader = new FileReader();
                var output = document.getElementById('image-preview');

                // 선택한 파일이 있는지 확인
                if (event.target.files && event.target.files[0]) {
                    reader.onload = function () {
                        output.src = reader.result; // 선택한 이미지를 미리보기
                    };
                    reader.readAsDataURL(event.target.files[0]); // 선택한 파일 읽기
                } else {
                    // 파일 선택이 없을 때 기본 이미지로 설정
                    output.src = '../resources/images/no_img.png'; // 기본 이미지 경로
                }
            }
        </script>

<script>
    $(document).ready(function() {
        // 지역 선택 이벤트 핸들러
        $('#areaSelect').on('change', function() {
            var areaIdx = $(this).val();  // 선택된 지역값
    
            // AJAX 요청
            $.ajax({
                url: '/performance/get_hall_area.do',  // 컨트롤러에 요청할 URL
                type: 'GET',
                dataType: 'json',  // 서버가 JSON 데이터를 반환하는지 명시
                data: { area_idx: areaIdx },  // 전송할 데이터 (지역 값)
                success: function(data) {
                    // 공연장 목록 초기화 (기본 옵션은 남겨둠)
                    $('#hallSelect').find('option:gt(0)').remove(); // 두 번째 옵션부터 삭제

                    // 공연장 목록 채우기
                    $.each(data, function(index, hall) {
                        $('#hallSelect').append('<option value="' + hall.hall_idx + '">' + hall.hall_name + '</option>');
                    });
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    alert('공연장 목록을 불러오는 데 실패했습니다.');
                }
            });
        });
    });
</script>

    </head>

    <body>
        <form method="POST" enctype="multipart/form-data"> <!-- file 업로드 시 꼭 작성해야 하는 것 -->
            <div id="box">

                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 style="text-align: center;">공연 정보 추가</h4>
                    </div>
                    <div class="panel-body">

                        <div>
                            <h4>공연 카테고리</h4>
                            <select class="form-control content" id="performance_cate_idx" name="performance_cate_idx"
                                onchange="selectDetailCate();">
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

                            <!-- 지역 선택 -->
                            <h4>지역</h4>
                            <span style="color: #ff1d38;">*지역을 먼저 선택하신 후, 공연장을 선택해주세요!</span>
                            <select class="form-control content" name="area_idx" id="areaSelect">
                                <option value="">지역을 선택하세요</option>  <!-- 초기값 변경 -->
                                <option value="1">서울</option>
                                <option value="2">경기/인천</option>
                                <option value="3">충청/대전</option>
                                <option value="4">경상/대구/부산</option>
                                <option value="5">전라/광주</option>
                                <option value="6">강원</option>
                                <option value="7">제주</option>
                            </select>
                            
                            <!-- 공연장 선택 -->
                            <h4>공연장</h4>
                            <select class="form-control content" name="hall_idx" id="hallSelect">
                                <option value="">공연장을 선택해주세요</option>
                            </select>

                            <h4>공연명</h4>
                            <input class="form-control content" rows="6" name="performance_name">

                            <h4>시작 일자</h4>
                            <input id="datepicker_start" class="content" name="performance_startday" width="276" />

                            <h4>종료 일자</h4>
                            <input id="datepicker_end" class="content" name="performance_endday" width="276" />

                            <h4>관람 시간</h4>
                            <div>*숫자만 입력해주세요. ex) 60분 -> 60</div>
                            <input class="form-control content" type="number" name="performance_runtime">

                            <h4>공연 이미지</h4>
                            <img id="image-preview" src="../resources/images/no_img.png" alt="이미지 추가" width="240"
                                height="300">
                            <input type="file" class="content" name="photo" accept="image/*"
                                onchange="previewImage(event)">

                            <h4>관람 연령</h4>
                            <div>*숫자만 입력해주세요. ex) 12세 -> 12</div>
                            <input class="form-control content" type="number" name="performance_age">

                            <input class="btn" type="button" value="이전" onclick="location.href='list.do'">
                            <input class="btn btn_insert" type="button" value="등록" onclick="send(this.form);">


                        </div>
                    </div>
                </div>
            </div>
        </form>

    </body>

    </html>