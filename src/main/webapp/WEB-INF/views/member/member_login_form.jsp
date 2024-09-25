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

    f.action = "login.do";	// 누구한테 보낼거냐 -> MemberLoginAction 만들어야 됨 
    f.submit();

   }// end: send()

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
      &nbsp;<label><input type="checkbox">아이디 저장</label> <!-- 기능 구현은 아직.. -->
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