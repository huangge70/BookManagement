package com.controller;

import java.io.IOException;
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
import com.service.recordService;
import com.service.userService;

public class recommendation extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		User user=(User) request.getSession().getAttribute("user");
		String username=user.getUsername();
		ResultSet rs=recordService.searchRecord(username);
		List<Book> list=new ArrayList<Book>();
		try {
			if(rs.next()){
				List<String> booknameList=new ArrayList<String>();
				booknameList.add(rs.getString("bookname"));
				while(rs.next())
					booknameList.add(rs.getString("bookname"));			
				List<String> userList=new ArrayList<String>();
				for(int i=0;i<booknameList.size();i++){
					System.out.println(booknameList.get(i));
					ResultSet rs3=userService.searchUsernameByBookname(booknameList.get(i));
					while(rs3.next()){
						userList.add(rs3.getString(1));
					}
				}
				for(int i=0;i<userList.size()-1;i++){
					for(int j=i+1;j<userList.size();j++){
						if(userList.get(i).equals(userList.get(j))||userList.get(i).equals(username))
							userList.remove(i);
					}
				}
				for(int i=0;i<userList.size();i++){
					if(userList.get(i).equals(username))
						userList.remove(i);
				}
				int a[]=new int[userList.size()];
				for(int i=0;i<userList.size();i++){
					List<String> booknameList2=new ArrayList<String>();
					ResultSet rs4=bookService.searchBooknameByUsername(userList.get(i));
					while(rs4.next()){
						String bookname=rs4.getString(1);					
						booknameList2.add(bookname);
					}
					for(int j=0;j<booknameList.size();j++){
						for(int k=0;k<booknameList2.size();k++)
							if(booknameList.get(j).equals(booknameList2.get(k)))
								a[i]++;
					}
				}
				int max_index=0;
				int max_value=a[0];
				for(int i=1;i<a.length;i++){
					if(a[i]>max_value){
						max_index=i;
						max_value=a[i];
					}
				}
				String target_username=userList.get(max_index);
				System.out.println(target_username);
				List<String> bookList=new ArrayList<String>();
				ResultSet rs7=recordService.searchRecord(target_username);
				while(rs7.next()){
					bookList.add(rs7.getString("bookname"));
				}
				
				for(int i=0;i<bookList.size();i++){
					System.out.println(bookList.get(i));
					ResultSet rs5=bookService.searchBookByBookname(bookList.get(i));
					if(rs5.next()){
						Book book=new Book();
						book.setId(rs5.getInt("id"));
						book.setBid(rs5.getString("bid"));
						book.setCollection(rs5.getString("collection"));
						book.setBookname(rs5.getString("bookname"));
						book.setAuthor(rs5.getString("author"));
						book.setPress(rs5.getString("press"));
						book.setTime(rs5.getString("time"));
						book.setState(rs5.getString("state"));
						book.setPrice(rs5.getDouble("price"));
						list.add(book);
					}
				}
			}else{
				ResultSet rs2=bookService.searchTjBook();
				list=this.returnList(rs2);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("book", list);
		request.getRequestDispatcher("user/showRecommendation.jsp").forward(request, response);
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
