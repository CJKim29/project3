<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>

    <!-- BootStrap 3.x-->
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
    />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

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
    </style>
    <!-- 입력값 검증 - 잘못 입력, 미입력 시 안내 메세지 -->
    <script type="text/javascript">
      function send(f) {
        /* 임의적으로 f라고 form의 이름을 적어줌 */

        // 입력값 검증(잘못 입력 시 안 넘어가도록 입력값을 검증하자)
        /* f안의 name의 value값 얻어와서 공백제거 */
        let hall_name = f.hall_name.value.trim();
        let hall_area = f.hall_area.value;
        let hall_addr = f.hall_addr.value.trim();
        let hall_tel = f.hall_tel.value.trim();
        let hall_site = f.hall_site.value.trim();
        let hall_seat = f.hall_seat.value;
        let photo = f.photo.value;

        if (hall_name == "") {
          alert("공연장 이름을 입력해주세요");
          f.hall_name.value = ""; /* 지우기 */
          f.hall_name.focus();
          return;
        }
        if (hall_addr == "") {
          alert("공연장 주소를 입력해주세요");
          f.hall_addr.value = ""; /* 지우기 */
          f.hall_addr.focus();
          return;
        }
        if (hall_tel == "") {
          alert("공연장 번호를 입력해주세요");
          f.hall_tel.value = ""; /* 지우기 */
          f.hall_tel.focus();
          return;
        }
        if (hall_site == "") {
          alert("공연장 홈페이지 주소를 입력해주세요");
          f.hall_site.value = ""; /* 지우기 */
          f.hall_site.focus();
          return;
        }
        if (photo == "") {
          alert("공연장 사진을 등록해주세요");
          return;
        }

        // f.method = "POST";
        f.action = "insert.do"; // 전송대상(PhotoInsertAction)
        f.submit(); // 전송
      }
    </script>
  </head>
  <body>
    <form method="POST" enctype="multipart/form-data">
      <!-- file 업로드 시 꼭 작성해야 하는 것 -->
      <div id="box">
        <div class="panel panel-success">
          <div class="panel-heading">공연장 등록</div>
          <div class="panel-body">
            <div>
              <h4>공연장 이름</h4>
              <input class="form-control content" rows="6" name="hall_name" />

              <h4>공연장 지역</h4>
              <select class="form-control content" name="hall_area">
                <option value="서울">서울</option>
                <option value="경기/인천">경기/인천</option>
                <option value="충청/대전">충청/대전</option>
                <option value="경상/대구/부산">경상/대구/부산</option>
                <option value="전라/광주">전라/광주</option>
                <option value="강원">강원</option>
                <option value="제주">제주</option>
              </select>

              <h4>주소</h4>
              <input class="form-control content" name="hall_addr" />

              <h4>공연장 전화번호</h4>
              <div>*정확히 입력해주세요 ex) 0211111111 -> 02-1111-1111</div>
              <input class="form-control content" name="hall_tel" />

              <h4>공연장 홈페이지 주소</h4>
              <input class="form-control content" name="hall_site" />

              <h4>공연장 좌석 규모</h4>
              <select class="form-control content" name="hall_seat">
                <option value="100">소공연장</option>
                <option value="225">중공연장</option>
                <option value="400">대공연장</option>
              </select>

              <h4>공연장 이미지</h4>
              <input class="form-control content" type="file" name="photo" />

              <input
                class="btn btn-success"
                type="button"
                value="돌아가기"
                onclick="location.href='list.do'"
              />
              <input
                class="btn btn-primary btn_insert"
                type="button"
                value="등록하기"
                onclick="send(this.form);"
              />
            </div>
          </div>
        </div>
      </div>
    </form>
  </body>
</html>
