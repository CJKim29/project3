package com.githrd.project3.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.githrd.project3.vo.CartVo;

@Mapper
public interface CartMapper {

  // 장바구니 목록 조회
  List<CartVo> cart_list(int mem_idx);

  CartVo select_one_cart(int cart_idx);

  // 장바구니 등록
  int cart_insert(CartVo vo);

  // 최근 등록된 장바구니 가져오기(장바구니 좌석 등록을 위함)
  int cart_recent_idx();

  // 장바구니 삭제
  int cart_delete(int cart_idx);

  // seat_idx값 조회
  int selectOne_seat_idx(int performance_idx, int row);

  int select_performance_cate_idx(int performance_idx);

  int selectOne_seat_idx_m(int performance_idx, int row);

  int selectOne_seat_idx_s(int performance_idx, int row);

  int selectOne_seat_idx_l(int performance_idx, int row);

}
