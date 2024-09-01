package com.githrd.project3.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.githrd.project3.vo.S_HallVo;

@Mapper
public interface S_HallMapper {

    List<S_HallVo> selectList();
}