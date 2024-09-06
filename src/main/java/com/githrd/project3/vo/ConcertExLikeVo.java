package com.githrd.project3.vo;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Alias("concertExLike")
public class ConcertExLikeVo {

    int concert_ex_like_idx;
    int concert_idx;
    int mem_idx;
    int like_number;

    ConcertVo concertVo;
    MemberVo memberVo;
}
