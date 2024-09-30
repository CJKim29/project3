package com.githrd.project3.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.githrd.project3.dao.MainMapper;
import com.githrd.project3.dao.PerformanceMapper;
import com.githrd.project3.util.MyCommon.Performance;
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

    @Autowired
    MainMapper mainMapper;

    // 공연 정보 전체 조회 - 그리드 형식
    @RequestMapping("list.do")
    public String main(Model model) {
    
        // 공연 정보 가져오기
        List<PerformanceVo> list = performance_mapper.selectList();

        // 최신 공연 정보 가져오기
        List<PerformanceVo> newPerformances = performance_mapper.selectNewPerformances();

        // 랭킹 공연 정보 가져오기
        List<PerformanceVo> rankingPerformances = performance_mapper.selectRankingPerformances();
        
        
        // request binding
        model.addAttribute("list", list);
        model.addAttribute("newPerformances", newPerformances);
        model.addAttribute("rankingPerformances", rankingPerformances);

        return "main/main";
    }

     @GetMapping("/main")
    public String getMainPage(Model model) {
        List<Performance> romanticComedy = mainMapper.getRandomPerformancesByGenre("로맨틱코미디", 4);
        List<Performance> drama = mainMapper.getRandomPerformancesByGenre("드라마", 4);
        List<Performance> performance = mainMapper.getRandomPerformancesByGenre("퍼포먼스", 4);
        List<Performance> horrorThriller = mainMapper.getRandomPerformancesByGenre("공포/스릴러", 4);
        List<Performance> children = mainMapper.getRandomPerformancesByGenre("어린이", 4);

        model.addAttribute("romanticComedy", romanticComedy);
        model.addAttribute("drama", drama);
        model.addAttribute("performance", performance);
        model.addAttribute("horrorThriller", horrorThriller);
        model.addAttribute("children", children);

        return "main";
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
