package com.githrd.project3.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.githrd.project3.dao.BookMapper;
import com.githrd.project3.dao.S_HallMapper;
import com.githrd.project3.vo.S_HallVo;
import com.githrd.project3.vo.X_PerformanceVo;

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

    @Autowired
    S_HallMapper s_hall_mapper;

    @RequestMapping("list.do")
    public String list(Model model) {

        // 회원목록 가져오기
        List<X_PerformanceVo> list = book_mapper.selectList();

        // request binding
        model.addAttribute("list", list);

        return "book/book_list";
    }

    @RequestMapping("performance_page.do")
    public String performance_page(int performance_idx, Model model) {

        X_PerformanceVo vo = book_mapper.selectOneFromIdx(performance_idx);

        model.addAttribute("vo", vo);

        return "/book/book_page";
    }

    @RequestMapping("performance_seat.do")
    public String performance_seat(
            @RequestParam("performance_idx") int performance_idx,
            @RequestParam("date") String performance_date,
            Model model) {

        // performance_idx와 date 값 사용 가능
        model.addAttribute("performance_idx", performance_idx);
        model.addAttribute("performance_date", performance_date);

        List<S_HallVo> seats = s_hall_mapper.selectSeatsByPerformanceAndDate(performance_idx, performance_date);

        model.addAttribute("seats", seats);

        X_PerformanceVo vo = book_mapper.selectOneFromIdx(performance_idx);

        model.addAttribute("vo", vo);

        Integer performance_date_idx = book_mapper.selectPerformanceDateIdx(performance_date, performance_idx);

        if (performance_date_idx == null) {
            // performance_date_idx가 null일 경우 처리
            model.addAttribute("error", "Invalid performance date or performance ID.");
            return "book/book_seat";
        }

        int zeroCount1 = book_mapper.selectRemainSeat1(performance_date_idx, 1); // 변경: 반환 값을 int로 받음
        model.addAttribute("zeroCount1", zeroCount1); // zeroCount를 모델에 추가

        int zeroCount2 = book_mapper.selectRemainSeat1(performance_date_idx, 2);
        model.addAttribute("zeroCount2", zeroCount2);

        int zeroCount3 = book_mapper.selectRemainSeat1(performance_date_idx, 3);
        model.addAttribute("zeroCount3", zeroCount3);

        int zeroCount4 = book_mapper.selectRemainSeat1(performance_date_idx, 4);
        model.addAttribute("zeroCount4", zeroCount4);

        int zeroCount5 = book_mapper.selectRemainSeat1(performance_date_idx, 5);
        model.addAttribute("zeroCount5", zeroCount5);

        return "book/book_seat";
    }

    @PostMapping("/reserve_seats.do")
    public String reserveSeats(@RequestParam("performance_idx") int performance_idx,
            @RequestParam("date") String performance_date,
            @RequestParam("selectedSeats") String selectedSeatsJson) {
        // performance_date_idx를 구합니다.
        Integer performance_date_idx = book_mapper.getPerformanceDateIdx(performance_idx, performance_date);

        if (performance_date_idx == null) {
            // performance_date_idx가 null일 경우 처리
            return "errorPage";
        }

        // 선택된 좌석 정보 파싱
        ObjectMapper mapper = new ObjectMapper();
        List<Map<String, Object>> selectedSeats;
        try {
            selectedSeats = mapper.readValue(selectedSeatsJson, new TypeReference<List<Map<String, Object>>>() {
            });
        } catch (IOException e) {
            e.printStackTrace();
            return "errorPage";
        }

        // 선택된 좌석을 업데이트
        for (Map<String, Object> seat : selectedSeats) {
            int row = ((Number) seat.get("row")).intValue();
            String col = (String) seat.get("col");
            s_hall_mapper.updateSeatStatus(performance_date_idx, row, col);
        }

        // 좌석 예약 페이지로 리다이렉트
        return "redirect:/book/performance_seat.do?performance_idx=" + performance_idx + "&date=" + performance_date;
    }

    @PostMapping("/book_reservation.do")
    public String bookResult(@RequestParam("seatInfo") List<String> seatInfo,
            @RequestParam("performance_idx") int performance_idx,
            @RequestParam("date") String performance_date, Model model) {

        List<S_HallVo> seats = s_hall_mapper.selectSeatsByPerformanceAndDate(performance_idx,
                performance_date);

        model.addAttribute("seats", seats);

        X_PerformanceVo vo = book_mapper.selectOneFromIdx(performance_idx);

        model.addAttribute("vo", vo);

        // 좌석 정보 처리
        model.addAttribute("seatInfo", seatInfo);
        return "/mypage/my_reservation"; // book_result.jsp로 이동
    }
}
