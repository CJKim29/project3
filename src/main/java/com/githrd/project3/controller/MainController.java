package com.githrd.project3.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.githrd.project3.dao.MainMapper;
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

    @RequestMapping("performance_modi.do")
    public String performanceModify(@RequestParam(value = "performance_idx", required = false) Integer performanceIdx, Model model) {
        if (performanceIdx == null) {
            // 처리할 수 없는 경우 에러 페이지로 리다이렉트
            return "redirect:/error"; // 또는 적절한 에러 핸들링
        }
        // 특정 공연 정보 가져오기
        PerformanceVo performance = mainMapper.selectPerformanceById(performanceIdx);
        model.addAttribute("performance", performance);
        return "main/main_performance_modi"; // 수정 페이지로 이동
    }
    


    // 공연 정보 수정
    @RequestMapping("updatePerformance.do")
    public String updatePerformance(PerformanceVo performanceVo) {
        // 공연 정보 업데이트
        mainMapper.updatePerformance(performanceVo);
        return "redirect:list.do"; // 수정 후 공연 목록으로 리다이렉트
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
