package com.serivce;

import java.util.List;
import java.util.Map;

import com.dao.userDao;


public class userService {
	
	private userDao lo=new userDao();
	
	public List<Map<String,Object>> loginright(){
		
		return lo.loginright();
	}
	public List<Map<String,Object>> loginright(String name){
		
		return lo.loginright(name);
	}
	
	public List<Map<String,Object>> loginright_activity(){
		
		return lo.loginright_activity();
	}
	
	public List<Map<String,Object>> loginright_activity(String name){
		
		return lo.loginright_activity(name);
	}
}