package com.githrd.project3.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.githrd.project3.vo.ConcertVo;

@Mapper
public interface ConcertMapper {

    // 전체 조회
    List<ConcertVo> selectList();

    // idx 조회
    ConcertVo selectOneFromIdx(int concert_idx);

    // 장르별 조회
    List<ConcertVo> concert_detail_cate_list(int genre, int area);

    // 지역별 조회
    List<ConcertVo> concert_area_list(int hall_idx, int concert_detail_cate_idx);

    // 장르별+지역별 조회
    List<ConcertVo> selectCategoryList(Map<String, Object> map);

}