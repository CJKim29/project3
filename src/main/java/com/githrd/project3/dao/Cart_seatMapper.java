package com.githrd.project3.dao;

import org.apache.ibatis.annotations.Mapper;

import com.githrd.project3.vo.Cart_seatVo;

@Mapper
public interface Cart_seatMapper {

  // 장바구니 좌석 등록
  int cart_seat_insert(Cart_seatVo vo);
}
