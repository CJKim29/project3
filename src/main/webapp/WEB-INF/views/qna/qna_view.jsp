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
		width: 800px;
		margin: auto;
		margin-top: 1%;
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
	
	.common{
		border: 1px solid #eeeeee;
		padding: 5px;
		margin-bottom: 5px;
		box-shadow: 1px 1px 1px #f2f2f2;
	}
	
	.content{
		min-height: 120px;
	}
	
	#qna_cmt_content{
		width: 100%;
		height: 80px;
		resize: none;
	}
	
	#btn_cmt_register{
		width: 100%;
		height: 80px;
		background: pink;
	}
</style>

<script type="text/javascript">

	function del() {
		
		if(confirm("정말 삭제하시겠습니까?")==false)return;
		
		location.href = "delete.do?qna_idx=${ vo.qna_idx }";
		
	}
	
	/* 답변쓰기 기능(관리자) */
	function comment_insert() {
		
		// 답변쓰기 작성 (ajax활용 - 관리자만 답변가능)
		let qna_cmt_content = $("#qna_cmt_content").val().trim();
		if(qna_cmt_content=='') {
			alert("답변을 입력하시오.");
			$("#qna_cmt_content").val("");
			$("#qna_cmt_content").focus();
			return;
		}
		
		// Ajax통해서 댓글 등록
		$.ajax({
			
			url		:	"../qna_cmt/insert.do",
			data	:	{
						 "qna_cmt_content" : qna_cmt_content,
						 "qna_idx"	   : "${ vo.qna_idx }",
						 "mem_idx"	   : "${ user.mem_idx }",
						 "mem_nickname"	   : "${ user.mem_nickname }",
						},
			dataType:	"json",
			
			success	:	function(res_data){
				// res_data = {"result" : true}
				
				// 입력창에서 작성했던 글 지우기
				$("#qna_cmt_content").val("");
				
				if(res_data.result==false){
					alert("댓글등록 실패!!");
					return;
				}
				
				comment_list(1);
			},
			error	:	function(err){
				alert(err.responseText)
			}
		});
		
	} // end - comment_insert()
	
	var g_page = 1;
	// 댓글목록 요청
	function comment_list(page) {
		g_page = page;
		
		$.ajax({
			
			url		:	"../qna_cmt/list.do",
			data	:	{"qna_idx":"${ vo.qna_idx }",
						 "page" : page
						},
			success	:	function(res_data){
				
				$("#comment_display").html(res_data);
			},
			error	:	function(err){
				alert(err.responseText);
			}
			
		});
	} // end - comment_list()
		
	// 초기화 이벤트 : 시작시
	$(document).ready(function(){
		
		// 현재 게시물에 달린 댓글 목록 출력
		comment_list(1);
	});
		 

</script>

</head>
<body>
	<div id="box">
		<div class="panel panel-primary">
			<div class="panel-heading" style="background: #F7230E;"><b style="color: white;">${ vo.mem_nickname }</b>님의 글</div>
			<div class="panel-body">
				<div class="common subject">${ vo.qna_title}</div>
				<div class="common content">${ vo.qna_content }</div>
				<div class="common regdate">${ vo.qna_regdate }</div>
				
				<div>
					<input class="btn" style="background: brown;" type="button" value="목록보기"
						   onclick="location.href='list.do'">
						   
					
					<!-- 글의 주인만 수정/삭제 -->
					<c:if test="${ vo.mem_idx eq user.mem_idx }">
						<input class="btn" style="background: tomato;" type="button" value="수정하기"
							   onclick="location.href='modify_form.do?qna_idx=${ vo.qna_idx }'">
						<input class="btn btn-danger" type="button" value="삭제하기"
							   onclick="del('${ vo.qna_idx }');">
					</c:if>
				</div>
			</div>
		</div>
		
		<!-- 관리자만 댓글 처리... -->
		<c:if test="${ user.mem_grade eq '관리자' }">
		<div class="row">
			<div class="col-sm-10" style="padding-right:0">
				<textarea rows="3" id="qna_cmt_content" placeholder="답변을 남겨주세요."></textarea>
			</div>
			<div class="col-sm-2">
				<input id="btn_cmt_register" type="button" value="댓글쓰기" 
					   onclick="comment_insert();">
			</div>
		</div>
		</c:if>
		
		<hr>
		
		<div id="comment_display">
		<%-- <c:forEach var="vo" items="${ list }">
				<!-- 자신의 글만 삭제메뉴 활성화 -->
				<c:if test="${ user.mem_idx eq vo.mem_idx }">
					<div style="text-align: right;">
						<input type="button" value="x"
							style="background: #F7230E; color: white;"
							onclick="comment_delete('${ vo.qna_cmt_idx}');">
					</div>
				</c:if>
				<div>${ vo.mem_nickname }</div>
				<div>${ vo.qna_cmt_regdate }</div>
				<div>${ vo.qna_cmt_content }</div>
				<hr>
			</c:forEach> --%>
		</div>
	</div>
</body>
</html>