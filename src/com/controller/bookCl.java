package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.domain.User;
import com.service.bookService;

public class bookCl extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String state=request.getParameter("state");
		int id=Integer.parseInt(request.getParameter("bid"));
		User user=(User) request.getSession().getAttribute("user");
		if(state.equals("ÔÚ¼Ü")){
			
			if(bookService.borrowBook(user, id)){
				request.setAttribute("borrowInfo", "success");
				request.getRequestDispatcher("searchBook?flag=first").forward(request, response);
			}
		}
		else{
			if(bookService.bookBook(user, id)){
				request.setAttribute("bookingInfo", "success");
				request.getRequestDispatcher("searchBook?flag=first").forward(request, response);
			}
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response); 
	}

}
