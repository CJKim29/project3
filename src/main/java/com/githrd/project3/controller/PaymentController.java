package com.githrd.project3.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.githrd.project3.dao.BookMapper;
import com.githrd.project3.dao.PaymentMapper;
import com.githrd.project3.service.IamportService;
import com.githrd.project3.vo.MemberVo;
import com.githrd.project3.vo.OrdersVo;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/payment/")
public class PaymentController {

 @Autowired
 HttpSession session;

 @Autowired
 BookMapper book_mapper;

 @Autowired
 PaymentMapper payment_mapper;

 // Iamport API 사용을 위한 서비스
 private final IamportService iamportService;
 private IamportClient iamportClient;

 @Autowired
 public PaymentController(IamportService iamportService, IamportClient iamportClient) {
  this.iamportService = iamportService;
  this.iamportClient = iamportClient;
 }

 // 결제 요청을 처리하는 메서드
 @PostMapping("payment.do")
 @ResponseBody
 public Map<String, Object> processPayment(
   @RequestParam("imp_uid") String imp_uid,
   @RequestParam("order_idx") int order_idx,
   @RequestParam("order_amount") int order_amount) {

  Map<String, Object> resultMap = new HashMap<>();

  MemberVo user = (MemberVo) session.getAttribute("user");

  try {
   // 2. 결제 정보를 Iamport 서버로부터 조회
   IamportResponse<Payment> paymentResponse = iamportService.getPaymentInfo(imp_uid);
   Payment payment = paymentResponse.getResponse();

   // 3. 결제 금액 확인
   if (payment.getAmount().compareTo(new BigDecimal(order_amount)) == 0) {
    // 결제 성공 처리
    book_mapper.updatePaymentState(order_idx);

    // 포인트 차감
    // 주문 정보에서 사용된 포인트 가져오기
    OrdersVo orderVo = book_mapper.selectOneOrderIdx(order_idx); // 주문 정보를 가져오는 메서드
    int used_point = orderVo.getUsed_point();

    // 포인트 적립
    int pointsToEarn = (int) (order_amount * 0.01); // 결제 금액의 1%

    // Map을 통해 포인트 차감 및 추가
    Map<String, Object> params = new HashMap<>();
    params.put("mem_idx", user.getMem_idx());
    params.put("mem_point", pointsToEarn);
    params.put("used_point", used_point);
    book_mapper.usedPoint(params); // 포인트 차감
    book_mapper.addPoint(params); // 회원에게 포인트 추가

    resultMap.put("result", "success");

    return resultMap;
   } else {
    // 결제 금액 불일치 처리
    resultMap.put("result", "fail_not_same_payment");

    return resultMap;
   }
  } catch (IamportResponseException | IOException e) {
   // 예외 처리
   resultMap.put("result", "fail_exception");

   return resultMap;
  }
 }

 // 결제 완료 후 이동 할 화면
 @RequestMapping("success.do")
 public String paymentSuccess(
   @RequestParam("performance_idx") int performance_idx,
   @RequestParam("order_idx") int order_idx,
   @RequestParam("used_point2") String used_point2,
   Model model) {

  MemberVo user = (MemberVo) session.getAttribute("user");

  // 주문 조회 시 필요한 정보 map에 담음
  Map<String, Object> map = new HashMap<>();
  map.put("mem_idx", user.getMem_idx());
  map.put("performance_idx", performance_idx);
  map.put("order_idx", order_idx);

  List<OrdersVo> list = book_mapper.ordersList(map);
  model.addAttribute("list", list);
  model.addAttribute("used_point2", used_point2);

  return "payment/success";
 }

 // 구매내역 조회
 @RequestMapping("list.do")
 public String paymentList(Model model) {

  MemberVo user = (MemberVo) session.getAttribute("user");

  List<OrdersVo> list = book_mapper.myOrderList(user.getMem_idx());
  model.addAttribute("list", list);

  // 주문 조회 시 필요한 정보 map에 담음
  // Map<String, Object> map = new HashMap<>();
  // map.put("mem_idx", user.getMem_idx());
  // map.put("performance_idx", performance_idx);
  // map.put("order_idx", order_idx);

  // List<OrdersVo> list = book_mapper.ordersList(map);
  // model.addAttribute("list", list);

  return "payment/my_payment";
 }

}
