package com.githrd.project3.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.githrd.project3.vo.FaqVo;

@Mapper
public interface FaqMapper {

    // 페이징조회
    List<FaqVo> faq_page_list(Map<String, Object> map);

    // 전체 게시물 수
    int faq_row_total(Map<String, Object> map);

    // 관리자 기능

    // 추가
    int faq_insert(FaqVo vo);

    // 1건 얻어오기(수정 용)
    FaqVo faq_one_from_idx(int faq_idx);

    // 수정
    int faq_update(FaqVo vo);

    // 삭제
    int faq_delete(int faq_idx);

}
