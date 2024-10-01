<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

   <!DOCTYPE html>
   <html>

   <head>
    <meta charset="UTF-8">
    <title>Insert title here</title>

    <!-- BootStrap 3.x-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://unpkg.com/gijgo@1.9.14/js/gijgo.min.js" type="text/javascript"></script>
    <link href="https://unpkg.com/gijgo@1.9.14/css/gijgo.min.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
     #box {
      width: 600px;
      margin: auto;
      margin-top: 100px;
     }

     h4 {
      font-weight: bold;
      margin-bottom: 10px;
     }

     .content {
      margin-bottom: 40px !important;
     }

     hr {
      margin-top: 0px !important;
     }

     .btn {
      width: 80px;
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

     .btn_insert {
      float: right;
     }
    </style>

    <!-- 입력값 검증 - 잘못 입력, 미입력 시 안내 메세지 -->
    <!-- <script type="text/javascript">
                function send(f) {		/* 임의적으로 f라고 form의 이름을 적어줌 */

                    // 입력값 검증(잘못 입력 시 안 넘어가도록 입력값을 검증하자)
                    /* f안의 name의 value값 얻어와서 공백제거 */

                    let seat_grade = f.seat_grade.value.trim();
                    let seat_price = f.seat_price.value.trim();

                    if (seat_grade == '') {
                        alert("좌석 이름(등급)을 입력해주세요");
                        f.seat_grade.value = "";	/* 지우기 */
                        f.seat_grade.focus();
                        return;
                    }
                    if (seat_price == '') {
                        alert("가격을 입력해주세요");
                        f.seat_price.value = "";	/* 지우기 */
                        f.seat_price.focus();
                        return;
                    }

                    f.action = "modify_seat.do";	// 전송대상(PhotoInsertAction)
                    f.submit();	// 전송
                }
            </script> -->

    <script type="text/javascript">
     // 폼 전송 전 검증 함수
     function sendAll(f) {
      for (let i = 0; i < f.seat_grade.length; i++) {
       let seat_grade = f.seat_grade[i].value.trim();
       let seat_price = f.seat_price[i].value.trim();

       if (seat_grade === '') {
        alert("좌석 이름(등급)을 입력해주세요");
        f.seat_grade[i].focus();
        return;
       }
       if (seat_price === '') {
        alert("좌석 가격을 입력해주세요\n*숫자만 입력 가능");
        f.seat_price[i].focus();
        return;
       }
      }

      f.submit(); // 모든 검증을 통과하면 폼 전송
     }

     // 좌석 폼을 동적으로 추가하는 함수
     function addSeatForm() {
      let formContainer = document.getElementById('formContainer');
      let newForm = document.createElement('div');
      newForm.className = 'seat-form form-container';
      newForm.innerHTML = `
                     <h4>좌석 이름(등급)</h4>
                     <div>*좌석 이름만 입력해주세요. ex) VIP석 -> VIP</div>
                     <input class="form-control content" name="seat_grade">
     
                     <h4>좌석 가격</h4>
                     <div>*숫자만 입력해주세요. ex) 100,000원 -> 100000</div>
                     <input class="form-control content" type="number" name="seat_price">
     
                     <button type="button" class="btn btn-danger btn_remove" onclick="removeSeatForm(this);">취소</button>
                 `;
      formContainer.appendChild(newForm);
     }

     // 좌석 폼을 취소하는 함수 (삭제)
     function removeSeatForm(button) {
      let formContainer = button.parentNode;
      formContainer.parentNode.removeChild(formContainer);
     }
    </script>
   </head>

   <body>
    <form id="mainForm" method="post" action="modify_seat.do">
     <input type="hidden" name="performance_idx" value="${param.performance_idx}">

     <div id="box">
      <div class="panel panel-default">
       <div class="panel-heading">
        <h4 style="text-align: center;">공연 좌석 수정</h4>
       </div>
       <div class="panel-body">
        <div id="formContainer">
         <!-- 기존 입력된 좌석 정보 불러오기 -->
         <c:set var="size" value="${fn:length(vo.seatList)}" />
         <c:forEach var="i" begin="0" end="${size - 1}">
          <c:set var="reverseIndex" value="${size - 1 - i}" />
          <c:set var="seat" value="${vo.seatList[reverseIndex]}" />
          <div class="seat-form form-container">
           <h4>좌석 이름(등급)</h4>
           <div>*좌석 이름만 입력해주세요. ex) VIP석 -> VIP</div>
           <input class="form-control content" name="seat_grade" value="${seat.seat_grade}">

           <h4>좌석 가격</h4>
           <div>*숫자만 입력해주세요. ex) 100,000원 -> 100000</div>
           <input class="form-control content" type="number" name="seat_price" value="${seat.seat_price}" required>

           <!-- 좌석 ID를 hidden으로 함께 전송 -->
           <!-- <input type="hidden" name="seat_idx[]" value="${seat.seat_idx}"> -->

           <button type="button" class="btn btn-danger btn_remove" onclick="removeSeatForm(this);">취소</button>
           <hr>
          </div>
         </c:forEach>
        </div>

        <!-- 좌석 더 추가하기 버튼 -->
        <input class="btn btn_insert" type="button" style="width: 100%;" value="좌석 더 추가하기" onclick="addSeatForm();">

        <!-- 폼 전송 버튼 -->
        <input class="btn btn_insert" type="button" style="width: 100%;" value="모든 좌석 수정" onclick="sendAll(this.form);">

       </div>
      </div>
     </div>
    </form>
   </body>

   </html>