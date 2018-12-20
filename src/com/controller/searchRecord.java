package com.controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.domain.Book;
import com.domain.Record;
import com.domain.User;
import com.service.recordService;

public class searchRecord extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		User user=(User) request.getSession().getAttribute("user");
		String username=user.getUsername();	
		ResultSet rs=recordService.searchRecord(username);			
		List<Record> list=new ArrayList<Record>();
		try {
			while(rs.next()){
				Record record=new Record();
				record.setId(rs.getInt("id"));
				record.setUsername(rs.getString("username"));
				record.setName(rs.getString("name"));
				record.setBid(rs.getString("bid"));
				record.setBookname(rs.getString("bookname"));
				record.setTime(rs.getDate("time"));
				record.setState(rs.getString("state"));
				list.add(record);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("record", list);
		request.getRequestDispatcher("user/showRecord.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}
	
}
