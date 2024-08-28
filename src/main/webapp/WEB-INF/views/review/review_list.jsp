<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- BootStrap 3.x-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- 후기 페이지 -->
 <!-- CSS 연결 -->
  <link rel="stylesheet" href="../resources/css/review/review_list.css">

  <script>

    function review(){
        
        $.ajax({
            url     :   "list.do",
            

        });
    }
  </script>

  <script>
    function insert(){
        // 후기 작성 조건 - 로그인O, 해당 공연 관람한 상태, 공연 시작일 이후 작성 가능

        // 로그인 체크
        // 로그인 X
        if("${ empty user }"=="true"){
			if(confirm("후기작성은 로그인 후 가능합니다. \n 로그인 하시겠습니까?")==false) return; // 아니오 선택 시
			// 로그인 폼으로 이동
			location.href="../member/login_form.do";
			return;
		}

        // 공연 관람 했는지 안 했는지 조건문 작성?
        // if(){
        //     alert("후기 작성은 관람자만 가능합니다.");
        // }

        // 공연 시작일 보다 작성일자가 더 커야 함
        // if(){

        // }

        // 로그인 O - 후기 작성 폼으로 이동 시킴
        location.href="insert_form.do?concert_idx=";         //controller에 있는 경로 씀
    }
  </script>

</head>
<body>

<div id="box">
    <div>
        <img src="../resources/images/subpage_sample.PNG"; alt="sample"/>
    </div>

    
    <hr>
    
    <div class="list">공연정보</div>
    <div class="list">캐스팅정보</div>
    <div class="list">판매정보</div>
    
    <div class="list" onclick="review();">관람후기</div>
    <div class="list">기대평</div>
    
    <hr>
    <input class="btn btn-info btn_insert" type="button" value="후기작성" onclick="insert();">

    <div review_box>
        <c:forEach var="vo" items="${ list }">
            <div review_one>
                <div class="nickname">${vo.mem_nickname}</div>
                <div class="regdate">${vo.review_regdate}</div>
                <div class="title">${vo.review_title}</div>
                <div class="content">${vo.review_content}</div>
            </div>
            <input type="button" class="btn btn-warning" vaule="수정" onclick="">
            <input type="button" class="btn btn-danger" vaule="삭제">
            <hr>
        </c:forEach>
    </div>
</div>

</body>
</html>