<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

   <!DOCTYPE html>
   <html>

   <head>
    <meta charset="UTF-8">
    <title>book_page</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://unpkg.com/gijgo@1.9.14/js/gijgo.min.js" type="text/javascript"></script>
    <link href="https://unpkg.com/gijgo@1.9.14/css/gijgo.min.css" rel="stylesheet" type="text/css" />

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

     .hall_img {
      width: 100px;
      height: 100px;
     }

     td {
      vertical-align: middle !important;
     }
    </style>

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

    <!-- 달력 -->
    <!-- <script>
                    $(document).ready(function () {
                        $('#datepicker').each(function () {
                            $(this).datepicker({
                                showOnFocus: false // 달력을 클릭할 때만 열리게 하지 않음
                            }).open();// 페이지 로드 시 바로 달력을 열기
                        });
                    });
                </script> -->

    <script>
     $(document).ready(function () {
      // datepicker 초기화
      $('#datepicker').datepicker({
       showOn: "button",
       buttonText: "Select date",
       format: "yyyy-mm-dd",

       minDate: new Date('2024-08-30'),
       maxDate: new Date('2024-09-20')
      });

      // 좌석정보 버튼 클릭 시 선택된 날짜를 URL에 추가
      $('input.reservation').click(function () {
       var selected_date = $('#datepicker').val();
       var performance_idx = $(this).data('performanceIdx');

       if (!selected_date || selected_date.trim() === "") {
        alert('날짜를 선택해주세요.');
        return;
       }

       // 자식 창 열기
       var newWindow = window.open('performance_seat.do?performance_idx=' + performance_idx + '&date=' + selected_date,
        'performance_seat_window',
        'width=800,height=630,location=no,status=no,scrollbars=yes');

       // 자식 창 핸들 저장
       window.performance_seat_window = newWindow;
      });


     });
    </script>


    <head>
     <meta charset="UTF-8">
     <title>hall</title>
    </head>

   <body>

    <div id="box">
     <h1 id="title">:::: 예매페이지 ::::</h1>

     <div style="margin-top:50px; text-align: left; float:right;">

      <!-- 로그인이 안된경우 -->
      <c:if test="${ empty sessionScope.user }">
       <input class="btn btn-warning" type="button" value="로그인" onclick="location.href='../member/login_form.do'">
      </c:if>

      <!-- 로그인이 된경우 -->
      <c:if test="${ not empty sessionScope.user }">
       <b>${ sessionScope.user.mem_name }</b>님 환영합니다
       <input class="btn btn-danger" type="button" value="로그아웃" onclick="location.href='../member/logout.do'">
      </c:if>
     </div>

     <div style="margin-top:50px; margin-bottom: 10px; float:right;">
      <input class="btn btn-primary" type="button" value="회원가입" onclick="location.href='../member/insert_form.do'">
     </div>

     <table class="table">
      <tr class="info">
       <th>공연번호</th>
       <th>카테고리</th>
       <th>공연장</th>
       <th>공연명</th>
       <th>시작일</th>
       <th>종료일</th>
       <th>공연시간</th>
       <th>사진</th>
       <th>관람연령</th>
       <th>좌석등급</th>
       <th>달력</th>
       <th>좌석정보</th>
      </tr>

      <!-- Data출력 -->
      <!-- for(MemberVo vo : list) -->

      <tr>
       <td>${ vo.performance_idx }</td>
       <td>${ vo.performanceCateVo.performance_cate_name }</td>
       <td>${ vo.hallVo.hall_name }</td>
       <td>${ vo.performance_name }</td>
       <td>${ vo.performance_startday }</td>
       <td>${ vo.performance_endday }</td>
       <td>${ vo.performance_runtime }</td>
       <td><img class="hall_img" src="../resources/images/${ vo.performance_image }"></td>
       <td>${ vo.performance_age }</td>
       <td>
        <c:forEach var="seat" items="${vo.seatList}">
         ${seat.seat_grade} : ${seat.seat_price} <br>
        </c:forEach>
       </td>
       <td><input id="datepicker" width="276" />
       </td>
       <td><input class="reservation btn btn-success" type="button" value="좌석정보"
         data-performance-idx="${ vo.performance_idx }"> </td>
      </tr>


     </table>


     <!-- Data가 없는 경우 -->
     <!-- <c:if test="${ empty requestScope.list }">
                        <div id="empty_msg">등록된 공연정보가 없습니다</div>
                    </c:if> -->
    </div>

   </body>

   </html>