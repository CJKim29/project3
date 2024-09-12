package com.githrd.project3.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.githrd.project3.dao.PerformanceMapper;
import com.githrd.project3.vo.MemberVo;
import com.githrd.project3.vo.PerformanceVo;

import jakarta.servlet.ServletContext;
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

	@Autowired
	ServletContext application;

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

	// 공연 정보 등록폼 띄우기
	@RequestMapping("insert_form.do")
	public String insert_form() {

		return "performance/performance_insert_form";
	}

	// 공연 정보 등록
	// 요청 parameter 이름과 받는 변수명이 동일하면 @RequestParam(name="")의 name속성 생략 가능 =>
	// @RequestParam 이렇게만 적어도 됨
	@RequestMapping("insert.do")
	// 파라미터 Vo로 포장해달라고 요청
	public String insert(PerformanceVo vo, @RequestParam MultipartFile photo, RedirectAttributes ra)
			throws IllegalStateException, IOException {

		// session 만료 시 처리 할 작업 : 로그아웃 시키기 -> 로그인 폼으로 이동
		// 세션 정보 구하기 - 로그인 한 유저 정보
		MemberVo user = (MemberVo) session.getAttribute("user");
		if (user == null) {

			// 사용자한테 로그아웃됐다고 알려주기 => member_login_form.jsp로 가서 안내멘트 작성
			ra.addAttribute("reason", "session_timeout");

			return "redirect:../member/login_form.do";
		}

		// 파일 업로드 처리
		String absPath = application.getRealPath("/resources/images/"); // 파일 절대경로, 상대경로
		String performance_image = "no_file";

		if (!photo.isEmpty()) {

			// 업로드 된 파일 이름 얻어오기
			performance_image = photo.getOriginalFilename();

			File f = new File(absPath, performance_image);

			if (f.exists()) { // 저장 경로에 동일한 파일이 존재하면 파일명 바꾸기
				// 원래 파일명 = 시간_원래파일명
				long tm = System.currentTimeMillis();
				performance_image = String.format("%d_%s", tm, performance_image);

				f = new File(absPath, performance_image);
			}
			// 임시 파일
			photo.transferTo(f); // 예외 처리 넘기기

		}
		// 업로드 된 파일 이름 저장
		vo.setPerformance_image(performance_image);

		// insert 문자형 자료 enter 처리
		String performance_name = vo.getPerformance_name().replaceAll("\n", "<br>");
		vo.setPerformance_name(performance_name);

		// DB insert
		int res = performance_mapper.performance_insert(vo);

		return "redirect:list.do";
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