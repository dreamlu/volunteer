package com.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.util.JDBC;

public class volunteerEnterDao {
	
	public boolean volunteerright(String name,String volunteer_name,String select_time){
		
		String sql_1 = "select root_name from volunteer_activity where volunteer_name='"+ volunteer_name +"'";
		List<Map<String,Object>> result=JDBC.doQuery(sql_1);
		String root_name = (String)result.get(0).get("root_name");
		
		//插入
		String sql="INSERT INTO entry_form(root_name,volunteer_name,user_name,user_select_time) VALUES ('"+root_name+"','"+volunteer_name+"','"+name+"','"+select_time+"')";
		int i=JDBC.doUpdate(sql);//执行成功返回1
		if(i==0){
			//根据主键删除记录
			sql="delete from entry_form where root_name='"+root_name+"' and volunteer_name='"+volunteer_name+"' and user_name='"+name+"'";
			JDBC.doUpdate(sql);
			//删除志愿者报名记录后
			//志愿者数量减一
			sql="update volunteer_activity set volunteer_num=volunteer_num-1 where volunteer_name='"+volunteer_name+"'";
			JDBC.doUpdate(sql);
			return false;
		}
		else
		{
			//志愿者数量加一
			sql="update volunteer_activity set volunteer_num=volunteer_num+1 where volunteer_name='"+volunteer_name+"'";
			JDBC.doUpdate(sql);
			return true;
		}
	}
	
	//admin查询报名的志愿者信息
	public List<Map<String,Object>> volunteerselect(String volunteer_name){
		
		String sql = "select *from entry_form join client where entry_form.user_name=client.user_name and volunteer_name='"+volunteer_name+"'";
		
		List<Map<String,Object>> result = JDBC.doQuery(sql);

		return result;
		
	}
	
	//查询志愿者个人的报名信息,按报名先后排序
	public List<Map<String,Object>> volunteerselectClient(String name){
			
		String sql = "select *from entry_form join volunteer_activity where entry_form.volunteer_name=volunteer_activity.volunteer_name and user_name='"+name+"' order by user_name desc";
			
		List<Map<String,Object>> result = JDBC.doQuery(sql);

		return result;
			
	}
	//收藏信息
	public boolean volunteerCollection(String name,String volunteer_name){
		
		String sql = "insert into collection(user_name,volunteer_name) values('"+name+"','"+ volunteer_name +"')";
	
		//插入
		int i=JDBC.doUpdate(sql);//执行成功返回1
		if(i==0){
			//说明已经存在
			//删除
			sql="delete from collection where user_name='"+name+"'and volunteer_name='"+volunteer_name+"'";
			JDBC.doUpdate(sql);
			return false;
		}
		else return true;
	}
	//查询志愿者收藏活动信息
		public List<Map<String,Object>> volunteerSelectCollection(String name){
				
			String sql = "select *from collection join volunteer_activity where collection.volunteer_name=volunteer_activity.volunteer_name and collection.user_name='"+name+"' order by user_name desc";
				
			List<Map<String,Object>> result = JDBC.doQuery(sql);

			return result;
				
		}
		//收藏项目信息
		public boolean volunteerCollectionProject(String name,String project_name){
			
			String sql = "insert into collection_project(user_name,project_name) values('"+name+"','"+ project_name +"')";
		
			//插入
			int i=JDBC.doUpdate(sql);//执行成功返回1
			if(i==0){
				//说明已经存在
				//删除
				sql="delete from collection_project where user_name='"+name+"'and project_name='"+project_name+"'";
				JDBC.doUpdate(sql);
				return false;
			}
			else return true;
		}
		//查询志愿者收藏项目信息
			public List<Map<String,Object>> volunteerSelectCollectionProject(String name){
					
				String sql = "select *from collection_project join publishproject where collection_project.project_name=publishproject.project_name and user_name='"+name+"' order by user_name desc";
					
				List<Map<String,Object>> result = JDBC.doQuery(sql);

				return result;
					
			}	
		//活动详情展示信息查询
		public List<Map<String,Object>> volunteerDetail(String volunteer_name){
			
			String sql = "select *from volunteer_activity where volunteer_name='"+volunteer_name+"'";
				
			List<Map<String,Object>> result = JDBC.doQuery(sql);

			return result;
				
		}
		//收藏信息
		public boolean volunteerAddlook(String volunteer_name){
			
			String sql = "update volunteer_activity set volunteer_look_num=volunteer_look_num+1 "
					+ "where volunteer_name='"+ volunteer_name +"'";
		
			//插入
			int i=JDBC.doUpdate(sql);//执行成功返回1
			if(i==0){
				return false;
			}
			else return true;
		}
		
		//查看该活动是否发布了宣传语总结
		public List<Map<String, Object>> volunteerSelectPublishAndSum(String volunteer_name){
			
			String sql="select *from publishandsum where volunteer_name='"+volunteer_name+"'";
			
			List<Map<String, Object>> result=JDBC.doQuery(sql);
			return result;
		}
		/*public List<Map<String, Object>> volunteerSelectPublishAndSum(){
			
			String sql="select *from publishandsum";
			
			List<Map<String, Object>> result=JDBC.doQuery(sql);
			return result;
		}*/
}
