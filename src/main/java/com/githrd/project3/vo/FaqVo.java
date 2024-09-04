package com.githrd.project3.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.NoArgsConstructor;

@Alias("faq")
@Data
@NoArgsConstructor
public class FaqVo {

    Integer faq_idx;
    String faq_title;
    String faq_content;
    String faq_regdate;

    int faq_no;
}
