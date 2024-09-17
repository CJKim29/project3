package com.githrd.project3.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.githrd.project3.dao.DetailMapper;
import com.githrd.project3.dao.MemberMapper;
import com.githrd.project3.dao.ReviewMapper;
import com.githrd.project3.dao.ReviewScoreMapper;
import com.githrd.project3.vo.ActorVo;
import com.githrd.project3.vo.CastingVo;
import com.githrd.project3.vo.MemberVo;
import com.githrd.project3.vo.PerformanceExLikeVo;
import com.githrd.project3.vo.PerformanceVo;
import com.githrd.project3.vo.ReviewScoreVo;
import com.githrd.project3.vo.ReviewVo;

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

    @Autowired
    ReviewMapper review_mapper;

    @Autowired
    ReviewScoreMapper review_score_mapper;

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

        List<ReviewVo> list_review = review_mapper.selectReviewList(performance_idx);
        model.addAttribute("list_review", list_review);

        Double avgScore = review_score_mapper.avgScore(performance_idx);
        model.addAttribute("avgScore", avgScore);

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

    @RequestMapping(value = "review_insert.do", method = RequestMethod.POST)
    public String insertReview(
        ReviewVo vo,
        @RequestParam("performance_idx") int performance_idx,
        @RequestParam("review_score_point") int review_score_point,
        Model model, RedirectAttributes ra) {

            MemberVo user = (MemberVo) session.getAttribute("user");

		    if (user == null) {

			ra.addAttribute("reason", "session_timeout");

			return "redirect:../member/login_form.do";
		}

        vo.setMem_idx(user.getMem_idx());
		vo.setMem_nickname(user.getMem_nickname());
        vo.setPerformance_idx(performance_idx);

        String review_content = vo.getReview_content().replaceAll("\n", "<br>");
		vo.setReview_content(review_content);

		// DB insert
		review_mapper.review_insert(vo); // review_idx가 vo 객체에 설정됩니다.
        int review_idx = vo.getReview_idx(); // review_idx를 가져옵니다.

        ReviewScoreVo reviewScoreVo = new ReviewScoreVo();
        reviewScoreVo.setMem_idx(user.getMem_idx());
        reviewScoreVo.setPerformance_idx(performance_idx);
        reviewScoreVo.setReview_idx(review_idx);
        reviewScoreVo.setReview_score_point(review_score_point);

        review_mapper.insertReviewScore(reviewScoreVo);

        return "redirect:detail.do?performance_idx=" + performance_idx + "&review_submitted=true";
    }

    @PostMapping("/updateReadhit")
    @ResponseBody
        public Map<String, Object> updateReadhit(@RequestParam("review_idx") int review_idx, HttpSession session) {
            Map<String, Object> response = new HashMap<>();
            
            // 로그인 여부 확인
            Integer mem_idx = (Integer) session.getAttribute("mem_idx");
            if (mem_idx == null) {
                response.put("success", false);
                response.put("message", "로그인 후에만 조회수를 증가시킬 수 있습니다.");
                return response;
            }

            // 유저가 이미 조회수를 증가시킨 경우를 체크
            boolean hasAlreadyRead = review_mapper.checkUserReadhit(mem_idx, review_idx);
            if (hasAlreadyRead) {
                response.put("success", false);
                response.put("message", "이미 조회수가 증가된 항목입니다.");
                return response;
            }

            // 조회수 증가
            review_mapper.incrementReadhit(review_idx);

            // 유저의 조회수 증가 기록 추가
            review_mapper.insertUserReadhit(mem_idx, review_idx);

            response.put("success", true);
            response.put("message", "조회수가 성공적으로 업데이트되었습니다.");
            return response;
    }
}