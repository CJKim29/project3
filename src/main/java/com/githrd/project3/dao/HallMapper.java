package com.githrd.project3.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.githrd.project3.vo.HallVo;

@Mapper
public interface HallMapper {

    List<HallVo> hall_list(Map<String,Object> map);

    int hall_insert(HallVo vo);

    HallVo hall_one_from_idx(int hall_idx);

    int hall_delete(int hall_idx);

    int hall_modify(HallVo vo);
}
