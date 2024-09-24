package com.githrd.project3.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.githrd.project3.service.PaymentService;
import com.githrd.project3.vo.PaymentVo;

@Controller
public class PaymentController {

 @Autowired
 private PaymentService paymentService;

 @PostMapping("/payment")
 public String payment(@RequestBody PaymentVo request) {

  // 결제 요청 처리
  return paymentService.createPayment(request.getMerchantUid(), request.getAmount());
 }

 // 결제 확인 메소드 추가
 @PostMapping("/payment/confirm")
 public String confirmPayment(@RequestBody String impUid) {
  return paymentService.getPayment(impUid);
 }

}
