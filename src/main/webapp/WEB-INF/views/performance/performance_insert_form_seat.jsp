<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

 <!DOCTYPE html>
 <html>

 <head>
  <meta charset="UTF-8">
  <title>Insert title here</title>

  <!-- BootStrap 3.x-->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

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

   .btn:focus {
    border: none;
    outline: none;
   }

   .btn_insert {
    float: right;
   }

   .form-container {
    margin-bottom: 20px;
   }
  </style>

  <script type="text/javascript">
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

    f.submit();

    //let forms = document.querySelectorAll('.seat-form');
    // for (let i = 0; i < forms.length; i++) {
    //  let f = forms[i];

    //  let seat_grade = f.querySelector('input[name="seats[' + i + '].seat_grade"]').value.trim();
    //  let seat_price = f.querySelector('input[name="seats[' + i + '].seat_price"]').value.trim();

    //  if (seat_grade === '') {
    //   alert("좌석 이름(등급)을 입력해주세요");
    //   f.querySelector('input[name="seats[' + i + '].seat_grade"]').focus();
    //   return;
    //  }
    //  if (seat_price === '') {
    //   alert("좌석 가격을 입력해주세요\n*숫자만 입력 가능");
    //   f.querySelector('input[name="seats[' + i + '].seat_price"]').focus();
    //   return;
    //  }
    // }

    // 모든 폼이 유효하면 제출
    //document.getElementById('mainForm').submit();
   }

   function addSeatForm() {
    let formContainer = document.getElementById('formContainer');
    let index = formContainer.childElementCount; // 현재 폼의 개수로 인덱스 설정
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

   function removeSeatForm(button) {
    let formContainer = button.parentNode;
    formContainer.parentNode.removeChild(formContainer);
   }
  </script>


 </head>

 <body>
  <form id="mainForm" method="get" action="insert_seat.do">
   <input type="hidden" name="performance_idx" value="${performance_idx}">

   <div id="box">
    <div class="panel panel-default">
     <div class="panel-heading">
      <h4 style="text-align: center;">공연 좌석 등록</h4>
     </div>
     <div class="panel-body">
      <div id="formContainer">
       <div class="seat-form form-container">
        <h4>좌석 이름(등급)</h4>
        <div>*좌석 이름만 입력해주세요. ex) VIP석 -> VIP</div>
        <!-- <input class="form-control content" name="seats[0].seat_grade"> -->
        <input class="form-control content" name="seat_grade">

        <h4>좌석 가격</h4>
        <div>*숫자만 입력해주세요. ex) 100,000원 -> 100000</div>
        <!-- <input class="form-control content" type="number" name="seats[0].seat_price"> -->
        <input class="form-control content" type="number" name="seat_price">
       </div>
      </div>

      <input class="btn btn_insert" type="button" style="width: 100%;" value="좌석 더 추가하기" onclick="addSeatForm();">
      <input class="btn btn_insert" type="button" style="width: 100%;" value="모든 좌석 등록" onclick="sendAll(this.form);">
     </div>
    </div>
   </div>
  </form>
 </body>

 </html>