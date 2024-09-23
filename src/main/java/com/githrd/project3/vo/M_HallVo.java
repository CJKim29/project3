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
  int a;
  int b;
  int c;
  int d;
  int e;
  int f;
  int g;
  int h;
  int i;
  int j;
  int k;
  int l;
  int m;
  int n;
  int o;

  SeatVo seatVo;
  PerformanceDateVo performanceDateVo;
}
