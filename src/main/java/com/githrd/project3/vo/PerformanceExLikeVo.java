package com.githrd.project3.vo;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Alias("performanceExLike")
public class PerformanceExLikeVo {

    int performance_ex_like_idx;
    int performance_idx;
    int mem_idx;
    int like_number;

    PerformanceVo performanceVo;
    MemberVo memberVo;
}
