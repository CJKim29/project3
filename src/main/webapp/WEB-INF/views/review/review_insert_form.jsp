<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- BootStrap 3.x-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">

    #box{
        width: 600px;
        margin: auto;
        margin-top: 100px;
    }
    
    textarea{
        resize: none;	/* 표 사이즈 조절 못하게 */
    }
    
    th{
         width: 15%;
        vertical-align: middle !important;
    }
    
</style>

<script type="text/javascript">
	
	function send(f) {		/* 임의적으로 f라고 form의 이름을 적어줌 */
		
		// 입력값 검증(잘못 입력 시 안 넘어가도록 입력값을 검증하자)
		let review_title   = f.review_title.value.trim();		/* f안의 name의 value값 얻어와서 공백제거 */
		let review_content = f.review_content.value.trim();
		
		if(review_title=='') {
			alert("제목을 입력하세요");
			f.review_title.value="";	/* 지우기 */
			f.review_title.focus();
			return;
		}
		if(review_content=='') {
			alert("내용을 입력하세요");
			f.review_content.value="";	/* 지우기 */
			f.review_content.focus();
			return;
		}

		// f.method = "POST";	
		f.action = "insert.do";
		f.submit();	// 전송
	}
</script>

</head>
<body>

    <form>           
		<div id="box">
		
			<div class="panel panel-success">
				<div class="panel-heading">후기 작성</div>
				<div class="panel-body">
					<table class="table">
						<tr>
							<th>제목</th>
							<td><input class="form-control" name="review_title"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td>
							<textarea class="form-control" rows="6" name="review_content"></textarea>
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center">
							  <input class="btn btn-success" type="button" value="취소" 
							  		 onclick="location.href='list.do'">
							  <input class="btn btn-primary" type="button" value="후기 작성" 
							  		 onclick="send(this.form);">	
									    <!-- 자바스크립트 함수 -->
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</form>

</body>
</html>