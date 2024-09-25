<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

 <!DOCTYPE html>
 <html>

 <head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
 </head>

 <body>
  <div>
   <input id="search_text" class="form-control" value="${param.search_text}" style="
 height: 40px;
 margin-right: 5px;
 font-size: 16px;
 width: 200px;
" />
   <input id="search_btn" type="button" class="btn" value="검색" onclick="find();"
    style="height: 40px; margin-right: 5px" />
   <a href="#" onclick="review_list();">&emsp;최신순&emsp;</a>
   <a href="#" onclick="review_old_list();">오래된순&emsp;</a>
   <a href="#" onclick="review_star_list();">별점순&emsp;</a>
  </div>
 </body>

 </html>