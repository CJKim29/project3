package com.githrd.project3.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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

	// 장르별 조회(concert_detail_cate_idx)
	// @GetMapping("/category/{category}")
	// public ResponseEntity<List<Item>> getItemsByCategory(@PathVariable String
	// category) {
	// List<Item> items = itemService.getItemsByCategory(category);
	// return new ResponseEntity<>(items, HttpStatus.OK);
	// }
	@GetMapping("/category/{concert_detail_cate_idx}")
	public String category(int concert_detail_cate_idx, Model model) {

		ConcertVo vo = concert_mapper.selectOneFromCategory(concert_detail_cate_idx);

		model.addAttribute("vo", vo);

		return "";
	}

}