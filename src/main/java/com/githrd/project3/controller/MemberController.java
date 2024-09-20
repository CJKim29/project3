package com.githrd.project3.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.githrd.project3.dao.MemberMapper;
import com.githrd.project3.vo.MemberVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/member/")
public class MemberController {

    // 자동연결(요청시 마다 Injection)
    @Autowired
    HttpServletRequest request;

    @Autowired
    HttpSession session;

    // 처음에 1회 연결
    @Autowired
    MemberMapper member_mapper;

    @RequestMapping("list.do")
    public String list(Model model) {

        // 회원목록 가져오기
        List<MemberVo> list = member_mapper.selectList();

        // request binding
        model.addAttribute("list", list);

        return "member/member_list";
    }

    // class RequestMapping + method RequestMapping => /member/login_form.do
    @RequestMapping("login_form.do")
    public String login_form() {

        String referer = request.getHeader("Referer");

        // 세션에 이전 페이지 URL 저장 (로그인 폼이 아닌 경우에만)
        if (referer != null && !referer.contains("login_form.do")) {
            session.setAttribute("prevPage", referer);
        }

        return "member/member_login_form";
    }

    // /member/login.do?mem_id=one&mem_pwd=1234

    @RequestMapping("login.do")
    public String login(String mem_id, String mem_pwd,
            RedirectAttributes ra) {

        MemberVo user = member_mapper.selectOneFromId(mem_id);

        if (user == null) {

            // RedirectAttributes => redirect시 parameter로 이용된다
            ra.addAttribute("reason", "fail_id");

            return "redirect:login_form.do";
        }

        // 비밀번호가 틀린경우
        if (user.getMem_pwd().equals(mem_pwd) == false) {

            ra.addAttribute("reason", "fail_pwd");
            ra.addAttribute("mem_id", mem_id);

            return "redirect:login_form.do";
        }

        // 로그인처리: 현재 로그인된 객체(user)정보를 session에 저장
        session.setAttribute("user", user);
        session.setAttribute("mem_idx", user.getMem_idx()); // mem_idx 추가 저장

        // 이전 페이지 정보가 세션에 저장되어 있는지 확인
        String prevPage = (String) session.getAttribute("prevPage");

        // 이전 페이지가 있다면 그쪽으로 리다이렉트, 없으면 메인 페이지로 이동
        if (prevPage != null) {
            session.removeAttribute("prevPage"); // 사용 후 세션에서 제거
            return "redirect:" + prevPage;
        }

        return "redirect:../main/list.do"; // 기본적으로 메인 페이지로 이동
    }

    // 로그아웃
    @RequestMapping("logout.do")
    public String logout() {

        session.removeAttribute("user");

        // 로그아웃 하기 전 페이지로 이동
        String referer = request.getHeader("Referer");

        if (referer != null) {
            return "redirect:" + referer;
        }

        return "redirect:../main/list.do";
    }

    // 삭제
    @RequestMapping("delete.do")
    public String delete(int mem_idx, RedirectAttributes ra) {

        // 2.로그인 한 유저가 일반유저 / 관리자 판단
        session = request.getSession();
        MemberVo user = (MemberVo) session.getAttribute("user"); // 다운캐스팅

        // 로그인 유저가 일반유저면 로그인정보 삭제
        if (user.getMem_grade().equals("일반")) {
            session.removeAttribute("user");
        }

        if (user.getMem_grade().equals("관리자") && user.getMem_idx() == mem_idx) {

            ra.addAttribute("reason", "not_admin_delete");
            return "redirect:list.do";
        }

        // 3.DB delete
        int res = member_mapper.delete(mem_idx);

        return "redirect:../main/list.do";
    }

    // 회원가입 폼
    @RequestMapping("insert_form.do")
    public String insert_form() {

        return "/member/member_insert_form";
    }

    @RequestMapping("insert.do")
    public String insert(MemberVo vo) {

        String mem_ip = request.getRemoteAddr();
        vo.setMem_ip(mem_ip);

        int res = member_mapper.insert(vo);

        return "redirect:login_form.do";
    }

    // 수정 폼
    @RequestMapping("modify_form.do")
    public String modify_form(int mem_idx, Model model) {

        // mem_idx에 해당하는 회원정보 얻어오기
        MemberVo vo = member_mapper.selectOneFromIdx(mem_idx);

        model.addAttribute("vo", vo);

        return "/member/member_modify_form";
    }

    // 수정하기
    @RequestMapping("modify.do")
    public String modify(MemberVo vo) {

        String mem_ip = request.getRemoteAddr();
        vo.setMem_ip(mem_ip);

        int res = member_mapper.update(vo);

        MemberVo loginUser = (MemberVo) session.getAttribute("user");

        // 현재수정정보가 로그인한 유저 본인인 경우
        if (loginUser.getMem_idx() == vo.getMem_idx()) {

            // 로그인상태정보
            MemberVo user = member_mapper.selectOneFromIdx(vo.getMem_idx());

            // scope내에 저장방식 Map형식:key/value쌍으로 저장
            // 동일한 key로 저장하면 수정처리됨(기존 value삭제할 필요X)
            session.setAttribute("user", user);
        }

        return "redirect:../mypage/mypage.do";
    }

    // 아이디체크
    @RequestMapping(value = "check_id.do")
    @ResponseBody
    public Map<String, Boolean> check_id(String mem_id) {

        MemberVo vo = member_mapper.selectOneFromId(mem_id);

        boolean bResult = (vo == null);

        Map<String, Boolean> map = new HashMap<String, Boolean>();
        map.put("result", bResult); // {"result" : true}

        return map;
    }

    // 닉네임 중복체크
    @RequestMapping(value = "check_nickname.do")
    @ResponseBody
    public Map<String, Boolean> check_nickname(String mem_nickname) {

        // mem_id에 해당 되는 유저정보 검색
        MemberVo vo = member_mapper.selectOne_nickname(mem_nickname);
        // vo에 없다면 중복되는 id가 없다는 뜻
        boolean bResult = (vo == null);

        Map<String, Boolean> map = new HashMap<String, Boolean>();
        map.put("result", bResult); // {"result" : true}

        return map;
    }

    // 회원 수정하기(프로필 이미지)
    @PostMapping(value = "/photo_modify.do")
    @ResponseBody
    public Map<String, String> photoModify(@RequestParam int mem_idx, @RequestParam("photo") MultipartFile photo)
            throws IllegalStateException, IOException {

        // 파일 업로드 처리
        // Spring Boot에서 resources 폴더에 저장하는 예시
        // String absPath = new
        // ClassPathResource("static/images/").getFile().getAbsolutePath();
        String absPath = new File("src/main/webapp/resources/images/").getAbsolutePath();
        String mem_filename = "no_file";

        if (!photo.isEmpty()) {
            // 업로드 된 파일 이름 얻어오기
            mem_filename = photo.getOriginalFilename();

            // 동일한 파일명이 있으면 파일명 변경
            File f = new File(absPath, mem_filename);
            if (f.exists()) {
                long tm = System.currentTimeMillis();
                mem_filename = String.format("%d_%s", tm, mem_filename);
                f = new File(absPath, mem_filename);
            }

            // 임시 파일을 지정한 위치로 복사
            photo.transferTo(f);
        }

        // 이전에 있던 파일 삭제
        MemberVo vo = member_mapper.selectOneFromIdx(mem_idx);
        // File delFile = new File(absPath, vo.getMem_filename());
        // if(delFile.exists()) {
        // delFile.delete();
        // }

        // 새로운 파일 이름으로 업데이트
        vo.setMem_filename(mem_filename);
        member_mapper.updateFilename(vo); // 업데이트 메소드명과 SQL 매핑 추가

        // 변경된 파일 이름을 JSON 형식으로 반환
        Map<String, String> result = new HashMap<>();
        result.put("mem_filename", mem_filename);

        return result;
    }
}