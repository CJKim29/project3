package com.githrd.project3.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.githrd.project3.vo.MemberVo;

@Mapper
public interface MemberMapper {

    List<MemberVo> selectList();

    MemberVo selectOneFromIdx(int mem_idx);

    MemberVo selectOneFromId(String mem_id);

    MemberVo selectOne_nickname(String mem_nickname);

    int insert(MemberVo vo);

    int update(MemberVo vo);

    int delete(int mem_idx);

    void updateFilename(MemberVo vo);
}
