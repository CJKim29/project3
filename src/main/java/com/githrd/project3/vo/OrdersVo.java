package com.githrd.project3.vo;

import java.util.List;

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
 String reserved_performance_date; // 공연관람날짜
 String order_date; // 주문일시

 // 조인용 변수
 String performance_name;
 String hall_name;

 List<OrdersSeatVo> seatList; // 주문좌석 리스트(각 좌석의 등급과 가격)
}
