package com.githrd.project3.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.githrd.project3.vo.S_HallVo;

@Mapper
public interface S_HallMapper {

        List<S_HallVo> selectList();

        List<S_HallVo> selectSeatsByConcert(int concertIdx);

        List<S_HallVo> selectSeatsByConcertAndDate(@Param("concert_idx") int concert_idx,
                        @Param("concert_date") String concert_date);

        int countAvailableSeatsBySeatIdx(int seatIdx);

        void updateSeatStatus(@Param("concert_date_idx") int concert_date_idx,
                        @Param("row") int row,
                        @Param("col") String col);

        List<S_HallVo> BookedSeatList(Integer concert_idx);
}