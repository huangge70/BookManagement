package com.domain;

import java.util.Date;

public class Record {

	private int id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBid() {
		return bid;
	}
	public void setBid(String bid) {
		this.bid = bid;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	private String username;
	private String name;
	private String bid;
	private String bookname;
	private Date time;
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	private String state;
	public String toInsertSql(){
		String sql="insert into record values(id,'"+username+"','"+name+"','"+bid+"','"+bookname+"','"+time+"','"+state+"');";
		return sql;
		
	}
}
