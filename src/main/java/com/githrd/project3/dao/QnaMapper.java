package com.githrd.project3.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.githrd.project3.vo.QnaVo;

@Mapper
public interface QnaMapper {
    // 페이징 조회
    List<QnaVo> qna_page_list(Map<String, Object> map);

    // 전체 게시물 수
    int qna_row_total(Map<String, Object> map);

    // 추가
    int qna_insert(QnaVo vo);

    // 1건 얻어오기
    QnaVo qna_one_from_idx(int qna_idx);

    // 수정
    int qna_update(QnaVo vo);

    // 삭제
    int qna_delete(int qna_idx);

    // 답변완료시, 답변 여부를 'y'로 수정
    int qna_update_use(int qna_idx);
}
