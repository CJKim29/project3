package com.githrd.project3.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.githrd.project3.vo.BoardVo;

@Mapper
public interface BoardMapper {
	// 전체 조회
	List<BoardVo> board_list();

	// page 별 조회(댓글 만들고 진행)
	List<BoardVo> board_page_list(Map<String, Object> map);

	// 전체 게시물 수(댓글 만들고 진행)
	int board_row_total(Map<String, Object> map);

	// 게시글 추가
	int board_insert(BoardVo vo);

	// b_idx에 해당되는 게시물 1건 얻어오기
	BoardVo board_one_from_idx(int board_idx);

	// 조회수 증가
	int board_update_readhit(int board_idx);

	// 같은 baseVo에서 기준글보다 step이 큰 게시물의 step을 1씩 증가: 답글작업
	int board_update_step(BoardVo baseVo);

	// 답글쓰기
	int board_reply(BoardVo vo);

	// 게시글 삭제처리
	int board_update_use(int board_idx);

	// 게시글 수정
	int board_update(BoardVo vo);

	int getMaxBoard_idx();

}
