<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공연 수정</title>

<body>

<div class="container mt-5">
    <h2>공연 수정</h2>

    <form action="updatePerformance.do" method="post" enctype="multipart/form-data">
        <input type="hidden" name="performance_idx" value="${performance.performance_idx}">

        <!-- 이미지 수정 -->
        <div class="form-group mb-3">
            <label for="performance_img">공연 이미지:</label><br>
            <img src="${performance.performance_img}" alt="공연 이미지" width="200" class="mb-2"><br>
            <input type="file" id="performance_img" name="performance_img" class="form-control">
        </div>

        <!-- 공연 제목 수정 -->
        <div class="form-group mb-3">
            <label for="performance_title">공연 제목:</label>
            <input type="text" id="performance_title" name="performance_title" value="${performance.performance_title}" class="form-control">
        </div>

        <!-- 공연 날짜 수정 -->
        <div class="form-group mb-3">
            <label for="performance_date">공연 날짜:</label>
            <input type="text" id="performance_date" name="performance_date" value="${performance.performance_date}" class="form-control">
        </div>

        <!-- 수정 버튼 -->
        <button type="submit" class="btn btn-primary">수정</button>
    </form>
</div>

</body>
</html>

