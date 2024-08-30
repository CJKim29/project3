package com.githrd.project3.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Alias("concert_detail_cate")
public class ConcertDetailCateVo {

    int concert_detail_cate_idx;
    String concert_detail_cate_name;

}
