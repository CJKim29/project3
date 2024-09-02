package com.githrd.project3.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.githrd.project3.vo.ConcertVo;

@Mapper
public interface ConcertMapper {

    // 전체 조회
    List<ConcertVo> selectList();

    // idx 조회
    ConcertVo selectOneFromIdx(int concert_idx);

    // 장르별 조회(concert_detail_cate_idx)
    ConcertVo selectOneFromCategory(int concert_detail_cate_idx);

}