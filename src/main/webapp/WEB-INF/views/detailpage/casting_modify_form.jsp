<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Insert title here</title>

            <style>
                #actor_pic {
                    width: 100%;
                    height: 100%;
                    object-fit: cover;
                }

                #actor_box {
                    width: 105px;
                    height: 110px;
                    border-radius: 70%;
                    overflow: hidden;
                    display: inline-block;
                }

                #casting_list {
                    display: inline-block;
                    margin: 0 36px 40px 0;
                    text-align: center;
                }
            </style>
        </head>

        <body>
            <input type="hidden" name="performance_idx" value="${vo.performance_idx}">
            <div id="moreText" class="collapsed">
                <h4>캐스팅</h4>
                <c:forEach var="castingVo" items="${ list }">
                    <div id="casting_list">
                        <div id="actor_box">
                            <a href="#">
                                <img id="actor_pic" src="../resources/images/${castingVo.actorVo.actor_pic}">
                            </a>
                        </div>
                        <h6>${castingVo.casting_name}</h6>
                        <p style="color: #666666;">
                            ${castingVo.actorVo.actor_name}
                        </p>
                    </div>
                </c:forEach>
            </div>
        </body>

        </html>