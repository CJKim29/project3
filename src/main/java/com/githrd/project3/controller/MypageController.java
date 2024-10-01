package com.githrd.project3.controller;

import java.util.Map;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.githrd.project3.dao.DetailMapper;
import com.githrd.project3.dao.ReviewMapper;
import com.githrd.project3.dao.ReviewScoreMapper;
import com.githrd.project3.util.MyCommon;
import com.githrd.project3.util.Paging3;
import com.githrd.project3.vo.CastingVo;
import com.githrd.project3.vo.MemberVo;
import com.githrd.project3.vo.PerformanceExLikeVo;
import com.githrd.project3.vo.PerformanceVo;
import com.githrd.project3.vo.ReviewVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/mypage/")
public class MypageController {

   @Autowired
   HttpServletRequest request;

   @Autowired
   HttpSession session;

   @Autowired
   DetailMapper detail_mapper;

   @Autowired
   ReviewMapper review_mapper;

   @Autowired
   ReviewScoreMapper review_score_mapper;

   @RequestMapping("mypage.do")
   public String mypage_home() {

      return "mypage/mypage";
   }

   @RequestMapping("ajax_review.do")
   public String review_list(@RequestParam(name = "page", defaultValue = "1") int nowPage,
         Model model) {

      MemberVo user = (MemberVo) session.getAttribute("user");

      int mem_idx = user.getMem_idx();

      // List<ReviewVo> list = review_mapper.selectMyReviewList(mem_idx);
      // model.addAttribute("list", list);

      Map<String, Object> map = new HashMap<String, Object>();

      int start = (nowPage - 1) * MyCommon.MyReview.BLOCK_LIST + 1;
      int end = start + MyCommon.MyReview.BLOCK_LIST - 1;

      map.put("start", start);
      map.put("end", end);
      map.put("mem_idx", mem_idx);

      // 전체 게시물 수
      int rowTotal = review_mapper.my_review_row_total(mem_idx);

      // pageMenu생성하기
      String pageMenu = Paging3.getMyReviewPaging(
            nowPage,
            rowTotal,
            MyCommon.MyReview.BLOCK_LIST,
            MyCommon.MyReview.BLOCK_PAGE);

      // 게시판 목록가져오기
      List<ReviewVo> my_review_list = review_mapper.my_review_list(map);

      // DS로부터 전달받은 Model을 통해서 데이터를 넣는다.
      // DS는 model에 저장된 데이터를 request binding시킨다

      model.addAttribute("my_review_list", my_review_list);
      model.addAttribute("pageMenu", pageMenu);

      // detail.jsp 내에서 ajax호출 시 review.jsp가 새 페이지로 호출 되는 것을 막기 위한 3줄
      int totalPages = (int) Math.ceil((double) rowTotal / MyCommon.MyReview.BLOCK_LIST); // 전체 페이지 수

      model.addAttribute("totalPages", totalPages);
      model.addAttribute("currentPage", nowPage);

      return "mypage/my_review";
   }

   @RequestMapping("ajax_like.do")
   public String like_list(PerformanceExLikeVo vo, Model model) {

      MemberVo user = (MemberVo) session.getAttribute("user");

      int mem_idx = user.getMem_idx();

      List<PerformanceExLikeVo> list = detail_mapper.LikeList(mem_idx);

      model.addAttribute("list", list);

      return "mypage/my_like";
   }
}
