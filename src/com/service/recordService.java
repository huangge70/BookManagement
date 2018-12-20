 package com.service;

import java.sql.ResultSet;

import com.util.SqlHelper;

public class recordService {

	public static ResultSet searchRecord(String username){
		String sql="select * from record where username=?";
		Object obj[]={username};
		ResultSet rs=SqlHelper.executeQuery(sql, obj);
		return rs;
	}
	public static boolean returnBook(int id){
		String sql="update record set state='ÒÑ»¹' where id=?";
		Object obj[]={id};
		SqlHelper.executeUpdate(sql, obj);
		return true;
	}
	public static ResultSet searchRetrieval(){
		String sql="select * from statistics order by time desc";
		ResultSet rs=SqlHelper.executeQuery(sql, null);
		return rs;
	}
	public static ResultSet searchTuijian(){
		String sql="select * from purchasetj";
		ResultSet rs=SqlHelper.executeQuery(sql, null);
		return rs;
	}
	public static ResultSet searchTjtj(){
		String sql="select bookname,count(*) count from purchasetj group by bookname order by count(*) desc";
		ResultSet rs=SqlHelper.executeQuery(sql, null);
		return rs;
	}
	public static ResultSet borrowTj(int n){
		n=(n-1)*10;
		String sql="select bookname,count(*) from record group by bookname order by count(*) desc limit ?,10";
		Object obj[]={n};
		ResultSet rs=SqlHelper.executeQuery(sql, obj);
		return rs;
	}
	public static ResultSet searchAllRecord(int n){
		n=(n-1)*10;
		String sql="select * from record limit ?,10";
		Object obj[]={n};
		ResultSet rs=SqlHelper.executeQuery(sql, obj);
		return rs;
	}
	public static ResultSet searchRecordByBookname(String bookname){
		String sql="select * from record where bookname=?";
		Object obj[]={bookname};
		ResultSet rs=SqlHelper.executeQuery(sql, obj);
		return rs;
	}
	public static void deleteRecord(int id){
		String sql="delete from record where id=?";
		Object obj[]={id};
		SqlHelper.executeUpdate(sql, obj);
	}
	public static ResultSet searchRecordByDate(Object obj[]){
		String sql="select * from record where username=? and time between ? and?";
		ResultSet rs=SqlHelper.executeQuery(sql, obj);
		return rs;
	}
	
}
