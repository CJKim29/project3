package com.githrd.project3.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Alias("orders_seat")
public class OrdersSeatVo {

 int order_seat_idx;
 int order_idx;
 int seat_idx;
 String order_seat_name;

 // Seat 테이블 조인용 변수
 String seat_grade;
 int seat_price;

}
