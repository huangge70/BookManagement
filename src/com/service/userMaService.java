package com.service;

import java.sql.ResultSet;

import com.util.SqlHelper;

public class userMaService {

	public static void addUser(Object[] obj){
		String sql="insert into user(username,name,password,sex,type,unit,illegal) values(?,?,?,?,?,?,?)";
		SqlHelper.executeUpdate(sql, obj);
	}
	public static ResultSet searchUser(int n){
		int begin=(n-1)*10+1;
		int end=n*10;
		String sql="select * from user where uid between ? and ?";
		Object obj[]={begin,end};
		ResultSet rs=SqlHelper.executeQuery(sql, obj);
		return rs;
	}
	public static ResultSet searchUserByName(String username){
		String sql="select * from user where username=?";
		Object obj[]={username};
		ResultSet rs=SqlHelper.executeQuery(sql, obj);
		return rs;
	}
	public static void deleteUser(String username){
		String sql="delete from user where username=?";
		Object obj[]={username};
		SqlHelper.executeUpdate(sql, obj);
	}
	public static void updateUser(Object obj[]){
		String sql="update user set unit=?,illegal=? where username=?";
		SqlHelper.executeUpdate(sql, obj);
	}
}
