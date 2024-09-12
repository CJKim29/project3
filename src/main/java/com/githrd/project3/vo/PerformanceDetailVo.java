package com.githrd.project3.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Alias("performanceDetail")
public class PerformanceDetailVo {

    int performance_detail_idx;
    int performance_idx;
    String performance_detail_info;
    String performance_al;
    String performance_detail_image;

    PerformanceVo performanceVo;
}
