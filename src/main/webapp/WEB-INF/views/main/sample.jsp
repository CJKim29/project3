<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>샘플(include) 방식</title>
  </head>
  <body>
    <jsp:include page="/WEB-INF/views/include/header.jsp"/>

    
    <p>본문</p>


    <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
  </body>
</html>
