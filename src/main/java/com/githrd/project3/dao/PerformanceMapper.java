package com.githrd.project3.dao;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;
import com.githrd.project3.vo.PerformanceVo;
import com.githrd.project3.vo.SeatVo;

@Mapper
public interface PerformanceMapper {
    // 전체 조회
    List<PerformanceVo> selectList();

    // idx 조회
    PerformanceVo selectOneFromIdx(int performance_idx);

    // 장르별 조회
    List<PerformanceVo> performance_detail_cate_list(int genre, int area);

    // 지역별 조회
    List<PerformanceVo> Performance_area_list(int hall_idx, int performance_detail_cate_idx);

    // 장르별+지역별 조회
    List<PerformanceVo> selectCategoryList(Map<String, Object> map);

    // 공연 등록
    int performance_insert(PerformanceVo vo);

    // 공연 등록 - 좌석 별 가격
    int performance_insert_seat(SeatVo vo);

    // 공연 수정
    int performance_update(PerformanceVo vo);

    // 검색어를 포함한 공연 목록 조회
    List<PerformanceVo> searchPerformances(String search);
}
