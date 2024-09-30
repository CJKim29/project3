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
               margin-right: 36px;
               text-align: center;
            }

            #moreText {
               width: 890px;
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
         </style>

         <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

         <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
         <!-- <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script> -->
         <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
         <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

         <script>
            function showModify() {
               $("#myModal").modal({ backdrop: "static" });
            }

            function deletes(casting_idx) {


               if (confirm("정말 삭제하시겠습니까?") == false) return;

               $.ajax({
                  url: "delete_casting.do",
                  type: "POST",
                  data: { "casting_idx": casting_idx },
                  dataType: "json",
                  success: function (res_data) {

                  },
                  error: function (err) {
                     alert(err.responseText);
                     console.log(res_data);
                  }
               })
            }
         </script>
      </head>

      <body>
         <div id="moreText" class="collapsed">
            <div>
               <h2>캐스팅 수정</h2>
               <h>(사진을 눌러주세요.)</h>
            </div>
            <c:forEach var="castingVo" items="${ list }">
               <div class="casting">
                  <div class="casting_list">
                     <div class="actor_box">
                        <img class="actor_pic" src="../resources/images/${castingVo.actorVo.actor_pic}"
                           onclick="showModify()">
                        <button id="delete_casting" type="button"
                           onclick="deletes(`${castingVo.casting_idx}`)">x</button>
                     </div>
                     <h4>${castingVo.casting_name}</h4>
                     <p style="color: #666666;">
                        ${castingVo.actorVo.actor_name}
                     </p>
                  </div>
               </div>
            </c:forEach>
            <div id="insert">
               <div class="casting">
                  <div class="casting_list">
                     <a href="#">
                        <div class="actor_box">
                           <img class="actor_pic" src="../resources/images/insert.png">
                        </div>
                     </a>
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
                     <h4 class="modal-title">캐스팅 수정</h4>
                     <button type="button" class="close" data-dismiss="modal">&times;</button>
                  </div>

                  <!-- Modal body -->
                  <div class="modal-body">
                     <form>

                     </form>
                  </div>

                  <!-- Modal footer -->
                  <div class="modal-footer">
                     <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                  </div>

               </div>
            </div>
         </div>
      </body>

      </html>