<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <!DOCTYPE html>
    <html>

    <head>
     <meta charset="UTF-8">
     <title>TIMOA - 회원정보 수정</title>
     <link rel="icon" href="../resources/images/TIMOA_icon.png" type="image/png">

     <!-- 회원 정보 수정 페이지 -->


     <!-- css 연결 -->
     <link rel="stylesheet" href="../resources/css/member/modify_form.css">

     <!-- BootStrap 3.x-->
     <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->

     <!-- Popper.js (Bootstrap 4의 tooltips, popovers에 필요) -->
     <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>

     <!-- Bootstrap 4 JavaScript -->
     <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

     <!-- 주소 검색 API -->
     <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

     <script type="text/javascript">
      function member_delete() {
       if (confirm("정말 탈퇴하시겠습니까?") == false) return;

       alert("회원 탈퇴가 완료되었습니다.");
       location.href = "../member/delete.do?mem_idx=" + `${user.mem_idx}`;
      }

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

      // 입력했는지 확인
      function send(f) {

       let mem_name = f.mem_name.value.trim();
       let mem_id = f.mem_id.value.trim();
       let mem_pwd = f.mem_pwd.value.trim();
       let mem_nickname = f.mem_nickname.value.trim();
       let mem_birth = f.mem_birth.value.trim();
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
       if (mem_birth == '') {
        alert("닉네임을 입력하세요");
        f.mem_birth.value = '';
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

       if (confirm("정말 수정하시겠습니까?") == false) return;

       alert("회원 정보 수정이 완료되었습니다.");
       f.action = "../member/modify.do";
       f.submit();		// 전송
      }// end: send

     </script>

     <!-- 닉네임 체크-->
     <script type="text/javascript">

      function check_nickname() {

       $("#btn_register").prop("disabled", true);

       let mem_nickname = $("#mem_nickname").val();
       let mem_nickname_check = /^[가-힣ㄱ-ㅎA-Za-z0-9]{3,12}$/;

       if (mem_nickname.length == 0) {
        $("#nickname_msg").html("");
        return;
       }

       if (mem_nickname_check.test(mem_nickname) == false) {
        $("#nickname_msg").html("닉네임은 3~12자리 한글, 영문 또는 숫자만 사용가능합니다.").css("color", "IndianRed");
        return;
       }

       $.ajax({
        url: "../member/check_nickname.do",
        data: { "mem_nickname": mem_nickname },
        dataType: "json",
        success: function (res_data) {
         if (res_data.result) {
          $("#nickname_msg").html("사용가능한 닉네임 입니다.").css("color", "Aqua");
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
        url: "../member/check_phone.do",
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
         console.log(err);
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
        url: "../member/check_email.do",
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
      }// end:check_email()
     </script>

     <!-- 프로필 사진 업로드 -->
     <script type="text/javascript">

      /* Ajax 이용해 이미지 수정 */
      function ajaxFileUpload() {
       // 업로드 버튼이 클릭되면 파일 찾기 창을 띄운다
       $("#ajaxFile").click();		// id가 ajaxFile인 애를 클릭해라 
      }

      function ajaxFileChange() {
       // 파일이 선택되면 업로드를 진행한다.
       photo_upload();
      }


      function photo_upload() {

       //파일선택->취소시    파일의 첫번쩨  없으면 함수 끝내라(취소하면 동작 실행하면 안되니까)
       if ($("#ajaxFile")[0].files[0] == undefined) return;

       var form = $("ajaxForm")[0];		// 폼에 대한 정보 얻어오기
       var formData = new FormData(form);
       formData.append("mem_idx", '${ vo.mem_idx }');		//mem_idx=5 이런식으로 넘어온것?
       formData.append("photo", $("#ajaxFile")[0].files[0]);//photo라는 이름으로 parameter 선택?

       $.ajax({
        url: "../member/photo_modify.do", //MemberController에 photo_modify 메서드 만들기
        type: "POST",
        data: formData,
        processData: false,
        contentType: false,
        dataType: 'json',
        success: function (res_data) {
         //res_data = {"p_filename":"aaa.jpg"}

         //location.href=''; //자신의 페이지를 리로드(refresh)

         //$("#my_img").attr("src","../resources/images/" + res_data.mem_filename);
         $("#my_img").prop("src", "../resources/images/" + res_data.mem_filename);

        },
        error: function (err) {
         alert(err.responseText);
        }
       });

      }

     </script>


     <script type="text/javascript">
      $(document).ready(function () {
       // 엘리먼트 셀럭터 + 어트리뷰트 셀렉터 함께 사용 
       $("select[name='mem_grade']").val("${ vo.mem_grade}")	/* select인데 name이 mem_grade인 애를 셀렉 */

      });
     </script>


    </head>

    <body>
     <!-- 파일 업로드 기능 구현 시 필수 작성 -->
     <form enctype="multipart/form-data" id="ajaxForm" method="post">
      <input id="ajaxFile" type="file" style="display:none;" onChange="ajaxFileChange();">
      <!--파일업로드용 기본 폼 못생겨서 기능은 얘가 하되 숨겨놓고 예쁜 버튼을 앞에 내세운 것-->
     </form>

     <form>
      <!-- 회원번호 안 보이게 전송 --> <!-- 따옴표 하는건 맞음.. -->
      <input type="hidden" name="mem_idx" value="${ vo.mem_idx }">

      <div class="shopping-cart section">
       <div id="box">
        <div class="sujeong">회원 정보 수정</div>
        <!-- input 사이즈 한 번에 조정 -->
        <div class="form-group form-group-lg">

         <!-- 프로필 사진 영역 -->
         <div class="profile_wrap">
          <div class="profile">
           <img style="width: 200px; height: 200px;" class="profile_img" src="../resources/images/${ vo.mem_filename }"
            id="my_img">
          </div>
          <div class="profile_btn">
           <input class="btn btn-lg" type="button" value="프로필 이미지편집" onclick="ajaxFileUpload();">
          </div>

          <!-- <div class="profile">						  accept="image/* : 이미지파일 확장자만 선택 허용
			<input type="file" name="uploadImg" id="input_img" accept="image/*">
			<input type="button" value="변경하기" onclick="send_file(this.form);">
		</div> -->
         </div>

         <div class="modify-content">
          <div class="form-group">
           <div class="text1">이름</div> <!-- 수정 전 원본 이름 -->
           <input type="text" class="form-control" name="mem_name" value="${ vo.mem_name }" placeholder="이름 입력">
          </div>
          <div class="form-group">
           <div class="text1">아이디 <span class="id_msg">*아이디는 수정이 불가합니다</span></div>
           <!-- id는 수정 불가하므로 읽기 전용 -->
           <input type="text" class="form-control" name="mem_id" value="${ vo.mem_id }" readonly="readonly">
          </div>
          <div class="form-group">
           <div class="text1">비밀번호</div>
           <input type="password" class="form-control" name="mem_pwd" value="${ vo.mem_pwd }" placeholder="비밀번호 입력">
          </div>
          <div class="form-group">
           <div class="text1" style="display: inline-block;">닉네임&emsp;</div><span id="nickname_msg"></span>
           <input type="text" class="form-control" name="mem_nickname" id="mem_nickname" placeholder="닉네임 입력"
            value="${ vo.mem_nickname }" onkeyup="check_nickname();">
          </div>
          <div class="form-group">
           <div class="text1">생년월일<span class="id_msg">*생년월일은 수정이 불가합니다</span></div>
           <!-- id는 수정 불가하므로 읽기 전용 -->
           <input type="text" class="form-control" name="mem_birth" value="${ vo.mem_birth }" readonly="readonly">
          </div>
          <div class="form-group">
           <div class="text1" style="display: inline-block;">핸드폰번호</div><span id="phone_msg"></span><br>
           <input type="text" class="form-control" placeholder="010" readonly
            style="width: 55px !important; display: inline-block;">
           <input type="text" class="form-control" name="mem_phone" id="mem_phone" placeholder="숫자 8자리만 입력"
            value="${ fn:substring(vo.mem_phone, fn:length(vo.mem_phone) - 8, fn:length(vo.mem_phone)) }"
            onkeyup="check_phone();" style="display: inline-block; width: 192px !important;">
           <span id="phone_msg"></span>
          </div>
          <div class="form-group">
           <div class="text1" style="display: inline-block;">이메일&emsp;</div><span id="email_msg"></span>
           <input type="text" class="form-control" name="mem_email" id="mem_email" placeholder="이메일 입력"
            value="${ vo.mem_email }" onkeyup="check_email();">
           <span id="email_msg"></span>
          </div>
          <div class="form-group">
           <div class="text1">우편번호</div>
           <input type="text" class="form-control addr_text" name="mem_zipcode" id="mem_zipcode"
            value="${ vo.mem_zipcode }">
           <input class="a_search btn btn-lg" type="button" value="우편번호 검색" onclick="find_addr();">


          </div>
          <div class="form-group addr">
           <div class="text1">주소</div>
           <input style="width:395px" type="text" class="form-control" name="mem_addr" id="mem_addr"
            value="${ vo.mem_addr }" placeholder="상세주소 입력">
          </div>
          <div class="form-group">
           <div>
            <!-- 회원등급이 관리자일 경우 나오는 화면 -->
            <c:if test="${ user.mem_grade eq '관리자' }">
             <div class="text1">회원등급</div>
             <select style="width:50%;" name="mem_grade" class="form-control">
              <option value="일반">일반</option>
              <option value="관리자">관리자</option>
             </select>
            </c:if>
            <!-- 회원등급이 일반일 경우 화면 안 나오게 -->
            <c:if test="${ user.mem_grade eq '일반' }">
             <input type="hidden" style="width:50%" class="form-control" name="mem_grade" value="${ vo.mem_grade }"
              readonly="readonly">
            </c:if>
           </div>
          </div>
         </div>
         <div class="membership-btn">
          <input
           style="color: white !important; background-color: rgb(23, 105, 255) !important; width: 200px; margin-top: 0px !important;"
           type="button" class="btn btn-block btn-lg" value="수정하기" onclick="send(this.form);">
          <input
           style="color: white !important; background-color: #ff1d38 !important; width: 200px; margin-top: 0px !important;"
           type="button" class="btn btn-block btn-lg" value="회원탈퇴" onclick="member_delete();">
         </div>

         <div class="home" style="text-align: center;"><a href="../main/list.do">&lt; &nbsp; 메인화면으로
           돌아가기</a></div>


        </div>
       </div>

      </div>

     </form>
    </body>

    </html>