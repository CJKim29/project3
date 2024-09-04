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

import com.githrd.project3.dao.QnaMapper;
import com.githrd.project3.util.MyCommon;
import com.githrd.project3.util.Paging;
import com.githrd.project3.vo.BoardVo;
import com.githrd.project3.vo.MemberVo;
import com.githrd.project3.vo.QnaVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/qna/")
public class QnaController {

    public QnaController() {

    }

    @Autowired
    HttpServletRequest request;

    @Autowired
    HttpSession session;

    @Autowired
    QnaMapper qna_mapper;

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
        List<QnaVo> list = qna_mapper.qna_page_list(map);
        // System.out.println(list.size());

        // 전체 게시물 수
        int rowTotal = qna_mapper.qna_row_total(map);

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

        return "qna/qna_list";
    }

    // 상세보기
    // /board/view.do?b_idx=5
    @RequestMapping("view.do")
    public String view(int qna_idx, Model model) {

        // b_idx에 해당되는 게시물 1건
        QnaVo vo = qna_mapper.qna_one_from_idx(qna_idx);

        // 결과적으로 request binding
        model.addAttribute("vo", vo);

        return "qna/qna_view";
    }

    @RequestMapping("insert_form.do")
    public String insert_form() {

        return "qna/qna_insert_form";
    }

    @RequestMapping("insert.do")
    public String insert(QnaVo vo, RedirectAttributes ra) {

        MemberVo user = (MemberVo) session.getAttribute("user");

        if (user == null) {

            ra.addAttribute("reason", "session_timeout");

            return "redirect:../member/login_form.do";
        }

        vo.setMem_idx(user.getMem_idx());
        vo.setMem_nickname(user.getMem_nickname());

        String qna_content = vo.getQna_content().replaceAll("\n", "<br>");
        vo.setQna_content(qna_content);

        // DB insert
        int res = qna_mapper.qna_insert(vo);

        return "redirect:list.do";
    }

    // 삭제
    @RequestMapping("delete.do")
    public String delete(int qna_idx) {

        int res = qna_mapper.qna_delete(qna_idx);

        return "redirect:list.do";
    }

    // 수정 폼
    @RequestMapping("modify_form.do")
    public String modify_form(int qna_idx, Model model) {

        QnaVo vo = qna_mapper.qna_one_from_idx(qna_idx);

        String qna_content = vo.getQna_content().replaceAll("\n", "<br>");
        vo.setQna_content(qna_content);

        model.addAttribute("vo", vo);

        return "qna/qna_modify_form";
    }

    // 수정
    @RequestMapping("modify.do")
    public String modify(QnaVo vo, RedirectAttributes ra) {

        MemberVo user = (MemberVo) session.getAttribute("user");

        if (user == null) {

            ra.addAttribute("reason", "session_timeout");

            return "redirect:../member/login_form.do";
        }

        // vo.setMem_idx(user.getMem_idx());
        // vo.setMem_name(user.getMem_name());

        String qna_content = vo.getQna_content().replaceAll("\n", "<br>");
        vo.setQna_content(qna_content);

        int res = qna_mapper.qna_update(vo);

        ra.addAttribute("qna_idx", vo.getQna_idx());

        return "redirect:view.do";
    }

}
