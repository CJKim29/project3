package com.githrd.project3.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.NoArgsConstructor;

@Alias("comment")
@NoArgsConstructor
@Data
public class CommentVo {

	int cmt_idx;
	String cmt_content;
	String cmt_ip;
	String cmt_regdate;
	int board_idx;
	int mem_idx;
	String mem_nickname;

	// public int getCmt_idx() {
	// return cmt_idx;
	// }

	// public void setCmt_idx(int cmt_idx) {
	// this.cmt_idx = cmt_idx;
	// }

	// public String getCmt_content() {
	// return cmt_content;
	// }

	// public void setCmt_content(String cmt_content) {
	// this.cmt_content = cmt_content;
	// }

	// public String getCmt_ip() {
	// return cmt_ip;
	// }

	// public void setCmt_ip(String cmt_ip) {
	// this.cmt_ip = cmt_ip;
	// }

	// public String getCmt_regdate() {
	// return cmt_regdate;
	// }

	// public void setCmt_regdate(String cmt_regdate) {
	// this.cmt_regdate = cmt_regdate;
	// }

	// public int getBoard_idx() {
	// return board_idx;
	// }

	// public void setBoard_idx(int board_idx) {
	// this.board_idx = board_idx;
	// }

	// public int getMem_idx() {
	// return mem_idx;
	// }

	// public void setMem_idx(int mem_idx) {
	// this.mem_idx = mem_idx;
	// }

	// public String getMem_nickname() {
	// return mem_nickname;
	// }

	// public void setMem_name(String mem_nickname) {
	// this.mem_nickname = mem_nickname;
	// }

}
