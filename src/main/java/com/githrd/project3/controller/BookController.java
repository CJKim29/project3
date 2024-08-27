package com.githrd.project3.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.githrd.project3.dao.BookMapper;
import com.githrd.project3.vo.BookVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/book/")
public class BookController {

	// 자동연결(요청시 마다 Injection)
	@Autowired
	HttpServletRequest request;

	@Autowired
	HttpSession session;

	// 처음에 1회 연결
	@Autowired
	BookMapper book_mapper;

	@RequestMapping("list.do")
	public String list(Model model) {

		// 회원목록 가져오기
		List<BookVo> list = book_mapper.selectList();

		// request binding
		model.addAttribute("list", list);

		return "book/book_list";
	}

	@RequestMapping("book_page.do")
	public String modify_form(int concert_idx, Model model) {

		BookVo vo = book_mapper.selectOneFromIdx(concert_idx);

		model.addAttribute("vo", vo);

		return "/book/book_page";
	}
}