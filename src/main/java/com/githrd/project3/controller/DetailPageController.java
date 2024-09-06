package com.githrd.project3.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.githrd.project3.dao.DetailMapper;
import com.githrd.project3.vo.ConcertExLikeVo;
import com.githrd.project3.vo.ConcertVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/detail/")
public class DetailPageController {

    // 자동연결(요청시 마다 Injection)
    @Autowired
    HttpServletRequest request;

    @Autowired
    HttpSession session;

    @Autowired
    DetailMapper detail_mapper;

    @RequestMapping("detail.do")
    public String detail_page(int concert_idx, Model model) {

        ConcertVo vo = detail_mapper.selectOneFromIdx(concert_idx);

        model.addAttribute("vo", vo);

        return "detailpage/detail";
    }

    // @GetMapping("/love")
    // public void love(int concert_idx, int mem_idx, Model model) {

    // model.addAttribute("vo", detail_mapper.selectOneFromIdx(concert_idx));

    // ConcertExLikeVo like = new ConcertExLikeVo();

    // like.setConcert_idx(concert_idx);
    // like.setMem_idx(mem_idx);

    // model.addAttribute("like", detail_mapper.findLike(concert_idx, mem_idx));
    // }

}
