<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>TIMOA - faq</title>
    <link rel="icon" href="../resources/images/TIMOA_icon.png" type="image/png">
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
    />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <style type="text/css">
      #box {
        width: 600px;
        margin: auto;
        margin-top: 10%;
      }

      textarea {
        resize: none;
      }

      h4 {
        font-weight: bold;
      }

      .btn {
        color: white !important;
      }
    </style>

    <script type="text/javascript">
      function send(f) {
        let faq_title = f.faq_title.value.trim();
        let faq_content = f.faq_content.value.trim();

        if (faq_title == "") {
          alert("제목을 입력하세요.");
          f.faq_title.value = "";
          f.faq_title.focus();
          return;
        }
        if (faq_content == "") {
          alert("내용을 입력하세요.");
          f.faq_content.value = "";
          f.faq_content.focus();
          return;
        }

        f.action = "insert.do";
        f.submit();
      }
    </script>
  </head>
  <body>
    <form>
      <div id="box">
        <div class="panel panel-primary">
          <div class="panel-heading" style="background: #ff1d38 !important">
            <h4>FAQ 등록</h4>
          </div>
          <div class="panel-body">
            <div>
              <h4>질문</h4>
              <input class="form-control" name="faq_title" />
            </div>
            <div>
              <h4>답변</h4>
              <textarea
                class="form-control"
                rows="10"
                name="faq_content"
              ></textarea>
            </div>

            <div style="margin-top: 10px">
              <input
                class="btn"
                style="background: brown"
                type="button"
                value="목록보기"
                onclick="location.href='list.do'"
              />
              <input
                class="btn btn-danger"
                type="button"
                value="등록"
                onclick="send(this.form)"
              />
            </div>
          </div>
        </div>
      </div>
    </form>
  </body>
</html>
