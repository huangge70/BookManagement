package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.domain.User;
import com.service.userMaService;

public class userManagement extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String flag=request.getParameter("flag");
		if(flag.equals("add")){
			String username=request.getParameter("username");
			String name=request.getParameter("name");
			String password="123";
			String sex=request.getParameter("sex");
			String type=request.getParameter("type");
			String unit=request.getParameter("unit");
			int illegal=0;
			Object obj[]={username,name,password,sex,type,unit,illegal};
			userMaService.addUser(obj);
			request.setAttribute("addUserInfo", "success");
			request.getRequestDispatcher("admin/addUser.jsp").forward(request, response);
		}
		else if(flag.equals("delete")){
			String username=request.getParameter("username");
			userMaService.deleteUser(username);
			request.setAttribute("deleteUserInfo", "success");
			request.getRequestDispatcher("searchUser?flag=first").forward(request, response);
		}
		else if(flag.equals("search")){
			String username=request.getParameter("username");
			ResultSet rs=userMaService.searchUserByName(username);
			try {
				User user=new User();
				if(rs.next()){
					user.setUsername(rs.getString("username"));
					user.setName(rs.getString("name"));
					user.setPassword(rs.getString("password"));
					user.setSex(rs.getString("sex"));
					user.setType(rs.getString("type"));
					user.setUnit(rs.getString("unit"));
					user.setIllegal(rs.getInt("illegal"));
				}
				request.setAttribute("user", user);
				request.getRequestDispatcher("admin/updateUser.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(flag.equals("update")){
			String username=request.getParameter("username");
			String unit=request.getParameter("unit");
			int illegal=Integer.parseInt(request.getParameter("illegal"));
			Object obj[]={unit,illegal,username};
			userMaService.updateUser(obj);
			request.setAttribute("updateUserInfo", "success");
			request.getRequestDispatcher("userManagement?flag=search&username="+username).forward(request, response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
