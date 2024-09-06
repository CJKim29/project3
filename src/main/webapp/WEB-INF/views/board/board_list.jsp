<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fn"
uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="zxx">
  <head>
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
    />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style type="text/css">
      #title {
        text-align: center;
        font-weight: bold;
        font-size: 26px;
        text-shadow: 1px 1px 1px black;
        color: #f7941d;
      }
      th {
        color: black;
      }

      a {
        color: #f7941d;
        text-decoration: none;
      }

      a:hover {
        color: #f7941d;
        text-decoration: none;
      }

      .board_name {
        display: inline-block;

        overflow: hidden;
        white-space: nowrap;
        text-overflow: ellipsi;
        word-break: break-all;

        /* ellipsi 속성 */
      }
    </style>

    <script type="text/javascript">
      // 페이지가 준비되면 검색창을 비우기(기존 null이 받아졌음)
      $(document).ready(function () {
        $("#search_text").val("");
      });

      function insert_form() {
        // 로그인 여부 체크
        if ("${ empty user }" == "true") {
          if (
            confirm("글쓰기는 로그인 후 가능합니다 \n 로그인 하시겠습니까?") ==
            false
          )
            return;

          location.href = "../member/login_form.do";

          return;
        }
        location.href = "insert_form.do";
      }

      let currentSort = "board_idx"; // 기본 정렬 기준

      function setSort(sortBy) {
        currentSort = sortBy; // 정렬 기준을 설정
        find(); // 정렬 기준을 포함한 검색 수행
      }

      // 검색
      function find() {
        let search = $("#search").val();
        let search_text = $("#search_text").val().trim();

        // 전체보기일 때 검색어를 비우기
        if (search === "all") {
          search_text = "";
        }

        // 전체검색이 아닌데 검색어가 비어있으면
        if (search !== "all" && search_text === "") {
          alert("검색어를 입력하세요.");
          $("#search_text").val("");
          $("#search_text").focus();
          return;
        }

        //자바스크립트 이용해서 호출
        location.href =
          "list.do?search=" +
          search +
          "&search_text=" +
          encodeURIComponent(search_text, "utf-8") +
          "&sort=" +
          encodeURIComponent(currentSort, "utf-8"); // 자바스크립트에서 인코딩/정렬 기준 추가
      }
    </script>
  </head>
  <body class="js">
    <jsp:include page="/WEB-INF/views/include/header.jsp" />

    <!-- Start Blog Grid -->
    <div class="blog-single shop-blog grid section" style="padding-top: 50px">
      <div class="container">
        <h3 id="title">
          ::::게시판::::
          <img src="../resources/images/김치쿵야.png" />
        </h3>
        <div class="row">
          <div style="text-align: right">
            <input
              class="btn"
              style="background: #f7941d; color: white"
              type="button"
              value="글쓰기"
              onclick="insert_form();"
            />
          </div>
          <!-- 검색메뉴 -->
          <div style="text-align: right; margin-bottom: 5px">
            <form class="form-inline">
              <select id="search" class="form-control">
                <option value="all">전체보기</option>
                <option value="board_name">제목</option>
                <option value="mem_nickname">작성자</option>
                <option value="name_content">제목+작성자</option>
              </select>

              <input
                id="search_text"
                class="form-control"
                value="${param.search_text}"
              />

              <input
                id="search_btn"
                type="button"
                class="btn btn-primary"
                value="검색"
                onclick="find();"
              />

              <input
                id="board_readhit"
                type="button"
                class="btn btn-primary"
                value="조회순"
                onclick="setSort('board_readhit');"
              />
              <input
                id="board_idx"
                type="button"
                class="btn btn-warning"
                value="등록일순"
                onclick="setSort('board_idx');"
              />
            </form>
          </div>
          <!-- 게시판 테이블 구성하기  -->
          <table class="table" style="margin-bottom: 0">
            <tr style="background: #f7941d">
              <th>번호</th>
              <th style="width: 50%">제목</th>
              <th>카테고리</th>
              <th>작성자</th>
              <th>작성일자</th>
              <th>조회수</th>
            </tr>

            <tr>
              <!-- 데이터가 없는 경우 -->
              <c:if test="${ empty list }">
                <tr>
                  <td colspan="5" align="center">
                    <font color="red">게시물이 없습니다</font>
                  </td>
                </tr>
              </c:if>

              <!-- 데이터가 있는 경우-->
              <c:forEach var="vo" items="${ list }">
                <tr>
                  <td>${ vo.board_idx }</td>

                  <td>
                    <!-- 답글이면 b_depth만큼 들여쓰기 -->
                    <c:forEach begin="1" end="${ vo.board_depth }">
                      &nbsp;&nbsp;&nbsp;
                    </c:forEach>

                    <!-- 답글이면 -->
                    <c:if test="${ vo.board_depth ne 0 }"> ㄴ </c:if>

                    <!-- 삭제된 게시물 -->
                    <c:if test="${ vo.board_use eq 'n' }">
                      <font color="red"
                        >(삭제된 게시물입니다.)
                        <span class="board_name">${ vo.board_name }</span>
                      </font>
                    </c:if>

                    <!-- 삭제안된 게시물 -->
                    <c:if test="${ vo.board_use eq 'y' }">
                      <span class="board_name">
                        <a href="view.do?board_idx=${ vo.board_idx }">
                          ${ vo.board_name }
                          <c:if test="${ vo.cmt_count ne 0 }">
                            <span class="badge" style="background: #f7941d"
                              >&nbsp;${ vo.cmt_count }</span
                            >
                          </c:if>
                        </a>
                      </span>
                    </c:if>
                  </td>
                  <td>${ vo.board_cate_name }</td>
                  <td>${ vo.mem_nickname }</td>
                  <td>${ vo.board_regdate }</td>
                  <td>${ vo.board_readhit }</td>
                </tr>
              </c:forEach>
            </tr>
          </table>
          <!-- Pagination -->
          <div style="text-align: center; margin: auto">${ pageMenu }</div>
          <!--/ End Pagination -->
        </div>
      </div>
    </div>
    <!--/ End Blog Grid -->
    <div style="height: 100px"></div>

    <jsp:include page="/WEB-INF/views/include/footer.jsp" />
  </body>
</html>
