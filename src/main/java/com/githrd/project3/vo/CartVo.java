package com.githrd.project3.vo;

import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.NoArgsConstructor;

@Alias("cart")
@NoArgsConstructor
@Data
public class CartVo {

  int cart_idx;
  int mem_idx;
  int performance_idx;
  String reserved_performance_date;

  // 조인용 변수
  String performance_image;
  String performance_name;
  String hall_name;

  List<Cart_seatVo> seatList;

}
