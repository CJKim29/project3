package com.githrd.project3.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.githrd.project3.dao.BookMapper;
import com.githrd.project3.dao.CartMapper;
import com.githrd.project3.dao.L_HallMapper;
import com.githrd.project3.dao.M_HallMapper;
import com.githrd.project3.dao.S_HallMapper;
import com.githrd.project3.vo.CartVo;
import com.githrd.project3.vo.L_HallVo;
import com.githrd.project3.vo.M_HallVo;
import com.githrd.project3.vo.PerformanceVo;
import com.githrd.project3.vo.S_HallVo;
import com.githrd.project3.vo.X_PerformanceVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/cart/")
public class CartController {

    @Autowired
    HttpServletRequest request;

    @Autowired
    HttpSession session;

    @Autowired
    CartMapper cart_mapper;

    @Autowired
    BookMapper book_mapper;

    @Autowired
    S_HallMapper s_hall_mapper;

    @Autowired
    M_HallMapper m_hall_mapper;

    @Autowired
    L_HallMapper l_hall_mapper;

    @RequestMapping("list.do")
    public String list(Model model) {

        // 장바구니 목록 가져오기
        List<CartVo> list = cart_mapper.cart_list();

        model.addAttribute("list", list);

        return "cart/cart_list";
    }

    @RequestMapping("insert.do")
    public String insert(@RequestParam("seatInfo") List<String> seatInfo,
            @RequestParam("date") String performance_date, Model model, CartVo cartVo) {
        System.out.println("--------------");
        System.out.println(cartVo);
        System.out.println("--------------");

        System.out.println("--------------");
        for (String seat : seatInfo) {
            System.out.println(seat);
        }
        System.out.println("--------------");

        int res = cart_mapper.cart_insert(cartVo);

        // 최근장바구니 번호 얻어오기 select max(c_idx) from cart

        // 좌석등록(반복문)

        return "redirect:list.do";
    }
}
