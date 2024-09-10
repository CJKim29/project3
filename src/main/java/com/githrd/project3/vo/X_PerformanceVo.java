package com.githrd.project3.vo;

import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Alias("x_performance")
public class X_PerformanceVo {

    int performance_idx;
    int performance_cate_idx;
    int performance_detail_cate_idx;
    int hall_idx;

    String performance_name;
    String performance_startday;
    String performance_endday;
    String performance_runtime;
    String performance_image;
    int performance_age;

    HallVo hallVo;
    PerformanceCateVo performanceCateVo;
    // SeatVo seatVo;
    List<SeatVo> seatList;
    S_HallVo s_HallVo;
    List<S_HallVo> s_HallList;

    // 공연 상세 카테고리
    PerformanceDetailCateVo performanceDetailCateVo;
    List<PerformanceDetailCateVo> performanceDetailCateList;

}
