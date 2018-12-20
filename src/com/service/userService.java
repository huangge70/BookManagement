package com.service;

import java.sql.ResultSet;

import com.util.SqlHelper;

public class userService {

	public static ResultSet userlogin(String username,String password){
		String obj[]={username,password};
		ResultSet rs=null;
		String sql="select * from user where username=? and password=?";
		rs=SqlHelper.executeQuery(sql, obj);
		return rs;
	}
	public static boolean updateUserInfo(Object obj[]){
		String sql="update user set password=?,sex=? where username=?";
		SqlHelper.executeUpdate(sql, obj);
		return true;
	}
	public static ResultSet searchBook(int n){
		int begin=(n-1)*10+1;
		int end=n*10;
		String sql="select * from book where id between ? and ?";
		Object obj[]={begin,end};
		ResultSet rs=SqlHelper.executeQuery(sql, obj);
		return rs;
	}

    public static void purchasetj(Object obj[]){
    	String sql="insert into purchasetj(uid,type,unit,bookname,author) values(?,?,?,?,?)";
    	SqlHelper.executeUpdate(sql, obj);
    }
    public static ResultSet searchUsernameByBookname(String bookname){
    	String sql="select distinct(username) from record where bookname=? limit 5";
    	Object obj[]={bookname};
    	ResultSet rs=SqlHelper.executeQuery(sql, obj);
    	return rs;
    }
}
