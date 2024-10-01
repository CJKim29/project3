package com.githrd.project3.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.githrd.project3.dao.HallMapper;
import com.githrd.project3.vo.HallVo;
import com.githrd.project3.vo.MemberVo;
import com.githrd.project3.vo.PerformanceVo;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/hall/")
public class HallController {

  // 자동연결(요청시 마다 Injection)
  @Autowired
  HttpServletRequest request;

  @Autowired
  HttpSession session;

  // 처음에 1회 연결
  @Autowired
  HallMapper hall_mapper;

  @Autowired
  ServletContext application;

  @RequestMapping("list.do")
  public String list(
      @RequestParam(defaultValue = "all") String area,
      Model model) {

    Map<String, Object> map = new HashMap<>();

    if (!area.equals("all")) {
      map.put("area", area);
    }

    // 회원목록 가져오기
    List<HallVo> list = hall_mapper.hall_list(map);

    // request binding
    model.addAttribute("list", list);

    return "hall/hall_list";
  }

  @RequestMapping("insert_form.do")
  public String insert_form() {

    return "hall/hall_insert_form";
  }

  @RequestMapping("insert.do")
  public String insert(HallVo vo, @RequestParam MultipartFile photo,
      RedirectAttributes ra) throws Exception {

    MemberVo user = (MemberVo) session.getAttribute("user");
    if (user == null) {

      // 사용자한테 로그아웃됐다고 알려주기 => member_login_form.jsp로 가서 안내멘트 작성
      ra.addAttribute("reason", "session_timeout");

      return "redirect:../member/login_form.do";
    }

    // 파일 업로드 처리
    String absPath = application.getRealPath("/resources/images/"); // 파일 절대경로, 상대경로
    String hall_image = "no_file";

    if (!hall_image.isEmpty()) {

      // 업로드 된 파일 이름 얻어오기
      hall_image = photo.getOriginalFilename();

      File f = new File(absPath, hall_image);

      if (f.exists()) { // 저장 경로에 동일한 파일이 존재하면 파일명 바꾸기
        // 원래 파일명 = 시간_원래파일명
        long tm = System.currentTimeMillis();
        hall_image = String.format("%d_%s", tm, hall_image);

        f = new File(absPath, hall_image);
      }
      // 임시 파일
      photo.transferTo(f); // 예외 처리 넘기기
    }
    vo.setHall_image(hall_image);

    int area_idx = 0;

    // hall_area 값에 따른 area_idx 매핑
    switch (vo.getHall_area()) {
      case "서울":
        area_idx = 1;
        break;
      case "경기/인천":
        area_idx = 2;
        break;
      case "충청/대전":
        area_idx = 3;
        break;
      case "경상/대구/부산":
        area_idx = 4;
        break;
      case "전라/광주":
        area_idx = 5;
        break;
      case "강원":
        area_idx = 6;
        break;
      case "제주":
        area_idx = 7;
        break;
    }
    vo.setArea_idx(area_idx);

    int res = hall_mapper.hall_insert(vo);

    return "redirect:list.do";
  }

  @RequestMapping("delete.do")
  public String delete(int hall_idx) {

    int res = hall_mapper.hall_delete(hall_idx);

    return "redirect:list.do";
  }

  @RequestMapping("modify_form.do")
  public String modify_form(int hall_idx, Model model) {

    HallVo vo = hall_mapper.hall_one_from_idx(hall_idx);

    model.addAttribute("vo", vo);

    return "hall/hall_modify_form";
  }

  @RequestMapping("modify.do")
  public String modify(HallVo vo, @RequestParam MultipartFile photo, RedirectAttributes ra)
      throws Exception {

    MemberVo user = (MemberVo) session.getAttribute("user");

    if (user == null) {

      ra.addAttribute("reason", "session_timeout");

      return "redirect:../member/login_form.do";
    }

    // 파일 업로드 처리
    String absPath = application.getRealPath("/resources/images/"); // 파일 절대경로, 상대경로
    String hall_image = "no_file";

    if (!hall_image.isEmpty()) {

      // 업로드 된 파일 이름 얻어오기
      hall_image = photo.getOriginalFilename();

      File f = new File(absPath, hall_image);

      if (f.exists()) { // 저장 경로에 동일한 파일이 존재하면 파일명 바꾸기
        // 원래 파일명 = 시간_원래파일명
        long tm = System.currentTimeMillis();
        hall_image = String.format("%d_%s", tm, hall_image);

        f = new File(absPath, hall_image);
      }
      // 임시 파일
      photo.transferTo(f); // 예외 처리 넘기기
    }
    vo.setHall_image(hall_image);

    int area_idx = 0;

    // hall_area 값에 따른 area_idx 매핑
    switch (vo.getHall_area()) {
      case "서울":
        area_idx = 1;
        break;
      case "경기/인천":
        area_idx = 2;
        break;
      case "충청/대전":
        area_idx = 3;
        break;
      case "경상/대구/부산":
        area_idx = 4;
        break;
      case "전라/광주":
        area_idx = 5;
        break;
      case "강원":
        area_idx = 6;
        break;
      case "제주":
        area_idx = 7;
        break;
    }
    vo.setArea_idx(area_idx);

    int res = hall_mapper.hall_modify(vo);

    return "redirect:list.do";
  }

  @RequestMapping("search.do")
  public String search(@RequestParam("hall_idx") int hall_idx, Model model) {
    List<PerformanceVo> list = hall_mapper.search_list(hall_idx);
    String hall_name = hall_mapper.get_hall_name(hall_idx);

    // 조회된 공연 목록을 모델에 추가
    model.addAttribute("list", list);
    model.addAttribute("hall_name", hall_name);

    return "hall/hall_search";
  }
}