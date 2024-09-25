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
    int insert(PerformanceVo vo);

    // 공연 등록 - 좌석 별 가격
    int insertSeat(SeatVo vo);

    // 공연 수정
    int update(PerformanceVo vo);

    // 공연 수정 - 이미지 파일 업로드
    int updateImage(PerformanceVo vo);

    // 공연 좌석 수정을 위한 selectOne
    SeatVo selectOneFromSeatIdx(int seat_idx);

    // 공연 좌석 수정
    int updateSeat(SeatVo vo);

    // 공연 삭제
    int delete(int performance_idx);

    // 페이징 처리
    int selectRowTotal(Map<String, Object> map);

    // 전체조회 +페이징 처리
    List<PerformanceVo> performancePageList(Map<String, Object> map);

    // 검색어를 포함한 공연 목록 조회
    List<PerformanceVo> searchPerformances(String search);

    // 최신 공연 정보 조회
    List<PerformanceVo> selectNewPerformances();

    // 랭킹 공연 정보 조회
    List<PerformanceVo> selectRankingPerformances();

}
