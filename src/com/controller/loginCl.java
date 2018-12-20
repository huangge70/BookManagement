package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.domain.User;
import com.service.userService;

public class loginCl extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String character=request.getParameter("character");
		System.out.println(username+" "+password+" "+character);
		if(character.equals("0")){
			ResultSet rs=userService.userlogin(username, password);
			try {
				if(rs.next()){
					User user=new User();
					user.setUsername(rs.getString("username"));
					user.setPassword(rs.getString("password"));
					user.setSex(rs.getString("sex"));
					user.setIllegal(rs.getInt("illegal"));
					user.setName(rs.getString("name"));
					user.setType(rs.getString("type"));
					user.setUnit(rs.getString("unit"));
					request.getSession().setAttribute("user", user);
					request.getRequestDispatcher("user/index.jsp").forward(request, response);
				}else{
					request.setAttribute("loginInfo", "error");
					request.getRequestDispatcher("index.jsp").forward(request, response);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		else{
			ResultSet rs=userService.userlogin(username, password);
			try {
				if(rs.next()){
					User user=new User();
					user.setUsername(rs.getString("username"));
					user.setPassword(rs.getString("password"));
					user.setSex(rs.getString("sex"));
					user.setName(rs.getString("name"));
					user.setType(rs.getString("type"));
					request.getSession().setAttribute("admin", user);
					request.getRequestDispatcher("admin/index.jsp").forward(request, response);
				}
				else{
					request.setAttribute("loginInfo", "error");
					request.getRequestDispatcher("index.jsp").forward(request, response);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
