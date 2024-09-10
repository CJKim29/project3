package com.githrd.project3.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.githrd.project3.dao.BookMapper;
import com.githrd.project3.dao.S_HallMapper;
import com.githrd.project3.vo.S_HallVo;
import com.githrd.project3.vo.X_ConcertVo;

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
        List<X_ConcertVo> list = book_mapper.selectList();

        // request binding
        model.addAttribute("list", list);

        return "book/book_list";
    }

    @RequestMapping("concert_page.do")
    public String concert_page(int concert_idx, Model model) {

        X_ConcertVo vo = book_mapper.selectOneFromIdx(concert_idx);

        model.addAttribute("vo", vo);

        return "/book/book_page";
    }

    @RequestMapping("concert_seat.do")
    public String concert_seat(
            @RequestParam("concert_idx") int concert_idx,
            @RequestParam("date") String concert_date,
            Model model) {

        // concert_idx와 date 값 사용 가능
        model.addAttribute("concert_idx", concert_idx);
        model.addAttribute("concert_date", concert_date);

        // List<S_HallVo> list = concert_mapper.selectS_HallList(concert_idx);

        // model.addAttribute("list", list);

        List<S_HallVo> seats = s_hall_mapper.selectSeatsByConcertAndDate(concert_idx, concert_date);

        model.addAttribute("seats", seats);

        X_ConcertVo vo = book_mapper.selectOneFromIdx(concert_idx);

        model.addAttribute("vo", vo);

        Integer concert_date_idx = book_mapper.selectConcertDateIdx(concert_date, concert_idx);

        if (concert_date_idx == null) {
            // concert_date_idx가 null일 경우 처리
            model.addAttribute("error", "Invalid concert date or concert ID.");
            return "book/book_seat";
        }

        int zeroCount1 = book_mapper.selectRemainSeat1(concert_date_idx, 1); // 변경: 반환 값을 int로 받음
        model.addAttribute("zeroCount1", zeroCount1); // zeroCount를 모델에 추가

        int zeroCount2 = book_mapper.selectRemainSeat1(concert_date_idx, 2);
        model.addAttribute("zeroCount2", zeroCount2);

        int zeroCount3 = book_mapper.selectRemainSeat1(concert_date_idx, 3);
        model.addAttribute("zeroCount3", zeroCount3);

        int zeroCount4 = book_mapper.selectRemainSeat1(concert_date_idx, 4);
        model.addAttribute("zeroCount4", zeroCount4);

        int zeroCount5 = book_mapper.selectRemainSeat1(concert_date_idx, 5);
        model.addAttribute("zeroCount5", zeroCount5);

        return "book/book_seat";
    }

    @PostMapping("/reserve_seats.do")
    public String reserveSeats(@RequestParam("concert_idx") int concert_idx,
            @RequestParam("date") String concert_date,
            @RequestParam("selectedSeats") String selectedSeatsJson) {
        // concert_date_idx를 구합니다.
        Integer concert_date_idx = book_mapper.getConcertDateIdx(concert_idx, concert_date);

        if (concert_date_idx == null) {
            // concert_date_idx가 null일 경우 처리
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
            s_hall_mapper.updateSeatStatus(concert_date_idx, row, col);
        }

        // 좌석 예약 페이지로 리다이렉트
        return "redirect:/book/concert_seat.do?concert_idx=" + concert_idx + "&date=" + concert_date;
    }

    // @RequestMapping("book_result.do")
    // public String book_result(
    // @RequestParam("concert_idx") int concert_idx,
    // @RequestParam("date") String concert_date,
    // @RequestParam(value = "selectedSeats", required = false, defaultValue = "[]")
    // String selectedSeatsJson,
    // Model model) {

    // List<S_HallVo> seats = s_hall_mapper.selectSeatsByConcertAndDate(concert_idx,
    // concert_date);

    // model.addAttribute("seats", seats);

    // X_ConcertVo vo = book_mapper.selectOneFromIdx(concert_idx);

    // model.addAttribute("vo", vo);

    // // 선택된 좌석 정보를 모델에 추가
    // // JSON 문자열을 파싱하여 좌석 정보 리스트로 변환
    // ObjectMapper mapper = new ObjectMapper();
    // List<Map<String, String>> selectedSeats;

    // try {
    // selectedSeats = mapper.readValue(selectedSeatsJson, new
    // TypeReference<List<Map<String, String>>>() {
    // });
    // } catch (JsonProcessingException e) {
    // e.printStackTrace();
    // return "error"; // 파싱 실패 시 에러 페이지로 이동
    // }

    // List<S_HallVo> list = s_hall_mapper.BookedSeatList(concert_idx);
    // model.addAttribute("list", list);

    // // 선택된 좌석 정보를 Model에 추가하여 JSP로 전달
    // model.addAttribute("selectedSeats", selectedSeats);

    // return "book/book_result";
    // }
    @PostMapping("/book_result.do")
    public String bookResult(@RequestParam("seatInfo") List<String> seatInfo,
            @RequestParam("concert_idx") int concert_idx,
            @RequestParam("date") String concert_date, Model model) {

        List<S_HallVo> seats = s_hall_mapper.selectSeatsByConcertAndDate(concert_idx,
                concert_date);

        model.addAttribute("seats", seats);

        X_ConcertVo vo = book_mapper.selectOneFromIdx(concert_idx);

        model.addAttribute("vo", vo);

        // 좌석 정보 처리
        model.addAttribute("seatInfo", seatInfo);
        return "/book/book_result"; // book_result.jsp로 이동
    }
}
