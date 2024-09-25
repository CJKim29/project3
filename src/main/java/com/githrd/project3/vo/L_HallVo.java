package com.githrd.project3.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Alias("l_hall")
public class L_HallVo {

    int l_hall_idx;
    int performance_date_idx;
    int seat_idx;
    int l_hall_row_no;
    int l_hall_a;
    int l_hall_b;
    int l_hall_c;
    int l_hall_d;
    int l_hall_e;
    int l_hall_f;
    int l_hall_g;
    int l_hall_h;
    int l_hall_i;
    int l_hall_j;
    int l_hall_k;
    int l_hall_l;
    int l_hall_m;
    int l_hall_n;
    int l_hall_o;
    int l_hall_p;
    int l_hall_q;
    int l_hall_r;
    int l_hall_s;
    int l_hall_t;

    SeatVo seatVo;
    PerformanceDateVo performanceDateVo;
}
