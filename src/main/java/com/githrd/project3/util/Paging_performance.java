package com.githrd.project3.util;

/*
        nowPage:현재페이지
        rowTotal:전체데이터갯수
        blockList:한페이지당 게시물수
        blockPage:한화면에 나타낼 페이지 목록수
 */

 public class Paging_performance {
  public static String getPaging_cate(
      String pageURL,
      int nowPage,
      int rowTotal,
      int blockList,
      int blockPage,
      int performance_cate_idx,
      String hall_area,
      String sort_options,
      int performance_detail_cate_idx) {

      // 데이터가 없을 경우 빈 문자열 반환
      if (rowTotal <= 0) {
          return ""; // 데이터가 없으면 페이지 네비게이션을 아예 표시하지 않음
      }

      int totalPage; // 전체 페이지 수
      int startPage; // 시작 페이지 번호
      int endPage;   // 마지막 페이지 번호

      boolean isPrevPage, isNextPage;
      StringBuffer sb; // 모든 상황을 판단하여 HTML코드를 저장할 곳

      isPrevPage = isNextPage = false;

      // 전체 페이지 수 계산
      totalPage = rowTotal / blockList;
      if (rowTotal % blockList != 0) {
          totalPage++;
      }

      // 현재 페이지가 전체 페이지 수를 넘을 경우 현재 페이지 값을 전체 페이지 값으로 변경
      if (nowPage > totalPage) {
          nowPage = totalPage;
      }

      // 전체 페이지가 1보다 작을 경우 페이징을 표시하지 않음
      if (totalPage < 1) {
          return ""; // 전체 페이지가 1보다 적으면 아예 반환
      }

      // 시작 페이지와 마지막 페이지 계산
      startPage = ((nowPage - 1) / blockPage) * blockPage + 1;
      endPage = startPage + blockPage - 1;

      // 마지막 페이지 수가 전체 페이지 수보다 크면 마지막 페이지 값을 변경
      if (endPage > totalPage) {
          endPage = totalPage;
      }

      // 마지막 페이지가 전체 페이지보다 작을 경우 다음 페이징이 적용할 수 있도록
      if (endPage < totalPage) {
          isNextPage = true;
      }

      // 시작 페이지의 값이 1보다 크면 이전 페이징 적용 가능
      if (startPage > 1) {
          isPrevPage = true;
      }

      // HTML 코드를 저장할 StringBuffer 생성
      sb = new StringBuffer("<ul class='pagination'>");

      // 이전 페이지 처리
      if (isPrevPage) {
          sb.append(
              String.format("<li class='page-item'><a class='page-link' href='%s?performance_cate_idx=%d&hall_area=%s&sort_options=%s&performance_detail_cate_idx=%d&blockList=%d&page=%d'>←</a></li>",
                  pageURL, performance_cate_idx, hall_area, sort_options, performance_detail_cate_idx, blockList, startPage - 1));
      } else {
          sb.append("<li class='page-item disabled'><a class='page-link' href='#'>←</a></li>");
      }

      // 페이지 목록 출력
      for (int i = startPage; i <= endPage; i++) {
          if (i == nowPage) { // 현재 있는 페이지
              sb.append(String.format("<li class='page-item active'><a class='page-link' href='#'>%d</a></li>", i));
          } else { // 현재 페이지가 아니면
              sb.append(String.format("<li class='page-item'><a class='page-link' href='%s?performance_cate_idx=%d&hall_area=%s&sort_options=%s&performance_detail_cate_idx=%d&blockList=%d&page=%d'>%d</a></li>",
                  pageURL, performance_cate_idx, hall_area, sort_options, performance_detail_cate_idx, blockList, i, i));
          }
      }

      // 다음 페이지 처리
      if (isNextPage) {
          sb.append(
              String.format("<li class='page-item'><a class='page-link' href='%s?performance_cate_idx=%d&hall_area=%s&sort_options=%s&performance_detail_cate_idx=%d&blockList=%d&page=%d'>→</a></li>",
                  pageURL, performance_cate_idx, hall_area, sort_options, performance_detail_cate_idx, blockList, endPage + 1));
      } else {
          sb.append("<li class='page-item disabled'><a class='page-link' href='#'>→</a></li>");
      }

      sb.append("</ul>");
      return sb.toString();
  }

 public static String getPaging(String pageURL, int nowPage, int rowTotal, int blockList, int blockPage) {

  int totalPage/* 전체페이지수 */,
    startPage/* 시작페이지번호 */,
    endPage;/* 마지막페이지번호 */

  boolean isPrevPage, isNextPage;
  StringBuffer sb; // 모든 상황을 판단하여 HTML코드를 저장할 곳

  isPrevPage = isNextPage = false;
  // 입력된 전체 자원을 통해 전체 페이지 수를 구한다..
  totalPage = rowTotal / blockList;
  if (rowTotal % blockList != 0)
   totalPage++;

  // 만약 잘못된 연산과 움직임으로 인하여 현재 페이지 수가 전체 페이지 수를
  // 넘을 경우 강제로 현재페이지 값을 전체 페이지 값으로 변경
  if (nowPage > totalPage)
   nowPage = totalPage;

  // 시작 페이지와 마지막 페이지를 구함.
  startPage = ((nowPage - 1) / blockPage) * blockPage + 1;
  endPage = startPage + blockPage - 1; //

  // 마지막 페이지 수가 전체페이지수보다 크면 마지막페이지 값을 변경
  if (endPage > totalPage)
   endPage = totalPage;

  // 마지막페이지가 전체페이지보다 작을 경우 다음 페이징이 적용할 수 있도록
  // boolean형 변수의 값을 설정
  if (endPage < totalPage)
   isNextPage = true;
  // 시작페이지의 값이 1보다 작으면 이전페이징 적용할 수 있도록 값설정
  if (startPage > 1)
   isPrevPage = true;

  // HTML코드를 저장할 StringBuffer생성=>코드생성
  sb = new StringBuffer("<ul class='pagination'>");
  // -----그룹페이지처리 이전
  // --------------------------------------------------------------------------------------------
  if (isPrevPage) {

   sb.append(
     String.format("<li class='page-item'><a class='page-link' href='%s?page=%d'>←</a></li>", pageURL, startPage - 1));

  } else
   sb.append("<li class='page-item'><a class='page-link' href='#'>←</a></li>");

  // ------페이지 목록 출력
  // -------------------------------------------------------------------------------------------------

  for (int i = startPage; i <= endPage; i++) {

   if (i == nowPage) { // 현재 있는 페이지
    sb.append(String.format("<li class='page-item active'><a class='page-link' href='#'>%d</a></li>", i));

   } else {// 현재 페이지가 아니면
    sb.append(String.format("<li class='page-item'><a class='page-link' href='%s?page=%d'>%d</a></li>", pageURL, i, i));
   }
  } // end for

  // -----그룹페이지처리 다음
  // ----------------------------------------------------------------------------------------------
  if (isNextPage) {
   sb.append(
     String.format("<li class='page-item'><a class='page-link' href='%s?page=%d'>→</a></li>", pageURL, endPage + 1));
  } else
   sb.append("<li class='page-item'><a class='page-link' href='#'>→</a></li>");
  // ---------------------------------------------------------------------------------------------------------------------

  sb.append("</ul>");
  return sb.toString();
 }

 public static String getPaging(String pageURL, String filter, int nowPage, int rowTotal, int blockList,
   int blockPage) {

  int totalPage/* 전체페이지수 */,
    startPage/* 시작페이지번호 */,
    endPage;/* 마지막페이지번호 */

  boolean isPrevPage, isNextPage;
  StringBuffer sb; // 모든 상황을 판단하여 HTML코드를 저장할 곳

  isPrevPage = isNextPage = false;
  // 입력된 전체 자원을 통해 전체 페이지 수를 구한다..
  totalPage = rowTotal / blockList;
  if (rowTotal % blockList != 0)
   totalPage++;

  // 만약 잘못된 연산과 움직임으로 인하여 현재 페이지 수가 전체 페이지 수를
  // 넘을 경우 강제로 현재페이지 값을 전체 페이지 값으로 변경
  if (nowPage > totalPage)
   nowPage = totalPage;

  // 시작 페이지와 마지막 페이지를 구함.
  startPage = ((nowPage - 1) / blockPage) * blockPage + 1;
  endPage = startPage + blockPage - 1; //

  // 마지막 페이지 수가 전체페이지수보다 크면 마지막페이지 값을 변경
  if (endPage > totalPage)
   endPage = totalPage;

  // 마지막페이지가 전체페이지보다 작을 경우 다음 페이징이 적용할 수 있도록
  // boolean형 변수의 값을 설정
  if (endPage < totalPage)
   isNextPage = true;

  // 시작페이지의 값이 1보다 작으면 이전페이징 적용할 수 있도록 값설정
  if (startPage > 1)
   isPrevPage = true;

  // 페이지가 없을 시 ◀, ▶ 버튼 없애기
  if (totalPage == 0) {
   return "";
  }
  // HTML코드를 저장할 StringBuffer생성=>코드생성
  sb = new StringBuffer("<ul class='pagination'>");

  // -----그룹페이지처리 이전
  // --------------------------------------------------------------------------------------------
  if (isPrevPage) {

   sb.append(String.format("<li class='page-item'><a class='page-link' href='review_list.do?page=%d&%s'>◀</a></li>",
     startPage - 1, filter));
  } else
   sb.append("<li class='page-item'><a class='page-link' href='#'>◀</a></li>");

  // ------페이지 목록 출력
  // -------------------------------------------------------------------------------------------------

  for (int i = startPage; i <= endPage; i++) {

   if (i == nowPage) { // 현재 있는 페이지
    sb.append(String.format("<li class='page-item active'><a class='page-link' href='#'>%d</a></li>", i));
   } else {// 현재 페이지가 아니면
    sb.append(String.format("<li class='page-item'><a class='page-link' href='review_list.do?page=%d&%s'>%d</a></li>",
      i, filter, i));
   }
  } // end for

  // -----그룹페이지처리 다음
  // ----------------------------------------------------------------------------------------------

  if (isNextPage) {
   sb.append(String.format("<li class='page-item'><a class='page-link' href='review_list.do?page=%d&%s'>▶</a></li>",
     endPage + 1, filter));
  } else
   sb.append("<li class='page-item'><a class='page-link' href='#'>▶</a></li>");

  // ---------------------------------------------------------------------------------------------------------------------

  sb.append("</ul>");

  return sb.toString();
 }

 public static String getCommentPaging(int nowPage, int rowTotal, int blockList, int blockPage) {

  int totalPage/* 전체페이지수 */,
    startPage/* 시작페이지번호 */,
    endPage;/* 마지막페이지번호 */

  boolean isPrevPage, isNextPage;
  StringBuffer sb; // 모든 상황을 판단하여 HTML코드를 저장할 곳

  isPrevPage = isNextPage = false;
  // 입력된 전체 자원을 통해 전체 페이지 수를 구한다..
  totalPage = rowTotal / blockList;
  if (rowTotal % blockList != 0)
   totalPage++;

  // 만약 잘못된 연산과 움직임으로 인하여 현재 페이지 수가 전체 페이지 수를
  // 넘을 경우 강제로 현재페이지 값을 전체 페이지 값으로 변경
  if (nowPage > totalPage)
   nowPage = totalPage;

  // 시작 페이지와 마지막 페이지를 구함.
  startPage = ((nowPage - 1) / blockPage) * blockPage + 1;
  endPage = startPage + blockPage - 1; //

  // 마지막 페이지 수가 전체페이지수보다 크면 마지막페이지 값을 변경
  if (endPage > totalPage)
   endPage = totalPage;

  // 마지막페이지가 전체페이지보다 작을 경우 다음 페이징이 적용할 수 있도록
  // boolean형 변수의 값을 설정
  if (endPage < totalPage)
   isNextPage = true;

  // 시작페이지의 값이 1보다 작으면 이전페이징 적용할 수 있도록 값설정
  if (startPage > 1)
   isPrevPage = true;

  // HTML코드를 저장할 StringBuffer생성=>코드생성
  sb = new StringBuffer("<ul class='pagination'>");

  // -----그룹페이지처리 이전
  // --------------------------------------------------------------------------------------------
  if (isPrevPage) {

   sb.append(String.format("<li class='page-item'><a class='page-link' href='#' onclick='comment_list(%d);'>◀</a></li>",
     startPage - 1));
  } else
   sb.append("<li class='page-item'><a class='page-link' href='#'>◀</a></li>");

  // ------페이지 목록 출력
  // -------------------------------------------------------------------------------------------------

  for (int i = startPage; i <= endPage; i++) {

   if (i == nowPage) { // 현재 있는 페이지
    sb.append(String.format("<li class='page-item active'><a class='page-link' href='#'>%d</a></li>", i));
   } else {// 현재 페이지가 아니면
    sb.append(String
      .format("<li class='page-item'><a class='page-link' href='#' onclick='comment_list(%d);'>%d</a></li>", i, i));
   }
  } // end for

  // -----그룹페이지처리 다음
  // ----------------------------------------------------------------------------------------------
  if (isNextPage) {
   sb.append(String.format("<li class='page-item'><a class='page-link' href='#' onclick='comment_list(%d);'>▶</a></li>",
     endPage + 1));
  } else
   sb.append("<li class='page-item'><a class='page-link' href='#'>▶</a></li>");

  // ---------------------------------------------------------------------------------------------------------------------

  sb.append("</ul>");

  return sb.toString();
 }

 public static String getPerformancePaging(int performance_idx, int nowPage, int rowTotal, int blockList, int blockPage) {
  int totalPage/* 전체페이지수 */,
    startPage/* 시작페이지번호 */,
    endPage;/* 마지막페이지번호 */

  boolean isPrevPage, isNextPage;
  StringBuffer sb; // 모든 상황을 판단하여 HTML코드를 저장할 곳

  isPrevPage = isNextPage = false;
  // 입력된 전체 자원을 통해 전체 페이지 수를 구한다..
  totalPage = rowTotal / blockList;
  if (rowTotal % blockList != 0)
   totalPage++;

  // 만약 잘못된 연산과 움직임으로 인하여 현재 페이지 수가 전체 페이지 수를
  // 넘을 경우 강제로 현재페이지 값을 전체 페이지 값으로 변경
  if (nowPage > totalPage)
   nowPage = totalPage;

  // 시작 페이지와 마지막 페이지를 구함.
  startPage = ((nowPage - 1) / blockPage) * blockPage + 1;
  endPage = startPage + blockPage - 1; //

  // 마지막 페이지 수가 전체페이지수보다 크면 마지막페이지 값을 변경
  if (endPage > totalPage)
   endPage = totalPage;

  // 마지막페이지가 전체페이지보다 작을 경우 다음 페이징이 적용할 수 있도록
  // boolean형 변수의 값을 설정
  if (endPage < totalPage)
   isNextPage = true;
  // 시작페이지의 값이 1보다 작으면 이전페이징 적용할 수 있도록 값설정
  if (startPage > 1)
   isPrevPage = true;

  // HTML코드를 저장할 StringBuffer생성=>코드생성
  sb = new StringBuffer("<ul class='pagination'>");
  // -----그룹페이지처리 이전
  // --------------------------------------------------------------------------------------------
  if (isPrevPage) {

   sb.append(
     String.format("<li class='page-item'><a class='page-link' href='#' onclick='review_list(%d,%d);' >←</a></li>",
       performance_idx, startPage - 1));

  } else
   sb.append("<li class='page-item'><a class='page-link' href='#'>←</a></li>");

  // ------페이지 목록 출력
  // -------------------------------------------------------------------------------------------------

  for (int i = startPage; i <= endPage; i++) {

   if (i == nowPage) { // 현재 있는 페이지
    sb.append(String.format("<li class='page-item active'><a class='page-link' href='#'>%d</a></li>", i));

   } else {// 현재 페이지가 아니면
    sb.append(
      String.format("<li class='page-item'><a class='page-link' href='#' onclick='review_list(%d,%d);' >%d</a></li>",
        performance_idx, i, i));
   }
  } // end for

  // -----그룹페이지처리 다음
  // ----------------------------------------------------------------------------------------------
  if (isNextPage) {
   sb.append(
     String.format("<li class='page-item'><a class='page-link' href='#' onclick='review_list(%d,%d);' >→</a></li>",
       performance_idx, endPage + 1));
  } else
   sb.append("<li class='page-item'><a class='page-link' href='#'>→</a></li>");
  // ---------------------------------------------------------------------------------------------------------------------

  sb.append("</ul>");
  return sb.toString();
 }
}