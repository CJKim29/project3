package com.githrd.project3.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.githrd.project3.dao.PerformanceMapper;
import com.githrd.project3.vo.PerformanceVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/performance/")
public class PerformanceController {

	// 자동연결(요청시 마다 Injection)
	@Autowired
	HttpServletRequest request;

	@Autowired
	HttpSession session;

	// 처음에 1회 연결
	@Autowired
	PerformanceMapper performance_mapper;

	// 공연 정보 전체 조회
	@RequestMapping("list.do")
	public String performance_grid(Model model) {

		// 공연 정보 가져오기
		List<PerformanceVo> list = performance_mapper.selectList();

		// request binding
		model.addAttribute("list", list);

		return "performance/performance_list";
	}

	// 카테고리 별 조회 및 정렬 기능
	@RequestMapping("category.do")
	public String category(int performance_detail_cate_idx, String hall_area, String sort_options,
			int sort_options_number,
			Model model) {

		// 콘서트 목록 가져오기
		List<PerformanceVo> list = null;

		// 파라미터 값 잘 받아와지나 확인
		// System.out.println("sort_options : " + sort_options);
		// System.out.println("sort_options_number : " + sort_options_number);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("performance_detail_cate_idx", performance_detail_cate_idx);
		map.put("hall_area", hall_area);
		map.put("sort_options", sort_options);
		map.put("sort_options_number", sort_options_number);

		list = performance_mapper.selectCategoryList(map);

		// request binding
		model.addAttribute("list", list);

		return "performance/performance_list_bottom";
	}

	// 공연 정보 추가
	@RequestMapping("insert_form.do")
	public String insert_form() {

		return "performance/performance_insert_form";
	}

	// 상세페이지 띄우기
	@RequestMapping("performance_page.do")
	public String Performance_page(int performance_idx, Model model) {

		PerformanceVo vo = performance_mapper.selectOneFromIdx(performance_idx);

		model.addAttribute("vo", vo);

		return "/performance/performance_page";
	}

	// 좌석 조회 위함?
	@RequestMapping("performance_seat.do")
	public String performance_seat(Model model) {
		return "performance/performance_seat";
	}

}