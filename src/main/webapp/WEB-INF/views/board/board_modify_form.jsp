<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <!DOCTYPE html>
 <html>

 <head>
  <meta charset="UTF-8" />
  <title>TIMOA - 게시판</title>
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

   .btn_update {
    float: right;
   }
  </style>

  <script type="text/javascript">
   function send(f) {
    let board_name = f.board_name.value.trim();
    let board_content = f.board_content.value.trim();

    if (board_name == "") {
     alert("제목을 입력하세요.");
     f.board_name.value = "";
     f.board_name.focus();
     return;
    }
    if (board_content == "") {
     alert("내용을 입력하세요.");
     f.board_content.value = "";
     f.board_content.focus();
     return;
    }
    if (!board_name == "" && !board_content == "") {
     if (confirm("등록하시겠습니까?") == false) return;
    }

    f.action = "modify.do?board_idx=${ vo.board_idx }";
    f.submit();
   }
  </script>
 </head>

 <body>
  <form>
   <input type="hidden" name="board_idx" value="${ param.board_idx }" />
   <div id="box">
    <div class="panel panel-default">
     <div class="panel-heading">
      <h4>수정하기</h4>
     </div>
     <div class="panel-body">
      <div>
       <h4>제목 :</h4>
       <input class="form-control" name="board_name" value="${ vo.board_name }" />
      </div>
      <div>
       <h4>내용 :</h4>
       <textarea class="form-control" rows="10" name="board_content" value="${ vo.board_content }"></textarea>
      </div>

      <div style="margin-top: 10px">
       <input class="btn" type="button" value="목록보기" onclick="location.href='list.do'" />
       <input class="btn btn_update" type="button" value="글올리기" onclick="send(this.form)" />
      </div>
     </div>
    </div>
   </div>
  </form>
 </body>

 </html>