package com.githrd.project3.vo;

import java.util.List;
import org.apache.ibatis.type.Alias;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Alias("performance")
public class PerformanceVo {

    int no;

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
    String performance_state;
    String performance_detail_info;
    String performance_al;
    String performance_detail_image;

    HallVo hallVo;
    PerformanceCateVo performanceCateVo;

    List<SeatVo> seatList;

    // 공연 상세 카테고리
    PerformanceDetailCateVo performanceDetailCateVo;
    List<PerformanceDetailCateVo> performanceDetailCateList;

}