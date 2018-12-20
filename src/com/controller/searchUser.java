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
import com.domain.User;
import com.service.bookService;
import com.service.userMaService;
import com.service.userService;

public class searchUser extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String flag=request.getParameter("flag");
		if(flag.equals("first")){
			request.getSession().setAttribute("userPage", 1);
			ResultSet rs=userMaService.searchUser(1);
			List<User> list=this.returnList(rs);
			request.setAttribute("user", list);
			request.getRequestDispatcher("admin/showUser.jsp").forward(request, response);
		}
		else if(flag.equals("pre")){
			int n=(Integer)request.getSession().getAttribute("userPage")-1;
			request.getSession().setAttribute("userPage", n);
			ResultSet rs=userMaService.searchUser(n);
			List<User> list=this.returnList(rs);
			request.setAttribute("user", list);
			request.getRequestDispatcher("admin/showUser.jsp").forward(request, response);
		}
		else if(flag.equals("next")){
			int n=(Integer) request.getSession().getAttribute("userPage")+1;
			request.getSession().setAttribute("userPage", n);
			ResultSet rs=userMaService.searchUser(n);
			List<User> list=this.returnList(rs);
			request.setAttribute("user", list);
			request.getRequestDispatcher("admin/showUser.jsp").forward(request, response);
		}
		else if(flag.equals("last")){
			int n=3131;
			request.getSession().setAttribute("userPage", n);
			ResultSet rs=userMaService.searchUser(n);
			List<User> list=this.returnList(rs);
			request.setAttribute("user", list);
			request.getRequestDispatcher("admin/showUser.jsp").forward(request, response);
		}
		else if(flag.equals("search")){
			String username=request.getParameter("username");
			ResultSet rs=userMaService.searchUserByName(username);
			List<User> list=this.returnList(rs);
			request.setAttribute("user", list);
			request.getRequestDispatcher("admin/showUser.jsp").forward(request, response);
		}
		else{
			int n=Integer.parseInt(request.getParameter("userPage"));
			request.getSession().setAttribute("userPage", n);
			ResultSet rs=userMaService.searchUser(n);
			List<User> list=this.returnList(rs);
			request.setAttribute("user", list);
			request.getRequestDispatcher("admin/showUser.jsp").forward(request, response);
		}
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}
	public List<User> returnList(ResultSet rs){
		List<User> list=new ArrayList<User>();
		try {	
			while(rs.next()){
				User user=new User();
				//System.out.println(rs.getString("username"));
				user.setUsername(rs.getString("username"));
				user.setName(rs.getString("name"));
				user.setPassword(rs.getString("password"));
				user.setSex(rs.getString("sex"));
				user.setType(rs.getString("type"));
				user.setUnit(rs.getString("unit"));
				user.setIllegal(rs.getInt("illegal"));
				list.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
