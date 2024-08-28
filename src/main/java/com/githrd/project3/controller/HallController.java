package com.githrd.project3.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.githrd.project3.dao.HallMapper;
import com.githrd.project3.vo.HallVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/hall/")
public class HallController {

	// 자동연결(요청시 마다 Injection)
	@Autowired
	HttpServletRequest request;

	@Autowired
	HttpSession session;

	// 처음에 1회 연결
	@Autowired
	HallMapper hall_mapper;

	@RequestMapping("list.do")
	public String list(Model model) {

		// 회원목록 가져오기
		List<HallVo> list = hall_mapper.selectList();

		// request binding
		model.addAttribute("list", list);

		return "hall/hall_list";
	}
}