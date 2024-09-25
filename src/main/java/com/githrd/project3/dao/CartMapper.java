package com.githrd.project3.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.githrd.project3.vo.CartVo;
import com.githrd.project3.vo.PerformanceVo;
import com.githrd.project3.vo.X_PerformanceVo;

@Mapper
public interface CartMapper {

    // 장바구니 목록 조회
    List<CartVo> cart_list();

    // 장바구니 등록
    int cart_insert(CartVo vo);

    // 장바구니 삭제
    int cart_delete(int cart_idx);

    // 장바구니 등록시, 예약여부를 '1'로 변경
    int cart_update_use(int cart_idx);

    X_PerformanceVo select_one_from_idx(int performance_idx);
}
