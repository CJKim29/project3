<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

   <!DOCTYPE html>
   <html>

   <head>
    <title>TIMOA - 공연장</title>
    <link rel="icon" href="../resources/images/TIMOA_icon.png" type="image/png">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <style type="text/css">
     #box {
      width: 1700px;
      margin: auto;
      margin-top: 10px;
     }

     #title {
      text-align: center;
      font-weight: bold;
      font-size: 30px;
      color: #333;

      margin: 50px 0px 50px 0px;
     }

     #empty_msg {
      text-align: center;
      color: red;
      margin-top: 150px;
      font-size: 25px;
     }

     .hall_img {
      width: 100px;
      height: 100px;
     }

     th {
      /* color: white; */
      height: 50px !important;
      vertical-align: middle !important;
      text-align: center !important;
     }

     td {
      vertical-align: middle !important;
      text-align: center !important;
     }

     .btn {
      width: 100px;
      font-weight: bold;
      padding-top: 10px;
      padding-bottom: 10px;
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

     .table_header {
      color: white;
     }

     .site {
      color: rgb(13, 97, 192);
      font-weight: bold;
     }

     .site:hover {
      color: rgb(5, 33, 65) !important;
      font-weight: bold !important;
     }
    </style>


    <script type="text/javascript">
     function filterByArea() {
      location.href =
       "list.do?area=" + encodeURIComponent($("#area-select").val());
     }

     function del(hall_idx) {

      if (confirm("정말 삭제하시겠습니까?") == false) return;

      location.href = "delete.do?hall_idx=" + hall_idx;
     }
    </script>


   <body>
    <jsp:include page="/WEB-INF/views/include/header.jsp" />

    <div id="box">
     <h1 id="title"> 공연장목록 </h1>
     <p style="text-align: right; color: #ff1d38;">※공연장명을 클릭하여 공연장에서 상영중인 공연 목록을 조회하실 수 있습니다.</p>
     <p style="text-align: right; color: #ff1d38;">※사이트로 이동을 클릭하여 해당 공연장 홈페이지로 이동하실 수 있습니다.</p>

     <div style="margin-top:20px; text-align: left; float:right;">
      <!-- 관리자만 추가 기능 -->
      <c:if test="${ user.mem_grade eq '관리자' }">
       <input style="margin-bottom:5px;" class="btn" type="button" value="등록" onclick="location.href='insert_form.do'">
      </c:if>
     </div>

     <table class="table">
      <tr style="background: #ff1d38">
       <!-- <th>번호</th> -->
       <th class="table_header">공연장</th>
       <th>
        <select id="area-select" onchange="filterByArea()">
         <option value="all" ${param.cate eq 'all' ? 'selected' : '' }>지역</option>
         <option value="1" ${param.cate eq '1' ? 'selected' : '' }>서울</option>
         <option value="2" ${param.cate eq '2' ? 'selected' : '' }>경기/인천</option>
         <option value="3" ${param.cate eq '3' ? 'selected' : '' }>충청/대전</option>
         <option value="4" ${param.cate eq '4' ? 'selected' : '' }>경상/대구/부산</option>
         <option value="5" ${param.cate eq '5' ? 'selected' : '' }>전라/광주</option>
         <option value="6" ${param.cate eq '6' ? 'selected' : '' }>강원</option>
         <option value="7" ${param.cate eq '7' ? 'selected' : '' }>제주</option>
        </select>
       </th>
       <th class="table_header">주소</th>
       <th class="table_header">전화번호</th>
       <th class="table_header">홈페이지</th>
       <th class="table_header">좌석수</th>
       <th class="table_header">공연장사진</th>
       <th></th>
      </tr>

      <!-- Data출력 -->
      <!-- for(MemberVo vo : list) -->
      <c:forEach var="vo" items="${ list }">
       <tr>
        <!-- <td>${ vo.hall_idx }</td> -->
        <td><a href="search.do?hall_idx=${vo.hall_idx}" class="site">${ vo.hall_name }</a></td>
        <td>${ vo.hall_area }</td>
        <td>${ vo.hall_addr }</td>
        <td>${ vo.hall_tel }</td>
        <td>
         <a href="${vo.hall_site}">
          <p class="site">사이트로이동</p>
         </a>
        </td>

        <td>${ vo.hall_seat }</td>
        <td><img class="hall_img" src="../resources/images/${ vo.hall_image }"></td>
        <td>
         <!-- 관리자 계정만 수정/삭제 -->
         <c:if test="${ user.mem_grade eq '관리자' }">
          <input class="btn" type="button" value="수정"
           onclick="location.href='modify_form.do?hall_idx=${ vo.hall_idx }'">
          <input class="btn" type="button" value="삭제" onclick="del('${ vo.hall_idx }');">
         </c:if>
        </td>
       </tr>
      </c:forEach>
     </table>

     <!-- Data가 없는 경우 -->
     <c:if test="${ empty requestScope.list }">
      <div id="empty_msg">등록된 공연장정보가 없습니다</div>
     </c:if>
    </div>

    <jsp:include page="/WEB-INF/views/include/footer.jsp" />

   </body>

   </html>