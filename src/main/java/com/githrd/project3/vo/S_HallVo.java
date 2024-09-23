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
    private int a;
    private int b;
    private int c;
    private int d;
    private int e;
    private int f;
    private int g;
    private int h;
    private int i;
    private int j;

    SeatVo seatVo;
    PerformanceDateVo performanceDateVo;
}
