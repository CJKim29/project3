package com.githrd.project3.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Alias("payment")
public class PaymentVo {

 private String merchantUid;
 private int amount;

 // Getters and Setters

}
