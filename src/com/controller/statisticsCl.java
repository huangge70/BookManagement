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

import com.domain.*;
import com.service.bookService;
import com.service.recordService;
import com.service.userService;

public class statisticsCl extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String flag=request.getParameter("flag");
		if(flag.equals("retrieval")){
			ResultSet rs=recordService.searchRetrieval();
			List<Retrieval> list=this.returnList(rs);
			request.setAttribute("retrieval", list);
			request.getRequestDispatcher("admin/showRetrieval.jsp").forward(request, response);
		}
		else if(flag.equals("tuijian")){
			ResultSet rs=recordService.searchTuijian();
			List<Purchasetj> list=new ArrayList<Purchasetj>();
			try {
				while(rs.next()){
					Purchasetj p=new Purchasetj();
					p.setId(rs.getInt(1));
					p.setUid(rs.getString(2));
					p.setType(rs.getString(3));
					p.setUnit(rs.getString(4));
					p.setBookname(rs.getString(5));
					p.setAuthor(rs.getString(6));
					list.add(p);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("purchasetj", list);
			request.getRequestDispatcher("admin/showPurchasetj.jsp").forward(request, response);
		}
		else if(flag.equals("tjtj")){
			ResultSet rs=recordService.searchTjtj();
			List<Tjtj> list=new ArrayList<Tjtj>();
			try {
				while(rs.next()){
					Tjtj t=new Tjtj();
					t.setBookname(rs.getString(1));
					t.setCount(rs.getInt(2));
					list.add(t);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("tjtj", list);
			request.getRequestDispatcher("admin/showTjtj.jsp").forward(request, response);
		}
		else if(flag.equals("borrowTj")){
			String flag2=request.getParameter("flag2");
			if(flag2.equals("first")){
				request.getSession().setAttribute("borrowTjPage", 1);
				ResultSet rs=recordService.borrowTj(1);
				List<Borrowtj> list=this.returnList2(rs);
				request.setAttribute("borrowTj", list);
				request.getRequestDispatcher("admin/showBorrowTj.jsp").forward(request, response);
			}
			else if(flag2.equals("pre")){
				int n=(Integer)request.getSession().getAttribute("borrowTjPage")-1;
				request.getSession().setAttribute("borrowTjPage", n);
				ResultSet rs=recordService.borrowTj(n);
				List<Borrowtj> list=this.returnList2(rs);
				request.setAttribute("borrowTj", list);
				request.getRequestDispatcher("admin/showBorrowTj.jsp").forward(request, response);
			}
			else if(flag2.equals("next")){
				int n=(Integer) request.getSession().getAttribute("borrowTjPage")+1;
				request.getSession().setAttribute("borrowTjPage", n);
				ResultSet rs=recordService.borrowTj(n);
				List<Borrowtj> list=this.returnList2(rs);
				request.setAttribute("borrowTj", list);
				request.getRequestDispatcher("admin/showBorrowTj.jsp").forward(request, response);
			}
			else if(flag2.equals("last")){
				int n=2945;
				request.getSession().setAttribute("borrowTjPage", n);
				ResultSet rs=recordService.borrowTj(n);
				List<Borrowtj> list=this.returnList2(rs);
				request.setAttribute("borrowTj", list);
				request.getRequestDispatcher("admin/showBorrowTj.jsp").forward(request, response);
			}
			else{
				int n=Integer.parseInt(request.getParameter("page"));
				request.getSession().setAttribute("borrowTjPage", n);
				ResultSet rs=recordService.borrowTj(n);
				List<Borrowtj> list=this.returnList2(rs);
				request.setAttribute("borrowTj", list);
				request.getRequestDispatcher("admin/showBorrowTj.jsp").forward(request, response);
			}
		}
	}
	public List<Retrieval> returnList(ResultSet rs){
		List<Retrieval> list=new ArrayList<Retrieval>();
		try {	
			while(rs.next()){
				Retrieval r=new Retrieval();
				r.setId(rs.getInt(1));
				r.setRetrieval(rs.getString(2));
				r.setTime(rs.getInt(3));
				list.add(r);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<Borrowtj> returnList2(ResultSet rs){
		List<Borrowtj> list=new ArrayList<Borrowtj>();
		try {	
			while(rs.next()){
				Borrowtj b=new Borrowtj();
				b.setBookname(rs.getString(1));
				b.setCount(rs.getInt(2));
				list.add(b);
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
