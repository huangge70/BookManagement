package com.service;

import java.sql.ResultSet;

import com.util.SqlHelper;

public class bookService2 {

	public static ResultSet searchBookByName(String bookname){
		String sql="select * from book where bookname=?";
		Object obj[]={bookname};
		ResultSet rs=SqlHelper.executeQuery(sql, obj);
		return rs;
	}
}
