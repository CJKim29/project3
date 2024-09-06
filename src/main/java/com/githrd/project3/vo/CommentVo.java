package com.githrd.project3.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.NoArgsConstructor;

@Alias("comment")
@NoArgsConstructor
@Data
public class CommentVo {

	int cmt_idx;
	String cmt_content;
	String cmt_ip;
	String cmt_regdate;
	Integer board_idx;
	int mem_idx;
	String mem_nickname;

}
