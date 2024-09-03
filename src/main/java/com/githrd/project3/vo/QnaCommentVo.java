package com.githrd.project3.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.NoArgsConstructor;

@Alias("qna_cmt")
@NoArgsConstructor
@Data
public class QnaCommentVo {
    Integer qna_cmt_idx;
    Integer mem_idx;
    Integer qna_idx;
    String qna_cmt_content;
    String qna_cmt_regdate;
}
