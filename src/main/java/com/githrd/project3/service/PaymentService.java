package com.githrd.project3.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.siot.IamportRestClient.IamportClient;

@Service
public class PaymentService {

 @Autowired
 private IamportClient iamportClient;

 public String createPayment(String merchantUid, int amount) {
  // 결제 요청 생성 및 API 호출
  // 필요한 데이터에 맞게 메소드 작성
  // 예시: iamportClient.payment().ready(...)
  return "결제 요청 성공";
 }

 public String getPayment(String impUid) {
  // 결제 확인 요청 및 API 호출
  // 예시: iamportClient.payment().get(impUid)
  return "결제 확인 성공";
 }

}
