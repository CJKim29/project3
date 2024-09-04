package com.githrd.project3.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.githrd.project3.dao.FaqMapper;
import com.githrd.project3.util.MyCommon;
import com.githrd.project3.util.Paging;
import com.githrd.project3.vo.FaqVo;
import com.githrd.project3.vo.MemberVo;
import com.githrd.project3.vo.QnaVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/faq/")
public class FaqController {

    public FaqController() {

    }

    @Autowired
    HttpServletRequest request;

    @Autowired
    HttpSession session;

    @Autowired
    FaqMapper faq_mapper;

    @RequestMapping("list.do")
    public String list(
            @RequestParam(name = "page", defaultValue = "1") int nowPage,
            Model model) {

        // 세션에 기록되어 있는 show삭제 (조회수 증가시 refresh인한 증가 방지)
        session.removeAttribute("show");

        Map<String, Object> map = new HashMap<String, Object>();

        int start = (nowPage - 1) * MyCommon.Board.BLOCK_LIST + 1;
        int end = start + MyCommon.Board.BLOCK_LIST - 1;

        map.put("start", start);
        map.put("end", end);

        // 게시판 목록가져오기
        List<FaqVo> list = faq_mapper.faq_page_list(map);
        // System.out.println(list.size());

        // 전체 게시물 수
        int rowTotal = faq_mapper.faq_row_total(map);

        // pageMenu생성하기
        String pageMenu = Paging.getPaging("list.do",
                nowPage,
                rowTotal,
                MyCommon.Board.BLOCK_LIST,
                MyCommon.Board.BLOCK_PAGE);

        // DS로부터 전달받은 Model을 통해서 데이터를 넣는다.
        // DS는 model에 저장된 데이터를 request binding시킨다
        model.addAttribute("list", list);
        model.addAttribute("pageMenu", pageMenu);

        return "faq/faq_list";
    }

    @RequestMapping("insert_form.do")
    public String insert_form() {

        return "faq/faq_insert_form";
    }

    @RequestMapping("insert.do")
    public String insert(FaqVo vo, RedirectAttributes ra) {

        MemberVo user = (MemberVo) session.getAttribute("user");

        if (user == null) {

            ra.addAttribute("reason", "session_timeout");

            return "redirect:../member/login_form.do";
        }

        String faq_content = vo.getFaq_content().replaceAll("\n", "<br>");
        vo.setFaq_content(faq_content);

        // DB insert
        int res = faq_mapper.faq_insert(vo);

        return "redirect:list.do";
    }

    // 삭제
    @RequestMapping("delete.do")
    public String delete(int faq_idx) {

        int res = faq_mapper.faq_delete(faq_idx);

        return "redirect:list.do";
    }

    // 수정 폼
    @RequestMapping("modify_form.do")
    public String modify_form(int faq_idx, Model model) {

        FaqVo vo = faq_mapper.faq_one_from_idx(faq_idx);

        String faq_content = vo.getFaq_content().replaceAll("\n", "<br>");
        vo.setFaq_content(faq_content);

        model.addAttribute("vo", vo);

        return "faq/faq_modify_form";
    }

    // 수정
    @RequestMapping("modify.do")
    public String modify(FaqVo vo, RedirectAttributes ra) {

        MemberVo user = (MemberVo) session.getAttribute("user");

        if (user == null) {

            ra.addAttribute("reason", "session_timeout");

            return "redirect:../member/login_form.do";
        }

        // vo.setMem_idx(user.getMem_idx());
        // vo.setMem_name(user.getMem_name());

        String faq_content = vo.getFaq_content().replaceAll("\n", "<br>");
        vo.setFaq_content(faq_content);

        int res = faq_mapper.faq_update(vo);

        ra.addAttribute("faq_idx", vo.getFaq_idx());

        return "redirect:list.do";
    }

}
