<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
   <!DOCTYPE html>
   <html>

   <head lang="zxx">
    <title>TIMOA - Q&A</title>
    <link rel="icon" href="../resources/images/TIMOA_icon.png" type="image/png" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <style type="text/css">
     #title {
      text-align: center;
      font-weight: bold;
      font-size: 30px;
      color: #333;

      margin: 50px 0px 50px 0px;
     }

     #search_btn:hover {
      background-color: #e6e6e6;
      color: black;
     }

     th {
      color: white;
      height: 50px;
      vertical-align: middle !important;
      text-align: center !important;
     }

     td {
      vertical-align: middle !important;
      text-align: center !important;
     }

     a {
      color: #ff1d38;
      text-decoration: none;
     }

     a:hover {
      color: #ff1d38;
      text-decoration: none;
     }

     .qna_img {
      width: 40px;
      margin-right: 10px;
     }

     .qna_title {
      display: inline-block;
      overflow: hidden;
      white-space: nowrap;
      text-overflow: ellipsi;
      word-break: break-all;

      /* ellipsi 속성 */
     }

     form {
      margin-bottom: 7px;
     }
    </style>

    <script type="text/javascript">
     function insert_form() {
      // 로그인 여부 체크
      if ("${ empty user }" == "true") {
       if (
        confirm("글쓰기는 로그인 후 가능합니다 \n 로그인 하시겠습니까?") ==
        false
       )
        return;

       location.href = "../member/login_form.do";

       return;
      }

      location.href = "insert_form.do";
     }

     // 검색
     function find() {
      let search = $("#search").val();
      let search_text = $("#search_text").val().trim();

      // 전체보기 또는 답변 완료된 게시물만 보기일 때 검색어를 비우기
      if (search === "all" || search === "use_y") {
       search_text = ""; // 검색어는 비워도 됩니다
      }

      // 전체검색이 아닌데 검색어가 비어있으면 경고
      if (search !== "all" && search !== "use_y" && search_text === "") {
       alert("검색어를 입력하세요.");
       $("#search_text").val("");
       $("#search_text").focus();
       return;
      }

      // 자바스크립트 이용해서 호출
      location.href =
       "list.do?search=" +
       search +
       "&search_text=" +
       encodeURIComponent(search_text, "utf-8");
     }
    </script>
   </head>

   <body class="js">
    <jsp:include page="/WEB-INF/views/include/header.jsp" />
    <div class="blog-single shop-blog grid section" style="padding-top: 30px">
     <div class="container">

      <!-- <h3 id="title"><img src="../resources/images/qna.png" alt="logo" class="qna_img" />Q&A</h3> -->
      <h3 id="title">Q&A</h3>

      <div class="row">
       <form style="height: 50px">
        <select id="search" style="height: 100%; padding: 8px 10px !important; box-sizing: border-box;">
         <option value="all">전체보기</option>
         <option value="qna_title">제목</option>
         <option value="mem_nickname">작성자</option>
         <option value="name_content">제목+작성자</option>
         <option value="use_y">답변 완료된 게시물만 보기</option>
        </select>
        <input id="search_text" value="${ param.search_text }" style="
                height: 40px;
                margin-right: 3px;
                margin-left: 6px;
                font-size: 16px;
                width: 200px;
              " />

        <input id="search_btn" type="button" class="btn" value="검색" onclick="find();"
         style="height: 40px; margin-right: 3px" />

        <input class="btn" style="background: #ff1d38; color: white" type="button" value="질문하기"
         onclick="insert_form();" />
       </form>

       <table class="table" style="margin-bottom: 0;">
        <tr style="background: #ff1d38;">
         <th>번호</th>
         <th style="width: 50%">제목</th>
         <th>작성자</th>
         <th>작성일자</th>
         <th>답변 유무</th>
        </tr>

        <!-- 데이터가 없는 경우 -->
        <tr>
         <c:if test="${ empty list }">
        <tr>
         <td colspan="5" align="center">
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
            <span class="qna_title">${ vo.qna_title }</span>
           </a>
          </td>
          <td>${ vo.mem_nickname }</td>
          <td>${ vo.qna_regdate }</td>
          <td>
           <c:if test="${ vo.qna_use eq 'n' }"> 답변 미완료 </c:if>
           <c:if test="${ vo.qna_use eq 'y' }">
            <c:if test="${ vo.qna_cmt_count ne 0 }">
             <span class="badge" style="background: #ff1d38; font-size: 16px">답변 완료</span>
            </c:if>
           </c:if>
          </td>
         </tr>
        </c:forEach>
        </tr>
       </table>
       <!-- PageMenu -->
       <div style="text-align: center; margin: auto">${ pageMenu }</div>
      </div>
     </div>
    </div>
    <div style="height: 100px"></div>

    <jsp:include page="/WEB-INF/views/include/footer.jsp" />
   </body>

   </html>