package com.githrd.project3.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
    // 회원 별 장바구니 목록 가져오기
    List<CartVo> list = cart_mapper.cart_list(user.getMem_idx());
    model.addAttribute("list", list);
    return "cart/cart_list";
  }

  @RequestMapping("insert.do")
  public String insert(@RequestParam("seatInfo") List<String> seatInfo, CartVo cartVo) {
    // 장바구니 정보 먼저 등록(유저, 공연 정보 - 1차 등록)
    int res = cart_mapper.cart_insert(cartVo);

    // 최근장바구니 번호 얻어오기
    int cart_idx = cart_mapper.cart_recent_idx();

    // 공연 카테고리 인덱스 조회
    int performance_cate_idx = cart_mapper.select_performance_cate_idx(cartVo.getPerformance_idx());

    // 좌석등록(반복문 - 최대 4좌석 등록을 위함 - 2차 등록)
    for (String seat : seatInfo) {
      // "x열x석" 형식에서 "열"과 "석"으로 분리
      String[] seatParts = seat.split("열|석");

      int row = Integer.parseInt(seatParts[0]); // "열" 앞의 숫자 (예: "3")

      int seat_idx = 0;

      // 카테고리에 따라 다른 메서드 호출
      switch (performance_cate_idx) {
        case 1: // 중형(뮤지컬)
          seat_idx = cart_mapper.selectOne_seat_idx_m(cartVo.getPerformance_idx(), row);
          break;
        case 2: // 소형(연극)
          seat_idx = cart_mapper.selectOne_seat_idx_s(cartVo.getPerformance_idx(), row);
          break;
        case 3: // 대형(콘서트)
          seat_idx = cart_mapper.selectOne_seat_idx_l(cartVo.getPerformance_idx(), row);
          break;
      }

      Cart_seatVo vo = new Cart_seatVo();
      vo.setCart_idx(cart_idx);
      vo.setSeat_idx(seat_idx);
      vo.setCart_seat_name(seat);
      System.out.println("seat:" + seat);

      // 좌석 정보 삽입
      cart_seat_mapper.cart_seat_insert(vo);
    }
    return "redirect:list.do";
  }

  @RequestMapping("delete.do")
  public String delete(int cart_idx) {

    int res = cart_mapper.cart_delete(cart_idx);

    return "redirect:list.do";
  }

  @ResponseBody // Ajax 응답을 위한 어노테이션 추가
  @RequestMapping("check_seat.do")
  public String check_seat(@RequestParam("cart_idx") int cartIdx) {
    // 1. 장바구니 내 좌석 정보 가져오기
    List<Cart_seatVo> seatList = cart_seat_mapper.cart_seat_reserved_check(cartIdx);

    // 2. 좌석의 예매 여부 확인
    boolean hasReservedSeats = seatList.stream().anyMatch(seat -> seat.getReserved() == 1);

    // 3. 예매된 좌석이 있으면 "reserved" 응답
    if (hasReservedSeats) {
      cart_mapper.cart_delete(cartIdx); // 장바구니 삭제
      return "reserved"; // 예매된 좌석이 있음을 나타내는 응답
    }

    // 4. 예매된 좌석이 없으면 "available" 응답
    return "available"; // 결제 가능한 상태
  }

  // 테스트
  @RequestMapping("payment.do")
  public String payment(@RequestParam("cart_idx") int cart_idx, Model model) {
    model.addAttribute("cart_idx", cart_idx);
    return "cart/testPayment"; // 테스트용 결제 페이지
  }

}