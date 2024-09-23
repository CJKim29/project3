package com.githrd.project3.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.githrd.project3.dao.BookMapper;
import com.githrd.project3.dao.CartMapper;
import com.githrd.project3.dao.Cart_seatMapper;
import com.githrd.project3.dao.L_HallMapper;
import com.githrd.project3.dao.M_HallMapper;
import com.githrd.project3.dao.S_HallMapper;
import com.githrd.project3.vo.CartVo;
import com.githrd.project3.vo.Cart_seatVo;
import com.githrd.project3.vo.MemberVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/cart/")
public class CartController {

  @Autowired
  HttpServletRequest request;

  @Autowired
  HttpSession session;

  @Autowired
  CartMapper cart_mapper;

  @Autowired
  Cart_seatMapper cart_seat_mapper;

  @Autowired
  BookMapper book_mapper;

  @Autowired
  S_HallMapper s_hall_mapper;

  @Autowired
  M_HallMapper m_hall_mapper;

  @Autowired
  L_HallMapper l_hall_mapper;

  @RequestMapping("list.do")
  public String list(Model model) {

    MemberVo user = (MemberVo) session.getAttribute("user");

    // 장바구니 목록 가져오기
    List<CartVo> list = cart_mapper.cart_list(user.getMem_idx());

    model.addAttribute("list", list);

    return "cart/cart_list";
  }

  @RequestMapping("insert.do")
  public String insert(@RequestParam("seatInfo") List<String> seatInfo, CartVo cartVo) {

    System.out.println(cartVo.getReserved_performance_date());

    int res = cart_mapper.cart_insert(cartVo);

    // 최근장바구니 번호 얻어오기
    int cart_idx = cart_mapper.cart_recent_idx();
    System.out.println(cart_idx);

    // 좌석등록(반복문)
    for (String seat : seatInfo) {
      Cart_seatVo vo = new Cart_seatVo();

      vo.setCart_idx(cart_idx); // 최근 등록된 cart_idx 사용
      vo.setSeat_idx(1); // seat_idx 설정 (필요 시 파싱)
      vo.setCart_seat_name(seat);

      // 좌석 정보 삽입
      cart_seat_mapper.cart_seat_insert(vo);
    }
    return "redirect:list.do";
  }
}
