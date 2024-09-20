package com.githrd.project3.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.githrd.project3.dao.PerformanceMapper;
import com.githrd.project3.util.MyCommon;
import com.githrd.project3.util.Paging;
import com.githrd.project3.util.PagingPList;
import com.githrd.project3.vo.MemberVo;
import com.githrd.project3.vo.PerformanceCateVo;
import com.githrd.project3.vo.PerformanceVo;
import com.githrd.project3.vo.SeatVo;

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
	public String performance_list(Model model) {

		// List<PerformanceVo> list = performance_mapper.selectList();

		// request binding
		// model.addAttribute("list", list);

		return "performance/performance_list";
	}

	// 카테고리 별 조회 및 정렬 기능
	@RequestMapping("category.do")
	public String category(@RequestParam(name = "page", defaultValue = "1") int nowPage,
			int performance_detail_cate_idx, String hall_area, String sort_options,
			@RequestParam(name = "sort_options_number", defaultValue = "9") int sort_options_number,
			Model model) {

		System.out.println("sort_options_number :" + sort_options_number);
		System.out.println("sort_options :" + sort_options);

		// 목록 가져오기 위한 map
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("performance_detail_cate_idx", performance_detail_cate_idx);
		map.put("hall_area", hall_area);
		map.put("sort_options", sort_options);
		// map.put("sort_options_number", sort_options_number);

		// paging
		// Map<String, Object> paging_map = new HashMap<String, Object>();
		// int start = (nowPage - 1) * MyCommon.Performance.BLOCK_LIST + 1;
		// int end = start + MyCommon.Performance.BLOCK_LIST - 1;

		int blockList = sort_options_number; // 선택된 값으로 게시물 수 설정
		int start = (nowPage - 1) * blockList + 1;
		int end = start + blockList - 1;

		System.out.printf("start:%d end:%d blockList:%d\n", start, end, blockList);
		map.put("start", start);
		map.put("end", end);

		// 콘서트 목록 가져오기
		List<PerformanceVo> list = performance_mapper.selectCategoryList(map);

		// 전체 게시물 수
		int rowTotal = performance_mapper.selectRowTotal(map);

		// System.out.printf("rowTotal:%d list.size():%d\n", rowTotal, list.size());

		// pageMenu생성하기
		String pageMenu = PagingPList.getPaging("category.do",
				nowPage,
				rowTotal,
				blockList,
				MyCommon.Performance.BLOCK_PAGE);

		// 전체 조회 및 페이징 된 목록 가져오기
		// List<PerformanceVo> paging_list =
		// performance_mapper.performancePageList(paging_map);

		// request binding
		model.addAttribute("performance_list", list);
		// model.addAttribute("paging_list", paging_list);
		model.addAttribute("pageMenu", pageMenu);

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
		int res = performance_mapper.insert(vo);

		return "redirect:list.do";
	}

	// 공연 좌석 등록 폼
	// "insert_form_price.do?performance_idx=" + performance_idx;
	@RequestMapping("insert_form_seat.do")
	public String insert_form_seat(int performance_idx, Model model) {

		// 공연 정보 등을 모델에 추가하여 JSP에 전달
		model.addAttribute("performance_idx", performance_idx);

		return "performance/performance_insert_form_seat";
	}

	// 공연 좌석 등록
	@RequestMapping("insert_seat.do")
	// 파라미터 Vo로 포장해달라고 요청
	public String insert_seat(SeatVo vo, int performance_idx, RedirectAttributes ra) {

		// session 만료 시 로그아웃 시키기 -> 로그인 폼으로 이동
		MemberVo user = (MemberVo) session.getAttribute("user");
		if (user == null) {

			ra.addAttribute("reason", "session_timeout");

			return "redirect:../member/login_form.do";
		}

		// insert 문자형 자료 enter 처리
		String seat_grade = vo.getSeat_grade().replaceAll("\n", "<br>");
		vo.setSeat_grade(seat_grade);

		// DB insert
		int res = performance_mapper.insertSeat(vo);

		return "redirect:list.do";
	}

	// 공연 수정 폼
	@RequestMapping("modify_form.do")
	public String modify_form(int performance_idx, Model model) {

		PerformanceVo vo = performance_mapper.selectOneFromIdx(performance_idx);

		// insert 문자형 자료 enter 처리
		String performance_name = vo.getPerformance_name().replaceAll("\n", "<br>");
		vo.setPerformance_name(performance_name);

		model.addAttribute("vo", vo);

		return "performance/performance_modify_form";
	}

	// 공연 수정
	@RequestMapping("modify.do")
	// 파라미터 Vo로 포장해달라고 요청
	public String modify(PerformanceVo vo, RedirectAttributes ra)
			throws IllegalStateException, IOException {

		// session 만료 시 처리 할 작업 : 로그아웃 시키기 -> 로그인 폼으로 이동
		// 세션 정보 구하기 - 로그인 한 유저 정보
		MemberVo user = (MemberVo) session.getAttribute("user");
		if (user == null) {

			// 사용자한테 로그아웃됐다고 알려주기 => member_login_form.jsp로 가서 안내멘트 작성
			ra.addAttribute("reason", "session_timeout");

			return "redirect:../member/login_form.do";
		}

		// insert 문자형 자료 enter 처리
		String performance_name = vo.getPerformance_name().replaceAll("\n", "<br>");
		vo.setPerformance_name(performance_name);

		// DB insert
		int res = performance_mapper.update(vo);

		return "redirect:list.do";
	}

	// 공연 수정 - 이미지 파일 업로드
	@RequestMapping(value = "image_upload.do")
	@ResponseBody // redirect할 때 사용해야하는 부분?
	public Map<String, String> image_upload(int performance_idx, @RequestParam MultipartFile photo)
			throws IllegalStateException, IOException {

		// 파일 업로드 처리
		// String absPath = application.getRealPath("/resources/images/"); // 파일 절대경로,
		// 상대경로
		String absPath = new File("src/main/webapp/resources/images/").getAbsolutePath();
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
			// 임시 파일 => 내가 지정한 위치로 복사
			photo.transferTo(f); // 예외 처리 넘기기

		}

		PerformanceVo vo = performance_mapper.selectOneFromIdx(performance_idx);

		// 이전에 있던 파일 삭제
		// File delFile = new File(absPath, vo.getPerformance_image());
		// delFile.delete();

		// update된 file 이름수정
		vo.setPerformance_image(performance_image); // 새로 업로드 된 파일 이름?

		// DB 추가
		int res = performance_mapper.updateImage(vo);

		Map<String, String> map = new HashMap<String, String>();
		map.put("performance_image", performance_image);

		return map;
	}

	// 공연 좌석 수정 폼 띄우기
	@RequestMapping("modify_form_seat.do")
	public String modify_form_seat(int performance_idx, Model model) {

		PerformanceVo vo = performance_mapper.selectOneFromIdx(performance_idx);

		model.addAttribute("vo", vo);

		return "performance/performance_modify_form_seat";
	}

	// 공연 좌석 수정
	@RequestMapping("modify_seat.do")
	// 파라미터 Vo로 포장해달라고 요청
	public String modify_seat(@RequestParam("seat_idx[]") List<Integer> seat_idx_list,
			@RequestParam("seat_grade[]") List<String> seat_grade_list,
			@RequestParam("seat_price[]") List<Integer> seat_price_list,
			int performance_idx,
			RedirectAttributes ra)
			throws IllegalStateException, IOException {

		// session 만료 시 처리 할 작업 : 로그아웃 시키기 -> 로그인 폼으로 이동
		// 세션 정보 구하기 - 로그인 한 유저 정보
		MemberVo user = (MemberVo) session.getAttribute("user");
		if (user == null) {

			// 사용자한테 로그아웃됐다고 알려주기 => member_login_form.jsp로 가서 안내멘트 작성
			ra.addAttribute("reason", "session_timeout");

			return "redirect:../member/login_form.do";
		}

		// 좌석 정보 수정 처리 - 여러 좌석 한 번에 수정하기 위해 배열로 받고 반복문 돌림
		for (int i = 0; i < seat_idx_list.size(); i++) {
			SeatVo vo = new SeatVo();
			vo.setSeat_idx(seat_idx_list.get(i));
			vo.setSeat_grade(seat_grade_list.get(i).replaceAll("\n", "<br>"));
			vo.setSeat_price(seat_price_list.get(i));
			vo.setPerformance_idx(performance_idx); // 이 부분 추가

			// 각 좌석 업데이트
			int res = performance_mapper.updateSeat(vo);
		}

		return "redirect:list.do";
	}

	// 공연 삭제
	@RequestMapping("delete.do")
	public String delete(int performance_idx) {

		// int res = qna_mapper.qna_delete(qna_idx);
		int res = performance_mapper.delete(performance_idx);

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

	// 검색 기능
	@RequestMapping("performance_search.do")
	public String search(String search, Model model) {
		// 검색어를 포함한 공연 목록 가져오기
		List<PerformanceVo> list = performance_mapper.searchPerformances("%" + search + "%");
		model.addAttribute("list", list);
		return "performance/performance_search"; // 검색 결과를 보여줄 JSP 페이지
	}

}