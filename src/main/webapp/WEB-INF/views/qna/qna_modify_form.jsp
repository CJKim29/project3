<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <!DOCTYPE html>
 <html>

 <head>
  <meta charset="UTF-8" />
  <title>TIMOA - Q&A</title>
  <link rel="icon" href="../resources/images/TIMOA_icon.png" type="image/png">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
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
    width: 100px;
    font-weight: bold;
    padding-top: 10px;
    padding-bottom: 10px;

    height: 40px !important;
    margin-right: 3px !important;

    /* 수평 중앙 정렬 */
    text-align: center !important;

    /* 수직 중앙 정렬을 위해 line-height를 버튼 높이와 동일하게 설정 */
    line-height: 40px !important;

    /* 다른 여백 없애기 */
    padding: 0 !important;
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

   .btn_update {
    float: right;
   }
  </style>

  <script type="text/javascript">
   function send(f) {
    let qna_title = f.qna_title.value.trim();
    let qna_content = f.qna_content.value.trim();

    if (qna_title == "") {
     alert("제목을 입력하세요.");
     f.qna_title.value = "";
     f.qna_title.focus();
     return;
    }
    if (qna_content == "") {
     alert("내용을 입력하세요.");
     f.qna_content.value = "";
     f.qna_content.focus();
     return;
    }
    if (!qna_title == "" && !qna_content == "") {
     if (confirm("등록하시겠습니까?") == false) return;
    }

    f.action = "modify.do?qna_idx=${ vo.qna_idx }";
    f.submit();
   }
  </script>
 </head>

 <body>
  <form>
   <input type="hidden" name="qna_idx" value="${ param.qna_idx }" />
   <div id="box">
    <div class="panel panel-default">
     <div class="panel-heading">
      <h4>수정하기</h4>
     </div>
     <div class="panel-body">
      <div>
       <h4>제목 :</h4>
       <input class="form-control" name="qna_title" value="${ vo.qna_title }" />
      </div>
      <div>
       <h4>내용 :</h4>
       <textarea class="form-control" rows="10" name="qna_content" value="${ vo.qna_content }"></textarea>
      </div>

      <div style="margin-top: 10px">
       <input class="btn" type="button" value="목록보기" onclick="location.href='list.do'" />
       <input class="btn btn_update" type="button" value="수정하기" onclick="send(this.form)" />
      </div>
     </div>
    </div>
   </div>
  </form>
 </body>

 </html>