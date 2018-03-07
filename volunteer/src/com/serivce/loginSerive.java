	package com.serivce;
	
	import java.util.List;
import java.util.Map;

import com.dao.loginDao;
	
	public class loginSerive {
		private loginDao lo=new loginDao();
		public boolean loginright(String name,String pwd){
			
			return lo.loginright(name,pwd);
		}
		//管理员验证
		public boolean loginright_admin(String name,String pwd){
			
			return lo.loginright_admin(name,pwd);
		}
		//根管理员
		public List<Map<String, Object>> loginright_admin(){
			
			return lo.loginright_admin();
		}
		public boolean loginright1(String name,String pwd,String college){
			
			return lo.loginright1(name,pwd,college);
		}
		public boolean loginright2(int pwd){
			
			return lo.loginright2(pwd);
		}
		//删除
		public boolean loginright_activityDec(String name){
			
			return lo.loginright_activityDec(name);
		}
		
		//更新
		public boolean loginright3(String name,String user_realname,String user_identify,String user_phone,String user_college,String user_college_sdept,String user_classroom,String user_introduce){
			
			return lo.loginright3(name,user_realname,user_identify,user_phone,user_college,user_college_sdept,user_classroom,user_introduce);
		}
		
		//更新client图片
		public boolean loginright4(String name, String address){
			
			return lo.loginright4(name,address);
		}

		//admin上传志愿活动信息
		public boolean loginright5(String admin,String name, String project_name, String place,String time,String address,
				String activity_volunteer_number, String activity_introduce,String activity_content){
					
			return lo.loginright5(admin,name,project_name,place,time,address,
					activity_volunteer_number,activity_introduce,activity_content);
		}
	}
