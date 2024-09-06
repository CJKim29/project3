package com.githrd.project3.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.githrd.project3.vo.QnaCommentVo;

@Mapper
public interface QnaCommentMapper {

	// 조회
	List<QnaCommentVo> qna_cmt_list(int qna_idx);

	// Paging조회
	List<QnaCommentVo> qna_cmt_page_list(Map<String, Object> map);

	// 추가
	int qna_cmt_insert(QnaCommentVo vo);

	// 삭제
	int qna_cmt_delete(int qna_cmt_idx);

	// 총 댓글 개수
	int qna_cmt_row_total(int qna_idx);
}
