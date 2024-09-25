package com.githrd.project3.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.githrd.project3.service.PaymentService;

@Controller
public class PaymentController {

 @Autowired
 private PaymentService paymentService;

 // private final IamportClient iamportClient;

 // @PostMapping("/payment")
 // public String payment(@RequestBody PaymentVo request) {

 // // 결제 요청 처리
 // return paymentService.createPayment(request.getMerchantUid(),
 // request.getAmount());
 // }

 // // 결제 확인 메소드 추가
 // @PostMapping("/payment/confirm")
 // public String confirmPayment(@RequestBody String impUid) {
 // return paymentService.getPayment(impUid);
 // }

 // 아임포트 결제 요청
 // public PaymentController() {
 // this.iamportClient = new IamportClient("REST_API_KEY",
 // "REST_API_SECRET");
 // }

 // @ResponseBody
 // @RequestMapping("/verify/{imp_uid}")
 // public IamportResponse<Payment> paymentByImpUid(@PathVariable("imp_uid")
 // String imp_uid)
 // throws IamportResponseException, IOException {
 // return iamportClient.paymentByImpUid(imp_uid);
 // }

}
