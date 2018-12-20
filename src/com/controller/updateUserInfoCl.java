package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.domain.User;
import com.service.userService;

public class updateUserInfoCl extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


		 String password=request.getParameter("password");
	     String sex=request.getParameter("sex");
	     User user=(User)request.getSession().getAttribute("user");
	     String username=user.getUsername();
	     Object obj[]={password,sex,username};
	     if(userService.updateUserInfo(obj)){
	    	 user.setPassword(password);
	    	 user.setSex(sex);
	    	 request.getRequestDispatcher("user/updateUserInfo.jsp").forward(request, response);
	     }
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
