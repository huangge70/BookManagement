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
import com.service.bookService;
import com.service.userService;

public class adminSearchBook extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String flag=request.getParameter("flag");
		if(flag.equals("first")){
			request.getSession().setAttribute("page", 1);
			ResultSet rs=userService.searchBook(1);
			List<Book> list=this.returnList(rs);
			request.setAttribute("book", list);
			request.getRequestDispatcher("admin/showBook.jsp").forward(request, response);
		}
		else if(flag.equals("pre")){
			int n=(Integer)request.getSession().getAttribute("page")-1;
			request.getSession().setAttribute("page", n);
			ResultSet rs=userService.searchBook(n);
			List<Book> list=this.returnList(rs);
			request.setAttribute("book", list);
			request.getRequestDispatcher("admin/showBook.jsp").forward(request, response);
		}
		else if(flag.equals("next")){
			int n=(Integer) request.getSession().getAttribute("page")+1;
			request.getSession().setAttribute("page", n);
			ResultSet rs=userService.searchBook(n);
			List<Book> list=this.returnList(rs);
			request.setAttribute("book", list);
			request.getRequestDispatcher("admin/showBook.jsp").forward(request, response);
		}
		else if(flag.equals("last")){
			int n=5610;
			request.getSession().setAttribute("page", n);
			ResultSet rs=userService.searchBook(n);
			List<Book> list=this.returnList(rs);
			request.setAttribute("book", list);
			request.getRequestDispatcher("admin/showBook.jsp").forward(request, response);
		}
		else if(flag.equals("search")){
			String bookname=request.getParameter("bookname");
			System.out.println(bookname);
			bookService.updateRetrieval(bookname);
			ResultSet rs=bookService.searchBookByName(bookname);
			List<Book> list=this.returnList(rs);
			request.setAttribute("book", list);
			request.getRequestDispatcher("admin/showBook.jsp").forward(request, response);
		}
		else{
			int n=Integer.parseInt(request.getParameter("page"));
			request.getSession().setAttribute("page", n);
			ResultSet rs=userService.searchBook(n);
			List<Book> list=this.returnList(rs);
			request.setAttribute("book", list);
			request.getRequestDispatcher("admin/showBook.jsp").forward(request, response);
		}
	}
	public List<Book> returnList(ResultSet rs){
		List<Book> list=new ArrayList<Book>();
		try {	
			while(rs.next()){
				Book book=new Book();
				book.setId(rs.getInt("id"));
				book.setBid(rs.getString("bid"));
				book.setCollection(rs.getString("collection"));
				book.setBookname(rs.getString("bookname"));
				book.setAuthor(rs.getString("author"));
				book.setPress(rs.getString("press"));
				book.setTime(rs.getString("time"));
				book.setState(rs.getString("state"));
				book.setPrice(rs.getDouble("price"));
				list.add(book);
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
