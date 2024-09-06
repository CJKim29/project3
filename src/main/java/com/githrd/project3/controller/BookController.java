package com.githrd.project3.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
    public String concert_seat(@RequestParam("concert_idx") int concert_idx,
            @RequestParam("date") String concert_date,
            Model model) {

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

    // @RequestMapping("reserveSeats.do")
    // public String reserveSeats(@RequestParam("concert_idx") int concert_idx,
    // @RequestParam("concert_date") String concert_date,
    // @RequestParam("selectedSeats") String selectedSeats,
    // Model model) {
    // // 선택된 좌석이 없을 경우 처리
    // if (selectedSeats == null || selectedSeats.trim().isEmpty()) {
    // model.addAttribute("error", "선택된 좌석이 없습니다. 좌석을 선택해주세요.");
    // return "redirect:/book/concert_seat.do?concert_idx=" + concert_idx + "&date="
    // + concert_date;
    // }

    // // 좌석 정보를 파싱
    // String[] seatArray = selectedSeats.split(",");

    // // concert_date_idx 조회
    // Integer concertDateIdx = book_mapper.selectConcertDateIdx(concert_date,
    // concert_idx);
    // if (concertDateIdx == null) {
    // model.addAttribute("error", "잘못된 공연 날짜 또는 공연 ID입니다.");
    // return "redirect:/book/concert_seat.do?concert_idx=" + concert_idx + "&date="
    // + concert_date;
    // }

    // // 각 좌석을 업데이트
    // for (String seat : seatArray) {
    // if (!seat.contains("-")) {
    // model.addAttribute("error", "잘못된 좌석 정보입니다.");
    // return "redirect:/book/concert_seat.do?concert_idx=" + concert_idx + "&date="
    // + concert_date;
    // }

    // String[] seatInfo = seat.split("-");
    // try {
    // int row = Integer.parseInt(seatInfo[0]);
    // String col = seatInfo[1];

    // // s_hall 테이블 업데이트 쿼리 실행
    // book_mapper.updateSeatStatus(concertDateIdx, row, col);
    // } catch (NumberFormatException e) {
    // model.addAttribute("error", "좌석 번호를 처리하는 중 오류가 발생했습니다.");
    // return "redirect:/book/concert_seat.do?concert_idx=" + concert_idx + "&date="
    // + concert_date;
    // }
    // }

    // return "redirect:/book/concert_seat.do?concert_idx=" + concert_idx + "&date="
    // + concert_date;
    // }
    @PostMapping("/reserveSeats.do")
    public String reserveSeats(
            @RequestParam("concert_date") String concertDate, // 문자열로 받아옴
            @RequestParam("seat_idx") int seatIdx,
            @RequestParam("selectedSeats") String selectedSeats) {

        // concert_date는 문자열로 사용되며, 필요에 따라 변환 가능
        // 해당 문자열을 사용해 필요한 데이터베이스 값을 가져옵니다.

        // 임시로 콘솔에 출력하여 확인
        System.out.println("concertDate: " + concertDate);
        System.out.println("seatIdx: " + seatIdx);
        System.out.println("selectedSeats: " + selectedSeats);

        String[] seats = selectedSeats.split(",");
        for (String seat : seats) {
            String[] seatDetails = seat.split("-");
            int row = Integer.parseInt(seatDetails[0]);
            String col = seatDetails[1];
            book_mapper.updateSeatStatus(concertDate, seatIdx, row, col); // 좌석 상태 업데이트
        }
        return "redirect:book_seat.jsp?concert_date=" + concertDate + "&seat_idx=" + seatIdx;
    }

}
