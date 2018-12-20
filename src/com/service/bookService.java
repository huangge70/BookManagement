package com.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.domain.User;
import com.util.SqlHelper;

public class bookService {

	public static ResultSet searchBookByName(String bookname){
		String sql="select * from book where bookname like ? limit 0,100";
		Object obj[]={"%"+bookname+"%"};
		ResultSet rs=SqlHelper.executeQuery(sql, obj);
		return rs;
	}
	public static boolean borrowBook(User user,int id){
		String sql1="select bookname from book where id=?";
		Object obj1[]={id};
		ResultSet rs=SqlHelper.executeQuery(sql1, obj1);
		String bookname="";
		try {
			if(rs.next())
				 bookname=rs.getString("bookname");
		} catch (Exception e) {
			e.printStackTrace();
		}
		String sql2="update book set state='借出' where id=?";
		Object obj2[]={id};
		SqlHelper.executeUpdate(sql2, obj2);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
		String sql3="insert into record(username,name,bid,bookname,time,state) values(?,?,?,?,?,?)";
		Object obj3[]={user.getUsername(),user.getName(),id,bookname,df.format(new Date()),"已借"};
		SqlHelper.executeUpdate(sql3, obj3);
		return true;
	}
	public static boolean bookBook(User user,int id){
		String sql1="select bookname from book where id=?";
		Object obj1[]={id};
		ResultSet rs=SqlHelper.executeQuery(sql1, obj1);
		String bookname="";
		try {
			if(rs.next())
				 bookname=rs.getString("bookname");
		} catch (Exception e) {
			e.printStackTrace();
		}
		String sql2="insert into booking(username,type,name,bid,bookname,time) values(?,?,?,?,?,?)";
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
		Object obj2[]={user.getUsername(),user.getType(),user.getName(),id,bookname,df.format(new Date())};
		SqlHelper.executeUpdate(sql2, obj2);
		return true;
	}
	public static void updateRetrieval(String bookname){
		String sql1="select * from statistics where retrieval=?";
		Object obj1[]={bookname};
		ResultSet rs=SqlHelper.executeQuery(sql1, obj1);
		try {
			if(rs.next()){
				int id=rs.getInt("id");
				int time=rs.getInt("time");
				String sql2="update statistics set time=? where id=?";
				Object obj2[]={time+1,id};
				SqlHelper.executeUpdate(sql2, obj2);
			}
			else{
				String sql2="insert into statistics(retrieval,time) values(?,?)";
				Object obj2[]={bookname,1};
				SqlHelper.executeUpdate(sql2, obj2);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public static void addBook(Object obj[]){
		String sql="insert into book(bid,collection,bookname,author,press,time,state,price) values(?,?,?,?,?,?,?,?)";
		SqlHelper.executeUpdate(sql, obj);
	}
	public static void deleteBook(int id){
		String sql="delete from book where id=?";
		Object obj[]={id};
		SqlHelper.executeUpdate(sql, obj);
	}
	public static ResultSet searchBookById(int id){
		String sql="select * from book where id=?";
		Object obj[]={id};
		ResultSet rs=SqlHelper.executeQuery(sql, obj);
		return rs;
	}
	public static void updateBook(Object obj[]){
		String sql="update book set collection=? where id=?";
		SqlHelper.executeUpdate(sql, obj);
	}
	public static ResultSet searchTjBook(){
		String sql="select book.* from book join (select count(*),bookname from record group by bookname order by count(*) desc) temp on book.bookname=temp.bookname limit 5";
	    ResultSet rs=SqlHelper.executeQuery(sql, null);
	    return rs;
	}
	public static ResultSet searchBooknameByUsername(String username){
		String sql="select bookname from record where username=?";
		Object obj[]={username};
		ResultSet rs=SqlHelper.executeQuery(sql, obj);
		return rs;
	}
	public static ResultSet searchBookByBookname(String bookname){
		String sql="select * from book where bookname=?";
		Object obj[]={bookname};
		ResultSet rs=SqlHelper.executeQuery(sql, obj);
		return rs;
	}
}
