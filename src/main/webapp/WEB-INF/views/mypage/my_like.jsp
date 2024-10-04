<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
       width: 125px !important;
       height: 171px !important;
       margin-left: 25px;
      }


      .btn.min {
       width: 40px;
       height: 40px;
       background-color: #333333;
       border: none;
       /* 필요에 따라 경계선 제거 */
       display: flex;
       /* flexbox로 정렬을 위한 설정 */
       justify-content: center;
       /* 수평 중앙 정렬 */
       align-items: center;
       /* 수직 중앙 정렬 */
       cursor: pointer;
       /* 클릭 가능한 커서 표시 */
       margin-left: 26px;
      }

      .ti-heart {
       font-size: 15px;
       /* 아이콘 크기 설정 */
       color: white;
       /* 아이콘 색상 */
       text-align: center;
       /* 텍스트 정렬 */
      }
     </style>

     <script>
      function likeDown(performance_idx) {
       $.ajax({
        url: 'likeDown.do',
        type: 'POST',
        data: { performance_idx: performance_idx },
        success: function (response) {
         $("#love-" + performance_idx).css({ "background-color": "#333333" });
         $("#love-" + performance_idx).attr("onclick", "likeUp('" + performance_idx + "')");
        }
       });
      }

      function likeUp(performance_idx) {
       $.ajax({
        url: 'likeUp.do',
        type: 'POST',
        data: { performance_idx: performance_idx },
        success: function (response) {
         $("#love-" + performance_idx).css({ "background-color": "#ff1d38" });
         $("#love-" + performance_idx).attr("onclick", "likeDown('" + performance_idx + "')");
        }
       });
      }
     </script>
    </head>

    <body>
     <div class="shopping-cart section" style="padding-bottom: 100px;">
      <div class="container">
       <div class="row">
        <div class="col-12">
         <!-- Shopping Summery -->
         <h4 class="text-center mb-4">좋아요한 공연 목록</h4>
         <table class="table shopping-summery">
          <thead>
           <tr class="main-hading">
            <th class="text-center" style="width: 20%;">공연</th>
            <th class="text-center" style="width: 25%;">공연명</th>
            <th class="text-center" style="width: 20%;">공연날짜</th>
            <th class="text-center" style="width: 15%;">공연시간</th>
            <th class="text-center" style="width: 20%;">좋아요</th>
           </tr>
          </thead>
          <tbody>
           <c:forEach var="vo" items="${ list }">
            <tr>
             <td class="image" data-title="No"><a
               href="../detail/detail.do?performance_idx=${vo.performanceVo.performance_idx}"><img id="performance_img"
                src="../resources/images/${vo.performanceVo.performance_image}"></a>
             </td>

             <td class="price" data-title="Price">
              <b>${ vo.performanceVo.performance_name }</b>
              <!-- <span></span> -->
             </td>
             <!-- 공연날짜 -->
             <td class="price" data-title="Price">
              ${fn:substringBefore(vo.performanceVo.performance_startday, ' ')}<br>~<br>
              ${fn:substringBefore(vo.performanceVo.performance_endday, ' ')}
              <!-- <span></span> -->
             </td>
             <!-- <td class="price" data-title="Price">
              ${fn:substringBefore(vo.performanceVo.performance_startday,
              ' ')}~${fn:substringBefore(vo.performanceVo.performance_endday, ' ')}
             </td> -->
             <!-- 공연시간 -->
             <td class="total-amount" data-title="Total">
              ${ vo.performanceVo.performance_runtime }분
             </td>

             <td class="action" data-title="checkout">
              <!-- 좋아요 여부 확인 및 버튼 표시 -->
              <c:choose>
               <c:when test="${ likeStatusMap[vo.performanceVo.performance_idx] == true }">
                <!-- 각 버튼에 고유한 ID 부여 -->
                <button type="button" id="love-${vo.performanceVo.performance_idx}" class="btn min"
                 style="background-color: #ff1d38;" onclick="likeDown('${vo.performanceVo.performance_idx}')">
                 <i class="ti-heart"></i> &nbsp;
                </button>
               </c:when>
               <c:otherwise>
                <button type="button" id="love-${vo.performanceVo.performance_idx}" class="btn min"
                 style="background-color: #333333;" onclick="likeUp('${vo.performanceVo.performance_idx}')">
                 <i class="ti-heart" style="text-align: center;"></i> &nbsp;
                </button>
               </c:otherwise>
              </c:choose>
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