<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <style>
      #title {
        text-align: center;
        font-weight: bold;
        font-size: 26px;
        text-shadow: 1px 1px 1px black;
        color: #ff1d38;
      }
    </style>
    <script type="text/javascript">
      function member_modify() {
        location.href = "../member/modify_form.do?mem_idx=" + `${user.mem_idx}`;
      }
      function member_delete() {
        alert("회원 탈퇴가 완료되었습니다.");
        location.href = "../member/delete.do?mem_idx=" + `${user.mem_idx}`;
      }
    </script>
  </head>
  <body>
    <jsp:include page="/WEB-INF/views/include/header.jsp" />

    <!-- Start Blog Grid -->
    <div class="blog-single shop-blog grid section" style="padding-top: 30px">
      <div class="container">
        <h3 id="title" style="margin-bottom: 20px">::::마이페이지::::</h3>
        <div class="row">
          <p>
            <b>${user.mem_nickname}</b>님의 보유 포인트는
            <b>${user.mem_point}P입니다.</b>
          </p>
          <input
            type="button"
            value="회원정보수정"
            onclick="member_modify();"
          />
          <input type="button" value="회원탈퇴" onclick="member_delete();" />
          <input type="button" value="장바구니" />
          <p>구매내역</p>
          <p>나의 후기 목록</p>
          <p>좋아요한 공연 목록</p>
        </div>
      </div>
    </div>
    <!--/ End Blog Grid -->

    <jsp:include page="/WEB-INF/views/include/footer.jsp" />
  </body>
</html>
