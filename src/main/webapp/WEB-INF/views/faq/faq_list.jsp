<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">

	@font-face {
	    font-family: 'ONE-Mobile-POP';
	    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/ONE-Mobile-POP.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	
	* {
		font-family: 'ONE-Mobile-POP';
		text-shadow: red;
	}
	
	#box {
		width: 1000px;
		margin: auto;
		margin-top: 50px;
	}
	
	#title {
		text-align: center;
		font-weight: bold;
		font-size: 26px;
		text-shadow: 1px 1px 1px black;
		color: #f7941d;
	}
	
	* {
		color: #f7941d;
	}
	
	th {
		color: black;
	}
	
	a {
		color: #f7941d;
		text-decoration: none;
	}
	
	a:hover {
		color: #f7941d;
		text-decoration: none;
	}
	
	.faq_title{
		display: inline-block;
		overflow: hidden;
		white-space: nowrap;
		text-overflow: ellipsis;
		word-break: break-all; 
	}
	
	.faq_content {
		display: none; /* 기본적으로 내용은 숨깁니다. */
		margin-top: 10px;
	}
	
	.show {
		display: block; /* 'show' 클래스가 추가되면 내용이 보입니다. */
	}
	
	.toggle-btn {
		cursor: pointer;
		color: #f7941d;
	}

</style>

<script type="text/javascript">
	function toggleContent(id) {
		var content = document.getElementById(id);
		if (content.classList.contains('show')) {
			content.classList.remove('show');
		} else {
			content.classList.add('show');
		}
	}
</script>

<script type="text/javascript">
	
	function insert_form() {
		
			location.href = "insert_form.do";
	}

    function del(faq_idx) {
		
		if(confirm("정말 삭제하시겠습니까?")==false)return;
		
		location.href = "delete.do?faq_idx="+faq_idx;
		
	}
	
</script>

</head>
<body>
	<div id="box">
		<h3 id="title">::::FAQ페이지::::		
		<img src="../resources/images/김치쿵야.png">
		</h3>
	
		<div class="row" style="margin-top: 30px; margin-bottom: 10px;">
            <c:if test="${ user.mem_grade eq '관리자' }">
			<div class="col-sm-4">                
				<input class="btn" style="background: #f7941d; color: white;" type="button" value="글쓰기"
					   onclick="insert_form();">                     
			</div>
            </c:if>
            <c:if test="${ user.mem_grade ne '관리자' }">
			<div class="col-sm-4">                
				                  
			</div>
            </c:if>
			<div class="col-sm-8" style="text-align: right;">
				<!-- 로그인이 안된 경우 -->
				<c:if test="${ empty user }">
					<input class="btn" style="background: #f7941d; color: white;" type="button" value="로그인" 
						   onclick="location.href='../member/login_form.do'">
				</c:if>
				
				<!-- 로그인이 안된 경우 -->
				<c:if test="${ not empty sessionScope.user }">
					<b>${ user.mem_nickname }</b>님 환영해요.
					<input class="btn" style="background: #f7941d; color: white;" type="button" value="로그아웃"
						   onclick="location.href='../member/logout.do'">
				</c:if>
			</div>
		</div>
		
		<table class="table">
			<tr style="background: #f7941d;">
				<th>번호</th>
				<th style="width: 50%;">제목</th>
				<th>작성일자</th>
			<tr>
			
			<!-- 데이터가 없는 경우 -->
			<c:if test="${ empty list }">
				<tr>
					<td colspan="4" align="center">
						<font color="red">게시물이 없습니다</font>
					</td>
				</tr>
			</c:if>
			
			<!-- 데이터가 있는 경우 -->
			<c:forEach var="vo" items="${ list }">
				<tr>
					<td>${ vo.faq_no }</td>
					<td>
						<font color="red">
                            <span class="toggle-btn faq_title" onclick="toggleContent('content-${vo.faq_no}')">${ vo.faq_title }&nbsp;&nbsp;&nbsp; V</span>
                            <div id="content-${vo.faq_no}" class="faq_content">
							    ${ vo.faq_content }
						    </div>
						</font>	
					</td>
					<td>
                        ${ vo.faq_regdate }
                      <!-- 관리자 계정만 수정/삭제 -->
					<c:if test="${ user.mem_grade eq '관리자' }">
						<input class="btn btn-success" type="button" value="수정하기"
							   onclick="location.href='modify_form.do?faq_idx=${ vo.faq_idx }'">
						<input class="btn btn-danger" type="button" value="삭제하기"
							   onclick="del('${ vo.faq_idx }');">
					</c:if>
                    </td>
				</tr>
			</c:forEach>
		</table>
		
		<!-- PageMenu -->
		<div style="text-align: center;">
			${ pageMenu }
		</div>
	</div>
</body>
</html>
