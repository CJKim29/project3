package com.githrd.project3.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.githrd.project3.dao.DetailMapper;
import com.githrd.project3.vo.ActorVo;
import com.githrd.project3.vo.CastingVo;
import com.githrd.project3.vo.MemberVo;
import com.githrd.project3.vo.PerformanceExLikeVo;
import com.githrd.project3.vo.PerformanceVo;

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
    public String detail_page(int performance_idx, Model model) {

        PerformanceVo vo = detail_mapper.selectOneFromIdx(performance_idx);
        List<CastingVo> list = (List<CastingVo>) detail_mapper.selectCastingFromIdx(performance_idx);

        model.addAttribute("vo", vo);
        model.addAttribute("list", list);

        MemberVo user = (MemberVo) session.getAttribute("user");

        int likeCount = detail_mapper.getTotalLikeCount(performance_idx);

        model.addAttribute("likeCount", likeCount);

        if (user != null) {
            // 로그인된 경우, 좋아요 여부를 가져오기
            boolean isLiked = detail_mapper.findLike(performance_idx, user.getMem_idx());

            model.addAttribute("isLiked", isLiked);
        }

        return "detailpage/detail";
    }

    @RequestMapping("toggleLike.do")
    public String toggleLike(int performance_idx, Model model) {

        MemberVo user = (MemberVo) session.getAttribute("user");

        boolean isLiked = detail_mapper.findLike(performance_idx, user.getMem_idx());

        if (isLiked) {
            // 좋아요 취소
            detail_mapper.likeDown(performance_idx, user.getMem_idx());

        } else {
            // 좋아요 추가
            PerformanceExLikeVo likeVo = new PerformanceExLikeVo();
            likeVo.setPerformance_idx(performance_idx);
            likeVo.setMem_idx(user.getMem_idx());
            detail_mapper.likeUp(likeVo);
        }

        return "redirect:/detail/detail.do?performance_idx=" + performance_idx;
    }

    @RequestMapping("actor_list.do")
    public String list(Model model) {

        List<ActorVo> list = detail_mapper.selectActorList();

        model.addAttribute("list", list);

        return "detailpage/actor_list";
    }

}
