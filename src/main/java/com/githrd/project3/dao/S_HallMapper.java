package com.githrd.project3.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.githrd.project3.vo.S_HallVo;

@Mapper
public interface S_HallMapper {

 List<S_HallVo> selectSeatsByPerformanceAndDate(@Param("performance_idx") int performance_idx,
   @Param("performance_date") String performance_date);

 void updateSeatStatus(@Param("performance_date_idx") int performance_date_idx,
   @Param("row") int row,
   @Param("col") String col);

 void insertIntoSHall(Map<String, Object> params);

 // 안쓰는 코드들
 // List<S_HallVo> selectList();

 // List<S_HallVo> selectSeatsByPerformance(int performanceIdx);

 // int countAvailableSeatsBySeatIdx(int seatIdx);

 // List<S_HallVo> BookedSeatList(Integer cperformance_idx);
}