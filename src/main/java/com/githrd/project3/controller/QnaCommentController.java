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

import com.githrd.project3.dao.QnaCommentMapper;
import com.githrd.project3.dao.QnaMapper;
import com.githrd.project3.util.MyCommon;
import com.githrd.project3.util.Paging;
import com.githrd.project3.vo.QnaCommentVo;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/qna_cmt/")
public class QnaCommentController {

    @Autowired
    QnaCommentMapper qna_cmt_mapper;

    @Autowired
    QnaMapper qna_mapper;

    @Autowired
    HttpServletRequest request;

    public QnaCommentController() {

    }

    @RequestMapping("list.do")
    public String list(Integer qna_idx,
            @RequestParam(name = "page", defaultValue = "1") int nowPage,
            Model model) {

        // 가져올 범위 계산
        int start = (nowPage - 1) * MyCommon.Comment.BLOCK_LIST + 1;
        int end = start + MyCommon.Comment.BLOCK_LIST - 1;

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("qna_idx", qna_idx);
        map.put("start", start);
        map.put("end", end);

        List<QnaCommentVo> list = qna_cmt_mapper.qna_cmt_page_list(map);

        // Paging Menu 만들기
        int rowTotal = qna_cmt_mapper.qna_cmt_row_total(qna_idx);

        String pageMenu = Paging.getCommentPaging(nowPage,
                rowTotal,
                MyCommon.Comment.BLOCK_LIST,
                MyCommon.Comment.BLOCK_PAGE);

        model.addAttribute("list", list);
        model.addAttribute("pageMenu", pageMenu);

        return "qna_cmt/qna_cmt_list";
    }

    @RequestMapping(value = "insert.do")
    @ResponseBody
    public Map<String, Object> insert(QnaCommentVo vo) {

        String qna_cmt_content = vo.getQna_cmt_content().replaceAll("\n", "<br>");
        vo.setQna_cmt_content(qna_cmt_content);

        int res = qna_cmt_mapper.qna_cmt_insert(vo); // 들어간 행수

        Map<String, Object> map = new HashMap<>();
        map.put("result", res == 1);

        // 성공하면 해당 게시물을 답변완료('y')로 변경하기;
        qna_mapper.qna_update_use(vo.getQna_idx());

        return map;
    }

    @RequestMapping(value = "delete.do")
    @ResponseBody
    public Map<String, Object> delete(int qna_cmt_idx) {

        int res = qna_cmt_mapper.qna_cmt_delete(qna_cmt_idx); // 들어간 행수

        // JSONObject json = new JSONObject();
        // json.put("result", res == 1); // 제대로 delete가 되었느냐 // {"result" : true} or
        // {"result" : false}

        Map<String, Object> map = new HashMap<>();
        map.put("result", res == 1);

        return map;
    }

}
