package com.kong.dto;

import java.sql.Date;

public class ReplyDTO {

	private int    no;
	private String writer;
	private String content;
	private int    board_no;
	private int    grp_num;
	private int    grp_order;
	private int    indent;
	private int    pno;
	private Date   regi_date;
	
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public int getGrp_num() {
		return grp_num;
	}
	public void setGrp_num(int grp_num) {
		this.grp_num = grp_num;
	}
	public int getGrp_order() {
		return grp_order;
	}
	public void setGrp_order(int grp_order) {
		this.grp_order = grp_order;
	}
	public int getIndent() {
		return indent;
	}
	public void setIndent(int indent) {
		this.indent = indent;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public Date getRegi_date() {
		return regi_date;
	}
	public void setRegi_date(Date regi_date) {
		this.regi_date = regi_date;
	}
	
	
	
	
	
	
	
	
}
