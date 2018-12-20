package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.domain.User;
import com.service.userService;

public class userFunction extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		User user=(User) request.getSession().getAttribute("user");
		String flag=request.getParameter("flag");
		if(flag.equals("purchasetj")){
			String bookname=request.getParameter("bookname");
			String author=request.getParameter("author");
			String uid=user.getUsername();
			String type=user.getType();
			String unit=user.getUnit();
			Object obj[]={uid,type,unit,bookname,author};
			userService.purchasetj(obj);
			request.setAttribute("tjInfo", "success");
			request.getRequestDispatcher("searchBook?flag=first").forward(request, response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
