package com.githrd.project3.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.githrd.project3.dao.ConcertMapper;
import com.githrd.project3.vo.ConcertVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/concert/")
public class ConcertController {

	// 자동연결(요청시 마다 Injection)
	@Autowired
	HttpServletRequest request;

	@Autowired
	HttpSession session;

	// 처음에 1회 연결
	@Autowired
	ConcertMapper concert_mapper;

	// 공연 정보 전체 조회
	@RequestMapping("list.do")
	public String concert_grid(Model model) {

		// 공연 정보 가져오기
		List<ConcertVo> list = concert_mapper.selectList();

		// request binding
		model.addAttribute("list", list);

		return "concert/concert_list";
	}

	// 카테고리 별 조회 및 정렬 기능
	@RequestMapping("category.do")
	public String category(int concert_detail_cate_idx, String hall_area, String sort_options, int sort_options_number,
			Model model) {

		// 콘서트 목록 가져오기
		List<ConcertVo> list = null;

		// 파라미터 값 잘 받아와지나 확인
		// System.out.println("sort_options : " + sort_options);
		// System.out.println("sort_options_number : " + sort_options_number);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("concert_detail_cate_idx", concert_detail_cate_idx);
		map.put("hall_area", hall_area);
		map.put("sort_options", sort_options);
		map.put("sort_options_number", sort_options_number);

		list = concert_mapper.selectCategoryList(map);

		// request binding
		model.addAttribute("list", list);

		return "concert/concert_list_bottom";
	}

	// 상세페이지 띄우기
	@RequestMapping("concert_page.do")
	public String concert_page(int concert_idx, Model model) {

		ConcertVo vo = concert_mapper.selectOneFromIdx(concert_idx);

		model.addAttribute("vo", vo);

		return "/concert/concert_page";
	}

	// 좌석 조회 위함?
	@RequestMapping("concert_seat.do")
	public String concert_seat(Model model) {

		return "concert/concert_seat";
	}

}