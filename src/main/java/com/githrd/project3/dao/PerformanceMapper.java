package com.githrd.project3.dao;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.githrd.project3.vo.PerformanceDateVo;
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

 int insertPerformanceDate(PerformanceDateVo vo);

 // 빈자리 자동 등록
 // 자리수 구하기(s/m/l)
 int getPerformanceCateIdx(int performance_idx);

 void insertSeats(@Param("performance_idx") int performance_idx,
   @Param("seat_grade") String seat_grade,
   @Param("seat_price") Integer seat_price);

 int selectSeatIndex(@Param("performance_idx") int performance_idx,
   @Param("seat_grade") String seat_grade,
   @Param("seat_price") int seat_price);

 List<Date> getPerformanceDates(int performance_idx);

 int getPerformanceDateIdx(int performance_idx,
   Date performance_date_date);

 // 카테고리별 공연 조회
 List<PerformanceVo> selectByCategory(Map<String, Object> map);

 // 카테고리별 전체 공연 수
 int selectRowTotalByCategory(Map<String, Object> map);

 // 카테고리별 공연 목록 조회
 List<PerformanceVo> select_cate(int performance_cate_idx);

 // performance_date에서 performance_idx로 performance_date_idx 추출
 List<Integer> selectPerformanceDateIdx(int performance_idx);

 // m_hall에서 performance_date_idx로 데이터 삭제
 void deleteFromMHall(int performance_date_idx);

 // performance_date에서 performance_idx로 해당 데이터 삭제
 void deletePerformanceDates(int performance_idx);

 void deleteSeatByPerformanceIdx(int performance_idx);

  // 카테고리별 랜덤 공연 조회
  List<PerformanceVo> getRandomPerformancesByCategory(int categoryIdx);

}
