package com.githrd.project3.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.githrd.project3.vo.CommentVo;

@Mapper
public interface CommentMapper {

	// 조회
	List<CommentVo> comment_list(int board_idx);

	// Paging조회
	List<CommentVo> comment_page_list(Map<String, Object> map);

	// 총 댓글 개수
	int comment_insert(CommentVo vo);

	// 추가
	int comment_delete(int cmt_idx);

	// 삭제
	int comment_row_total(int board_idx);

}
