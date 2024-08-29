package com.githrd.project3.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/subpage/")
public class SubPageController {

    // 자동연결(요청시 마다 Injection)
    @Autowired
    HttpServletRequest request;

    @Autowired
    HttpSession session;

    @RequestMapping("list_grid.do")
    public String subpage_grid(Model model) {

        return "subpage/subpage_grid";
    }

    @RequestMapping("list.do")
    public String subpage_list(Model model) {

        return "subpage/subpage_list";
    }

}
