<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">
  <head>
    

   

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>	

<style type="text/css">

	textarea{
		resize: none;
	}
	
	h4{
		font-weight: bold;
	}
	
	.content{
		min-height: 120px;
	}
	
	
</style>


	<script type="text/javascript">

		function del() {
			
			if(confirm("정말 삭제하시겠습니까?")==false)return;
			
			location.href = "delete.do?board_idx=${ vo.board_idx }";
			
		}
		
		/* 댓글쓰기 기능 */
		function comment_insert() {
			
			// 로그인이 안되었으면
			if("${ empty user }" == "true"){
				if(confirm("로그인 후 댓글쓰기가 가능합니다. \n 로그인하시겠습니까?")==false) return;
				
				//alert(location.href);
				
				// 로그인 폼으로 이동
				location.href="../member/login_form.do";
				
				return;
			}
			
			// 댓글쓰기 작성 (ajax활용)
			let cmt_content = $("#cmt_content").val().trim();
			if(cmt_content=='') {
				alert("댓글을 입력하시오.");
				$("#cmt_content").val("");
				$("#cmt_content").focus();
				return;
			}
			
			// Ajax통해서 댓글 등록
			$.ajax({
				
				url		:	"../comment/insert.do",
				data	:	{
							 "cmt_content" : cmt_content,
							 "board_idx"	: "${ vo.board_idx }",
							 "mem_idx"	   : "${ user.mem_idx }",
							 "mem_nickname"	   : "${ user.mem_nickname }",
							},
				dataType:	"json",
				
				success	:	function(res_data){
					// res_data = {"result" : true}
					
					// 입력창에서 작성했던 글 지우기
					$("#cmt_content").val("");
					
					if(res_data.result==false){
						alert("댓글등록 실패!!");
						return;
					}
					alert("댓글이 등록되었습니다.");
          window.location.href = window.location.href;
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
				
				url		:	"../comment/list.do",
				data	:	{"board_idx":"${ vo.board_idx }",
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
  <body class="js">
    <jsp:include page="/WEB-INF/views/include/header.jsp" />
   


    <!-- Start Blog Single -->
    <section class="blog-single section" style="padding-top: 0">
      <div class="container">
        <div class="row">
          <div class="col-lg-10 offset-lg-1 col-12">
            <div class="blog-single-main">
              <div class="row">
                <div class="col-12">
                  <div class="blog-detail">
                    <h2 class="blog-title">${ vo.board_name }</h2>
                    <div class="blog-meta">
                      <span class="author"
                        ><a href="#"><i class="fa fa-user"></i><b>${ vo.mem_nickname }</b>님의 글</a
                        ><a href="#"><i class="fa fa-calendar"></i>${ vo.board_regdate }</a
                        ><a href="#"
                          ><i class="fa fa-comments"></i>조회수 (${ vo.board_readhit+1 })</a
                        ></span
                      >
                    </div>
                    <div class="content">
                      <p>${ vo.board_content }</p>                     
                    </div>
                  </div>
				  <div>
					<input class="btn" style="background: brown;" type="button" value="목록보기"
						   onclick="location.href='list.do'"> 
					
					<c:if test="${ vo.mem_idx eq user.mem_idx or user.mem_grade eq '관리자' }">
						<input class="btn" style="background: tomato;" type="button" value="수정하기"
							   onclick="location.href='modify_form.do?board_idx=${ vo.board_idx }'">
						<input class="btn btn-danger" type="button" value="삭제하기"
							   onclick="del('${ vo.board_idx }');">
					</c:if>
				</div>
                </div>
				
                <div class="col-12">
                  <div class="comments">
            <h3 class="comment-title">댓글 (${ vo.cmt_count })</h3>
					  <!-- Single Comment -->
					  <div id="comment_display">	
					  </div>	
                    <!-- End Single Comment -->                   
                  </div>
                </div>
                <div class="col-12">
                  <div class="reply">
                    <div class="reply-head">
                      <h2 class="reply-title">댓글 남기기</h2>
                      <!-- Comment Form -->
                      <form class="form" action="#">
                        <div class="row">
                          <div class="col-12">
                            <div class="form-group">
                              <label>Your Message<span>*</span></label>
                              <textarea rows="3" id="cmt_content" placeholder="로그인 후에 댓글쓰기가 가능합니다."></textarea>
                            </div>
                          </div>
                          <div class="col-12">
                            <div class="form-group button">
                              <input class="btn" type="button" onclick="comment_insert();" value="댓글쓰기">
                            </div>
                          </div>
                        </div>
                      </form>
                      <!-- End Comment Form -->
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--/ End Blog Single -->

    <jsp:include page="/WEB-INF/views/include/footer.jsp" />
</html>
