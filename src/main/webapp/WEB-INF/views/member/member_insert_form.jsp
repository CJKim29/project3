<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <!DOCTYPE html>
 <html>

 <head>
  <meta charset="UTF-8">
  <title>티모아 회원가입</title>
  <link rel="icon" href="../resources/images/TIMOA_icon.png" type="image/png">

  <!-- 회원가입 페이지 -->


  <!-- css 연결 -->
  <link rel="stylesheet" href="../resources/css/member/insert_form.css">

  <!-- BootStrap 3.x-->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

  <!-- 주소 검색 API -->
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


  <script type="text/javascript">

   // 아이디 체크
   function check_id() {
    // 회원 가입 버튼은 비활성화 (id체크 후 활성화 할 것임)
    // <input id="btn_register" type="button"....disabled="disabled">
    $("#btn_register").prop("disabled", true);

    let mem_id = $("#mem_id").val();
    let mem_id_check = /^[가-힣ㄱ-ㅎA-Za-z]{3,8}$/;

    if (mem_id.length == 0) {
     $("#id_msg").html("");
     return;
    }

    if (mem_id.length < 3) {
     $("#id_msg").html("아이디는 3~8자리 영문 한글만 사용가능합니다.").css("color", "IndianRed");
     return;
    }
    // 서버에 현재 입력된 id를 체크 요청 jQuery Ajax 이용
    $.ajax({

     url: "check_id.do",		// id 체크하는 서블릿 만들어서 체크해달라고 요청하기(서버한테) -> MemberCheckIdAction
     data: { "mem_id": mem_id },	// parameter -> check_id.do?mem_id=one   서버에 보낼 데이터 -> id 체크 중이므로 id 정보를 보내야함
     dataType: "json",
     success: function (res_data) {
      // res_data = {"result":true} or {"result":false}
      if (res_data.result) {
       $("#id_msg").html("사용 가능한 아이디입니다").css("color", "black");
       $("#btn_register").prop("disabled", false);
      } else {
       $("#id_msg").html("이미 사용 중인 아이디입니다").css("color", "IndianRed");
      }
     },
     error: function (err) {
      alert(err.responseText)	// 에러 확인하기 위해
     }
    });
   } // end: check_id()
  </script>


  <script type="text/javascript">

   // 닉네임 체크
   function check_nickname() {

    $("#btn_register").prop("disabled", true);

    let mem_nickname = $("#mem_nickname").val();
    let mem_nickname_check = /^[가-힣ㄱ-ㅎA-Za-z]{3,12}$/;

    if (mem_nickname.length == 0) {
     $("#nickname_msg").html("");
     return;
    }

    if (mem_nickname_check.test(mem_nickname) == false) {
     $("#nickname_msg").html("닉네임은 3~12자리 영문 한글만 사용가능합니다.").css("color", "IndianRed");
     return;
    }

    $.ajax({
     url: "check_nickname.do",
     data: { "mem_nickname": mem_nickname },
     dataType: "json",
     success: function (res_data) {
      if (res_data.result) {
       $("#nickname_msg").html("사용가능한 닉네임 입니다.").css("color", "black");
       $("#btn_register").prop("disabled", false);
      } else {
       $("#nickname_msg").html("이미 사용중인 닉네임 입니다.").css("color", "IndianRed");
      }
     },
     error: function (err) {
      alert("현재, 요청이 지연되고 있습니다.");
     }
    });
   }// end:check_nickname()
  </script>

  <script type="text/javascript">

   // 핸드폰번호 체크
   function check_phone() {

    $("#btn_register").prop("disabled", true);

    let mem_phone = $("#mem_phone").val();
    let mem_phone_check = /^[0-9]{8}$/;

    if (mem_phone.length == 0) {
     $("#phone_msg").html("");
     return;
    }

    if (mem_phone_check.test(mem_phone) == false) {
     $("#phone_msg").html("핸드폰번호는 숫자 8자리를 입력해주세요.").css("color", "IndianRed");
     return;
    }

    $.ajax({
     url: "check_phone.do",
     data: { "mem_phone": mem_phone },
     dataType: "json",
     success: function (res_data) {
      if (res_data.result) {
       $("#phone_msg").html("사용가능한 핸드폰번호 입니다.").css("color", "black");
       $("#btn_register").prop("disabled", false);
      } else {
       $("#phone_msg").html("이미 사용중인 핸드폰번호 입니다.").css("color", "IndianRed");
      }
     },
     error: function (err) {
      alert("현재, 요청이 지연되고 있습니다.");
     }
    });
   }// end:check_phone()
  </script>

  <script type="text/javascript">

   // 이메일 체크
   function check_email() {

    $("#btn_register").prop("disabled", true);

    let mem_email = $("#mem_email").val();
    let mem_email_check = /^[가-힣ㄱ-ㅎA-Za-z0-9@.]{3,25}$/;

    if (mem_email.length == 0) {
     $("#email_msg").html("");
     return;
    }

    if (mem_email_check.test(mem_email) == false) {
     $("#email_msg").html("이메일은 3~25자리 영문 한글만 사용가능합니다.").css("color", "IndianRed");
     return;
    }

    $.ajax({
     url: "check_email.do",
     data: { "mem_email": mem_email },
     dataType: "json",
     success: function (res_data) {
      if (res_data.result) {
       $("#email_msg").html("사용가능한 이메일 입니다.").css("color", "black");
       $("#btn_register").prop("disabled", false);
      } else {
       $("#email_msg").html("이미 사용중인 이메일 입니다.").css("color", "IndianRed");
      }
     },
     error: function (err) {
      alert("현재, 요청이 지연되고 있습니다.");
     }
    });
   }// end:check_emailname()
  </script>


  <script type="text/javascript">
   // 주소 찾기 -> API
   function find_addr() {

    var themeObj = {
     bgColor: "#05142f" //바탕 배경색
    };

    new daum.Postcode({
     theme: themeObj,
     oncomplete: function (data) {
      // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분
      $("#mem_zipcode").val(data.zonecode);		// 우편번호 넣기
      $("#mem_addr").val(data.address);			// 주소 넣기
     }
    }).open();

   }// end: find_addr()
  </script>



  <script type="text/javascript">
   // 입력했는지 확인
   function send(f) {

    let mem_name = f.mem_name.value.trim();
    let mem_id = f.mem_id.value.trim();
    let mem_pwd = f.mem_pwd.value.trim();
    let mem_nickname = f.mem_nickname.value.trim();

    // 생년월일 드롭다운 값
    let year = document.getElementById("year").value;
    let month = document.getElementById("month").value;
    let day = document.getElementById("day").value;

    if (year === 'select' || month === 'select' || day === 'select') {
     alert("생년월일을 모두 선택하세요");
     return;
    }

    // month와 day는 두 자릿수로 맞추기
    if (month.length < 2) {
     month = '0' + month;
    }
    if (day.length < 2) {
     day = '0' + day;
    }

    // yyyymmdd 형식으로 mem_birth에 값 설정
    let mem_birth = year + month + day;
    f.mem_birth.value = mem_birth;

    let mem_phone = f.mem_phone.value.trim();
    let mem_email = f.mem_email.value.trim();

    let mem_zipcode = f.mem_zipcode.value.trim();
    let mem_addr = f.mem_addr.value.trim();

    if (mem_name == '') {
     alert("이름을 입력하세요");
     f.mem_name.value = '';
     f.mem_name.focus();
     return;
    }
    if (mem_id == '') {
     alert("아이디를 입력하세요");
     f.mem_id.value = '';
     f.mem_id.focus();
     return;
    }
    if (mem_pwd == '') {
     alert("비밀번호를 입력하세요");
     f.mem_pwd.value = '';
     f.mem_pwd.focus();
     return;
    }
    if (mem_nickname == '') {
     alert("닉네임을 입력하세요");
     f.mem_nickname.value = '';
     f.mem_nickname.focus();
     return;
    }

    if (mem_birth.length !== 8) {
     alert("생년월일을 정확히 입력하세요");
     f.mem_birth.focus();
     return;
    }


    if (mem_phone == '') {
     alert("핸드폰번호를 입력하세요");
     f.mem_phone.value = '';
     f.mem_phone.focus();
     return;
    }

    if (mem_email == '') {
     alert("이메일을 입력하세요");
     f.mem_email.value = '';
     f.mem_email.focus();
     return;
    }

    if (mem_zipcode == "") {
     alert("우편번호를 입력하세요");
     f.mem_zipcode.value = "";
     f.mem_zipcode.focus();
     return;
    }

    if (mem_addr == "") {
     alert("주소를 입력하세요");
     f.mem_addr.value = "";
     f.mem_addr.focus();
     return;
    }
    alert("회원가입이 완료되었습니다.");
    f.action = "insert.do";
    f.submit();		// 전송
   }// end: send
  </script>

  <!-- 생년월일 입력 시 연도 동적 입력 & 일 윤년 고려 -->
  <script>
   // DOMContentLoaded 이벤트가 발생한 후에 실행되도록 설정
   document.addEventListener('DOMContentLoaded', function () {
    // 연도 추가 (1900년부터 현재 연도까지)
    const yearSelect = document.getElementById('year');
    const currentYear = new Date().getFullYear();
    for (let i = currentYear; i >= 1900; i--) {
     const option = document.createElement('option');
     option.value = i;
     option.textContent = i;
     yearSelect.appendChild(option);
    }

    // 월과 일 선택에 따른 일 수 동적 변경
    const monthSelect = document.getElementById('month');
    const daySelect = document.getElementById('day');

    function isLeapYear(year) {
     return (year % 4 === 0 && year % 100 !== 0) || year % 400 === 0;
    }

    function updateDays(year, month) {
     // 각 월에 따른 일 수
     const daysInMonth = [31, isLeapYear(year) ? 29 : 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
     const days = daysInMonth[month - 1];

     // 일 옵션 초기화
     daySelect.innerHTML = '<option value="select">일</option>';

     // 해당 월에 맞는 일 수 추가
     for (let i = 1; i <= days; i++) {
      const option = document.createElement('option');
      option.value = i;
      option.textContent = i;
      daySelect.appendChild(option);
     }
    }

    // 연도와 월 변경 시 일 수 업데이트
    yearSelect.addEventListener('change', function () {
     const year = parseInt(this.value);
     const month = parseInt(monthSelect.value);
     if (!isNaN(year) && !isNaN(month)) {
      updateDays(year, month);
     }
    });

    monthSelect.addEventListener('change', function () {
     const year = parseInt(yearSelect.value);
     const month = parseInt(this.value);
     if (!isNaN(year) && !isNaN(month)) {
      updateDays(year, month);
     }
    });
   });
  </script>

 </head>

 <body>
  <div id="logo">
   <img src="../resources/images/logo_TIMOA.PNG" style="width: 300px;">
  </div>
  <form>
   <input type="hidden" name="mem_birth" id="mem_birth">
   <div id="box">
    <div class="form-group form-group-lg">
     <div class="form-group">
      <div class="text1 text-name">
       <input type="text" class="form-control" name="mem_name" placeholder="이름 입력">
      </div>
     </div>
     <div class="form-group">
      <div class="text2">
       <input type="text" class="form-control" name="mem_id" id="mem_id" placeholder="아이디 입력" onkeyup="check_id();">
      </div>
      <span id="id_msg" style="display: block; min-height: 20px;"></span>
     </div>
     <div class="form-group">
      <div class="text1">
       <input type="password" class="form-control" name="mem_pwd" id="mem_pwd" placeholder="비밀번호 입력">
      </div>
     </div>
     <div class="form-group">
      <div class="text2">
       <input type="text" class="form-control" name="mem_nickname" id="mem_nickname" placeholder="닉네임 입력"
        onkeyup="check_nickname();">
      </div>
      <span id="nickname_msg" style="display: block; min-height: 20px;"></span>
     </div>
     <!-- <div class="form-group">
      <div class="text1">
       <input type="text" class="form-control" name="mem_birth" id="mem_birth" placeholder="생년월일 입력">
      </div>
     </div> -->
     <div class="form-group">
      <div class="text1">
       <select name="year" id="year">
        <option value="select">태어난 해</option>
       </select>

       <select name="month" id="month">
        <option value="select">월</option>
        <option value="1">01</option>
        <option value="2">02</option>
        <option value="3">03</option>
        <option value="4">04</option>
        <option value="5">05</option>
        <option value="6">06</option>
        <option value="7">07</option>
        <option value="8">08</option>
        <option value="9">09</option>
        <option value="10">10</option>
        <option value="11">11</option>
        <option value="12">12</option>
       </select>

       <select name="day" id="day">
        <option value="select">일</option>
       </select>
      </div>
     </div>
     <div class="form-group">
      <div class="text2">
       <input type="text" class="form-control" placeholder="010" readonly style="width: 65px;">
       <input type="text" class="form-control" name="mem_phone" id="mem_phone" placeholder="핸드폰번호 입력(숫자 8자리)"
        style="width: 235px;" onkeyup="check_phone();">
      </div>
      <span id="phone_msg" style="display: block; min-height: 20px;"></span>
     </div>
     <div class="form-group">
      <div class="text2">
       <input type="text" class="form-control" name="mem_email" id="mem_email" placeholder="이메일 입력"
        onkeyup="check_email();">
      </div>
      <span id="email_msg" style="display: block; min-height: 20px;"></span>
     </div>
     <div class="form-group">
      <div class="text1">
       <input type="text" class="form-control addr_text" style="width: 180px !important;" name="mem_zipcode"
        id="mem_zipcode" placeholder="우편번호 입력">
       <input style="background-color: #2B2E36 !important; width: 100px !important;" class="a_search btn btn-lg"
        type="button" value="주소검색" onclick="find_addr();">
      </div>
     </div>
     <div class="form-group addr">
      <div class="text1">
       <input type="text" class="form-control" name="mem_addr" id="mem_addr" placeholder="상세주소 입력">
      </div>
     </div>
     <div class="membership-btn">
      <input style="color: white !important; background-color: rgb(23, 105, 255) !important; width: 200px;"
       id="btn_register" type="button" class="btn btn-block btn-lg" value="가입하기" onclick="send(this.form);">
     </div>

     <!-- <input style="background-color: #2B2E36;" type="button" class="btn btn-block btn-lg text-#999999"
			   value="메인화면으로 돌아가기" onclick="location.href='../member/list.do'"> -->
     <div class="home" style="text-align: center;"><a href="../main/list.do">메인화면으로 돌아가기</a>
     </div>


    </div>
   </div>
  </form>
 </body>

 </html>