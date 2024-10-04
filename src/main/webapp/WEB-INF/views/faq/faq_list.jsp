<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
   <!DOCTYPE html>
   <html lang="zxx">

   <head>
    <title>TIMOA - faq</title>
    <link rel="icon" href="../resources/images/TIMOA_icon.png" type="image/png">

    <style type="text/css">
     #title {
      text-align: center;
      font-weight: bold;
      font-size: 30px;
      color: #333;

      margin: 50px 0px 50px 0px;
     }

     th {
      color: black;
     }

     a {
      color: #ff1d38;
      text-decoration: none;
     }

     a:hover {
      color: #ff1d38;
      text-decoration: none;
     }

     .faq_title {
      display: inline-block;
      overflow: hidden;
      white-space: nowrap;
      text-overflow: ellipsis;
      word-break: break-all;
     }

     .faq_content {
      display: none;
      /* 기본적으로 내용은 숨깁니다. */
      margin-top: 10px;
     }

     .show {
      display: block;
      /* 'show' 클래스가 추가되면 내용이 보입니다. */
     }

     .toggle-btn {
      cursor: pointer;
     }

     .btn {
      width: 100px;
      font-weight: bold;
      padding-top: 10px;
      padding-bottom: 10px;

      height: 40px !important;
      margin-right: 3px !important;

      /* 수평 중앙 정렬 */
      text-align: center !important;

      /* 수직 중앙 정렬을 위해 line-height를 버튼 높이와 동일하게 설정 */
      line-height: 40px !important;

      /* 다른 여백 없애기 */
      padding: 0 !important;
     }

     .btn:hover {
      background-color: #ff1d38;
      color: #fff;
      transition: 0.4s all ease-in-out;
     }

     /* 버튼 클릭 후 남아있는 효과 지우기 */
     .btn:focus {
      border: none;
      outline: none;
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

      if (confirm("정말 삭제하시겠습니까?") == false) return;

      location.href = "delete.do?faq_idx=" + faq_idx;

     }

    </script>

   </head>

   <body class="js">
    <jsp:include page="/WEB-INF/views/include/header.jsp" />
    <div class="blog-single shop-blog grid section" style="padding-top: 50px">
     <div class="container">
      <h4 id="title">FAQ</h3>

       <div class="row" style="margin-top: 30px; margin-bottom: 10px; ">

        <c:if test="${ user.mem_grade eq '관리자' }">
         <input class="btn" type="button" value="등록" onclick="insert_form();">
        </c:if>

        <table class="table" style="margin-bottom: 0">
         <!-- 데이터가 없는 경우 -->
         <tr>
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
           <td>
            <span class="toggle-btn faq_title" onclick="toggleContent('content-${vo.faq_no}')"
             style="font-size: 20px;">${ vo.faq_title } <span style="color: #cccccc;">▼</span></span><br>
            <span style="font-size: 14px; color: #cccccc;">${ fn:substring(vo.faq_regdate,0,10) }</span>
            <div id="content-${vo.faq_no}" class="faq_content" style="background: #f3f3f3; font-size: 13px; ">
             ${ vo.faq_content }
            </div>

           </td>
           <td>
            <!-- 관리자 계정만 수정/삭제 -->
            <c:if test="${ user.mem_grade eq '관리자' }">
             <input class="btn" type="button" value="수정"
              onclick="location.href='modify_form.do?faq_idx=${ vo.faq_idx }'">
             <input class="btn btn-danger" type="button" value="삭제" onclick="del('${ vo.faq_idx }');">
            </c:if>
           </td>
          </tr>
         </c:forEach>
         </tr>
        </table>

       </div>
     </div>
    </div>

    <jsp:include page="/WEB-INF/views/include/footer.jsp" />
   </body>

   </html>