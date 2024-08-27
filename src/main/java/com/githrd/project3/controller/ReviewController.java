package com.githrd.project3.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.githrd.project3.dao.ReviewMapper;
import com.githrd.project3.vo.MemberVo;
import com.githrd.project3.vo.ReviewVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/review/")
public class ReviewController {

    // 자동연결(요청시 마다 Injection)
    @Autowired
    HttpServletRequest request;

    @Autowired
    HttpSession session;

    // 처음에 1회 연결
    @Autowired
    ReviewMapper review_mapper;

    // 전체 조회
    @RequestMapping("list.do")
    public String list(Model model) {

        // 리뷰 목록 가져오기
        List<ReviewVo> list = review_mapper.selectList();

        // request binding
        model.addAttribute("list", list);

        return "review/review_list";
    }

    // 후기 등록폼 띄우기
    @RequestMapping("insert_form.do")
    public String insert_form() {
        return "review/review_insert_form";
    }

    // 후기 등록(insert)
    @RequestMapping("insert.do")
    public String insert(ReviewVo vo, RedirectAttributes ra) {

        // 세션 정보 구하기
        MemberVo user = (MemberVo) session.getAttribute("user");

        // session timeout = session이 만료가 된 상황
        if (user == null) {
            // 사용자한테 로그아웃됐다고 알려주기 => 다시 로그인 하세요 => 로그인 폼으로 보내기
            // response.sendRedirect("../member/login_form.do?reason=session_timeout"); //
            // member_login_form.jsp로 가서 안내멘트 작성
            ra.addAttribute("reason", "session_timeout");

            return "redirect:../member/login_form.do";
        }

        // insert_form에서 작성한 내용 받기
        String review_title = vo.getReview_title().replaceAll("\n", "<br>");
        vo.setReview_title(review_title);

        String review_content = vo.getReview_content().replaceAll("\n", "<br>");
        vo.setReview_content(review_content);

        // 로그인 유저 정보 넣기 - idx, nickname
        vo.setMem_idx(user.getMem_idx());
        vo.setMem_nickname(user.getMem_nickname());

        // 공연 번호 받아 오기?
        // vo.setConcert_idx(0);

        // ip 받기
        String review_ip = request.getRemoteAddr();
        vo.setReview_ip(review_ip);

        // DB insert
        int res = review_mapper.insert(vo);

        return "redirect:list.do";
    }

}
