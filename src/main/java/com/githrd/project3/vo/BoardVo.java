package com.githrd.project3.vo;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Alias("board")
@NoArgsConstructor
@Getter
@Setter
public class BoardVo {

  int board_idx;
  Integer board_cate_idx;
  int mem_idx;
  String board_name;
  String board_content;
  String board_ip;
  String board_regdate;
  int board_readhit;
  String board_use;
  int board_ref;
  int board_step;
  int board_depth;
  String mem_nickname;

  // 댓글 구현되고 만들기
  int board_no;
  int cmt_count;
  String board_cate_name;
}
