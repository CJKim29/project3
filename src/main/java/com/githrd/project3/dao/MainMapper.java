package com.githrd.project3.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.githrd.project3.util.MyCommon.Performance;

@Mapper
public interface MainMapper {
    List<Performance> getRandomPerformancesByGenre(@Param("genre") String genre, @Param("limit") int limit);
}
