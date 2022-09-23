package model;

import java.sql.Date;

public class BoardReply {
	private int reply_no;
	private int member_no; 
	private int review_no;
	private String rp_content;
	private Date rp_reg_date;
	private String rp_del;
	
	public int getReply_no() {
		return reply_no;
	}
	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
	public String getRp_content() {
		return rp_content;
	}
	public void setRp_content(String rp_content) {
		this.rp_content = rp_content;
	}
	public Date getRp_reg_date() {
		return rp_reg_date;
	}
	public void setRp_reg_date(Date rp_reg_date) {
		this.rp_reg_date = rp_reg_date;
	}
	public String getRp_del() {
		return rp_del;
	}
	public void setRp_del(String rp_del) {
		this.rp_del = rp_del;
	}
}
