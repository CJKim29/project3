package com.githrd.project3.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/mypage/")
public class MypageController {

    @Autowired
    HttpServletRequest request;

    @Autowired
    HttpSession session;

    @RequestMapping("mypage.do")
    public String mypage_home() {

        return "mypage/mypage";
    }
}
