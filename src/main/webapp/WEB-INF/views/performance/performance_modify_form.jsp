<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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



                /* 자동완성 커스텀 */
                input:autofill,
                input:autofill:hover,
                input:autofill:focus,
                input:autofill:active {
                    -webkit-text-fill-color: rgb(26, 24, 24);
                    transition: background-color 5000s ease-in-out 0s;
                }

                #p_img {
                    text-align: center;
                    margin-top: 20px;
                    margin-bottom: 10px;
                }

                #img_btn {
                    width: 225px;
                    margin-left: auto;
                    margin-right: auto;
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

            <!-- 수정 정보 전달 - 이미지 제외-->
            <script type="text/javascript">

                function send(f) {		/* 임의적으로 f라고 form의 이름을 적어줌 */

                    // 입력값 검증(잘못 입력 시 안 넘어가도록 입력값을 검증하자)
                    /* f안의 name의 value값 얻어와서 공백제거 */
                    let performance_name = f.performance_name.value.trim();
                    let performance_startday = f.performance_startday.value.trim();
                    let performance_endday = f.performance_endday.value.trim();
                    let performance_runtime = f.performance_runtime.value.trim();
                    // let photo = f.photo.value.trim();
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
                    // if (photo == '') {
                    //     alert("공연이미지를 등록해주세요");
                    //     return;
                    // }
                    if (performance_age == '') {
                        alert("관람 연령을 입력해주세요\n*숫자만 입력 가능");
                        f.performance_age.value = "";	/* 지우기 */
                        f.performance_age.focus();
                        return;
                    }

                    // f.method = "POST";	
                    f.action = "modify.do";	// 전송대상(PhotoInsertAction)
                    f.submit();	// 전송
                } // end: send()


                /* Ajax 이용해 이미지 수정 */
                function ajaxFileUpload() {
                    // 업로드 버튼이 클릭되면 파일 찾기 창을 띄운다
                    $("#ajaxFile").click();		// id가 ajaxFile인 애를 클릭해라 
                }

                function ajaxFileChange() {
                    // 파일이 선택되면 업로드를 진행한다.
                    fileUpload();
                }

                function fileUpload() {
                    //파일선택->취소시    파일의 첫번쩨  없으면 함수 끝내라(취소하면 동작 실행하면 안되니까)
                    if ($("#ajaxFile")[0].files[0] == undefined) return;


                    var form = $("ajaxFile")[0];		// 폼에 대한 정보 얻어오기
                    var formData = new FormData(form);
                    formData.append("performance_idx", '${ vo.performance_idx }');		//p_idx=5 이런식으로 넘어온것?
                    formData.append("photo", $("#ajaxFile")[0].files[0]);//photo라는 이름으로 parameter 선택 -> insert_form 이미지 선택 부분 name=photo

                    $.ajax({
                        url: "image_upload.do", //PhotoUploadAction 만들기 -> 이미지 수정하기 위해 만드는 servlet
                        type: "POST",
                        data: formData,
                        processData: false,
                        contentType: false,
                        dataType: 'json',
                        success: function (res_data) {
                            //res_data = {"p_filename":"aaa.jpg"}
                            // <img> id="image-preview" 
                            $("#image-preview").attr("src", "../resources/images/" + res_data.performance_image);
                            // $("#my_img").prop("src","../images/" + res_data.p_filename); <- 이거 써도 됨
                        },
                        error: function (err) {
                            alert(err.responseText);
                        }
                    });
                }// end: fileUpload()
            </script>


            <!-- 공연 카테고리 선택 시 실행 될 이벤트 -->
            <script>
                function selectDetaileCate() {
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

                // 페이지 로드 시 selectDetaileCate 함수 실행
                window.onload = function () {
                    selectDetaileCate(); // 로드 시 공연 카테고리에 따라 세부 카테고리 표시
                };
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

            <!-- 이미지 선택 -->
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
            <!-- file 업로드 시 반드시 작성 -->
            <form enctype="multipart/form-data" id="ajaxForm" method="post">
                <input id="ajaxFile" type="file" style="display:none;" onChange="ajaxFileChange();">
                <!--파일업로드용 기본 폼 못생겨서 기능은 얘가 하되 숨겨놓고 예쁜 버튼을 앞에 내세운 것-->
            </form>

            <form>
                <input type="hidden" name="performance_idx" value="${vo.performance_idx}">
                <div id="box">

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 style="text-align: center;">공연 정보 수정</h4>
                        </div>
                        <div class="panel-body">

                            <div>
                                <h4>공연 카테고리</h4>
                                <select class="form-control content" id="performance_cate_idx"
                                    name="performance_cate_idx" onchange="selectDetaileCate();">
                                    <option value="1" ${ vo.performance_cate_idx==1 ? 'selected' : '' }>뮤지컬</option>
                                    <option value="2" ${ vo.performance_cate_idx==2 ? 'selected' : '' }>연극</option>
                                    <option value="3" ${ vo.performance_cate_idx==3 ? 'selected' : '' }>콘서트</option>
                                </select>

                                <!-- 공연 카테고리가 뮤지컬 or 연극일 경우 -->
                                <div id="musical_theater_cate">
                                    <h4>뮤지컬, 연극 세부 카테고리</h4>
                                    <select class="form-control content" name="performance_detail_cate_idx"
                                        value="${vo.performance_detail_cate_idx}">
                                        <option value="1" ${ vo.performance_detail_cate_idx==1 ||
                                            vo.performance_detail_cate_idx==7 ? 'selected' : '' }>로맨틱코미디</option>
                                        <option value="2" ${ vo.performance_detail_cate_idx==2 ||
                                            vo.performance_detail_cate_idx==8 ? 'selected' : '' }>드라마</option>
                                        <option value="3" ${ vo.performance_detail_cate_idx==3 ||
                                            vo.performance_detail_cate_idx==9 ? 'selected' : '' }>코믹</option>
                                        <option value="4" ${ vo.performance_detail_cate_idx==4 ||
                                            vo.performance_detail_cate_idx==10 ? 'selected' : '' }>공포/스릴러</option>
                                        <option value="5" ${ vo.performance_detail_cate_idx==5 ||
                                            vo.performance_detail_cate_idx==11 ? 'selected' : '' }>퍼포머스</option>
                                        <option value="6" ${ vo.performance_detail_cate_idx==6 ||
                                            vo.performance_detail_cate_idx==12 ? 'selected' : '' }>어린이</option>
                                    </select>
                                </div>

                                <!-- 공연 카테고리가 콘서트 일 경우 -->
                                <div id="concert_cate" style="display: none;">
                                    <h4>콘서트 세부 카테고리</h4>
                                    <select class="form-control content" name="performance_detail_cate_idx"
                                        value="${vo.performance_detail_cate_idx}">
                                        <option value="1" ${ vo.performance_detail_cate_idx==13 ? 'selected' : '' }>발라드
                                        </option>
                                        <option value="2" ${ vo.performance_detail_cate_idx==14 ? 'selected' : '' }>락
                                        </option>
                                        <option value="3" ${ vo.performance_detail_cate_idx==15 ? 'selected' : '' }>힙합
                                        </option>
                                        <option value="4" ${ vo.performance_detail_cate_idx==16 ? 'selected' : '' }>트로트
                                        </option>
                                    </select>
                                </div>

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
                                <input class="form-control content" rows="6" name="performance_name"
                                    value="${vo.performance_name}">

                                <h4>시작 일자</h4>
                                <input id="datepicker_start" class="content" name="performance_startday"
                                    value="${fn:substring(vo.performance_startday, 0, 10)}" width="276" />
                                <!-- 시간 떼고 날짜만 가져오기 위함(JSTL) -->

                                <h4>종료 일자</h4>
                                <input id="datepicker_end" class="content" name="performance_endday"
                                    value="${fn:substring(vo.performance_endday, 0, 10)}" width="276" />

                                <h4>관람 시간</h4>
                                <div>*숫자만 입력해주세요. ex) 60분 -> 60</div>
                                <input class="form-control content" type="number" name="performance_runtime"
                                    value="${vo.performance_runtime}">

                                <h4>공연 이미지</h4>
                                <!-- 이미지 미리보기 영역 -->
                                <div id="p_img">
                                    <img id="image-preview" src="../resources/images/${ vo.performance_image }"
                                        alt="공연 이미지" style="width: 220px; height: 300px;">
                                </div>
                                <div id="img_btn" class="content">
                                    <input class="btn btn-block" type="button" name="photo" value="이미지편집"
                                        onchange="previewImage(event)" onclick="ajaxFileUpload();">
                                </div>

                                <h4>관람 연령</h4>
                                <div>*숫자만 입력해주세요. ex) 12세 -> 12</div>
                                <input class="form-control content" type="number" name="performance_age"
                                    value="${vo.performance_age}">

                                <input class="btn" type="button" value="이전" onclick="location.href='list.do'">
                                <input class="btn btn_insert" type="button" value="수정" onclick="send(this.form);">


                            </div>
                        </div>
                    </div>
                </div>
            </form>

        </body>

        </html>