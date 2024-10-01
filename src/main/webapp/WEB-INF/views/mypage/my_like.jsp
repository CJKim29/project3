<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

         <!DOCTYPE html>
         <html>

         <head>
            <meta charset="UTF-8">
            <title>Insert title here</title>

            <style>
               table {
                  margin-top: 15px;
               }

               td.image {
                  padding: 0 !important;
               }

               #performance_img {
                  width: 118px !important;
                  height: 171px !important;
               }
            </style>
         </head>

         <body>
            <div class="shopping-cart section" style="padding-bottom: 200px;">
               <div class="container">
                  <div class="row">
                     <div class="col-12">
                        <!-- Shopping Summery -->
                        <h4>좋아요한 공연 목록</h4>
                        <table class="table shopping-summery">
                           <thead>
                              <tr class="main-hading">
                                 <th class="text-center">공연</th>
                                 <!-- <th class="text-center">공연명</th> -->
                                 <th class="text-center">공연명</th>
                                 <th class="text-center">공연날짜</th>
                                 <th class="text-center">공연시간</th>
                                 <th class="text-center">관람연령</th>
                              </tr>
                           </thead>
                           <tbody>
                              <c:forEach var="vo" items="${ list }">
                                 <tr>
                                    <td class="image" data-title="No"><a
                                          href="../detail/detail.do?performance_idx=${vo.performanceVo.performance_idx}"><img
                                             id="performance_img"
                                             src="../resources/images/${vo.performanceVo.performance_image}"></a>
                                    </td>

                                    <td class="price" data-title="Price">
                                       ${ vo.performanceVo.performance_name }
                                       <!-- <span></span> -->
                                    </td>
                                    <!-- 공연날짜 -->
                                    <td class="price" data-title="Price">
                                       ${fn:substringBefore(vo.performanceVo.performance_startday,
                                       ' ')}~${fn:substringBefore(vo.performanceVo.performance_endday, ' ')}
                                       <!-- <span></span> -->
                                    </td>
                                    <!-- 공연시간 -->
                                    <td class="total-amount" data-title="Total">
                                       ${ vo.performanceVo.performance_runtime }분
                                    </td>
                                    <!-- 관람연령 -->
                                    <td class="action" data-title="checkout">
                                       <span>
                                          ${ vo.performanceVo.performance_age }살 이상
                                       </span>
                                    </td>
                                 </tr>
                              </c:forEach>
                           </tbody>
                        </table>
                        <!--/ End Shopping Summery -->
                     </div>
                  </div>
               </div>
            </div>
         </body>

         </html>