package com.githrd.project3;

import java.util.TimeZone;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class Project3Application {

 public static void main(String[] args) {
  // 애플리케이션 시작 전에 시간대 설정
  TimeZone.setDefault(TimeZone.getTimeZone("Asia/Seoul"));
  SpringApplication.run(Project3Application.class, args);
 }

}
