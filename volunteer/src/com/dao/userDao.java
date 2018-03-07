package com.dao;

import java.util.List;
import java.util.Map;

import com.util.JDBC;

public class userDao {
	
	public List<Map<String,Object>> loginright(){
		
		String sql="select user_id,user_name,password from client ";//where uname='"+name+"' and password='"+id+"'";
		
		List<Map<String,Object>> result=JDBC.doQuery(sql);
		
			return result;		
	}
	//查询个人信息
	public List<Map<String,Object>> loginright(String name){
		
		String sql="select *from client WHERE user_name='"+name+"'";
		
		List<Map<String,Object>> result=JDBC.doQuery(sql);
		
			return result;		
	}
	//查询志愿活动信息
	public List<Map<String,Object>> loginright_activity(){
			
		String sql="select *from volunteer_activity order by volunteer_id desc";// WHERE root_name='"+name+"'";
			
		List<Map<String,Object>> result=JDBC.doQuery(sql);
			
			return result;		
	}
	//查询志愿活动信息
	public List<Map<String,Object>> loginright_activity(String name){
		
		String sql="select *from volunteer_activity WHERE root_name='"+name+"' order by volunteer_id desc";
		
		List<Map<String,Object>> result=JDBC.doQuery(sql);
		
			return result;		
	}
}
