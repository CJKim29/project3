package com.githrd.project3.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Alias("concert_cate")
public class ConcertCateVo {
    int concert_cate_idx;
    String concert_cate_name;

    // 세부 카테고리
    ConcertDetailCateVo concertDetailCateVo;
}
