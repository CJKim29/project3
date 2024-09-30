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

     // 공연 수정 폼 요청
     @GetMapping("performance_modi.do")
     public String performanceModi(@RequestParam(value = "performance_idx", required = false) Integer performanceIdx, Model model) {
         if (performanceIdx != null) {
             // 공연 정보 가져오기 (수정할 때)
             PerformanceVo performance = mainMapper.selectPerformanceById(performanceIdx);
             model.addAttribute("performance", performance);
         } else {
             // 공연 정보 추가 폼 (새 공연 추가할 때)
             model.addAttribute("performance", new PerformanceVo());
         }
         return "main/main_performance_modi"; // 수정 및 추가 JSP 페이지로 이동
     }
 
     @PostMapping("updatePerformance.do")
public String updatePerformance(PerformanceVo performance, @RequestParam("performance_img") MultipartFile performance_img) {
    // 파일이 비어 있지 않은 경우에만 처리
    if (!performance_img.isEmpty()) {
        // 파일 저장 경로 설정 (실제 파일 저장 경로는 서버의 경로로 설정)
        String uploadDir = "F:/project3/src/main/webapp/resources/template/images/";
        String fileName = performance_img.getOriginalFilename();
        

        // 저장할 디렉토리 확인 및 생성
                File dir = new File(uploadDir);
                if (!dir.exists()) {
                    dir.mkdirs(); // 디렉토리가 없으면 생성
                }

        // 파일 저장 로직
        try {
            File destFile = new File(uploadDir + fileName);
            performance_img.transferTo(destFile);

            // 저장된 파일 경로를 performance 객체에 설정
            performance.setPerformance_image("/resources/template/images/" + fileName);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // 공연 정보 업데이트
    mainMapper.updatePerformance(performance);

    return "redirect:/main/list.do"; // 수정 후 목록으로 리다이렉트
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
