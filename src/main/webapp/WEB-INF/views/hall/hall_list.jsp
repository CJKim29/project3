<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>티모아</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <style type="text/css">
        #box {
            width: 1700px;
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
        function del(hall_idx){
            
            if(confirm("정말 삭제하시겠습니까?")==false)return;
			
			location.href = "delete.do?hall_idx="+hall_idx;
        }

    </script>


<body>

    <div id="box">
        <h1 id="title">:::: 공연장목록 ::::</h1>

        <div style="margin-top:50px; text-align: left; float:right;">

            <!-- 로그인이 안된경우 -->
            <c:if test="${ empty user }">
                <input class="btn btn-warning" type="button" value="로그인"
                    onclick="location.href='../member/login_form.do'">
                <input class="btn btn-primary" type="button" value="회원가입"
                    onclick="location.href='../member/insert_form.do'">
            </c:if>

            <!-- 로그인이 된경우 -->
            <c:if test="${ not empty user }">
                <b>${ user.mem_nickname }</b>님 환영합니다
                <input class="btn btn-danger" type="button" value="로그아웃"
                    onclick="location.href='../member/logout.do'">
            </c:if>
            
            <!-- 관리자만 추가 기능 -->
            <c:if test="${ user.mem_grade eq '관리자' }">
                <input class="btn btn-primary" type="button" value="추가" style=" color: white;"
                onclick="location.href='insert_form.do'">
            </c:if>
        </div>


        <table class="table">
            <tr class="info">
                <th>번호</th>
                <th>공연장</th>
                <th>지역</th>
                <th>주소</th>
                <th>전화번호</th>
                <th>홈페이지</th>
                <th>좌석수</th>
                <th>공연장사진</th>
                <th></th>
            </tr>

            <!-- Data출력 -->
            <!-- for(MemberVo vo : list) -->
            <c:forEach var="vo" items="${ list }">
                <tr>
                    <td>${ vo.hall_idx }</td>
                    <td>${ vo.hall_name }</td>
                    <td>${ vo.hall_area }</td>
                    <td>${ vo.hall_addr }</td>
                    <td>${ vo.hall_tel }</td>
                    <td>${ vo.hall_site }</td>
                    <td>${ vo.hall_seat }</td>
                    <td><img class="hall_img" src="../resources/images/${ vo.hall_image }"></td>
                    <td>
                        <!-- 관리자 계정만 수정/삭제 -->
                      <c:if test="${ user.mem_grade eq '관리자' }">
                          <input class="btn" type="button" value="수정" style="background: #5cb85c; color: white;"
                                 onclick="location.href='modify_form.do?hall_idx=${ vo.hall_idx }'">
                          <input class="btn" type="button" value="삭제" style="background: #d9534f; color: white;"
                                 onclick="del('${ vo.hall_idx }');">
                      </c:if>
                    </td>
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