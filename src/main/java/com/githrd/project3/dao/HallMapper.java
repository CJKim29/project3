package com.githrd.project3.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.githrd.project3.vo.HallVo;

@Mapper
public interface HallMapper {

    List<HallVo> hall_list();

    int hall_insert(HallVo vo);

}
