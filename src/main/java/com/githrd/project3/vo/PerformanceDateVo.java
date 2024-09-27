package com.githrd.project3.vo;

import java.time.LocalDateTime;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Alias("performance_date")
public class PerformanceDateVo {
 int performance_date_idx;
 int performance_idx;
 LocalDateTime performance_date_date;
}
