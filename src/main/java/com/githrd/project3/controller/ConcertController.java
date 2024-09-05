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

	// 공연 정보 전체 조회 - 그리드 형식
	@RequestMapping("list_grid.do")
	public String concert_grid(Model model) {

		// 공연 정보 가져오기
		List<ConcertVo> list = concert_mapper.selectList();

		// request binding
		model.addAttribute("list", list);

		return "concert/concert_grid";
	}

	// 공연 정보 전체 조회 - 리스트 형식
	@RequestMapping("list.do")
	public String concert_list(Model model) {

		// 공연 정보 가져오기
		List<ConcertVo> list = concert_mapper.selectList();

		// request binding
		model.addAttribute("list", list);

		return "concert/concert_list";
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

	@RequestMapping("category.do")
	public String category(int concert_detail_cate_idx, String hall_area, String sort_options, int sort_options_number,
			Model model) {

		// 콘서트 목록 가져오기
		List<ConcertVo> list = null;

		// 파라미터 값 잘 받아와지나 확인
		// System.out.println(area);
		// System.out.println("genre : " + genre);
		// System.out.println("sort_options : " + sort_options);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("concert_detail_cate_idx", concert_detail_cate_idx);
		map.put("hall_area", hall_area);
		map.put("sort_options", sort_options);
		map.put("sort_options_number", sort_options_number);

		list = concert_mapper.selectCategoryList(map);

		// request binding
		model.addAttribute("list", list);

		return "concert/concert_grid_bottom";
	}

	@RequestMapping("category_area.do")
	public String category_area(int hall_idx, int concert_detail_cate_idx, Model model) {

		// 콘서트 목록 가져오기
		List<ConcertVo> list = null;

		// System.out.println(concert_detail_cate_idx);

		// hall_idx : jsp 함수 안에 선언 되어 있는 변수
		if (hall_idx == 0 && concert_detail_cate_idx == 0) { // '지역전체' + '장르전체'
			// 공연 목록 전체 조회
			list = concert_mapper.selectList();
		} else {
			list = concert_mapper.concert_area_list(hall_idx, concert_detail_cate_idx);
		}

		// request binding
		model.addAttribute("list", list);

		return "concert/concert_grid_bottom";
	}

}