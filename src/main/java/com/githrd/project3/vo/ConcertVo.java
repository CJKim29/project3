package com.githrd.project3.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Alias("concert")
public class ConcertVo {

    int concert_idx;

    String concert_name;
    String concert_startday;
    String concert_endday;
    String concert_runtime;
    String concert_image;
    int concert_age;

    int concert_cate_idx;
    int hall_idx;

    HallVo hallVo;

}
