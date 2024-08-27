package com.githrd.project3.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.githrd.project3.vo.ReviewVo;

@Mapper
public interface ReviewMapper {

    List<ReviewVo> selectList();

    int insert(ReviewVo vo);

}
