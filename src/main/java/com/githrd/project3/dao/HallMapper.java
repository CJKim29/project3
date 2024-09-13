package com.githrd.project3.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.githrd.project3.vo.HallVo;

@Mapper
public interface HallMapper {

    // 공연장 전체 조회
    List<HallVo> hall_list();

}
