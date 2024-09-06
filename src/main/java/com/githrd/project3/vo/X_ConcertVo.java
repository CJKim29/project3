package com.githrd.project3.vo;

import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Alias("x_concert")
public class X_ConcertVo {

    int concert_idx;
    int concert_cate_idx;
    int concert_detail_cate_idx;
    int hall_idx;

    String concert_name;
    String concert_startday;
    String concert_endday;
    String concert_runtime;
    String concert_image;
    int concert_age;

    HallVo hallVo;
    ConcertCateVo concertCateVo;
    // SeatVo seatVo;
    List<SeatVo> seatList;
    S_HallVo s_HallVo;
    List<S_HallVo> s_HallList;

    // 공연 상세 카테고리
    ConcertDetailCateVo concertDetailCateVo;
    List<ConcertDetailCateVo> concertDetailCateList;

}
