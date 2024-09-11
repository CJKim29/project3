package com.githrd.project3.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.githrd.project3.dao.PerformanceMapper;
import com.githrd.project3.vo.PerformanceVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/main/")
public class MainController {

    // 자동연결(요청시 마다 Injection)
    @Autowired
    HttpServletRequest request;

    @Autowired
    HttpSession session;

    @Autowired
    PerformanceMapper performance_mapper;

    // 공연 정보 전체 조회 - 그리드 형식
    @RequestMapping("list.do")
    public String main(Model model) {

        // 공연 정보 가져오기
        List<PerformanceVo> list = performance_mapper.selectList();

        // request binding
        model.addAttribute("list", list);

        return "main/main";
    }

    @RequestMapping("performance_like.do")
    public String cart(Model model) {
        return "main/performance_like"; // `WEB-INF/views/main/performance_like.jsp`로 매핑
    }

    @RequestMapping("mypage.do")
    public String mypage(Model model){
        return "main/mypage";
    }

}
