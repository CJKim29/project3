package com.githrd.project3.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.githrd.project3.vo.OrdersVo;
import com.githrd.project3.vo.X_PerformanceVo;

@Mapper
public interface BookMapper {

 List<X_PerformanceVo> selectList();

 X_PerformanceVo selectOneFromIdx(int performance_idx);

 // performance_date와 performance_idx를 기반으로 performance_date_idx를 조회
 Integer selectPerformanceDateIdx(@Param("performance_date") String performance_date,
   @Param("performance_idx") int performance_idx);

 // 이후 수정
 // 남은 좌석 수를 performance_date_idx와 seat_idx를 이용해 조회(S_hall/M_hall/L_hall)
 Integer selectRemainSeat_S(@Param("performance_date_idx") int performance_date_idx,
   @Param("seat_idx") int seat_idx);

 Integer selectRemainSeat_M(@Param("performance_date_idx") int performance_date_idx,
   @Param("seat_idx") int seat_idx);

 Integer selectRemainSeat_L(@Param("performance_date_idx") int performance_date_idx,
   @Param("seat_idx") int seat_idx);

 Integer getPerformanceDateIdx(@Param("performance_idx") int performance_idx,
   @Param("performance_date") String performance_date);

 int countSeatGarde(int performance_idx);

 List<Map<String, Object>> countSeatIdx(int performance_idx);

 // 주문정보 insert
 void ordersInsert(OrdersVo ordersVo);

 OrdersVo selectOneFromOrderIdx(int order_idx);

 // OrdersVo vo = book_mapper.selectOneFromOrderIdx(int order_idx); // 메서드 선언
 // void ordersInsert(OrdersVo order); // 삽입 메서드 선언

 // 안쓰는 코드들
 // Integer selectRemainSeat(@Param("performance_date") String performance_date,
 // @Param("seat_idx") int seat_idx);

 // // 좌석 상태를 업데이트하는 메서드
 // void updateSeatStatus(@Param("date") String performance_date,
 // @Param("seat_idx") int seat_idx,
 // @Param("row") int row,
 // @Param("col") String col);

 // // performance_date 문자열을 performance_date_idx로 변환하는 메서드
 // int getPerformanceDateIdxByDate(@Param("performanceDate") String
 // performanceDate);

}