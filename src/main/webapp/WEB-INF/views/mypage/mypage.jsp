<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>마이페이지</title>
    <link rel="stylesheet" href="../resources/css/mypage.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <!-- <script type="text/javascript">
      function member_modify() {
        location.href = "../member/modify_form.do?mem_idx=" + `${user.mem_idx}`;
      }
      function member_delete() {
        if (confirm("정말 탈퇴하시겠습니까?") == false) return;

        alert("회원 탈퇴가 완료되었습니다.");
        location.href = "../member/delete.do?mem_idx=" + `${user.mem_idx}`;
      }
      function cart_list() {
        location.href = "../cart/list.do";
      }
    </script> -->
  </head>
  <body>
    <jsp:include page="/WEB-INF/views/include/header.jsp" />

    <div class="custom-header" style="margin-top: 30px">
      <div class="header-container">
        <div class="logo-section">
          <img
            src="../resources/template/images/logo_TIMOA1.png"
            alt="logo"
            class="logo-img"
          />
        </div>
        <div class="welcome-section">
          <span style="font-weight: bold">티모아 마이페이지</span>
        </div>
        <div class="points-section">
          <span style="font-size: 17px">
            <b>${user.mem_nickname}</b>님의 보유 포인트:
            <b style="color: gold">${user.mem_point}P</b>
          </span>
        </div>
      </div>
    </div>

    <main>
      <div class="sidebar">
        <ul>
          <li><a href="#" data-content="member-info">회원정보 수정</a></li>
          <li><a href="#" data-content="delete-account">회원 탈퇴</a></li>
        </ul>
        <hr />
        <ul>
          <li><a href="#" data-content="cart">장바구니</a></li>
          <li><a href="#" data-content="purchase-history">구매 내역</a></li>
        </ul>
        <hr />
        <ul>
          <li><a href="#" data-content="my-reviews">나의 후기 목록</a></li>
          <li>
            <a href="#" data-content="liked-performances">좋아요한 공연 목록</a>
          </li>
        </ul>
        <hr />
        <ul>
          <li><a href="#" data-content="qna">Q&A</a></li>
          <li><a href="#" data-content="bulletin-board">게시판</a></li>
          <li><a href="#" data-content="faq">FAQ</a></li>
        </ul>
      </div>

      <div class="content"></div>
    </main>

    <script>
      $(document).ready(function () {
        $("a").on("click", function (e) {
          e.preventDefault();
          const content = $(this).data("content");

          // Ajax로 각 메뉴 클릭 시 해당 페이지를 불러오는 부분
          $(".content").load(content + ".html");
        });
      });
    </script>

    <jsp:include page="/WEB-INF/views/include/footer.jsp" />
  </body>
</html>
