package com.githrd.project3.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.githrd.project3.vo.L_HallVo;

@Mapper
public interface L_HallMapper {

 List<L_HallVo> selectSeatsByPerformanceAndDate(@Param("performance_idx") int performance_idx,
   @Param("performance_date") String performance_date);

 void updateSeatStatus(@Param("performance_date_idx") int performance_date_idx,
   @Param("row") int row, @Param("col") String col);

 // 주문 취소 시 좌석 정보 업데이트
 void updateSeatStatusByOrder(@Param("performance_date_idx") int performance_date_idx,
   @Param("row") int row,
   @Param("col") String col);

 // 빈좌석 등록
 void insertIntoLHall(Map<String, Object> params);
}
