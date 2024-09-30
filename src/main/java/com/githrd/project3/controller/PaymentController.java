package com.githrd.project3.controller;

import java.io.IOException;
import java.math.BigDecimal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.githrd.project3.dao.BookMapper;
import com.githrd.project3.dao.PaymentMapper;
import com.githrd.project3.service.IamportService;
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
 public String processPayment(
   @RequestParam("imp_uid") String imp_uid,
   @RequestParam("order_idx") int order_idx,
   @RequestParam("order_amount") int order_amount,
   Model model) {

  try {
   // 2. 결제 정보를 Iamport 서버로부터 조회
   IamportResponse<Payment> paymentResponse = iamportService.getPaymentInfo(imp_uid);
   Payment payment = paymentResponse.getResponse();

   // 3. 결제 금액 확인
   if (payment.getAmount().compareTo(new BigDecimal(order_amount)) == 0) {
    // 결제 성공 처리
    book_mapper.updatePaymentState(order_idx);
    model.addAttribute("message", "결제가 성공적으로 완료되었습니다.");
    return "redirect:/payment/success.do";
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

 // 결제 완료 후 이동 할 화면
 @RequestMapping("success.do")
 public String paymentSuccess() {

  return "payment/success";
 }

}
