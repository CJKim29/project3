package com.githrd.project3.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.githrd.project3.vo.Cart_seatVo;

@Mapper
public interface Cart_seatMapper {

  // 장바구니 좌석 등록
  int cart_seat_insert(Cart_seatVo vo);

  List<Cart_seatVo> cart_seat_select_one(int cart_idx);

  int cart_seat_reserved_check_m(Map<String, Object> reserve_map);

  int cart_seat_reserved_check_s(Map<String, Object> reserve_map);

  int cart_seat_reserved_check_l(Map<String, Object> reserve_map);
}
