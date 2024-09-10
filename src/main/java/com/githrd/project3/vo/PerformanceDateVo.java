package com.githrd.project3.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Alias("performance_date")
public class PerformanceDateVo {
    int performance_date_idx;
    int performance_idx;
    String performance_date_date;
}
