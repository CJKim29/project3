<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
      <!DOCTYPE html>
      <html>

      <head>
         <meta charset="UTF-8">
         <title>Insert title here</title>

         <link rel='stylesheet'
            href='https://cdn-uicons.flaticon.com/2.6.0/uicons-regular-straight/css/uicons-regular-straight.css'>

         <style>
            body {
               display: flex;
               justify-content: center;
               align-items: center;
               margin: auto;
            }

            .actor_pic {
               width: 100%;
               height: 100%;
               object-fit: cover;
               cursor: pointer;
               position: relative;
            }

            #delete_casting {
               position: absolute;
               background-color: #FF1D38;
               border: 0;
               border-radius: 100%;
               width: 14px;
               height: 16px;
               text-align: center;
               color: #FFFFFF;
               line-height: 10px;
               padding-left: 4px;
               box-shadow: 1px 1px 1px #666;
            }

            #delete_casting:hover {
               box-shadow: none;
            }

            .actor_box {
               width: 105px;
               height: 110px;
               border-radius: 70%;
               overflow: hidden;
               display: inline-block;
            }

            .casting_list {
               display: inline-block;
               text-align: center;
               width: 135px;
               height: 189px;
               margin: 0 12px 5px 0;
               vertical-align: top;
            }

            #moreText {
               width: 910px;
               margin-top: 50px;
            }

            #moreText h2 {
               display: inline-block;
            }

            #insert {
               display: inline-block;
               vertical-align: top;
            }

            .casting {
               display: inline-block;
               height: 215px;
               margin-top: 30px;
            }

            #new_name {
               outline: none;
               width: 195px;
               height: 30px;
               font-size: 14px;
               border-radius: 2px;
            }

            #image {
               width: 105px;
               height: 110px;
               border-radius: 70%;
               overflow: hidden;
               display: inline-block;
            }

            #modal-actor-img {
               width: 100%;
               height: 100%;
               object-fit: cover;
            }

            #actorList {
               display: inline-block;
               margin-top: 10px;
            }

            #modal-actor-name {
               text-align: center;
            }

            #searchActorButton {
               background-color: #FF1D38;
               color: #fff;
               border: 1px solid #FF1D38;
               font-weight: bold;
               border-radius: 3%;
               outline: none;
               height: 30px;
               box-shadow: 2px 2px 2px #666;
            }

            #searchActorButton:hover {
               box-shadow: none;
            }

            .insert_btn {
               background-color: #333;
               color: #fff;
               padding: 7px 9px;
               border: 0;
               border-radius: 5%;
               font-weight: bold;
               outline: none;
            }

            .insert_btn:hover {
               background-color: #FF1D38;
               color: #fff;
            }

            #select_actor_box {
               display: inline-block;
               margin-top: 10px;
               padding-right: 18px;
               text-align: center;
            }

            #casting_what {
               margin-top: 10px;
               outline: none;
            }

            #back {
               padding: 10px 10px;
               background-color: #333;
               color: #fff;
               font-weight: bold;
               border-radius: 3%;
               outline: none;
               position: relative;
               left: 610px;
               border: 0;
            }

            #back:hover {
               background-color: #FF1D38;
               color: #fff;
               border: 0;
            }
         </style>

         <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

         <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
         <!-- <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script> -->
         <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
         <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

         <script>
            function showInsert() {
               $("#myModal").modal({ backdrop: "static" });

               $('.close').click(function () {
                  $('#actorList').empty();
                  $('#new_name').val("");
               })

               $(document).ready(function () {
                  $('#searchActorButton').off('click').on('click', function () {
                     var actorName = $('#new_name').val();

                     if (actorName == "") {
                        alert("출연자의 이름을 입력해주세요");
                        actorName = "";
                        return;
                     }

                     $.ajax({
                        url: 'actor_insert.do',
                        method: 'GET',
                        data: { actor_name: actorName },
                        success: function (response) {
                           $('#actorList').empty();

                           let actorlist = '';

                           if (response.length > 0) {
                              response.forEach(function (actor) {
                                 actorlist += `
                                    <div id='select_actor_box'>
                                    <div id='image'>
                                    <img id='modal-actor-img' src='../resources/images/\${actor.actor_pic}'>
                                    </div>
                                    <div id='modal-actor-name'>\${actor.actor_name}</div>
                                    <input type='radio' name='selectActor' value='\${actor.actor_idx}'>
                                    </div>
                                 `;
                              });
                           } else {
                              actorlist += `
                                 배우를 찾을 수 없습니다.
                              `;
                           }

                           $("#actorList").html(actorlist);

                        },
                        error: function (err) {
                           alert(err.responseText)
                        }
                     });
                  });

                  $('.insert_btn').off('click').on('click', function () {

                     var selectedActor = $("input[name = 'selectActor']:checked");

                     if (selectedActor.length === 0) {
                        alert("배우를 선택해주세요.");
                        return;
                     }

                     var actorIdx = selectedActor.val();
                     var castingName = $('#casting_what').val();
                     var performanceIdx = $('#performance_idx').val();

                     $.ajax({
                        url: "insert_casting.do",
                        method: 'POST',
                        data: {
                           actor_idx: actorIdx,
                           casting_name: castingName,
                           performance_idx: performanceIdx
                        },
                        success: function (response) {
                           location.href = "casting_modify_form.do?performance_idx=" + performanceIdx;
                        },
                        error: function (err) {
                           alert(err.responseText)
                        }
                     })
                  })
               });
            }


            function deletes(casting_idx) {

               if (confirm("정말 삭제하시겠습니까?") == false) return;

               location.href = "delete_casting.do?casting_idx=" + casting_idx;
            }

            function insert_casting() {

            }
         </script>
      </head>

      <body>
         <div id="moreText" class="collapsed">
            <div>
               <h2>캐스팅 수정</h2>
               <button id="back" onclick="location.href='detail.do?performance_idx=${vo.performance_idx}'">돌아가기</button>
            </div>
            <c:forEach var="castingVo" items="${ list }">
               <div class="casting">
                  <div class="casting_list">
                     <div class="actor_box">
                        <img class="actor_pic" src="../resources/images/${castingVo.actorVo.actor_pic}">
                        <button id="delete_casting" type="button"
                           onclick="deletes('${castingVo.casting_idx}');">x</button>
                     </div>
                     <h5>${castingVo.casting_name}</h5>
                     <p style="color: #666666;">
                        ${castingVo.actorVo.actor_name}
                     </p>
                  </div>
               </div>
            </c:forEach>
            <div id="insert">
               <div class="casting">
                  <div class="casting_list">
                     <div class="actor_box">
                        <img class="actor_pic" src="../resources/images/insert.png" onclick="showInsert()">
                     </div>
                  </div>
               </div>
            </div>
         </div>

         <!-- Insert Modal -->
         <div class="modal fade" id="myModal">
            <div class="modal-dialog modal-lg">
               <div class="modal-content">

                  <!-- Modal Header -->
                  <div class="modal-header">
                     <h4 class="modal-title">캐스팅 추가</h4>
                     <button type="button" class="close" data-dismiss="modal">&times;</button>
                  </div>

                  <!-- Modal body -->
                  <div class="modal-body">
                     <input type="hidden" name="performance_idx" id="performance_idx" value="${vo.performance_idx}">
                     <input type="text" id="new_name" placeholder="출연자 이름을 입력해주세요.">
                     <button type="button" id="searchActorButton">검색</button>
                     <div id="actor_form">
                        <div id="actorList"></div>
                     </div>
                     <b>배역 : </b><input id="casting_what" type='text' placeholder='배역을 입력해주세요'>
                  </div>

                  <!-- Modal footer -->
                  <div class="modal-footer">
                     <button type="button" class="insert_btn" onclick="insert_casting('${actor.actor_idx}')">추가</button>
                  </div>

               </div>
            </div>
         </div>
      </body>

      </html>