package com.githrd.project3.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Alias("performance_cate")
public class PerformanceCateVo {
    int performance_cate_idx;
    String performance_cate_name;

    // 세부 카테고리
    PerformanceDetailCateVo performanceDetailCateVo;
}
