package com.githrd.project3.util;

public class MyCommon {

 // 게시판 페이징정보
 public static class Board {
  public static final int BLOCK_LIST = 10; // 한 화면에 보여질 게시물 수
  public static final int BLOCK_PAGE = 5; // 한 화면에 보여질 페이지 수
 }

 // 댓글 페이징정보
 public static class Comment {
  public static final int BLOCK_LIST = 3; // 한 화면에 보여질 게시물 수
  public static final int BLOCK_PAGE = 5; // 한 화면에 보여질 페이지 수
 }

 // 후기 페이징정보
 public static class Review {
  public static final int BLOCK_LIST = 5; // 한 화면에 보여질 게시물 수
  public static final int BLOCK_PAGE = 5; // 한 화면에 보여질 페이지 수
 }

 // mypage 후기 페이징정보
 public static class MyReview {
  public static final int BLOCK_LIST = 3; // 한 화면에 보여질 게시물 수
  public static final int BLOCK_PAGE = 5; // 한 화면에 보여질 페이지 수
 }

 // 공연 목록 페이징
 public static class Performance {

  // public static final int BLOCK_LIST = 9; // 한 화면에 보여질 게시물 수
  public static final int BLOCK_PAGE = 3; // 한 화면에 보여질 페이지 수
 }

}