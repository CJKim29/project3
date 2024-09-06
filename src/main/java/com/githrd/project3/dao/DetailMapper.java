package com.githrd.project3.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.githrd.project3.vo.ConcertExLikeVo;
import com.githrd.project3.vo.ConcertVo;

@Mapper
public interface DetailMapper {

    // 전체 조회
    List<ConcertVo> selectList();

    // idx 조회
    ConcertVo selectOneFromIdx(int concert_idx);

    int findLike(int concert_idx, int mem_idx);

    int likeUp(ConcertExLikeVo vo);

    int likeDown(ConcertExLikeVo vo);
}
