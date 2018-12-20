package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.domain.Book;
import com.domain.Record;
import com.service.bookService;
import com.service.recordService;
import com.service.userService;

public class recordCl extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String flag=request.getParameter("flag");
		if(flag.equals("first")){
			request.getSession().setAttribute("recordPage", 1);
			ResultSet rs=recordService.searchAllRecord(1);
			List<Record> list=this.returnList(rs);
			request.setAttribute("record", list);
			request.getRequestDispatcher("admin/showAllRecord.jsp").forward(request, response);
		}
		else if(flag.equals("pre")){
			int n=(Integer)request.getSession().getAttribute("recordPage")-1;
			request.getSession().setAttribute("recordPage", n);
			ResultSet rs=recordService.searchAllRecord(n);
			List<Record> list=this.returnList(rs);
			request.setAttribute("record", list);
			request.getRequestDispatcher("admin/showAllRecord.jsp").forward(request, response);
		}
		else if(flag.equals("next")){
			int n=(Integer) request.getSession().getAttribute("recordPage")+1;
			request.getSession().setAttribute("recordPage", n);
			ResultSet rs=recordService.searchAllRecord(n);
			List<Record> list=this.returnList(rs);
			request.setAttribute("record", list);
			request.getRequestDispatcher("admin/showAllRecord.jsp").forward(request, response);
		}
		else if(flag.equals("last")){
			int n=6293;
			request.getSession().setAttribute("recordPage", n);
			ResultSet rs=userService.searchBook(n);
			List<Record> list=this.returnList(rs);
			request.setAttribute("record", list);
			request.getRequestDispatcher("admin/showAllRecord.jsp").forward(request, response);
		}
		else if(flag.equals("search")){
			String bookname=request.getParameter("bookname");
			System.out.println(bookname);
			ResultSet rs=recordService.searchRecordByBookname(bookname);
			List<Record> list=this.returnList(rs);
			request.setAttribute("record", list);
			request.getRequestDispatcher("admin/showAllRecord.jsp").forward(request, response);
		}
		else if(flag.equals("delete")){
			int id=Integer.parseInt(request.getParameter("id"));
			System.out.println(id);
			recordService.deleteRecord(id);
			request.setAttribute("deleteInfo", "success");
			request.getRequestDispatcher("recordCl?flag=first").forward(request, response);
		}
		else{
			int n=Integer.parseInt(request.getParameter("page"));
			request.getSession().setAttribute("recordPage", n);
			ResultSet rs=recordService.searchAllRecord(n);
			List<Record> list=this.returnList(rs);
			request.setAttribute("record", list);
			request.getRequestDispatcher("admin/showAllRecord.jsp").forward(request, response);
		}
	}
	public List<Record> returnList(ResultSet rs){
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
		return list;
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
