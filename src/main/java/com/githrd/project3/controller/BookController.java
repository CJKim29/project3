package com.githrd.project3.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.githrd.project3.dao.BookMapper;
import com.githrd.project3.dao.CartMapper;
import com.githrd.project3.dao.Cart_seatMapper;
import com.githrd.project3.dao.L_HallMapper;
import com.githrd.project3.dao.M_HallMapper;
import com.githrd.project3.dao.MemberMapper;
import com.githrd.project3.dao.S_HallMapper;
import com.githrd.project3.vo.Cart_seatVo;
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
 CartMapper cart_mapper;
 @Autowired
 Cart_seatMapper cart_seat_mapper;

 @Autowired
 HttpSession session;

 // 처음에 1회 연결
 @Autowired
 BookMapper book_mapper;

 @Autowired
 MemberMapper member_mapper;

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
 public String reserveSeats(
   OrdersVo ordersVo,
   String selectedSeats,
   @RequestParam("performance_idx") int performance_idx,
   @RequestParam("date") String performance_date,
   @RequestParam("seatInfo") List<String> seatInfo,
   @RequestParam(value = "cart_idx", required = false) Integer cart_idx, Model model) {

  // 세션에서 회원 정보 가져옴
  MemberVo user = (MemberVo) session.getAttribute("user");
  int mem_idx = user.getMem_idx();

  // 회원 정보를 가져옴
  MemberVo member = member_mapper.selectOneFromIdx(mem_idx);

  // 회원 포인트 추출
  int mem_point = member.getMem_point(); // MemberVo 객체에서 포인트를 추출
  model.addAttribute("mem_point", mem_point);

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
  // 장바구니를 통해 넘어온 경우 cart_idx가 존재함
  if (cart_idx != null) {
   // 장바구니에서 넘어온 요청일 경우 처리 (예: 장바구니에서 좌석 정보 가져오기)
   List<Cart_seatVo> seatList = cart_seat_mapper.cart_seat_select_one(cart_idx);
   for (Cart_seatVo cart_seatVo : seatList) {
    seatInfo.add(cart_seatVo.getCart_seat_name());
    int row = Integer.parseInt(cart_seatVo.getCart_seat_name().split("열|석")[0]); // "열" 앞의 숫자 (예: "3")
    String col = cart_seatVo.getCart_seat_name().split("열|석")[1].toLowerCase(); // "석" 앞의 문자 (예: "B")
    switch (vo.getPerformance_cate_idx()) {
     case 1:
      m_hall_mapper.updateSeatStatus(performance_date_idx, row, col);
      break;
     case 2:
      s_hall_mapper.updateSeatStatus(performance_date_idx, row, col);
      break;
     case 3:
      l_hall_mapper.updateSeatStatus(performance_date_idx, row, col);
      break;
    }
    // 장바구니에서 삭제
    cart_mapper.cart_delete(cart_idx);
   }
  } else {
   // 바로 예약한 경우 처리
   ObjectMapper mapper = new ObjectMapper();
   List<Map<String, Object>> selectedSeatsList;
   try {
    selectedSeatsList = mapper.readValue(selectedSeats, new TypeReference<List<Map<String, Object>>>() {
    });
   } catch (IOException e) {
    e.printStackTrace();
    return "errorPage";
   }
   // 선택된 좌석 업데이트
   for (Map<String, Object> seat : selectedSeatsList) {
    int row = ((Number) seat.get("row")).intValue();
    String col = (String) seat.get("col");
    // 카테고리에 따른 처리
    switch (vo.getPerformance_cate_idx()) {
     case 1:
      m_hall_mapper.updateSeatStatus(performance_date_idx, row, col);
      break;
     case 2:
      s_hall_mapper.updateSeatStatus(performance_date_idx, row, col);
      break;
     case 3:
      l_hall_mapper.updateSeatStatus(performance_date_idx, row, col);
      break;
    }
   }
  }

  // "date" 값을 ordersVo에 설정
  ordersVo.setReserved_performance_date(performance_date);
  ordersVo.setMem_idx(mem_idx);

  // 주문 정보 DB insert
  int res = book_mapper.ordersInsert(ordersVo);
  // System.out.println("주문 삽입 결과: " + res);
  // System.out.println("주문 인덱스: " + ordersVo.getOrder_idx());
  // session에 주문 정보 저장
  // 데이터베이스에서 생성된 주문 정보를 다시 가져오기
  OrdersVo createdOrder = book_mapper.selectOneOrderIdx(ordersVo.getOrder_idx());
  // 세션에 주문 정보를 저장
  session.setAttribute("order", createdOrder);
  System.out.println("주문 정보가 세션에 저장되었습니다 : " + createdOrder);

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
     seat_idx = book_mapper.selectOneSeatIdxM(performance_date_idx, row);
     break;
    case 2: // 소형(연극)
     seat_idx = book_mapper.selectOneSeatIdxS(performance_date_idx, row);
     break;
    case 3: // 대형(콘서트)
     seat_idx = book_mapper.selectOneSeatIdxL(performance_date_idx, row);
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
  model.addAttribute("ordersVo", ordersVo);
  model.addAttribute("order_idx", order_idx);
  model.addAttribute("performance_idx", performance_idx);

  return "/payment/payment_check";
 }

 @RequestMapping("agree.do")
 public String agree(OrdersVo ordersVo,
   @RequestParam("performance_idx") int performance_idx,
   @RequestParam("used_point2") String used_point2,
   @RequestParam("total_payment") String total_payment,
   @RequestParam("order_idx") int order_idx,
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
  order_idx = book_mapper.OrderRecentIdx();

  // 파라미터로 받은 "total_payment" 값을 ordersVo의 order_amount에 저장하기
  // 숫자만 추출 -> "," 와 "원" 제거
  String total_payment_number = total_payment.replace(",", "").replace("원", "");
  // String -> int로 변환
  int int_total_payment = Integer.parseInt(total_payment_number);

  // 파라미터로 받은 "used_point2"을 ordersVo의 used_point에 저장하기
  String used_point2_number = used_point2.replace(",", "").replace("P", "");
  int int_used_point2 = Integer.parseInt(used_point2_number);

  Map<String, Object> paramMap = new HashMap<>();
  paramMap.put("order_idx", order_idx);
  paramMap.put("order_amount", int_total_payment);
  paramMap.put("used_point", int_used_point2);
  book_mapper.updateOrderAmount(paramMap);
  book_mapper.updateUsedPoint(paramMap);

  Map<String, Object> map = new HashMap<>();
  map.put("mem_idx", user.getMem_idx());
  map.put("performance_idx", performance_idx);
  map.put("order_idx", order_idx);

  List<OrdersVo> list = book_mapper.ordersList(map);
  model.addAttribute("list", list);
  model.addAttribute("ordersVo", ordersVo);

  int order_amount = book_mapper.selectOneOrderAmount(order_idx);
  model.addAttribute("order_amount", order_amount);

  model.addAttribute("used_point2", used_point2);
  model.addAttribute("total_payment", total_payment);
  model.addAttribute("order_idx", order_idx);
  model.addAttribute("performance_idx", performance_idx);

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

 @RequestMapping("checkOrderTimeout.do")
 public String checkOrderTimeout(@RequestBody Map<String, Object> requestData, Model model) {
  System.out.println("--------------------주문 취소 확인용-----------------------");

  // JSON에서 데이터 추출
  int performance_idx = Integer.parseInt((String) requestData.get("performance_idx"));
  String performance_date = (String) requestData.get("date");

  // seatInfo를 List<Map>으로 변환
  List<Map<String, Object>> seatInfo = (List<Map<String, Object>>) requestData.get("seatInfo");

  // selectedSeats를 List<Map>으로 변환
  List<Map<String, Object>> selectedSeatsList = (List<Map<String, Object>>) requestData.get("selectedSeats");

  // 세션에서 주문 정보 가져오기
  OrdersVo order = (OrdersVo) session.getAttribute("order");
  if (order == null) {
   System.out.println("주문 정보가 세션에 존재하지 않습니다.");
   return "redirect:/main/list.do"; // 주문이 없으면 메인 페이지로 리다이렉트
  }

  // 공연 정보 조회
  PerformanceVo vo = book_mapper.selectOneFromIdx(performance_idx);
  Integer performance_date_idx = book_mapper.getPerformanceDateIdx(performance_idx, performance_date);

  // 주문 생성 시간 가져오기
  // Timestamp orderDate = order.getOrder_date();
  // long orderTime = orderDate.getTime();
  // long currentTime = System.currentTimeMillis();
  // long timeElapsed = currentTime - orderTime;

  // System.out.println("orderDate : " + orderDate);
  OrdersVo order2 = book_mapper.selectOneOrderIdx(order.getOrder_idx());

  System.out.println("order_diff : " + order2.getOrder_diff());
  // System.out.println("orderDate : " + orderTime);

  // 30초(30000ms) 이상 경과한 경우
  if (order2.getOrder_diff() > 30) {
   // DB에서 주문 삭제 및 세션에서 주문 정보 삭제
   book_mapper.orderDelete(order.getOrder_idx());
   session.removeAttribute("order");

   // 좌석 정보 업데이트
   for (Map<String, Object> seat : selectedSeatsList) {
    int row = ((Number) seat.get("row")).intValue();
    String col = (String) seat.get("col");
    // 카테고리에 따른 처리
    switch (vo.getPerformance_cate_idx()) {
     case 1:
      m_hall_mapper.updateSeatStatusByOrder(performance_date_idx, row, col);
      break;
     case 2:
      s_hall_mapper.updateSeatStatusByOrder(performance_date_idx, row, col);
      break;
     case 3:
      l_hall_mapper.updateSeatStatusByOrder(performance_date_idx, row, col);
      break;
    }
   }
  }

  return "redirect:/main/list.do"; // 리다이렉트할 페이지
 }

}
