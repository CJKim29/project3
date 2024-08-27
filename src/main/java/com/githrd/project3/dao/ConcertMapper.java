package com.githrd.project3.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.githrd.project3.vo.ConcertVo;

@Mapper
public interface ConcertMapper {

    List<ConcertVo> selectList();

    ConcertVo selectOneFromIdx(int concert_idx);
}