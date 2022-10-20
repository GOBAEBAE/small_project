package data.dto;

import java.sql.Timestamp;

public class OttreDto {
	private String num;
	private String contentnum;
	private String ottid;
	private String txt;
	private Timestamp writeday;
	
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	
	public String getContentnum() {
		return contentnum;
	}
	public void setContentnum(String contentnum) {
		this.contentnum = contentnum;
	}
	public String getOttid() {
		return ottid;
	}
	public void setOttid(String ottid) {
		this.ottid = ottid;
	}
	public String getTxt() {
		return txt;
	}
	public void setTxt(String txt) {
		this.txt = txt;
	}
	public Timestamp getWriteday() {
		return writeday;
	}
	public void setWriteday(Timestamp writeday) {
		this.writeday = writeday;
	}
	
}
