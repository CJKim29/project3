package com.githrd.project3.vo;

import java.util.List;
import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Alias("performance")
public class PerformanceVo {

    int no;

    int performance_idx;
    int performance_cate_idx;
    int performance_detail_cate_idx;
    int hall_idx;
    int area_idx;
    String performance_name;
    String performance_startday;
    String performance_endday;
    String performance_runtime;
    String performance_image;
    int performance_age;
    String performance_state;
    String performance_detail_info;
    String performance_al;
    String performance_detail_image;

    String hall_name;
    String hall_area;
    String performance_cate_name;

    HallVo hallVo;
    PerformanceCateVo performanceCateVo;

    List<SeatVo> seatList;

    List<CastingVo> castingList;

    // 공연 상세 카테고리
    PerformanceDetailCateVo performanceDetailCateVo;
    List<PerformanceDetailCateVo> performanceDetailCateList;

}