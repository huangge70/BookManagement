package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.domain.User;
import com.service.recordService;

public class returnBook extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		User user=(User) request.getSession().getAttribute("user");
		int id=Integer.parseInt(request.getParameter("id"));
		if(recordService.returnBook(id)){
			
			request.setAttribute("returnBookInfo", "success");
			request.getRequestDispatcher("searchRecord").forward(request, response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
