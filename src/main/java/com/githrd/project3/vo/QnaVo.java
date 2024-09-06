package com.githrd.project3.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.NoArgsConstructor;

@Alias("qna")
@NoArgsConstructor
@Data
public class QnaVo {
    Integer qna_idx;
    Integer mem_idx;
    String qna_title;
    String qna_content;
    String mem_nickname;
    String qna_regdate;
    String qna_use;

    // 구현되고 추가하기
    int qna_no;
    int qna_cmt_count;
}
