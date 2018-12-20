package com.service;

import java.sql.ResultSet;
import com.util.SqlHelper;
public class recordService2 {

	public static ResultSet searchRecord(String username){
		String sql="select * from record where username=?";
		Object obj[]={username};
		ResultSet rs=SqlHelper.executeQuery(sql, obj);
		return rs;
	}
}
