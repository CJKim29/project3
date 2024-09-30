package com.githrd.project3.controller;

import java.util.Map;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.githrd.project3.dao.DetailMapper;
import com.githrd.project3.dao.ReviewMapper;
import com.githrd.project3.dao.ReviewScoreMapper;
import com.githrd.project3.util.MyCommon;
import com.githrd.project3.util.Paging3;
import com.githrd.project3.vo.CastingVo;
import com.githrd.project3.vo.MemberVo;
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
 public String review_list(Model model) {

  MemberVo user = (MemberVo) session.getAttribute("user");

  int mem_idx = user.getMem_idx();

  List<ReviewVo> list = review_mapper.selectMyReviewList(mem_idx);
  model.addAttribute("list", list);

  return "mypage/my_review";
 }
}
