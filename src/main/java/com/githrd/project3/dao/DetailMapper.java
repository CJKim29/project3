package com.githrd.project3.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.githrd.project3.util.MyCommon.Performance;
import com.githrd.project3.vo.ActorVo;
import com.githrd.project3.vo.CastingVo;
import com.githrd.project3.vo.PerformanceExLikeVo;
import com.githrd.project3.vo.PerformanceVo;

@Mapper
public interface DetailMapper {

   // 전체 조회
   List<PerformanceVo> selectList();

   // idx 조회
   PerformanceVo selectOneFromIdx(int Performance_idx);

   // 좋아요 유무
   boolean findLike(int performance_idx, int mem_idx);

   // 좋아요 목록
   List<PerformanceExLikeVo> LikeList(int mem_idx);

   // 좋아요 추가
   void likeUp(PerformanceExLikeVo performanceExLike);

   // 좋아요 취소
   void likeDown(int performance_idx, int mem_idx);

   int selectLikeNumber(int performance_idx, int mem_idx);

   // 특정 공연의 전체 좋아요 수 조회
   int getTotalLikeCount(int performance_idx);

   // 배우 전체 조회
   List<ActorVo> selectActorList();

   // 배우 idx별 조회
   ActorVo selectActorFromIdx(int actor_idx);

   // 캐스팅 전체 조회
   List<CastingVo> selectCastingList();

   // 공연 idx별 캐스팅 조회
   List<CastingVo> selectCastingFromIdx(int performance_idx);

   List<String> getPerformanceDates(int performance_idx);

   // 파일이름 변경
   int updateFilename(PerformanceVo vo);

   // 수정
   int update(PerformanceVo vo);

   String getFirstDate(int performance_idx);

   String getLastDate(int performance_idx);

   // 배우 idx별 공연
   List<Performance> performance_list_by_actor(int actor_idx);

   // 캐스팅 idx별
   CastingVo selectCastingFromCastingIdx(int casting_idx);

   // 캐스팅 삭제
   int delete(int casting_idx);

   // 배우 이름별 조회
   List<ActorVo> selectActorFromName(String actor_name);

   // 캐스팅 추가
   int insert(CastingVo vo);
}
