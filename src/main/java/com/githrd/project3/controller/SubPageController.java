package com.githrd.project3.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.githrd.project3.dao.ConcertMapper;
import com.githrd.project3.vo.ConcertVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/subpage/")
public class SubPageController {

    // 자동연결(요청시 마다 Injection)
    @Autowired
    HttpServletRequest request;

    @Autowired
    HttpSession session;

    @Autowired
    ConcertMapper concert_mapper;

    // 공연 정보 전체 조회 - 그리드 형식
    @RequestMapping("list_grid.do")
    public String subpage_grid(Model model) {

        // 공연 정보 가져오기
        List<ConcertVo> list = concert_mapper.selectList();

        // request binding
        model.addAttribute("list", list);

        return "concert/concert_grid";
    }

    // 공연 정보 전체조회 - 리스트 형식
    @RequestMapping("list.do")
    public String subpage_list(Model model) {

        return "concert/concert_list";
    }

    // 공연 정보 하나 조회 - idx로 정보 하나 가져오기
    @RequestMapping("detailpage.do")
    public String detailpage(int concert_idx, Model model) {

        ConcertVo vo = concert_mapper.selectOneFromIdx(concert_idx);

        model.addAttribute("vo", vo);

        return "/detailpage/detail";
    }

}
