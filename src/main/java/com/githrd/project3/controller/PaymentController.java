package com.githrd.project3.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.githrd.project3.dao.BookMapper;
import com.githrd.project3.dao.PaymentMapper;
import com.githrd.project3.service.IamportService;
import com.githrd.project3.vo.MemberVo;
import com.githrd.project3.vo.OrdersVo;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import jakarta.annotation.PostConstruct;
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
 public String processPayment(
   @RequestParam("imp_uid") String imp_uid,
   @RequestParam("order_idx") int order_idx,
   @RequestParam("order_amount") int order_amount,
   Model model) {

  // 여기서 order_amount 값이 제대로 설정되고 있는지 확인
  int orderAmount = 30000; // 예시 값, 실제 값으로 설정
  model.addAttribute("test", orderAmount);

  // MemberVo user = (MemberVo) session.getAttribute("user");
  // Map<String, Object> map = new HashMap<>();
  // map.put("mem_idx", user.getMem_idx());
  // map.put("performance_idx", performance_idx);
  // map.put("order_idx", order_idx);

  // List<OrdersVo> list = book_mapper.ordersList(map);
  // model.addAttribute("list", list);
  // model.addAttribute("ordersVo", ordersVo);

  try {
   // 2. 결제 정보를 Iamport 서버로부터 조회
   IamportResponse<Payment> paymentResponse = iamportService.getPaymentInfo(imp_uid);
   Payment payment = paymentResponse.getResponse();

   // 3. 결제 금액 확인
   if (payment.getAmount().equals(order_amount)) {
    // 결제 성공 처리
    book_mapper.updatePaymentState(order_idx, "y");
    model.addAttribute("message", "결제가 성공적으로 완료되었습니다.");
    return "redirect:/payment/success";
   } else {
    // 결제 금액 불일치 처리
    model.addAttribute("message", "결제 금액 불일치");
    return "redirect:/payment/failure";
   }
  } catch (IamportResponseException | IOException e) {
   // 예외 처리
   model.addAttribute("message", "결제 처리 중 오류가 발생했습니다.");
   return "redirect:/payment/failure";
  }
 }

 // @RequestMapping("payment.do")
 // public ResponseEntity<Map<String, Object>> processPayment(
 // @RequestParam("imp_uid") String impUid,
 // @RequestParam("order_idx") String merchantUid,
 // @RequestParam("order_amount") int paidAmount) throws
 // IamportResponseException, IOException {

 // // 결제 정보 조회
 // IamportResponse<Payment> paymentResponse =
 // iamportClient.paymentByImpUid(impUid);
 // Payment paymentData = paymentResponse.getResponse();

 // Map<String, Object> result = new HashMap<>();

 // if (paymentData != null &&
 // paymentData.getAmount().equals(BigDecimal.valueOf(paidAmount))) {
 // // 결제 금액 일치
 // result.put("amount", paymentData.getAmount());
 // return ResponseEntity.ok(result); // ResponseEntity로 결과를 JSON 형태로 반환

 // } else {
 // // 금액 불일치 또는 결제 실패
 // return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
 // }
 // }

 // 결제 완료 후 이동 할 화면
 @RequestMapping("success.do")
 public String paymentSuccess(OrdersVo ordersVo, Model model) {

  MemberVo user = (MemberVo) session.getAttribute("user");

  // 회원 별 주문 내역 조회
  List<OrdersVo> list = book_mapper.ordersList(user.getMem_idx());
  model.addAttribute("list", list);

  return "payment/success";
 }

}
