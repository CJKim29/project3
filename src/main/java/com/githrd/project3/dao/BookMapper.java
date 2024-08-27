package com.githrd.project3.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.githrd.project3.vo.BookVo;

@Mapper
public interface BookMapper {

    List<BookVo> selectList();

    BookVo selectOneFromIdx(int concert_idx);
}