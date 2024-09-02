package com.githrd.project3.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.githrd.project3.vo.ConcertVo;

@Mapper
public interface ConcertMapper {

    List<ConcertVo> selectList();

    ConcertVo selectOneFromIdx(int concert_idx);

    Integer selectRemainSeat(@Param("concert_date") String concert_date, @Param("seat_idx") int seat_idx);

    // List<S_HallVo> selectS_HallList(int concert_idx);
}