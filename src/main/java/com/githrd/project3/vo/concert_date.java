package com.githrd.project3.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Alias("concert_date")
public class concert_date {
    int concert_date_idx;
    int concert_idx;
    String concert_date_date;
}
