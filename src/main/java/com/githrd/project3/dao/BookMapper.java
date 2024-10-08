package com.githrd.project3.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.githrd.project3.vo.OrdersSeatVo;
import com.githrd.project3.vo.OrdersVo;
import com.githrd.project3.vo.PerformanceVo;
import com.githrd.project3.vo.X_PerformanceVo;

@Mapper
public interface BookMapper {

 List<X_PerformanceVo> selectList();

 PerformanceVo selectOneFromIdx(int performance_idx);

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
 int ordersInsert(OrdersVo ordersVo);

 OrdersVo selectOneFromOrderIdx(int order_idx);

 int selectOnePerformanceCateIdx(int performance_idx);

 int selectOneSeatIdxM(int performance_date_idx, int row);

 int selectOneSeatIdxS(int performance_date_idx, int row);

 int selectOneSeatIdxL(int performance_date_idx, int row);

 void ordersSeatInsert(OrdersSeatVo ordersSeatVo);

 int OrderRecentIdx();

 List<OrdersVo> ordersList(Map<String, Object> map);

 List<OrdersVo> ordersList(int mem_idx);

 // 회원 별 주문 내역 조회
 List<OrdersVo> myOrderList(int mem_idx);

 void updatePaymentState(int order_idx);

 void updateOrderAmount(Map<String, Object> paramMap);

 void updateUsedPoint(Map<String, Object> paramMap);

 OrdersVo selectOneOrderIdx(int order_idx);

 int selectOneOrderAmount(int order_idx);

 void addPoint(Map<String, Object> params); // Map을 사용하는 포인트 추가 메서드

 void usedPoint(Map<String, Object> params); // Map을 사용하는 포인트 차감 메서드

 // 주문 정보 삭제
 void orderDelete(int order_idx);

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