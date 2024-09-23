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
  int p;
  int q;
  int r;
  int s;
  int t;

  SeatVo seatVo;
  PerformanceDateVo performanceDateVo;
}
