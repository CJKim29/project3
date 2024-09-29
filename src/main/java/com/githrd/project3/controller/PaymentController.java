package com.githrd.project3.controller;

import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.io.IOException;
import com.githrd.project3.service.PaymentService;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import java.math.BigDecimal;

@Controller
@RequestMapping("/payment/")
public class PaymentController {

 private final PaymentService paymentService;

 private final IamportClient iamportClient;

 @Autowired
 public PaymentController(PaymentService paymentService, IamportClient iamportClient) {
  this.paymentService = paymentService;
  this.iamportClient = iamportClient;
 }

 @RequestMapping("payment.do")
 public ResponseEntity<Map<String, Object>> processPayment(
   @RequestParam("imp_uid") String impUid,
   @RequestParam("order_idx") String merchantUid,
   @RequestParam("order_amount") int paidAmount) throws IamportResponseException, IOException {

  // 결제 정보 조회
  IamportResponse<Payment> paymentResponse = iamportClient.paymentByImpUid(impUid);
  Payment paymentData = paymentResponse.getResponse();

  Map<String, Object> result = new HashMap<>();

  if (paymentData != null && paymentData.getAmount().equals(BigDecimal.valueOf(paidAmount))) {
   // 결제 금액 일치
   result.put("amount", paymentData.getAmount());
   return ResponseEntity.ok(result); // ResponseEntity로 결과를 JSON 형태로 반환

  } else {
   // 금액 불일치 또는 결제 실패
   return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
  }
 }

}
