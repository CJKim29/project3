package com.githrd.project3.service;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.githrd.project3.dao.BookMapper;
import com.githrd.project3.vo.OrdersVo;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

// service : 비즈니스 로직을 처리함 -> 실제 결제 검증이나 추가 작업 처리
@Service
public class IamportService {

 @Autowired
 BookMapper book_mapper;

 private final IamportClient iamportClient;

 @Autowired
 public IamportService(IamportClient iamportClient) {
  this.iamportClient = iamportClient;
 }

 public IamportResponse<Payment> getPaymentInfo(String impUid) throws IamportResponseException, IOException {
  return iamportClient.paymentByImpUid(impUid); // imp_uid를 이용해 결제 정보 조회
 }

 public OrdersVo getOrderByIdx(int orderIdx) {
  return book_mapper.selectOneFromOrderIdx(orderIdx);
 }
}
