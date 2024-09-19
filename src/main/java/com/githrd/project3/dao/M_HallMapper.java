package com.githrd.project3.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.githrd.project3.vo.M_HallVo;

@Mapper
public interface M_HallMapper {

    List<M_HallVo> selectSeatsByPerformanceAndDate(@Param("performance_idx") int performance_idx,
            @Param("performance_date") String performance_date);

    void updateSeatStatus(@Param("performance_date_idx") int performance_date_idx, @Param("row") int row,
            @Param("col") String col);
}
