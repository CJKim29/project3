package com.githrd.project3.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.NoArgsConstructor;

@Alias("cart_seat")
@NoArgsConstructor
@Data
public class Cart_seatVo {

  int cart_seat_idx;
  int cart_idx;
  int seat_idx;
  String cart_seat_name;
  int reserved; // 예매 여부 (검증용 변수)

  // 조인용 변수
  String seat_grade;
  int seat_price;

  
}
