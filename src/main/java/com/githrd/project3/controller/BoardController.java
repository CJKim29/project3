package com.githrd.project3.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.githrd.project3.dao.BoardMapper;
import com.githrd.project3.util.MyCommon;
import com.githrd.project3.util.Paging;
import com.githrd.project3.vo.BoardVo;
import com.githrd.project3.vo.MemberVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/board/")
public class BoardController {

	public BoardController() {

	}

	@Autowired
	HttpServletRequest request;

	@Autowired
	HttpSession session;

	@Autowired
	// @Qualifier("board.dao") // 식별자 -연결시킴
	BoardMapper board_mapper;

	@RequestMapping("list.do")
	public String list(@RequestParam(name = "page", defaultValue = "1") int nowPage,
			@RequestParam(defaultValue = "all") String search,
			@RequestParam(defaultValue = "board_idx") String sort, String search_text, Model model) {

		// 세션에 기록되어 있는 show삭제 (조회수 증가시 refresh인한 증가 방지)
		session.removeAttribute("show");

		Map<String, Object> map = new HashMap<String, Object>();

		int start = (nowPage - 1) * MyCommon.Board.BLOCK_LIST + 1;
		int end = start + MyCommon.Board.BLOCK_LIST - 1;

		map.put("start", start);
		map.put("end", end);
		map.put("sort", sort); // sort 파라미터를 map에 추가

		// 제목 + 작성자
		if (search.equals("name_content")) {
			map.put("board_name", search_text);
			map.put("mem_nickname", search_text);
		} else if (search.equals("board_name")) {
			// 제목
			map.put("board_name", search_text);
		} else if (search.equals("mem_nickname")) {
			// 작성자
			map.put("mem_nickname", search_text);
		}

		// 전체 게시물 수
		int rowTotal = board_mapper.board_row_total(map);

		String search_filter = String.format("search=%s&search_text=%s", search, search_text);

		// pageMenu생성하기
		String pageMenu = Paging.getPaging("list.do",
				search_filter,
				nowPage,
				rowTotal,
				MyCommon.Board.BLOCK_LIST,
				MyCommon.Board.BLOCK_PAGE);

		// 게시판 목록가져오기
		List<BoardVo> list = board_mapper.board_page_list(map);

		// DS로부터 전달받은 Model을 통해서 데이터를 넣는다.
		// DS는 model에 저장된 데이터를 request binding시킨다
		model.addAttribute("list", list);
		model.addAttribute("pageMenu", pageMenu);

		return "board/board_list";
	}

	@RequestMapping("insert_form.do")
	public String insert_form() {

		return "board/board_insert_form";
	}

	// /board/insert.do?board_cate_idx&board_name=제목&board_content=내용
	@RequestMapping("insert.do")
	public String insert(BoardVo vo, RedirectAttributes ra) {

		MemberVo user = (MemberVo) session.getAttribute("user");

		if (user == null) {

			ra.addAttribute("reason", "session_timeout");

			return "redirect:../member/login_form.do";
		}

		vo.setMem_idx(user.getMem_idx());
		vo.setMem_nickname(user.getMem_nickname());

		// 작성자 IP
		String board_ip = request.getRemoteAddr();
		vo.setBoard_ip(board_ip);

		String board_content = vo.getBoard_content().replaceAll("\n", "<br>");
		vo.setBoard_content(board_content);

		// DB insert
		int res = board_mapper.board_insert(vo);

		return "redirect:list.do";
	}

	// 상세보기
	// /board/view.do?b_idx=5
	@RequestMapping("view.do")
	public String view(int board_idx, Model model) {

		// b_idx에 해당되는 게시물 1건
		BoardVo vo = board_mapper.board_one_from_idx(board_idx);

		// 게시글을 안봤으면 (refresh에 의한 조회수 증가 차단)
		if (session.getAttribute("show") == null) {

			// 조회수 증가
			int res = board_mapper.board_update_readhit(board_idx);

			session.setAttribute("show", true);
		}

		// int res = board_mapper.board_update_readhit(board_idx);

		// 결과적으로 request binding
		model.addAttribute("vo", vo);

		return "board/board_view";
	}

	// 답글쓰기 폼
	@RequestMapping("reply_form.do")
	public String reply_form() {

		return "board/board_reply_form";
	}

	// /bbs/board/delete.do?b_idx=18
	@RequestMapping("delete.do")
	public String delete(int board_idx) {

		// 삭제 처리 : b_use : 'n'
		int res = board_mapper.board_update_use(board_idx);

		return "redirect:list.do";
	}

	// 수정 폼
	@RequestMapping("modify_form.do")
	public String modify_form(int board_idx, Model model) {

		BoardVo vo = board_mapper.board_one_from_idx(board_idx);

		String board_content = vo.getBoard_content().replaceAll("\n", "<br>");
		vo.setBoard_content(board_content);

		model.addAttribute("vo", vo);

		return "board/board_modify_form";
	}

	// 수정
	// /bbs/board/modify.do?b_idx=&b_subject=굿굿&b_content=나이수~
	@RequestMapping("modify.do")
	public String modify(BoardVo vo, RedirectAttributes ra) {

		MemberVo user = (MemberVo) session.getAttribute("user");

		if (user == null) {

			ra.addAttribute("reason", "session_timeout");

			return "redirect:../member/login_form.do";
		}

		// vo.setMem_idx(user.getMem_idx());
		// vo.setMem_name(user.getMem_name());

		// 작성자 IP
		String board_ip = request.getRemoteAddr();
		vo.setBoard_ip(board_ip);

		String board_content = vo.getBoard_content().replaceAll("\n", "<br>");
		vo.setBoard_content(board_content);

		int res = board_mapper.board_update(vo);

		ra.addAttribute("board_idx", vo.getBoard_idx());

		return "redirect:view.do";
	}

}