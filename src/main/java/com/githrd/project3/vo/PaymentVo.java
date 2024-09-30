package com.githrd.project3.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Alias("payment")
public class PaymentVo {

 // private String merchantUid;
 // private int amount;

 int payment_idx; // 결제번호
 int order_idx; // 주문번호
 int payment_amount; // 결제값
 String payment_date; // 결제날짜

}
