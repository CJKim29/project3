package com.githrd.project3.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.githrd.project3.vo.S_HallVo;

@Mapper
public interface S_HallMapper {

        List<S_HallVo> selectList();

        List<S_HallVo> selectSeatsByPerformance(int performanceIdx);

        List<S_HallVo> selectSeatsByPerformanceAndDate(@Param("performance_idx") int performance_idx,
                        @Param("performance_date") String performance_date);

        int countAvailableSeatsBySeatIdx(int seatIdx);

        void updateSeatStatus(@Param("performance_date_idx") int performance_date_idx,
                        @Param("row") int row,
                        @Param("col") String col);

        List<S_HallVo> BookedSeatList(Integer cperformance_idx);
}