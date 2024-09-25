<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <!DOCTYPE html>
 <html>

 <head>
  <meta charset="UTF-8">
  <title>티모아 로그인</title>
  <link rel="icon" href="../resources/images/TIMOA_icon.png" type="image/png">


  <!-- 로그인 페이지 -->


  <!-- css 연결 -->
  <link rel="stylesheet" href="../resources/css/member/login_form.css">

  <!-- BootStrap 3.x-->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


  <script type="text/javascript">
   // 페이지가 로드될 때 실행
   document.addEventListener("DOMContentLoaded", function () {
    // 쿠키에서 아이디를 가져와서 input 필드에 채운다
    var savedId = getCookie("savedId");
    if (savedId) {
     document.getElementsByName("mem_id")[0].value = savedId; // 아이디 입력 필드에 채움
     document.getElementById("saveId").checked = true; // 체크박스 체크
    }
   });

   function send(f) {
    let mem_id = f.mem_id.value.trim();
    let mem_pwd = f.mem_pwd.value.trim();

    if (mem_id == '') {
     alert("아이디를 입력하세요");
     f.mem_id.value = "";
     f.mem_id.focus();
     return;
    }

    if (mem_pwd == '') {
     alert("비밀번호를 입력하세요");
     f.mem_pwd.value = "";
     f.mem_pwd.focus();
     return;
    }

    // 체크박스가 체크되어 있으면 쿠키에 저장
    if (document.getElementById("saveId").checked) {
     setCookie("savedId", mem_id, 30); // 30일 동안 저장
    } else {
     setCookie("savedId", "", -1); // 쿠키 삭제
    }

    f.action = "login.do"; // 로그인 처리 URL
    f.submit();
   }

   // 쿠키를 설정하는 함수
   function setCookie(name, value, days) {
    var expires = "";
    if (days) {
     var date = new Date();
     date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
     expires = "; expires=" + date.toUTCString();
    }
    document.cookie = name + "=" + (value || "") + expires + "; path=/";
   }

   // 쿠키를 가져오는 함수
   function getCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++) {
     var c = ca[i];
     while (c.charAt(0) === ' ') c = c.substring(1, c.length);
     if (c.indexOf(nameEQ) === 0) return c.substring(nameEQ.length, c.length);
    }
    return null;
   }
  </script>


  <script>
   // 페이지가 로드되면 이벤트 리스너 추가
   document.addEventListener("DOMContentLoaded", function () {
    // 폼 요소 가져오기 (여기서는 this.form을 사용하여 버튼 클릭 시의 폼을 가져옴)
    var form = document.getElementById('loginButton').form;

    // 엔터 키 이벤트 추가
    form.addEventListener('keypress', function (event) {
     if (event.key === 'Enter') { // Enter 키가 눌리면
      event.preventDefault(); // 폼 제출 기본 동작 방지
      send(form); // send 함수 호출
     }
    });
   });
  </script>

  <script type="text/javascript">

   //  화면이 배치가 완료되면 호출 
   // 1) js방식
   // window.onload = function(){};
   // 2) jQuery 방식
   $(document).ready(function () {

    setTimeout(showMessage, 100);	// 0.1초 후에 메시지 띄워라

   });

   // id,pwd 잘못 입력 시 띄울 메세지 창
   function showMessage() {
    if ("${ param.reason == 'fail_id'}" == "true") {		// el 방식 작성 -> 지금 여러 방법 혼용해서 쓰는 중이므로 el 작성 시 "" 요걸로 감싼 후 작성
     alert("아이디를 틀렸습니다");
    }

    if ("${ param.reason == 'fail_pwd'}" == "true") {		// el 방식 작성 -> 지금 여러 방법 혼용해서 쓰는 중이므로 el 작성 시 "" 요걸로 감싼 후 작성
     alert("비밀번호를 틀렸습니다");
    }

    /* if(){
     alert("아이디가 없습니다\n회원가입하시겠습니까");
    } */
    ///member/login_form.do?reason=session_timeout
    if ("${ param.reason == 'session_timeout'}" == "true") {		// PhotoInsertAction에 대한 내용 추가(세션 만료 안내)
     alert("시간이 경과 되어 로그아웃 되었습니다\n다시 로그인 해주세요");
    }

   }

  </script>

 </head>

 <body>
  <div id="logo">
   <img src="../resources/images/logo_TIMOA.PNG" style="width: 300px;">
  </div>
  <form>
   <input type="hidden" name="url" value="${ param.url }"> <!-- 세션 트래킹 -->
   <div id="box">
    <div class="form-group form-group-lg">
     <div class="form-group text1"> <!-- url에 있는 파라미터 값 읽어서 넣어주는 것  -->
      <div class="outline">
       <img src="../resources/images/id_logo.PNG" class="login-icon">
       <input type="text" class="form-control" name="mem_id" value="${ param.mem_id }" placeholder="아이디">
      </div>
     </div>
     <div class="form-group text1">
      <div class="outline">
       <img src="../resources/images/pwd_logo.PNG" class="login-icon">
       <input type="password" class="form-control" name="mem_pwd" placeholder="비밀번호">
      </div>
     </div>

     <div class="checkbox">
      &nbsp;<label><input type="checkbox" id="saveId"> 아이디 저장</label>
     </div>
     <div class="login-btn" style="border-radius: 15px !important;">
      <input id="loginButton"
       style="border-radius: 15px !important; background-color: rgb(23, 105, 255) !important; color: white !important;"
       type="button" class="btn btn-block btn-lg text-#999999" value="로그인" onclick="send(this.form);">
     </div>

     <hr>
     <div class="membership_wrap" style="text-align: center;">
      <div class="membership1">아직 회원이 아니신가요?</div>
      <div class="membership2">
       <a href="../member/insert_form.do"><span>&emsp;회원 가입</span></a>
      </div>
     </div>

     <!-- 		<div>
				<span>아이디 찾기</span>
				<span>비밀번호 찾기</span>
			</div> -->

    </div>
   </div>
  </form>
 </body>

 </html>