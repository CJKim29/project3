<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <title>Insert title here</title>

                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

                <style>
                    textarea {
                        resize: none;
                        width: 100%;
                        outline: none;
                    }

                    .panel {
                        width: 735px;
                        margin: auto;
                        border: #FF1D38;
                        margin-top: 50px;
                        margin-bottom: 50px;
                    }

                    .panel-heading {
                        background-color: #FF1D38;
                        color: #fff;
                    }

                    .panel-body {
                        border: 1px solid #FF1D38;
                    }

                    #my_img {
                        width: 500px;
                        margin-right: 11px;
                    }

                    th {
                        width: 80px;
                    }

                    input {
                        vertical-align: top;
                        background-color: #333;
                        color: #fff;
                        padding: 7px 9px;
                        border: 0;
                        border-radius: 3%;
                        font-weight: bold;
                    }

                    input:hover {
                        background-color: #FF1D38;
                        color: #fff;
                        outline: none;
                    }

                    .click {
                        padding: 10px 10px;
                        background-color: #fff;
                        color: #333;
                        border: 1px solid #eee;
                        font-weight: bold;
                        border-radius: 3%;
                        outline: none;
                    }
                </style>

                <script>
                    //------ Ajax이용한 이미지 수정----------------------------------------------   

                    function img_upload() {
                        // 업로드 버튼이 클릭되면 파일 찾기 창을 띄운다.
                        $("#ajaxFile").click();
                    }

                    function ajaxFileChange() {
                        // 파일이 선택되면 업로드를 진행한다.
                        photo_upload();
                    }



                    function photo_upload() {

                        //파일선택->취소시
                        if ($("#ajaxFile")[0].files[0] == undefined) return;


                        var form = $("#ajaxForm")[0];

                        var formData = new FormData(form);
                        formData.append("performance_idx", '${ vo.performance_idx }');       //p_idx=5
                        formData.append("photo", $("#ajaxFile")[0].files[0]);                //photo=bmi.png

                        $.ajax({
                            url: "detail_img_upload.do", //PhotoUploadAction
                            type: "POST",
                            data: formData,
                            processData: false,
                            contentType: false,

                            dataType: 'json',
                            success: function (res_data) {
                                //res_data = {"p_filename":"aaa.jpg"}

                                //location.href=''; //자신의 페이지를 리로드(refresh)

                                $("#my_img").attr("src", "../resources/images/" + res_data.p_filename);
                                //$("#my_img").prop("src","../images/" + res_data.p_filename);

                            },
                            error: function (err) {
                                alert(err.responseText);
                            }
                        });

                    }

                    function send(f) {
                        var performance_detail_info = f.performance_detail_info.value.trim();
                        var performance_al = f.performance_al.value.trim();

                        if (performance_detail_info == '') {
                            f.performance_detail_info.value = null;
                        }
                        if (performance_al == '') {
                            f.performance_al.value = null;
                        }

                        f.action = "modify.do";
                        f.submit();
                    }
                </script>
            </head>

            <body>
                <!--화일업로드용 폼  -->
                <form enctype="multipart/form-data" id="ajaxForm" method="post">
                    <input id="ajaxFile" type="file" style="display:none;" onChange="ajaxFileChange();">
                </form>

                <form>
                    <input type="hidden" name="performance_idx" value="${vo.performance_idx}">

                    <div class="panel">
                        <div class="panel-heading">
                            <h4>정보 수정</h4>
                        </div>
                        <div class="panel-body">
                            <table class="table">
                                <tr>
                                    <td colspan="2" align="right">
                                        <input class="click" type="button" value="수정하기" onclick="send(this.form);">
                                        <input class="click" type="button" value="돌아가기"
                                            onclick="location.href='detail.do?performance_idx=${vo.performance_idx}'">
                                    </td>
                                </tr>

                                <tr>
                                    <th>상세 정보</th>
                                    <td>
                                        <textarea name="performance_detail_info"
                                            rows="6">${vo.performance_detail_info}</textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <th>공지사항</th>
                                    <td>
                                        <textarea name="performance_al" rows="6">${vo.performance_al}</textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <th>상세 정보 이미지</th>
                                    <td>
                                        <c:if test="${vo.performance_detail_image != null}">
                                            <img src="../resources/images/${vo.performance_detail_image}" id="my_img">
                                        </c:if>
                                        <input id="ajaxFile" type="button" value="이미지 편집" onclick="img_upload()">
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </form>
            </body>

            </html>