package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.domain.Book;
import com.domain.User;
import com.service.bookService;
import com.service.userMaService;

public class bookManagement extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String flag=request.getParameter("flag");
		if(flag.equals("add")){
			String bid=request.getParameter("bid");
			String collection=request.getParameter("collection");
			String bookname=request.getParameter("bookname");
			String author=request.getParameter("author");
			String press=request.getParameter("press");
			String time=request.getParameter("time");
			double price=Double.parseDouble(request.getParameter("price"));
			System.out.println(price);
			//System.out.println(time);
			Object obj[]={bid,collection,bookname,author,press,time,"ÔÚ¼Ü",price};
			bookService.addBook(obj);
			request.setAttribute("addBookInfo", "success");
			request.getRequestDispatcher("admin/addBook.jsp").forward(request, response);
		}
		else if(flag.equals("delete")){
			int id=Integer.parseInt(request.getParameter("id"));
			bookService.deleteBook(id);
			request.setAttribute("deleteBookInfo", "success");
			request.getRequestDispatcher("adminSearchBook?flag=first").forward(request, response);
		}
		else if(flag.equals("search")){
			int id=Integer.parseInt(request.getParameter("id"));
			ResultSet rs=bookService.searchBookById(id);
			try {
				Book book=new Book();
				if(rs.next()){
					book.setId(rs.getInt("id"));
					book.setBid(rs.getString("bid"));
					book.setBookname(rs.getString("bookname"));
					book.setAuthor(rs.getString("author"));
					book.setCollection(rs.getString("collection"));
					book.setPress(rs.getString("press"));
					book.setPrice(rs.getDouble("price"));
					book.setState(rs.getString("state"));
					book.setTime(rs.getString("time"));
				}
				request.setAttribute("book", book);
				request.getRequestDispatcher("admin/updateBook.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(flag.equals("update")){
			int id=Integer.parseInt(request.getParameter("id"));
			String collection=request.getParameter("collection");
			Object obj[]={collection,id};
			bookService.updateBook(obj);
			request.setAttribute("updateBookInfo", "success");
			request.getRequestDispatcher("bookManagement?flag=search&id="+id).forward(request, response);
		}
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
