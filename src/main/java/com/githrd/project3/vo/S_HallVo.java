package com.githrd.project3.vo;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.Alias;

@Data
@NoArgsConstructor
@Alias("s_hall")
public class S_HallVo {

    private int s_hall_idx;
    private int performance_date_idx;
    private int seat_idx;
    private int s_hall_row_no;
    private int s_hall_a;
    private int s_hall_b;
    private int s_hall_c;
    private int s_hall_d;
    private int s_hall_e;
    private int s_hall_f;
    private int s_hall_g;
    private int s_hall_h;
    private int s_hall_i;
    private int s_hall_j;

    SeatVo seatVo;
    PerformanceDateVo performanceDateVo;
}
