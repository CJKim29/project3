package com.githrd.project3.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReviewScoreMapper {

    Double avgScore(int performance_idx);

}
