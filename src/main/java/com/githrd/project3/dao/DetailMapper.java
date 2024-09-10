package com.githrd.project3.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.githrd.project3.vo.PerformanceExLikeVo;
import com.githrd.project3.vo.PerformanceVo;

@Mapper
public interface DetailMapper {

    // 전체 조회
    List<PerformanceVo> selectList();

    // idx 조회
    PerformanceVo selectOneFromIdx(int Performance_idx);

    // 좋아요 유무
    boolean findLike(int performance_idx, int mem_idx);

    // 좋아요 추가
    void likeUp(PerformanceExLikeVo performanceExLike);

    // 좋아요 취소
    void likeDown(int performance_idx, int mem_idx);

    int selectLikeNumber(int performance_idx, int mem_idx);

    // 특정 공연의 전체 좋아요 수 조회
    int getTotalLikeCount(int performance_idx);
}
