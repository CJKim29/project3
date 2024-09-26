<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search</title>
<style>
    .search-results {
            margin: 20px auto;
            max-width: 1200px;
        }

        .search-results h2 {
            text-align: center;
            font-size: 30px;
            margin-bottom: 30px;
        }

        .performance_list {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
        }

        .content_wrap {
            width: 30%;
            margin-bottom: 20px;
            text-align: center;
            box-sizing: border-box;
        }

        .performance_img {
            width: 320px;
            height: 500px;
            /* 사진 비율 맞추기 */
            object-fit: cover;
            margin-bottom: 10px;
        }

        .performance_cate, .performance_name, .performance_hall {
            font-size: 16px;
            color: rgb(0, 0, 0);
            margin: 5px 0;
        }

        .performance_name {
            font-size: 23px;
            font-weight: bold;
        }

        .content_wrap a {
            text-decoration: none;
            color: inherit;
        }

        /* 이미지 강조 */
        .content_wrap a:hover .performance_img {
            opacity: 0.8;
        }

</style>
</head>
<body>
    <jsp:include page="/WEB-INF/views/include/header.jsp"/>
    
    <!-- 검색 결과 표시 -->
    <div class="search-results">
        <h2>검색 결과</h2>
        <c:if test="${not empty list}">
            <ul class="performance_list">
                <c:forEach var="performance" items="${list}">
                    <li class="content_wrap">
                        <a href="../detail/detail.do?performance_idx=${performance.performance_idx}">
                            <img class="performance_img" src="${pageContext.request.contextPath}/resources/images/${performance.performance_image}" alt="performance_name">
                            <div class="performance_cate">${performance.performanceCateVo.performance_cate_name}</div>
                            <div class="performance_name">${performance.performance_name}</div>
                            <div class="area">
                                ${performance.hallVo.hall_area} &gt; ${performance.hallVo.hall_name}
                            </div>
                            <div class="performance_state">상태: ${performance.performance_state}</div>
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </c:if>
        <c:if test="${empty list}">
            <p style="text-align: center; font-size: 30px;">검색된 공연이 없습니다.</p>
        </c:if>
    </div>

    <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>
