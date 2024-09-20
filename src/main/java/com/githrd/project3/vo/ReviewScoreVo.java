package com.githrd.project3.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Alias("review_score")
public class ReviewScoreVo {
    
    int review_score_idx;
    int mem_idx;
    int performance_idx;
    int review_idx;
    int review_score_point;

    Double average_score; //평균 값을 위해
}
