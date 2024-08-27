package com.githrd.project3.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Alias("seat")
public class seat {
    int seat_idx;
    int concert_idx;
    String seat_grade;
    int seat_price;
}
