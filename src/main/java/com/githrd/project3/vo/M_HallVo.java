package com.githrd.project3.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Alias("m_hall")
public class M_HallVo {

    int m_hall_idx;
    int performance_date_idx;
    int seat_idx;
    int m_hall_row_no;
    int m_hall_a;
    int m_hall_b;
    int m_hall_c;
    int m_hall_d;
    int m_hall_e;
    int m_hall_f;
    int m_hall_g;
    int m_hall_h;
    int m_hall_i;
    int m_hall_j;
    int m_hall_k;
    int m_hall_l;
    int m_hall_m;
    int m_hall_n;
    int m_hall_o;

    SeatVo seatVo;
    PerformanceDateVo performanceDateVo;
}
