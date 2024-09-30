<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공연 수정</title>
    <jsp:include page="/WEB-INF/views/include/header.jsp"/>
</head>
<body>
    <h2>공연 수정</h2>
    <!-- 파일 업로드를 위한 enctype 추가 -->
    <form action="${pageContext.request.contextPath}/main/updatePerformance.do" method="post" enctype="multipart/form-data">
        <input type="hidden" name="performance_idx" value="${performance.performance_idx}">

        <label for="performance_name">공연 이름:</label>
        <input type="text" id="performance_name" name="performance_name" value="${performance.performance_name}" required><br><br>

        <label for="performance_startday">시작일:</label>
        <input type="date" id="performance_startday" name="performance_startday" value="${performance.performance_startday}" required><br><br>

        <label for="performance_endday">종료일:</label>
        <input type="date" id="performance_endday" name="performance_endday" value="${performance.performance_endday}" required><br><br>

        <label for="performance_img">공연 이미지 업로드:</label>
        <input type="file" id="performance_img" name="performance_img" class="form-control" accept="image/*" required><br><br>

        <input type="submit" value="수정하기">
    </form>

    <a href="${pageContext.request.contextPath}/main/list.do">목록으로 돌아가기</a>

    <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>
