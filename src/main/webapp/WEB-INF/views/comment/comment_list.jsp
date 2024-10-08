<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <!DOCTYPE html>
  <html>

  <head>
   <meta charset="UTF-8">
   <title>Insert title here</title>

   <style>
    .btn_X {
     width: 30px !important;
     height: 30px !important;
    }
   </style>

   <script type="text/javascript">

    function comment_delete(cmt_idx) {

     if (confirm("정말 삭제하시겠어요?") == false) return;
     // jQuery 라이브러리가 없어도 board_view에서 활용되기 때문에 ajax를 활용할 수 있다.
     $.ajax({
      url: "../comment/delete.do",
      data: { "cmt_idx": cmt_idx },
      dataType: "json",
      success: function (res_data) {
       // res_data = {"result" : true} or {"result" : false} 
       if (res_data.result == false) {
        alert("삭제 실패");
        return;
       }
       window.location.href = window.location.href;
       comment_list(g_page);
      },
      error: function (err) {
       alert(err.responseText);
      }
     });

    }

   </script>

  </head>

  <body>

   <!-- 	<ul class="pagination">
		<li><a href="#" onclick="comment_list(1);">1</a></li>
		<li><a href="#" onclick="comment_list(2);">2</a></li>
	</ul> -->

   <!-- for(CommentVo vo : list) -->

   <c:forEach var="vo" items="${ list }">
    <!-- 자신의 글만 삭제메뉴 활성화 -->
    <c:if test="${ user.mem_idx eq vo.mem_idx }">
     <div style="text-align: right;">
      <input type="button" class="btn_X" value="x" style="background: #F7230E;color: white;"
       onclick="comment_delete('${ vo.cmt_idx}');">
     </div>
    </c:if>
    <div>${ vo.mem_nickname }</div>
    <div>${ vo.cmt_regdate }</div>
    <div>${ vo.cmt_content }</div>
    <hr>
   </c:forEach>

   <c:if test="${ not empty list}">
    <!-- 페이지 메뉴를 중앙에 정렬하기 위해 div로 감싸기 -->
    <div style="display: flex; justify-content: center;">
     ${ pageMenu }
    </div>
   </c:if>
  </body>

  </html>