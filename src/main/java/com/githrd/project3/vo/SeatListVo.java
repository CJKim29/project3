package com.githrd.project3.vo;

import java.util.List;
import org.apache.ibatis.type.Alias;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Alias("seatList")
// 좌석등록을 한꺼번에 하기 위해 만든 VO
public class SeatListVo {
 int performance_idx;
 List<SeatVo> seats; // 여러 좌석 정보를 담는 리스트
}
