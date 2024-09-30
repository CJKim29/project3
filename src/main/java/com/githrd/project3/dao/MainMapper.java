package com.githrd.project3.dao;

import org.apache.ibatis.annotations.Mapper;
import com.githrd.project3.vo.PerformanceVo;

@Mapper
public interface MainMapper {
    // 공연 수정
    int updatePerformance(PerformanceVo vo);

    // 공연 정보 가져오기
    PerformanceVo selectPerformanceById(int performance_idx);
}
