<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

  <!DOCTYPE html>
  <html>

  <head>
   <meta charset="UTF-8" />
   <title>TIMOA - 마이페이지</title>
   <link rel="icon" href="../resources/images/TIMOA_icon.png" type="image/png">
   <link rel="stylesheet" href="../resources/css/mypage.css" />
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

   <script>
    $(document).ready(function () {
     // '장바구니' 링크 클릭 시
     $('#memberModify').on('click', function (event) {
      event.preventDefault();  // 기본 링크 동작을 막음

      // AJAX 요청 보내기
      $.ajax({
       url: '/member/modify_form.do?mem_idx=${user.mem_idx}',  // 호출할 URL
       type: 'GET',           // HTTP 메소드
       success: function (response) {
        // 응답이 성공적으로 돌아왔을 때, 내용을 .content에 삽입
        $('.content').html(response);
       },
       error: function (xhr, status, error) {
        // 에러가 발생했을 때 처리
        console.error('AJAX 요청 실패:', status, error);
        $('.content').html('<p>회원정보수정을 불러오는 데 실패했습니다.</p>');
       }
      });
     });
    });
   </script>
   <script>
    $(document).ready(function () {
     // '장바구니' 링크 클릭 시
     $('#cartLink').on('click', function (event) {
      event.preventDefault();  // 기본 링크 동작을 막음

      // AJAX 요청 보내기
      $.ajax({
       url: '/cart/ajax_list.do',  // 호출할 URL
       type: 'GET',           // HTTP 메소드
       success: function (response) {
        // 응답이 성공적으로 돌아왔을 때, 내용을 .content에 삽입
        $('.content').html(response);
       },
       error: function (xhr, status, error) {
        // 에러가 발생했을 때 처리
        console.error('AJAX 요청 실패:', status, error);
        $('.content').html('<p>장바구니 정보를 불러오는 데 실패했습니다.</p>');
       }
      });
     });
    });
   </script>
   <script>
    $(document).ready(function () {
     // '장바구니' 링크 클릭 시
     $('#MyLike').on('click', function (event) {
      event.preventDefault();  // 기본 링크 동작을 막음

      // AJAX 요청 보내기
      $.ajax({
       url: '/mypage/ajax_like.do',  // 호출할 URL
       type: 'GET',                  // HTTP 메소드
       success: function (response) {
        // 응답이 성공적으로 돌아왔을 때, 내용을 .content에 삽입
        $('.content').html(response);
       },
       error: function (xhr, status, error) {
        // 에러가 발생했을 때 처리
        console.error('AJAX 요청 실패:', status, error);
        $('.content').html('<p>좋아요한 공연목록을 불러오는 데 실패했습니다.</p>');
       }
      });
     });
    });
   </script>
   <script>
    $(document).ready(function () {
     $('#MyReview').on('click', function (event) {
      event.preventDefault();  // 기본 링크 동작을 막음
      // 나의 후기 클릭 시
      myReviewList(1);
     });
    });

    function myReviewList(page) {
     // AJAX 요청 보내기
     $.ajax({
      url: '/mypage/ajax_review.do',  // 호출할 URL
      data: { 'page': page },
      type: 'GET',           // HTTP 메소드
      success: function (response) {
       // 응답이 성공적으로 돌아왔을 때, 내용을 .content에 삽입
       $('.content').html(response);
      },
      error: function (xhr, status, error) {
       // 에러가 발생했을 때 처리
       console.error('AJAX 요청 실패:', status, error);
       $('.content').html('<p>나의 후기 목록을 불러오는 데 실패했습니다.</p>');
      }
     });
    }
   </script>
   <!-- 구매 내역 -->
   <script>
    $(document).ready(function () {
     // URL에서 'active' 파라미터 확인
     const urlParams = new URLSearchParams(window.location.search);
     const isActive = urlParams.get('active');

     if (isActive === 'true') {
      // 'paymentList' 링크를 클릭한 것처럼 상태를 활성화
      $('#paymentList').addClass('active'); // CSS 스타일 적용 (예: active 클래스를 추가)

      // 'paymentList'의 click 이벤트를 수동으로 트리거 (구매내역 로드)
      setTimeout(() => {
       $('#paymentList').trigger('click');
      }, 100);  // 페이지가 완전히 로드된 후 클릭 이벤트를 트리거
     }

     // '구매내역' 링크 클릭 시
     $('#paymentList').on('click', function (event) {
      event.preventDefault(); // 기본 링크 동작을 막음

      // AJAX 요청 보내기
      $.ajax({
       url: '/payment/list.do',
       type: 'GET',
       success: function (response) {
        // 응답이 성공적으로 돌아왔을 때, 내용을 .content에 삽입
        $('.content').html(response);
       },
       error: function (xhr, status, error) {
        console.error('AJAX 요청 실패:', status, error);
        $('.content').html('<p>구매 내역을 불러오는 데 실패했습니다.</p>');
       }
      });
     });
    });

   </script>
  </head>

  <body>
   <jsp:include page="/WEB-INF/views/include/header.jsp" />

   <div class="custom-header" style="margin-top: 30px">
    <div class="header-container">
     <div class="logo-section">
      <img src="../resources/template/images/logo_TIMOA1.png" alt="logo" class="logo-img" />
     </div>
     <div class="welcome-section">
      <span style="font-weight: bold">티모아 마이페이지</span>
     </div>
     <div class="points-section">
      <span style="font-size: 17px">
       <b>${user.mem_nickname}</b>님의 보유 포인트:
       <b style="color: gold">${mem_point}P</b>
      </span>
     </div>
    </div>
   </div>

   <main>
    <div class="sidebar">
     <ul>
      <li><a href="#" data-content="member-info" id="memberModify">회원정보 수정</a></li>
     </ul>
     <hr />
     <ul>
      <li><a href="#" data-content="cart" id="cartLink">장바구니</a></li>
      <li><a href="#" data-content="payment" id="paymentList">구매 내역</a></li>
     </ul>
     <hr />
     <ul>
      <li><a href="#" data-content="my-reviews" id="MyReview">나의 후기 목록</a></li>
      <li>
       <a href="#" data-content="liked-performances" id="MyLike">좋아요한 공연 목록</a>
      </li>
     </ul>
     <hr />
     <ul>
      <li><a href="/qna/list.do" data-content="qna">Q&A</a></li>
      <li><a href="/board/list.do" data-content="bulletin-board">게시판</a></li>
      <li><a href="/faq/list.do" data-content="faq">FAQ</a></li>
     </ul>
     <c:if test="${ user.mem_grade eq '관리자' }">
      <hr />
      <ul>
       <li><a href="/member/list.do" data-content="member">회원관리</a></li>
      </ul>
     </c:if>
    </div>

    <div class="content"></div>
   </main>

   <jsp:include page="/WEB-INF/views/include/footer.jsp" />
  </body>

  </html>