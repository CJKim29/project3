package com.githrd.project3.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.githrd.project3.vo.ReviewScoreVo;
import com.githrd.project3.vo.ReviewVo;

@Mapper
public interface ReviewMapper {

    List<ReviewVo> selectReviewList(int performance_idx);

    int insert(ReviewVo vo);

    int review_insert(ReviewVo vo);

    void insertReviewScore(ReviewScoreVo reviewScoreVo);
    void updateReviewScore(ReviewScoreVo reviewScoreVo);

    // 유저가 이미 조회수를 증가시킨 경우를 체크하는 메서드
    boolean checkUserReadhit(@Param("mem_idx") int mem_idx, @Param("review_idx") int review_idx);
    // 조회수 증가 메서드
    void incrementReadhit(@Param("review_idx") int review_idx);
    // 유저의 조회수 증가 기록 추가 메서드
    void insertUserReadhit(@Param("mem_idx") int mem_idx, @Param("review_idx") int review_idx);

    int review_row_total(Map<String, Object> map);

    List<ReviewVo> review_page_list(Map<String, Object> map);

    ReviewVo review_one_from_idx(int review_idx);

    int review_update(ReviewVo vo);

}
