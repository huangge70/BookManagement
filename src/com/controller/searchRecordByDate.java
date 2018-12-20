package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.domain.Record;
import com.domain.User;
import com.service.recordService;

public class searchRecordByDate extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		User user=(User) request.getSession().getAttribute("user");
		String username=user.getUsername();
		String beginDate=request.getParameter("beginDate");
		String endDate=request.getParameter("endDate");		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date begin=null;
		Date end=null;
		try {
			begin=sdf.parse(beginDate);  
			end=sdf.parse(endDate);	
		} catch (Exception e) {
			e.printStackTrace();
		}	  
		Object obj[]={username,begin,end};
		ResultSet rs=recordService.searchRecordByDate(obj);
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
