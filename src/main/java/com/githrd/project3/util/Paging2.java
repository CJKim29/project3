package com.githrd.project3.util;

/*
    nowPage: 현재 페이지
    rowTotal: 전체 데이터 갯수
    blockList: 한 페이지당 게시물 수
    blockPage: 한 화면에 나타낼 페이지 목록 수
 */
public class Paging2 {

 // 페이지 네비게이션 생성 메소드
 public static String getPaging(String pageURL, int nowPage, int rowTotal, int blockList, int blockPage) {

  int totalPage, startPage, endPage; // 전체 페이지 수, 시작 페이지 번호, 마지막 페이지 번호
  boolean isPrevPage, isNextPage; // 이전 페이지, 다음 페이지 존재 여부
  StringBuffer sb; // HTML 코드를 저장할 곳

  isPrevPage = isNextPage = false;

  // 전체 페이지 수 계산
  totalPage = rowTotal / blockList;
  if (rowTotal % blockList != 0)
   totalPage++;

  // 현재 페이지가 전체 페이지 수를 초과하는 경우 조정
  if (nowPage > totalPage)
   nowPage = totalPage;

  // 시작 페이지와 마지막 페이지 계산
  startPage = ((nowPage - 1) / blockPage) * blockPage + 1;
  endPage = startPage + blockPage - 1;

  // 마지막 페이지가 전체 페이지 수를 초과하는 경우 조정
  if (endPage > totalPage)
   endPage = totalPage;

  // 다음 페이지와 이전 페이지 존재 여부 설정
  if (endPage < totalPage)
   isNextPage = true;
  if (startPage > 1)
   isPrevPage = true;

  // HTML 코드 생성
  sb = new StringBuffer("<ul class='pagination'>");

  // 이전 페이지 링크
  if (isPrevPage) {
   sb.append(String.format("<li class='page-item'><a class='page-link' href='%s&page=%d'>←</a></li>",
     pageURL, startPage - 1));
  } else {
   sb.append("<li class='page-item'><a  class='page-link' href='#'>←</a></li>");
  }

  // 페이지 목록 출력
  for (int i = startPage; i <= endPage; i++) {
   if (i == nowPage) {
    sb.append(String.format("<li class='page-item active' ><a class='page-link' href='#'>%d</a></li>", i));
   } else {
    sb.append(String.format("<li class='page-item'><a class='page-link' href='%s&page=%d'>%d</a></li>",
      pageURL, i, i));
   }
  }

  // 다음 페이지 링크
  if (isNextPage) {
   sb.append(String.format("<li class='page-item'><a class='page-link' href='%s&page=%d'>→</a></li>", pageURL,
     endPage + 1));
  } else {
   sb.append("<li class='page-item'><a class='page-link' href='#'>→</a></li>");
  }

  sb.append("</ul>");
  return sb.toString();
 }

 // 필터를 포함한 페이지 네비게이션 생성 메소드
 public static String getPaging(String pageURL, String filter, int nowPage, int rowTotal, int blockList,
   int blockPage) {

  int totalPage, startPage, endPage; // 전체 페이지 수, 시작 페이지 번호, 마지막 페이지 번호
  boolean isPrevPage, isNextPage; // 이전 페이지, 다음 페이지 존재 여부
  StringBuffer sb; // HTML 코드를 저장할 곳

  isPrevPage = isNextPage = false;

  // 전체 페이지 수 계산
  totalPage = rowTotal / blockList;
  if (rowTotal % blockList != 0)
   totalPage++;

  // 현재 페이지가 전체 페이지 수를 초과하는 경우 조정
  if (nowPage > totalPage)
   nowPage = totalPage;

  // 시작 페이지와 마지막 페이지 계산
  startPage = ((nowPage - 1) / blockPage) * blockPage + 1;
  endPage = startPage + blockPage - 1;

  // 마지막 페이지가 전체 페이지 수를 초과하는 경우 조정
  if (endPage > totalPage)
   endPage = totalPage;

  // 다음 페이지와 이전 페이지 존재 여부 설정
  if (endPage < totalPage)
   isNextPage = true;
  if (startPage > 1)
   isPrevPage = true;

  // 페이지가 없을 시 ◀, ▶ 버튼 없애기
  if (totalPage == 0) {
   return "";
  }

  // HTML 코드 생성
  sb = new StringBuffer("<ul class='pagination'>");

  // 이전 페이지 링크
  if (isPrevPage) {
   sb.append(String.format("<li><a href='%s&page=%d&%s'>◀</a></li>", pageURL, startPage - 1, filter));
  } else {
   sb.append("<li><a href='#'>◀</a></li>");
  }

  // 페이지 목록 출력
  for (int i = startPage; i <= endPage; i++) {
   if (i == nowPage) {
    sb.append(String.format("<li class='active'><a href='#'>%d</a></li>", i));
   } else {
    sb.append(String.format("<li><a href='%s&page=%d&%s'>%d</a></li>", pageURL, i, filter, i));
   }
  }

  // 다음 페이지 링크
  if (isNextPage) {
   sb.append(String.format("<li><a href='%s&page=%d&%s'>▶</a></li>", pageURL, endPage + 1, filter));
  } else {
   sb.append("<li><a href='#'>▶</a></li>");
  }

  sb.append("</ul>");
  return sb.toString();
 }

 // 댓글 페이징 생성 메소드
 public static String getCommentPaging(int nowPage, int rowTotal, int blockList, int blockPage) {

  int totalPage, startPage, endPage; // 전체 페이지 수, 시작 페이지 번호, 마지막 페이지 번호
  boolean isPrevPage, isNextPage; // 이전 페이지, 다음 페이지 존재 여부
  StringBuffer sb; // HTML 코드를 저장할 곳

  isPrevPage = isNextPage = false;

  // 전체 페이지 수 계산
  totalPage = rowTotal / blockList;
  if (rowTotal % blockList != 0)
   totalPage++;

  // 현재 페이지가 전체 페이지 수를 초과하는 경우 조정
  if (nowPage > totalPage)
   nowPage = totalPage;

  // 시작 페이지와 마지막 페이지 계산
  startPage = ((nowPage - 1) / blockPage) * blockPage + 1;
  endPage = startPage + blockPage - 1;

  // 마지막 페이지가 전체 페이지 수를 초과하는 경우 조정
  if (endPage > totalPage)
   endPage = totalPage;

  // 다음 페이지와 이전 페이지 존재 여부 설정
  if (endPage < totalPage)
   isNextPage = true;
  if (startPage > 1)
   isPrevPage = true;

  // HTML 코드 생성
  sb = new StringBuffer("<ul class='pagination'>");

  // 이전 페이지 링크
  if (isPrevPage) {
   sb.append(String.format("<li><a href='#' onclick='comment_list(%d);'>◀</a></li>", startPage - 1));
  } else {
   sb.append("<li><a href='#'>◀</a></li>");
  }

  // 페이지 목록 출력
  for (int i = startPage; i <= endPage; i++) {
   if (i == nowPage) {
    sb.append(String.format("<li class='active'><a href='#'>%d</a></li>", i));
   } else {
    sb.append(String.format("<li><a href='#' onclick='comment_list(%d);'>%d</a></li>", i, i));
   }
  }

  // 다음 페이지 링크
  if (isNextPage) {
   sb.append(String.format("<li><a href='#' onclick='comment_list(%d);'>▶</a></li>", endPage + 1));
  } else {
   sb.append("<li><a href='#'>▶</a></li>");
  }

  sb.append("</ul>");
  return sb.toString();
 }
}
