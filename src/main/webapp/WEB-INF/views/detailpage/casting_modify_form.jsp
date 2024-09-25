<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Insert title here</title>

            <link rel='stylesheet'
                href='https://cdn-uicons.flaticon.com/2.6.0/uicons-regular-straight/css/uicons-regular-straight.css'>

            <style>
                body {
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    margin: auto;
                    margin-top: 50px;
                }

                .actor_pic {
                    width: 100%;
                    height: 100%;
                    object-fit: cover;
                }

                .actor_box {
                    width: 105px;
                    height: 110px;
                    border-radius: 70%;
                    overflow: hidden;
                    display: inline-block;
                }

                .casting_list {
                    display: inline-block;
                    margin: 0 36px 40px 0;
                    text-align: center;
                }

                #moreText {
                    width: 890px;
                }

                #insert {
                    display: inline-block;
                    vertical-align: top;
                }
            </style>
        </head>

        <body>
            <input type="hidden" name="performance_idx" value="${vo.performance_idx}">
            <div id="moreText" class="collapsed">
                <h2>캐스팅 수정</h2>
                <c:forEach var="castingVo" items="${ list }">
                    <div class="casting_list">
                        <div class="actor_box">
                            <img class="actor_pic" src="../resources/images/${castingVo.actorVo.actor_pic}">
                        </div>
                        <h4>${castingVo.casting_name}</h4>
                        <p style="color: #666666;">
                            ${castingVo.actorVo.actor_name}
                        </p>
                    </div>
                </c:forEach>
                <div id="insert">
                    <div class="casting_list">
                        <a href="#">
                            <div class="actor_box">
                                <img class="actor_pic" src="../resources/images/insert.png">
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </body>

        </html>