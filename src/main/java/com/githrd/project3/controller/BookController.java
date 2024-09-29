package com.githrd.project3.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.githrd.project3.dao.BookMapper;
import com.githrd.project3.dao.L_HallMapper;
import com.githrd.project3.dao.M_HallMapper;
import com.githrd.project3.dao.S_HallMapper;
import com.githrd.project3.vo.L_HallVo;
import com.githrd.project3.vo.M_HallVo;
import com.githrd.project3.vo.MemberVo;
import com.githrd.project3.vo.OrdersSeatVo;
import com.githrd.project3.vo.OrdersVo;
import com.githrd.project3.vo.PerformanceVo;
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

  PerformanceVo vo = book_mapper.selectOneFromIdx(performance_idx);

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

  PerformanceVo vo = book_mapper.selectOneFromIdx(performance_idx);

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

 @RequestMapping("/reserve_seats.do")
 public String reserveSeats(OrdersVo ordersVo, int performance_idx, String selectedSeats,
   @RequestParam("date") String performance_date,
   @RequestParam("seatInfo") List<String> seatInfo, Model model) {

  // System.out.println("---[ordersVo]----------------------------------------------------------------------------");
  // System.out.println(ordersVo);

  // System.out.println("---[selectedSeats]-----------------------------------------------------------------------");
  // System.out.println(selectedSeats);

  // System.out.println("---[seatInfo]-----------------------------------------------------------------------------");
  // System.out.println(seatInfo);

  // System.out.println("---[performance_date]---------------------------------------------------------------------");
  // System.out.println(performance_date);

  // System.out.println("---[performance_idx]----------------------------------------------------------------------");
  // System.out.println(performance_idx);

  MemberVo user = (MemberVo) session.getAttribute("user");

  // 공연 정보 조회
  PerformanceVo vo = book_mapper.selectOneFromIdx(performance_idx);
  model.addAttribute("vo", vo);
  model.addAttribute("seatInfo", seatInfo);

  // performance_date_idx를 구합니다.
  Integer performance_date_idx = book_mapper.getPerformanceDateIdx(performance_idx, performance_date);
  if (performance_date_idx == null) {
   // performance_date_idx가 null일 경우 처리
   return "errorPage";
  }
  // 선택된 좌석 정보 파싱
  ObjectMapper mapper = new ObjectMapper();
  List<Map<String, Object>> selectedSeats1;
  try {
   selectedSeats1 = mapper.readValue(selectedSeats, new TypeReference<List<Map<String, Object>>>() {
   });
  } catch (IOException e) {
   e.printStackTrace();
   return "errorPage";
  }

  if (vo.getPerformance_cate_idx() == 1) {
   // 선택된 좌석을 업데이트
   for (Map<String, Object> seat : selectedSeats1) {
    int row = ((Number) seat.get("row")).intValue();
    String col = (String) seat.get("col");
    m_hall_mapper.updateSeatStatus(performance_date_idx, row, col);
   }
  }
  if (vo.getPerformance_cate_idx() == 2) {
   // 선택된 좌석을 업데이트
   for (Map<String, Object> seat : selectedSeats1) {
    int row = ((Number) seat.get("row")).intValue();
    String col = (String) seat.get("col");
    s_hall_mapper.updateSeatStatus(performance_date_idx, row, col);
   }
  }
  if (vo.getPerformance_cate_idx() == 3) {
   // 선택된 좌석을 업데이트
   for (Map<String, Object> seat : selectedSeats1) {
    int row = ((Number) seat.get("row")).intValue();
    String col = (String) seat.get("col");
    l_hall_mapper.updateSeatStatus(performance_date_idx, row, col);
   }
  }

  // "date" 값을 ordersVo에 설정
  ordersVo.setReserved_performance_date(performance_date);

  // 주문 정보 DB insert
  int res = book_mapper.ordersInsert(ordersVo);

  // 최근 주문 번호 얻어오기
  int order_idx = book_mapper.OrderRecentIdx();

  // 공연 카테고리 인덱스 조회
  int performance_cate_idx = book_mapper.selectOnePerformanceCateIdx(ordersVo.getPerformance_idx());

  // 좌석등록(반복문 - 최대 4좌석 등록을 위함 - 2차 등록)
  for (String seat : seatInfo) {
   // "x열x석" 형식에서 "열"과 "석"으로 분리
   String[] seatParts = seat.split("열|석");

   int row = Integer.parseInt(seatParts[0]); // "열" 앞의 숫자 (예: "3")

   int seat_idx = 0;

   // 카테고리에 따라 다른 메서드 호출
   switch (performance_cate_idx) {
    case 1: // 중형(뮤지컬)
     seat_idx = book_mapper.selectOneSeatIdxM(ordersVo.getPerformance_idx(), row);
     break;
    case 2: // 소형(연극)
     seat_idx = book_mapper.selectOneSeatIdxS(ordersVo.getPerformance_idx(), row);
     break;
    case 3: // 대형(콘서트)
     seat_idx = book_mapper.selectOneSeatIdxL(ordersVo.getPerformance_idx(), row);
     break;
   }

   OrdersSeatVo ordersSeatVo = new OrdersSeatVo();
   ordersSeatVo.setOrder_idx(order_idx);
   ordersSeatVo.setSeat_idx(seat_idx);
   ordersSeatVo.setOrder_seat_name(seat);

   // 좌석 정보 삽입
   book_mapper.ordersSeatInsert(ordersSeatVo);
  }

  // 주문 리스트 가져옴
  Map<String, Object> map = new HashMap<>();
  map.put("mem_idx", user.getMem_idx());
  map.put("performance_idx", performance_idx);
  map.put("order_idx", order_idx);

  List<OrdersVo> list = book_mapper.ordersList(map);

  model.addAttribute("list", list);
  model.addAttribute("ordersVo", ordersVo); // JSP에 전달

  return "/payment/payment_check";
 }

 // @RequestMapping("agree.do")
 // public String agree(OrdersVo ordersVo,
 // @RequestParam("performance_idx") int performance_idx,
 // @RequestParam("used_point2") String used_point2,
 // @RequestParam("order_idx") int order_idx,
 // Model model, RedirectAttributes ra) {

 // // session에서 사용자 정보 가져오기
 // MemberVo user = (MemberVo) session.getAttribute("user");
 // if (user == null) {
 // ra.addAttribute("reason", "session_timeout");
 // return "redirect:../member/login_form.do";
 // }

 // // 공연 정보 조회
 // PerformanceVo vo = book_mapper.selectOneFromIdx(performance_idx);
 // model.addAttribute("vo", vo);

 // // order_idx를 사용하여 해당 주문 정보 조회
 // OrdersVo order = ordersMapper.getOrderById(orderIdx);
 // model.addAttribute("recentOrder", order);

 // // 최근 주문 번호 얻어오기
 // int order_idx = book_mapper.OrderRecentIdx();

 // Map<String, Object> map = new HashMap<>();
 // map.put("mem_idx", user.getMem_idx());
 // map.put("performance_idx", performance_idx);
 // map.put("order_idx", order_idx);
 // List<OrdersVo> list = book_mapper.ordersList(map);

 // model.addAttribute("list", list);
 // model.addAttribute("ordersVo", ordersVo);
 // model.addAttribute("used_point2", used_point2);

 // return "/payment/payment_agree";
 // }

 @RequestMapping("agree.do")
 public String agree(OrdersVo ordersVo,
   @RequestParam("performance_idx") int performance_idx,
   @RequestParam("used_point2") String used_point2,
   @RequestParam("total_payment") String total_payment,
   Model model, RedirectAttributes ra) {

  // session에서 사용자 정보 가져오기
  MemberVo user = (MemberVo) session.getAttribute("user");
  if (user == null) {
   ra.addAttribute("reason", "session_timeout");
   return "redirect:../member/login_form.do";
  }

  // 공연 정보 조회
  PerformanceVo vo = book_mapper.selectOneFromIdx(performance_idx);
  model.addAttribute("vo", vo);

  // 최근 주문 번호 얻어오기
  int order_idx = book_mapper.OrderRecentIdx();

  Map<String, Object> map = new HashMap<>();
  map.put("mem_idx", user.getMem_idx());
  map.put("performance_idx", performance_idx);
  map.put("order_idx", order_idx);
  List<OrdersVo> list = book_mapper.ordersList(map);

  model.addAttribute("list", list);
  model.addAttribute("ordersVo", ordersVo);

  // JSON 문자열을 파싱
  // ObjectMapper objectMapper = new ObjectMapper();
  // try {
  // List<String> seatGrades = objectMapper.readValue(seat_grade, new
  // TypeReference<List<String>>() {
  // });
  // List<Integer> seatPrices = objectMapper.readValue(seat_price, new
  // TypeReference<List<Integer>>() {
  // });
  // // 필요한 데이터 처리
  // model.addAttribute("seatGrades", seatGrades);
  // model.addAttribute("seatPrices", seatPrices);
  // } catch (JsonProcessingException e) {
  // // 에러 로그를 남기거나 사용자에게 알림 처리
  // System.out.println("JSON 파싱 중 오류 발생: " + e.getMessage());
  // return "redirect:/errorPage"; // 에러 페이지로 리다이렉트
  // }
  model.addAttribute("used_point2", used_point2);
  model.addAttribute("total_payment", total_payment);
  System.out.println("Total Payment: " + total_payment);

  return "/payment/payment_agree";
 }

 @PostMapping("/book_reservation.do")
 public String bookResult(@RequestParam("seatInfo") List<String> seatInfo,
   @RequestParam("performance_idx") int performance_idx,
   @RequestParam("reserved_performance_date") String performance_date, Model model) {

  PerformanceVo vo = book_mapper.selectOneFromIdx(performance_idx);

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

}
