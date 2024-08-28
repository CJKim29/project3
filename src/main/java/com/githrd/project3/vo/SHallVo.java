package com.githrd.project3.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Alias("s_hall")
public class SHallVo {
    int s_hall_idx;
    int concert_date_idx;
    int seat_idx;
    int s_hall_row_no;
    int s_hall_a;
    int s_hall_b;
    int s_hall_c;
    int s_hall_d;
    int s_hall_e;
    int s_hall_f;
    int s_hall_g;
    int s_hall_h;
    int s_hall_i;
    int s_hall_j;
}
