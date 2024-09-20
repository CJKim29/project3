package com.githrd.project3.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Alias("review")
public class ReviewVo {

    int review_idx;         // 리뷰번호
    int mem_idx;            // 회원 번호 - fk
    int performance_idx;    // 공연 번호 - fk

    String review_title;    // 리뷰 제목
    String review_content;  // 리뷰 내용
    String mem_nickname;    // 회원 닉네임
    String review_regdate;  // 작성일자

    int review_readhit;     // 조회수

    String mem_filename;    //후기 목록에 이미지를 불러오기 위해 추가
    int review_score_point; //평점 불러오기 위해 추가

}
