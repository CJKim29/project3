<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <title>member_list</title>

                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

                <style type="text/css">
                    #box {
                        width: 1500px;
                        margin: auto;
                        margin-top: 50px;
                    }

                    #title {
                        text-align: center;
                        font-weight: bold;
                        font-size: 32px;
                        color: #9dd9ff;
                        text-shadow: 1px 1px 1px black;
                    }

                    #empty_msg {
                        text-align: center;
                        color: red;
                        margin-top: 150px;
                        font-size: 25px;
                    }

                    .hall_img {
                        width: 100px;
                        height: 100px;
                    }

                    td {
                        vertical-align: middle !important;
                    }
                </style>

                <script type="text/javascript">

                    function del(mem_idx) {
                        //console.log(mem_idx, "삭제");

                        //삭제하기 전 확인
                        if (confirm("정말 삭제 하시겠습니까?") == false) return;

                        //삭제요청
                        location.href = "delete.do?mem_idx=" + mem_idx;	//MemberDeleteAction
                    }
                </script>

                <script type="text/javascript">

                    //초기화1
                    //$(document).ready(function(){});

                    //초기화2
                    $(function () {
                        setTimeout(showMessage, 100);
                    });

                    function showMessage() {
                        // /member/list.do?reason=not_admin_delete
                        if ("${ param.reason eq 'not_admin_delete'}" == "true") {

                            alert("관리자는 삭제할 수 없습니다");
                        }

                    }
                </script>

                <head>
                    <meta charset="UTF-8">
                    <title>hall</title>
                </head>

            <body>

                <div id="box">
                    <h1 id="title">:::: 공연장목록 ::::</h1>

                    <div style="margin-top:50px; text-align: left; float:right;">

                        <!-- 로그인이 안된경우 -->
                        <c:if test="${ empty sessionScope.user }">
                            <input class="btn btn-warning" type="button" value="로그인"
                                onclick="location.href='../member/login_form.do'">
                        </c:if>

                        <!-- 로그인이 된경우 -->
                        <c:if test="${ not empty sessionScope.user }">
                            <b>${ sessionScope.user.mem_name }</b>님 환영합니다
                            <input class="btn btn-danger" type="button" value="로그아웃"
                                onclick="location.href='../member/logout.do'">
                        </c:if>
                    </div>

                    <div style="margin-top:50px; margin-bottom: 10px; float:right;">
                        <input class="btn btn-primary" type="button" value="회원가입"
                            onclick="location.href='../member/insert_form.do'">
                    </div>

                    <table class="table">
                        <tr class="info">
                            <th>공연장번호</th>
                            <th>공연장</th>
                            <th>지역</th>
                            <th>주소</th>
                            <th>전화번호</th>
                            <th>홈페이지</th>
                            <th>좌석수</th>
                            <th>공연장사진</th>
                        </tr>

                        <!-- Data출력 -->
                        <!-- for(MemberVo vo : list) -->
                        <c:forEach var="vo" items="${ list }">
                            <tr>
                                <td>${ vo.s_hall_idx }</td>
                                <td>${ vo.s_hall_name }</td>
                                <td>${ vo.s_hall_area }</td>
                                <td>${ vo.s_hall_addr }</td>
                                <td>${ vo.s_hall_tel }</td>
                                <td>${ vo.s_hall_site }</td>
                                <td>${ vo.s_hall_seat }</td>
                                <td><img class="hall_img" src="../resources/images/${ vo.s_hall_image }"></td>
                            </tr>
                        </c:forEach>

                    </table>


                    <!-- Data가 없는 경우 -->
                    <c:if test="${ empty requestScope.list }">
                        <div id="empty_msg">등록된 공연장정보가 없습니다</div>
                    </c:if>
                </div>

            </body>

            </html>