package com.githrd.project3.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Alias("orders")
public class OrdersVo {

 int order_idx; // 주문번호
 int performance_idx; // 공연번호
 int mem_idx; // 회원번호
 int seat_idx; // 좌석번호

 String order_date; // 주문일시
 int order_amount; // 주문금액

}
