package com.githrd.project3.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Alias("member")
public class MemberVo {

    int mem_idx;
    String mem_name;
    String mem_id;
    String mem_pwd;
    String mem_nickname;
    String mem_birth;
    String mem_phone;
    String mem_email;

    String mem_zipcode;
    String mem_addr;
    String mem_ip;
    String mem_regdate;
    String mem_grade;

    String mem_filename;

    int mem_point;
    public Object getMem_idx;

    // 없어도 회원 기능 잘 되는지 테스트 후 삭제
    // 기본생성자 만들기
    // public MemberVo() {
    // }

    // 생성자 만들기 insert용
    public MemberVo(String mem_name, String mem_id, String mem_pwd, String mem_nickname, String mem_zipcode,
            String mem_addr,
            String mem_ip) {
        super();
        this.mem_name = mem_name;
        this.mem_id = mem_id;
        this.mem_pwd = mem_pwd;
        this.mem_nickname = mem_nickname;

        this.mem_zipcode = mem_zipcode;
        this.mem_addr = mem_addr;
        this.mem_ip = mem_ip;
    }

    // 생성자 update 용
    public MemberVo(int mem_idx, String mem_name, String mem_pwd, String mem_nickname, String mem_zipcode,
            String mem_addr, String mem_ip,
            String mem_grade) {
        super();
        this.mem_idx = mem_idx;
        this.mem_name = mem_name;
        this.mem_pwd = mem_pwd;
        this.mem_nickname = mem_nickname;

        this.mem_zipcode = mem_zipcode;
        this.mem_addr = mem_addr;
        this.mem_ip = mem_ip;
        this.mem_grade = mem_grade;
    }

}
