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

        // 최신 공연 정보 가져오기
        List<PerformanceVo> newPerformances = performance_mapper.selectNewPerformances();

        // 랭킹 공연 정보 가져오기
        List<PerformanceVo> rankingPerformances = performance_mapper.selectRankingPerformances();
        
        // 카테고리별 랜덤 공연 가져오기
        List<PerformanceVo> randomRomanticPerformances = performance_mapper.getRandomPerformancesByCategory(1);
        List<PerformanceVo> randomDramaPerformances = performance_mapper.getRandomPerformancesByCategory(2);
        List<PerformanceVo> randomPerformancePerformances = performance_mapper.getRandomPerformancesByCategory(5);
        List<PerformanceVo> randomHorrorPerformances = performance_mapper.getRandomPerformancesByCategory(4);
        List<PerformanceVo> randomChildrenPerformances = performance_mapper.getRandomPerformancesByCategory(6);
        
        // request binding
        model.addAttribute("list", list);
        model.addAttribute("newPerformances", newPerformances);
        model.addAttribute("rankingPerformances", rankingPerformances);
        
        model.addAttribute("randomRomanticPerformances", randomRomanticPerformances);
        model.addAttribute("randomDramaPerformances", randomDramaPerformances);
        model.addAttribute("randomPerformancePerformances", randomPerformancePerformances);
        model.addAttribute("randomHorrorPerformances", randomHorrorPerformances);
        model.addAttribute("randomChildrenPerformances", randomChildrenPerformances);

        return "main/main";
    }
    

    




    @RequestMapping("cart.do")
    public String cart(Model model) {
        return "main/cart"; // WEB-INF/views/main/cart.jsp로 매핑한다
    }

    @RequestMapping("mypage.do")
    public String mypage(Model model){
        return "main/mypage";
    }

    
    

}
