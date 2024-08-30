<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  	
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
		width: 600px;
		margin: auto;
		margin-top: 10%;
	}
		@font-face {
	    font-family: 'ONE-Mobile-POP';
	    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/ONE-Mobile-POP.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	
	* {
		font-family: 'ONE-Mobile-POP';
		text-shadow: red;
		color: #F7230E;
	}
	
	textarea{
		resize: none;
	}
	
	h4{
		font-weight: bold;
	}
	
	.btn{
		color: white !important;
	}
</style>

<script type="text/javascript">

	function send(f) {
		
		let board_name = f.board_name.value.trim();
		let board_content = f.board_content.value.trim();
		
		if(board_name==''){
			alert("제목을 입력하세요.")
			f.board_name.value="";
			f.board_name.focus();
			return;
		}
		if(board_content==''){
			alert("내용을 입력하세요.")
			f.board_content.value="";
			f.board_content.focus();
			return;
		}
		
		f.action = "reply.do";
		f.submit();
	}
	
</script>
</head>
<body>
<form>
	<input type="hidden" name="board_idx" value="${ param.board_idx }">
	<div id="box">
		<div class="panel panel-primary">
			<div class="panel-heading" style="background: #F7230E !important;">
				<h4>답글쓰기</h4>
			</div>
			<div class="panel-body">
				<c:forEach var="vo" items="${ list }">
				<div>
					<input readonly="readonly" value="${ vo.board_cate_idx }">
				</div>
				</c:forEach>
				<div>
					<h4>제목 :</h4> <input class="form-control" name="board_name">
				</div>
				<div>
					<h4>내용 :</h4> <textarea class="form-control" rows="10" name="board_content"></textarea>
				</div>
				
				<div style="margin-top: 10px;">
					<input class="btn" style="background: brown;" type="button" value="목록보기" onclick="location.href='list.do'">
					<input class="btn btn-danger" type="button" value="글올리기" onclick="send(this.form)">
				</div>
			</div>
		</div>
	</div>
</form>	
</body>
</html>