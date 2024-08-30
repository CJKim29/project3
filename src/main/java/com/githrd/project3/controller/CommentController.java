package com.githrd.project3.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.githrd.project3.util.MyCommon;
import com.githrd.project3.util.Paging;
import com.githrd.project3.vo.CommentVo;

import com.githrd.project3.dao.CommentMapper;
import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/comment/")
public class CommentController {

	@Autowired
	CommentMapper comment_mapper;

	@Autowired
	HttpServletRequest request;

	public CommentController() {
		// TODO Auto-generated constructor stub
		System.out.println("--CommentController()--");
	}

	// /comment/list.do?b_idx=5&page=1
	@RequestMapping("list.do")
	public String list(int board_idx,
			@RequestParam(name = "page", defaultValue = "1") int nowPage,
			Model model) {

		// 가져올 범위 계산
		int start = (nowPage - 1) * MyCommon.Comment.BLOCK_LIST + 1;
		int end = start + MyCommon.Comment.BLOCK_LIST - 1;

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("board_idx", board_idx);
		map.put("start", start);
		map.put("end", end);

		List<CommentVo> list = comment_mapper.comment_page_list(map);

		// Paging Menu 만들기
		// b_idx의 댓글 개수 구한다
		int rowTotal = comment_mapper.comment_row_total(board_idx);

		String pageMenu = Paging.getCommentPaging(nowPage,
				rowTotal,
				MyCommon.Comment.BLOCK_LIST,
				MyCommon.Comment.BLOCK_PAGE);

		model.addAttribute("list", list);
		model.addAttribute("pageMenu", pageMenu);

		return "comment/comment_list";
	}

	// /comment/insert.do?cmt_content=내용&b_idx=5&mem_idx=2&mem_nickname=일길동
	@RequestMapping(value = "insert.do")
	@ResponseBody
	public Map<String, Object> insert(CommentVo vo) {

		System.out.println("--------------------------------------------");
		System.out.println(vo);
		System.out.println("--------------------------------------------");

		String cmt_ip = request.getRemoteAddr();
		vo.setCmt_ip(cmt_ip);

		String cmt_content = vo.getCmt_content().replaceAll("\n", "<br>");
		vo.setCmt_content(cmt_content);

		int res = comment_mapper.comment_insert(vo); // 들어간 행수

		Map<String, Object> map = new HashMap<>();
		map.put("result", res == 1);

		return map;
	}

	// /comment/delete.do?cmt_idx=5
	@RequestMapping(value = "delete.do")
	@ResponseBody
	public Map<String, Object> delete(int cmt_idx) {

		int res = comment_mapper.comment_delete(cmt_idx); // 들어간 행수

		// JSONObject json = new JSONObject();
		// json.put("result", res == 1); // 제대로 delete가 되었느냐 // {"result" : true} or
		// {"result" : false}

		Map<String, Object> map = new HashMap<>();
		map.put("result", res == 1);

		return map;

	}
}
