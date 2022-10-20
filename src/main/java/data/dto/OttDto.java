package data.dto;

import java.sql.Timestamp;

public class OttDto {
	private String num;
	private String title;
	private String photo;
	private String actors;
	private String ott;
	private Timestamp startday;
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getActors() {
		return actors;
	}
	public void setActors(String actors) {
		this.actors = actors;
	}
	public String getOtt() {
		return ott;
	}
	public void setOtt(String ott) {
		this.ott = ott;
	}
	public Timestamp getStartday() {
		return startday;
	}
	public void setStartday(Timestamp startday) {
		this.startday = startday;
	}
	
	
}
