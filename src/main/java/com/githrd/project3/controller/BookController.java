package com.githrd.project3.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.githrd.project3.dao.BookMapper;
import com.githrd.project3.dao.L_HallMapper;
import com.githrd.project3.dao.M_HallMapper;
import com.githrd.project3.dao.S_HallMapper;
import com.githrd.project3.vo.L_HallVo;
import com.githrd.project3.vo.M_HallVo;
import com.githrd.project3.vo.MemberVo;
import com.githrd.project3.vo.OrdersVo;
import com.githrd.project3.vo.S_HallVo;
import com.githrd.project3.vo.X_PerformanceVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/book/")
public class BookController {
 // 자동연결(요청시 마다 Injection)
 @Autowired
 HttpServletRequest request;

 @Autowired
 HttpSession session;

 // 처음에 1회 연결
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

  // 회원목록 가져오기
  List<X_PerformanceVo> list = book_mapper.selectList();

  // request binding
  model.addAttribute("list", list);

  return "book/book_list";
 }

 @RequestMapping("performance_page.do")
 public String performance_page(int performance_idx, Model model) {

  X_PerformanceVo vo = book_mapper.selectOneFromIdx(performance_idx);

  model.addAttribute("vo", vo);

  return "/book/book_page";
 }

 @RequestMapping("performance_seat.do")
 public String performance_seat(
   @RequestParam("performance_idx") int performance_idx,
   @RequestParam("date") String performance_date,
   Model model) {

  // performance_idx와 date 값 사용 가능
  model.addAttribute("performance_idx", performance_idx);
  model.addAttribute("performance_date", performance_date);

  X_PerformanceVo vo = book_mapper.selectOneFromIdx(performance_idx);

  model.addAttribute("vo", vo);
  // 뮤지컬(1)은 중극장 좌석(m_hall)으로 조회
  if (vo.getPerformance_cate_idx() == 1) {

   List<M_HallVo> seats = m_hall_mapper.selectSeatsByPerformanceAndDate(performance_idx, performance_date);

   model.addAttribute("seats", seats);

   Integer performance_date_idx = book_mapper.selectPerformanceDateIdx(performance_date, performance_idx);

   if (performance_date_idx == null) {
    // performance_date_idx가 null일 경우 처리
    model.addAttribute("error", "Invalid performance date or performance ID.");
    return "book/book_seat_m";
   }

   List<Map<String, Object>> seatList = book_mapper.countSeatIdx(performance_idx);
   for (Map<String, Object> seat : seatList) {
    int seat_idx = (int) seat.get("seat_idx");
    int zeroCount = book_mapper.selectRemainSeat_M(performance_date_idx, seat_idx);

    seat.put("remaining_seats", zeroCount); // 남은 좌석 수 추가
   }
   model.addAttribute("seatList", seatList);

   return "book/book_seat_m";
  }

  // 연극(2)은 소극장 좌석(s_hall)으로 조회
  if (vo.getPerformance_cate_idx() == 2) {

   List<S_HallVo> seats = s_hall_mapper.selectSeatsByPerformanceAndDate(performance_idx, performance_date);

   model.addAttribute("seats", seats);

   Integer performance_date_idx = book_mapper.selectPerformanceDateIdx(performance_date, performance_idx);

   if (performance_date_idx == null) {
    // performance_date_idx가 null일 경우 처리
    model.addAttribute("error", "Invalid performance date or performance ID.");
    return "book/book_seat_s";
   }

   List<Map<String, Object>> seatList = book_mapper.countSeatIdx(performance_idx);
   for (Map<String, Object> seat : seatList) {
    int seat_idx = (int) seat.get("seat_idx");
    int zeroCount = book_mapper.selectRemainSeat_S(performance_date_idx, seat_idx);

    seat.put("remaining_seats", zeroCount); // 남은 좌석 수 추가
   }
   model.addAttribute("seatList", seatList);

   return "book/book_seat_s";
  }

  // 콘서트는 대극장 좌석으로 조회
  if (vo.getPerformance_cate_idx() == 3) {

   List<L_HallVo> seats = l_hall_mapper.selectSeatsByPerformanceAndDate(performance_idx, performance_date);

   model.addAttribute("seats", seats);

   Integer performance_date_idx = book_mapper.selectPerformanceDateIdx(performance_date, performance_idx);

   if (performance_date_idx == null) {
    // performance_date_idx가 null일 경우 처리
    model.addAttribute("error", "Invalid performance date or performance ID.");
    return "book/book_seat_l";
   }

   List<Map<String, Object>> seatList = book_mapper.countSeatIdx(performance_idx);
   for (Map<String, Object> seat : seatList) {
    int seat_idx = (int) seat.get("seat_idx");
    int zeroCount = book_mapper.selectRemainSeat_L(performance_date_idx, seat_idx);

    seat.put("remaining_seats", zeroCount); // 남은 좌석 수 추가
   }
   model.addAttribute("seatList", seatList);

   return "book/book_seat_l";
  }

  return "book/book_list";

 } // end - performance_seat

 @PostMapping("/reserve_seats.do")
 public String reserveSeats(@RequestParam("performance_idx") int performance_idx,
   @RequestParam("date") String performance_date,
   @RequestParam("selectedSeats") String selectedSeatsJson,
   @RequestParam("seatInfo") List<String> seatInfo,
   Model model) {

  // 공연 정보 조회
  X_PerformanceVo vo = book_mapper.selectOneFromIdx(performance_idx);
  model.addAttribute("vo", vo);

  if (vo.getPerformance_cate_idx() == 1) {
   List<M_HallVo> seats = m_hall_mapper.selectSeatsByPerformanceAndDate(performance_idx, performance_date);

   model.addAttribute("seats", seats);
  }
  if (vo.getPerformance_cate_idx() == 2) {
   List<S_HallVo> seats = s_hall_mapper.selectSeatsByPerformanceAndDate(performance_idx,
     performance_date);

   model.addAttribute("seats", seats);
  }
  if (vo.getPerformance_cate_idx() == 3) {
   List<L_HallVo> seats = l_hall_mapper.selectSeatsByPerformanceAndDate(performance_idx,
     performance_date);

   model.addAttribute("seats", seats);
  }

  // 좌석 정보 model을 통해 jsp로 전달
  model.addAttribute("seatInfo", seatInfo);

  // performance_date_idx를 구합니다.
  Integer performance_date_idx = book_mapper.getPerformanceDateIdx(performance_idx, performance_date);

  if (performance_date_idx == null) {
   // performance_date_idx가 null일 경우 처리
   return "errorPage";
  }

  // 선택된 좌석 정보 파싱
  ObjectMapper mapper = new ObjectMapper();
  List<Map<String, Object>> selectedSeats;
  try {
   selectedSeats = mapper.readValue(selectedSeatsJson, new TypeReference<List<Map<String, Object>>>() {
   });
  } catch (IOException e) {
   e.printStackTrace();
   return "errorPage";
  }

  if (vo.getPerformance_cate_idx() == 1) {
   // 선택된 좌석을 업데이트
   for (Map<String, Object> seat : selectedSeats) {
    int row = ((Number) seat.get("row")).intValue();
    String col = (String) seat.get("col");
    m_hall_mapper.updateSeatStatus(performance_date_idx, row, col);
   }
  }
  if (vo.getPerformance_cate_idx() == 2) {
   // 선택된 좌석을 업데이트
   for (Map<String, Object> seat : selectedSeats) {
    int row = ((Number) seat.get("row")).intValue();
    String col = (String) seat.get("col");
    s_hall_mapper.updateSeatStatus(performance_date_idx, row, col);
   }
  }
  if (vo.getPerformance_cate_idx() == 3) {
   // 선택된 좌석을 업데이트
   for (Map<String, Object> seat : selectedSeats) {
    int row = ((Number) seat.get("row")).intValue();
    String col = (String) seat.get("col");
    l_hall_mapper.updateSeatStatus(performance_date_idx, row, col);
   }
  }

  System.out.println("seatInfo = " + seatInfo);
  System.out.println("performance_date = " + performance_date);

  return "/payment/payment_check";
 }

 @PostMapping("/book_reservation.do")
 public String bookResult(@RequestParam("seatInfo") List<String> seatInfo,
   @RequestParam("performance_idx") int performance_idx,
   @RequestParam("date") String performance_date, Model model) {

  X_PerformanceVo vo = book_mapper.selectOneFromIdx(performance_idx);

  model.addAttribute("vo", vo);

  if (vo.getPerformance_cate_idx() == 1) {
   List<M_HallVo> seats = m_hall_mapper.selectSeatsByPerformanceAndDate(performance_idx,
     performance_date);

   model.addAttribute("seats", seats);
  }
  if (vo.getPerformance_cate_idx() == 2) {
   List<S_HallVo> seats = s_hall_mapper.selectSeatsByPerformanceAndDate(performance_idx,
     performance_date);

   model.addAttribute("seats", seats);
  }
  if (vo.getPerformance_cate_idx() == 3) {
   List<L_HallVo> seats = l_hall_mapper.selectSeatsByPerformanceAndDate(performance_idx,
     performance_date);

   model.addAttribute("seats", seats);
  }

  // 좌석 정보 처리
  model.addAttribute("seatInfo", seatInfo);
  return "/mypage/my_reservation"; // book_result.jsp로 이동
 }

 @RequestMapping("payment_agree.do")
 public String payment_agree(
   @RequestParam("performance_idx") int performance_idx,
   @RequestParam("date") String performance_date,
   @RequestParam("selectedSeats") String selectedSeatsJson,
   @RequestParam("seatInfo") List<String> seatInfo,
   Model model, RedirectAttributes ra) {

  // session 만료 시 로그아웃 시키기 -> 로그인 폼으로 이동
  MemberVo user = (MemberVo) session.getAttribute("user");
  if (user == null) {

   ra.addAttribute("reason", "session_timeout");

   return "redirect:../member/login_form.do";
  }

  // 공연 정보 조회
  X_PerformanceVo vo = book_mapper.selectOneFromIdx(performance_idx);

  model.addAttribute("vo", vo);
  // 이거 써야 좌석 정보 가져와짐
  model.addAttribute("selectedSeats", selectedSeatsJson);
  model.addAttribute("seatInfo", seatInfo);

  // ----------------------- 주문 정보 관련----------------------------

  // 주문 정보를 담기 위한 OrdersVo 객체 생성
  OrdersVo ordersVo = new OrdersVo();

  ordersVo.setPerformance_idx(performance_idx);
  ordersVo.setMem_idx(user.getMem_idx());
  // ordersVo.setOrder_date(new Timestamp(System.currentTimeMillis()));
  // ordersVo.setOrder_amount( /* 금액 계산 로직을 여기에 추가하세요 */ );

  // 여기서 seat_idx는 반드시 세팅되어야 합니다. 여러 좌석이 있다면 이를 처리하는 로직이 필요합니다.
  // ordersVo.setSeat_idx(여기에 좌석 아이디);

  // 주문 정보 DB insert
  book_mapper.ordersInsert(ordersVo);

  // INSERT 후 생성된 `order_idx` 가져오기
  int order_idx = ordersVo.getOrder_idx(); // MyBatis의 `ordersInsert`가 이 값을 리턴하게끔 설정

  // 생성된 주문 번호를 모델에 추가해 JSP에서 사용할 수 있도록 전달
  model.addAttribute("order_idx", order_idx);

  return "/payment/payment_agree";
 }

 // 결체창 띄우기
 // @RequestMapping("payment.do")
 // public String payment() {

 // return "/payment/payment";
 // }

}
