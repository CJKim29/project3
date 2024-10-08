<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	
	function comment_delete(qna_cmt_idx){
		
		if(confirm("정말 삭제하시겠어요?")==false) return;
		// jQuery 라이브러리가 없어도 board_view에서 활용되기 때문에 ajax를 활용할 수 있다.
		$.ajax({
			url		:	"../qna_cmt/delete.do",
			data	:	{"qna_cmt_idx":qna_cmt_idx},
			dataType:	"json",
			success	:	function(res_data){
				// res_data = {"result" : true} or {"result" : false} 
				if(res_data.result==false){
					alert("삭제 실패");
					return;
				}
				comment_list(g_page);
			},
			error	:	function(err){
				alert(err.responseText);
			}
		});
		
	}
	
</script>

</head>
<body>
	<h2>답변</h2>
	<hr>
	<!-- for(CommentVo vo : list) -->
	<c:forEach var="vo" items="${ list }">
		<!-- 자신의 글만 삭제메뉴 활성화 -->
		<c:if test="${ user.mem_idx eq vo.mem_idx }">
			<div style="text-align: right;">
				<input type="button" value="x" style="background: #F7230E; color: white;" onclick="comment_delete('${ vo.qna_cmt_idx}');">
			</div>
		</c:if>
		<div><b>${ vo.mem_nickname }</b> (${ vo.qna_cmt_regdate })</div><br>
		<div>${ vo.qna_cmt_content }</div>
		<hr>
	</c:forEach>
</body>
</html>