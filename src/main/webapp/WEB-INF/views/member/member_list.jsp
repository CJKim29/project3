<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

   <!DOCTYPE html>
   <html>

   <head>
    <meta charset="UTF-8">
    <title>TIMOA - 회원목록</title>
    <link rel="icon" href="../resources/images/TIMOA_icon.png" type="image/png">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <style type="text/css">
     #box {
      width: 1500px;
      margin: auto;
      margin-top: 50px;
     }

     #title {
      text-align: center;
      font-weight: bold;
      font-size: 32px;
      color: #9dd9ff;
      text-shadow: 1px 1px 1px black;
     }

     #empty_msg {
      text-align: center;
      color: red;
      margin-top: 150px;
      font-size: 25px;
     }

     td {
      vertical-align: middle !important;
     }
    </style>

    <script type="text/javascript">

     function del(mem_idx) {
      //console.log(mem_idx, "삭제");

      //삭제하기 전 확인
      if (confirm("정말 삭제 하시겠습니까?") == false) return;

      //삭제요청
      location.href = "delete.do?mem_idx=" + mem_idx;	//MemberDeleteAction
     }
    </script>

    <script type="text/javascript">

     //초기화1
     //$(document).ready(function(){});

     //초기화2
     $(function () {
      setTimeout(showMessage, 100);
     });

     function showMessage() {
      // /member/list.do?reason=not_admin_delete
      if ("${ param.reason eq 'not_admin_delete'}" == "true") {

       alert("관리자는 삭제할 수 없습니다");
      }

     }
    </script>

   </head>

   <body>

    <div id="box">
     <h1 id="title">티모아 회원목록</h1>

     <div style="margin-top:50px; text-align: left; float:right;">

      <!-- 로그인이 안된경우 -->
      <c:if test="${ empty sessionScope.user }">
       <input class="btn btn-warning" type="button" value="로그인" onclick="location.href='login_form.do'">
      </c:if>

      <!-- 로그인이 된경우 -->
      <c:if test="${ not empty sessionScope.user }">
       <b>${ sessionScope.user.mem_name }</b>님 환영합니다
       <input class="btn btn-danger" type="button" value="로그아웃" onclick="location.href='logout.do'">
      </c:if>
     </div>

     <div style="margin-top:50px; margin-bottom: 10px; float:right;">
      <input class="btn btn-primary" type="button" value="회원가입" onclick="location.href='insert_form.do'">
     </div>

     <table class="table">
      <tr class="info">
       <th>회원번호</th>
       <th>회원명</th>
       <th>닉네임</th>
       <th>아이디</th>
       <th>생년월일</th>
       <th>핸드폰번호</th>
       <th>이메일</th>
       <th>비밀번호</th>
       <th>우편번호</th>
       <th>주소</th>
       <th>아이피</th>
       <th>가입일자</th>
       <th>회원등급</th>
       <th>포인트</th>
       <th>편집</th>
      </tr>

      <!-- Data출력 -->
      <!-- for(MemberVo vo : list) -->
      <c:forEach var="vo" items="${ list }">
       <tr>
        <td>${ vo.mem_idx }</td>
        <td>${ vo.mem_name }</td>
        <td>${ vo.mem_nickname }</td>
        <td>${ vo.mem_id }</td>
        <td>${fn:substring(vo.mem_birth, 0, 10)}</td>
        <td>${ vo.mem_phone }</td>
        <td>${ vo.mem_email }</td>
        <td>${ vo.mem_pwd }</td>
        <td>${ vo.mem_zipcode }</td>
        <td>${ vo.mem_addr }</td>
        <td>${ vo.mem_ip }</td>
        <td>${ fn:substring(vo.mem_regdate,0,10) }</td>
        <td>${ vo.mem_grade }</td>
        <td>${ vo.mem_point }</td>
        <td>
         <!--                        관리자          또는        로그인 한 유저       -->
         <c:if test="${ (user.mem_grade eq '관리자') or (user.mem_idx eq vo.mem_idx) }">
          <input class="btn btn-success" type="button" value="수정"
           onclick="location.href='modify_form.do?mem_idx=${ vo.mem_idx }'">
          <input class="btn btn-danger" type="button" value="삭제" onclick="del('${ vo.mem_idx }');">
         </c:if>
        </td>
       </tr>
      </c:forEach>

     </table>


     <!-- Data가 없는 경우 -->
     <c:if test="${ empty requestScope.list }">
      <div id="empty_msg">등록된 회원정보가 없습니다</div>
     </c:if>
    </div>

   </body>

   </html>