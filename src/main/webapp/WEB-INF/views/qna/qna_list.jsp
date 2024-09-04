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
		color: #F7230E;
	}
	
	* {
		color: #F7230E;
	}
	
	th {
		color: black;
	}
	
	a {
		color: #F7230E;
		text-decoration: none;
	}
	
	a:hover {
		color: #F7230E;
		text-decoration: none;
	}
	
	.qna_title{
		display: inline-block;
		
		overflow: hidden;
		white-space: nowrap;
		text-overflow: ellipsi;
		word-break: break-all; 
		
		/* ellipsi 속성 */
	}
</style>

<script type="text/javascript">
	
	function insert_form() {
		
			location.href = "insert_form.do";
	}
	
</script>

</head>
<body>
	<div id="box">
		<h3 id="title">::::Q&A페이지::::		
		<img src="../resources/images/김치쿵야.png">
		</h3>
	
		<div class="row" style="margin-top: 30px; margin-bottom: 10px;">
			<div class="col-sm-4">                
				<input class="btn" style="background: #F7230E; color: white;" type="button" value="글쓰기"
					   onclick="insert_form();">                     
			</div>
			<div class="col-sm-8" style="text-align: right;">
				<!-- 로그인이 안된 경우 -->
				<c:if test="${ empty user }">
					<input class="btn" style="background: #F7230E; color: white;" type="button" value="로그인" 
						   onclick="location.href='../member/login_form.do'">
				</c:if>
				
				<!-- 로그인이 안된 경우 -->
				<c:if test="${ not empty sessionScope.user }">
					<b>${ user.mem_nickname }</b>님 환영해요.
					<input class="btn" style="background: #F7230E; color: white;" type="button" value="로그아웃"
						   onclick="location.href='../member/logout.do'">
				</c:if>
			</div>
		</div>
		
		<table class="table">
			<tr style="background: #F7230E;">
				<th>번호</th>
				<th style="width: 50%;">제목</th>
				<th>작성자</th>
				<th>작성일자</th>
				<th>답변</th>
			<tr>
			
			<!-- 데이터가 없는 경우 -->
			<c:if test="${ empty list }">
				<tr>
					<td	colspan="5" align="center">
						<font color="red">게시물이 없습니다</font>
					</td>
				</tr>
			</c:if>
			
			<!-- 데이터가 있는 경우 -->
			<c:forEach var="vo" items="${ list }">
				<tr>
					<td>${ vo.qna_idx }</td>					
					<td>
                        <a href="view.do?qna_idx=${ vo.qna_idx }">				
						<font color="red">
							<span class="qna_title">${ vo.qna_title }</span>	
						</font>	
                        </a>												
					</td>
					<td>${ vo.mem_nickname }</td>
					<td>${ vo.qna_regdate }</td>
					<td>
                        <c:if test="${ vo.qna_use eq 'n' }">
                            <font color="red">답변 미완료</font>
                        </c:if>	
                        <c:if test="${ vo.qna_use eq 'y' }">
                            <c:if test="${ vo.qna_cmt_count ne 0 }">
                                <span class="badge" style="background: #F7230E;">&nbsp; 답변 완료</span>
                            </c:if>								
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