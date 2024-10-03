<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
   <!DOCTYPE html>
   <html lang="zxx">

   <head>
    <title>TIMOA - 게시판</title>
    <link rel="icon" href="../resources/images/TIMOA_icon.png" type="image/png">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <style type="text/css">
     #search_btn:hover {
      color: black;
      background-color: #e6e6e6;
     }

     #title {
      text-align: center;
      font-weight: bold;
      font-size: 30px;
      color: #333;

      margin: 50px 0px 50px 0px;
     }

     th {
      color: white;
      /* height: 40px !important; */
      vertical-align: middle !important;
      text-align: center !important;
     }

     td {
      vertical-align: middle !important;
      text-align: center !important;
     }

     table {
      width: 1125px !important;
     }

     a {
      color: #ff1d38;
      text-decoration: none;
     }

     a:hover {
      color: #ff1d38;
      text-decoration: none;
     }

     .board_name {
      display: inline-block;

      overflow: hidden;
      white-space: nowrap;
      text-overflow: ellipsis;
      word-break: break-all;

      /* ellipsi 속성 */
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
     // 페이지가 준비되면 검색창을 비우기(기존 null이 받아졌음)
     $(document).ready(function () {
      $("#search_text").val("");
     });

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

     let currentSort = "board_idx"; // 기본 정렬 기준

     function setSort(sortBy) {
      currentSort = sortBy; // 정렬 기준을 설정
      find(); // 정렬 기준을 포함한 검색 수행
     }

     // 검색
     function find() {
      let search = $("#search").val();
      let search_text = $("#search_text").val().trim();

      // 전체보기일 때 검색어를 비우기
      if (search === "all") {
       search_text = "";
      }

      // 전체검색이 아닌데 검색어가 비어있으면
      if (search !== "all" && search_text === "") {
       alert("검색어를 입력하세요.");
       $("#search_text").val("");
       $("#search_text").focus();
       return;
      }

      //자바스크립트 이용해서 호출
      location.href =
       "list.do?search=" +
       search +
       "&search_text=" +
       encodeURIComponent(search_text, "utf-8") +
       "&sort=" +
       encodeURIComponent(currentSort, "utf-8") +
       "&cate=" +
       encodeURIComponent($("#category-select").val()); // 카테고리 값 추가; // 자바스크립트에서 인코딩/정렬 기준 추가
     }

     function filterByCategory() {
      find(); // 카테고리 선택 시 검색을 수행
     }
    </script>
   </head>

   <body class="js">
    <jsp:include page="/WEB-INF/views/include/header.jsp" />

    <!-- Start Blog Grid -->
    <div class="blog-single shop-blog grid section" style="padding-top: 30px; padding-left: 15px;">
     <div class="container">
      <h3 id="title">게시판</h3>
      <div class="row">
       <!-- 검색메뉴 -->
       <form style="height:50px;">
        <select id="search" style="height: 40px; font-size: 16px; margin-right: 5px">
         <option value="all">전체보기</option>
         <option value="board_name">제목</option>
         <option value="mem_nickname">작성자</option>
         <option value="name_content">제목+작성자</option>
        </select>

        <input id="search_text" value="${param.search_text}" style="
                  height: 40px;
                  margin-right:3px;
                  margin-left:6px;
                  font-size: 16px;
                  width: 200px;
                " />

        <input id="search_btn" type="button" class="btn" value="검색" onclick="find();" />


        <input id="board_readhit" type="button" class="btn" value="조회순" onclick="setSort('board_readhit');" />
        <input id="board_idx" type="button" class="btn" value="등록일순" onclick="setSort('board_idx');" />

        <input class="btn" type="button" value="글쓰기" onclick="insert_form();" />


       </form>
       <!-- 게시판 테이블 구성하기  -->
       <table class="table" style="margin: 0;">
        <tr style="background: #ff1d38">
         <th style="width: 6%; color:black;">
          <select id="category-select" onchange="filterByCategory()">
           <option value="all" ${param.cate eq 'all' ? 'selected' : '' }>전체</option>
           <option value="1" ${param.cate eq '1' ? 'selected' : '' }>뮤지컬</option>
           <option value="2" ${param.cate eq '2' ? 'selected' : '' }>연극</option>
           <option value="3" ${param.cate eq '3' ? 'selected' : '' }>콘서트</option>
          </select>
         </th>
         <th>제목</th>
         <th style="width: 10%">작성자</th>
         <th style="width: 15%">작성일자</th>
         <th style="width: 6%">조회수</th>
        </tr>

        <tr>
         <!-- 데이터가 없는 경우 -->
         <c:if test="${ empty list }">
        <tr>
         <td colspan="5" align="center">
          <font color="red">게시물이 없습니다</font>
         </td>
        </tr>
        </c:if>

        <!-- 데이터가 있는 경우-->
        <c:forEach var="vo" items="${ list }">
         <tr>
          <td>${ vo.board_cate_name }</td>
          <td>
           <!-- 삭제된 게시물 -->
           <c:if test="${ vo.board_use eq 'n' }">
            <font color="red">(삭제된 게시물입니다.)
             <span class="board_name">${ vo.board_name }</span>
            </font>
           </c:if>

           <!-- 삭제안된 게시물 -->
           <c:if test="${ vo.board_use eq 'y' }">
            <span class="board_name">
             <a href="view.do?board_idx=${ vo.board_idx }">
              ${ vo.board_name }
              <c:if test="${ vo.cmt_count ne 0 }">
               <span style="color: #ff1d38; font-size: 10px">&nbsp;(${ vo.cmt_count })</span>
              </c:if>
             </a>
            </span>
           </c:if>
          </td>

          <td>${ vo.mem_nickname }</td>
          <td>${ vo.board_regdate }</td>

          <td style="text-align: center;">
           ${vo.board_readhit}
          </td>
         </tr>
        </c:forEach>
        </tr>
       </table>
       <!-- Pagination -->
       <div style="text-align: center; margin: auto">${ pageMenu }</div>
       <!--/ End Pagination -->
      </div>
     </div>
    </div>
    <!--/ End Blog Grid -->

    <jsp:include page="/WEB-INF/views/include/footer.jsp" />
   </body>

   </html>