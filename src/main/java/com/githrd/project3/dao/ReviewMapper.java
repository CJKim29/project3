package com.githrd.project3.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.githrd.project3.vo.MemberVo;
import com.githrd.project3.vo.ReviewScoreVo;
import com.githrd.project3.vo.ReviewVo;

@Mapper
public interface ReviewMapper {

    List<ReviewVo> selectReviewList(int performance_idx);

    int insert(ReviewVo vo);

    int review_insert(ReviewVo vo);

    void insertReviewScore(ReviewScoreVo reviewScoreVo);


}
