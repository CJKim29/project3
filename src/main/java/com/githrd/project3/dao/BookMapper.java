package com.githrd.project3.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.githrd.project3.vo.X_ConcertVo;

@Mapper
public interface BookMapper {

    List<X_ConcertVo> selectList();

    X_ConcertVo selectOneFromIdx(int concert_idx);

    Integer selectRemainSeat(@Param("concert_date") String concert_date, @Param("seat_idx") int seat_idx);

    // concert_date와 concert_idx를 기반으로 concert_date_idx를 조회
    Integer selectConcertDateIdx(@Param("concert_date") String concert_date, @Param("concert_idx") int concert_idx);

    // 남은 좌석 수를 concert_date_idx와 seat_idx를 이용해 조회
    Integer selectRemainSeat1(@Param("concert_date_idx") int concert_date_idx, @Param("seat_idx") int seat_idx);

    // List<S_HallVo> selectS_HallList(int concert_idx);
}
