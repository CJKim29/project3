package com.githrd.project3.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.githrd.project3.vo.HallVo;
import com.githrd.project3.vo.PerformanceVo;

@Mapper
public interface HallMapper {

    List<HallVo> hall_list(Map<String,Object> map);

    int hall_insert(HallVo vo);

    String get_hall_name(int hall_idx);

    List<PerformanceVo> search_list(int hall_idx);

    HallVo hall_one_from_idx(int hall_idx);

    int hall_delete(int hall_idx);

    int hall_modify(HallVo vo);

    List<HallVo> get_hall_by_area(int area_idx);
}
