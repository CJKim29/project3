package com.githrd.project3.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Alias("hall")
public class HallVo {

    int hall_idx;
    String hall_name;
    String hall_area;
    String hall_addr;
    String hall_tel;
    String hall_site;
    int hall_seat;
    String hall_image;
}