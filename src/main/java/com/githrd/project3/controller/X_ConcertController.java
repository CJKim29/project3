package com.githrd.project3.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.githrd.project3.dao.ConcertMapper;
import com.githrd.project3.dao.S_HallMapper;
import com.githrd.project3.vo.ConcertVo;
import com.githrd.project3.vo.S_HallVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/concert/")
public class X_ConcertController {

	// 자동연결(요청시 마다 Injection)
	@Autowired
	HttpServletRequest request;

	@Autowired
	HttpSession session;

	// 처음에 1회 연결
	@Autowired
	ConcertMapper concert_mapper;

	@Autowired
	S_HallMapper s_hall_mapper;

	@RequestMapping("list.do")
	public String list(Model model) {

		// 회원목록 가져오기
		List<ConcertVo> list = concert_mapper.selectList();

		// request binding
		model.addAttribute("list", list);

		return "concert/X_concert_list";
	}

	@RequestMapping("concert_page.do")
	public String concert_page(int concert_idx, Model model) {

		ConcertVo vo = concert_mapper.selectOneFromIdx(concert_idx);

		model.addAttribute("vo", vo);

		return "/concert/X_concert_page";
	}

	@RequestMapping("concert_seat.do")
	public String concert_seat(@RequestParam("concert_idx") int concert_idx,
			@RequestParam("date") String concert_date,
			Model model) {

		// List<S_HallVo> list = concert_mapper.selectS_HallList(concert_idx);

		// model.addAttribute("list", list);

		ConcertVo vo = concert_mapper.selectOneFromIdx(concert_idx);

		model.addAttribute("vo", vo);

		int zeroCount1 = concert_mapper.selectRemainSeat(concert_date, 1); // 변경: 반환 값을 int로 받음
		model.addAttribute("zeroCount1", zeroCount1); // zeroCount를 모델에 추가

		int zeroCount2 = concert_mapper.selectRemainSeat(concert_date, 2);
		model.addAttribute("zeroCount2", zeroCount2);

		int zeroCount3 = concert_mapper.selectRemainSeat(concert_date, 3);
		model.addAttribute("zeroCount3", zeroCount3);

		int zeroCount4 = concert_mapper.selectRemainSeat(concert_date, 4);
		model.addAttribute("zeroCount4", zeroCount4);

		int zeroCount5 = concert_mapper.selectRemainSeat(concert_date, 5);
		model.addAttribute("zeroCount5", zeroCount5);

		return "concert/X_concert_seat";
	}
}