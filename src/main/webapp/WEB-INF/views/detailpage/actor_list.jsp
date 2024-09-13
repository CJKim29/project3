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

                    .actor_img {
                        width: 100px;
                        height: 100px;
                    }

                    td {
                        vertical-align: middle !important;
                    }
                </style>
            </head>

            <body>
                <div id="box"></div>
                <h1 id="title">:::: 인물 ::::</h1>

                <table class="table">
                    <tr class="info">
                        <th>인물번호</th>
                        <th>이름</th>
                        <th>직업</th>
                        <th>신체조건</th>
                        <th>소속사</th>
                        <th>소속그룹</th>
                        <th>배우이미지</th>
                    </tr>

                    <!-- Data출력 -->
                    <!-- for(Actorvo : list) -->
                    <c:forEach var="vo" items="${ list }">
                        <tr>
                            <td>${vo.actor_idx}</td>
                            <td>${ vo.actor_name }</td>
                            <td>${ vo.actor_job }</td>
                            <td>${ vo.actor_body }</td>
                            <td>${ vo.actor_company }</td>
                            <td>${ vo.actor_group }</td>
                            <td><img class="actor_img" src="../resources/images/${ vo.actor_pic }"></td>
                        </tr>
                    </c:forEach>

                </table>


                <!-- Data가 없는 경우 -->
                <c:if test="${ empty requestScope.list }">
                    <div id="empty_msg">등록된 공연정보가 없습니다</div>
                </c:if>
                </div>

            </body>

            </html>