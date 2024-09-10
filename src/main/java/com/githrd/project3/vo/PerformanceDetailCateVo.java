package com.githrd.project3.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Alias("performance_detail_cate")
public class PerformanceDetailCateVo {

    int performance_detail_cate_idx;
    String performance_detail_cate_name;

}
