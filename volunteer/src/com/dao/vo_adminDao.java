package com.dao;

import java.util.List;
import java.util.Map;

import com.util.JDBC;

public class vo_adminDao {

	public boolean vo_adminUpload(String volunteer_name,String vo_title,int flag,String vo_content,String address){
		
		//插入宣传总结信息
		String sql="INSERT INTO publishandsum(volunteer_name,vo_title,vo_flag,vo_content,vo_picture_path) "
				+ "VALUES ('"+volunteer_name+"','"+vo_title+"',"+flag+",'"+vo_content+"','"+address+"')";
		int i=JDBC.doUpdate(sql);//执行成功返回1
		if(i==0){
			//尝试更新宣传总结的信息
			sql="update publishandsum set vo_title='"+vo_title+"',vo_content='"+vo_content+"',vo_picture_path='"+address+"' "
					+ "where volunteer_name='"+volunteer_name+"' and vo_flag="+flag+"";
			JDBC.doUpdate(sql);
			return false;
		}
		else return true;
	}
	public List<Map<String,Object>> vo_adminPublishAndSum(String volunteer_name,int flag){
		
		String sql="select *from publishandsum where volunteer_name='"+volunteer_name+"'and vo_flag="+flag+"";
		
		List<Map<String,Object>> result=JDBC.doQuery(sql);
		
		return result;		
	}
	
	//更新选中参加志愿活动的志愿者信息
	public boolean vo_volunteerIsSelect(String volunteer_name,String user_name){
		
		//插入宣传总结信息
		String sql="update entry_form set user_isselect='是' where volunteer_name='"+volunteer_name+"' and user_name='"+user_name+"'";
		int i=JDBC.doUpdate(sql);//执行成功返回1
		if(i==0){
			
			return false;
		}
		else return true;
	}
	//根管理员上传志愿活动项目
	public boolean vo_adminPublishProject(String project_name,String project_organization,String project_contact,String project_classify,String project_introduce,String address1,String address2){
		
		//插入志愿活动项目
		String sql="INSERT INTO publishproject(project_name,project_organization,project_contact,project_classify,project_picture_path,project_logo_path,project_introduce) "
				+ "VALUES ('"+project_name+"','"+project_organization+"','"+project_contact+"','"+project_classify+"','"+address1+"','"+address2+"','"+project_introduce+"')";
		int i=JDBC.doUpdate(sql);//执行成功返回1
		if(i==0){
			//尝试更新上传志愿活动项目
			sql="update publishproject set project_organization='"+project_organization+"',project_contact='"+project_contact+"',project_classify='"+project_classify+"',"
					+ "project_picture_path='"+address1+"',project_logo_path='"+address2+"',project_introduce='"+project_introduce+"' "
					+ "where project_name='"+project_name+"";
			JDBC.doUpdate(sql);
			return false;
		}
		else return true;
	}
	
	//查看发布的志愿项目
	public List<Map<String, Object>> vo_adminProjectSelect(String project_name){
		
		String sql="select *from publishproject where project_name='"+project_name+"'";
		
		List<Map<String, Object>> result=JDBC.doQuery(sql);
		return result;
	}
	//查看发布的志愿项目关联的志愿活动信息
		public List<Map<String, Object>> vo_adminProject_VolunteerSelect(String project_name){
			
			String sql="select *from volunteer_activity where project_name='"+project_name+"'";
			
			List<Map<String, Object>> result=JDBC.doQuery(sql);
			return result;
		}
	//查看所有发布的项目
	public List<Map<String, Object>> vo_adminProjectSelect(){
		
		String sql="select *from publishproject order by project_name desc";
		
		List<Map<String, Object>> result=JDBC.doQuery(sql);
		return result;
	}
	//删除项目
	public boolean vo_deleteProject(String project_name){
		
		String sql="delete from publishproject where project_name='"+project_name+"'";
		int i=JDBC.doUpdate(sql);
		if(i==0){
			return false;
		}
		else return true;
	}
	
	public boolean vo_addLove(String user_name){
		
		String sql="update client set user_love=user_love+5 where user_name='"+user_name+"'";
		int i=JDBC.doUpdate(sql);
		if(i==0){
			return false;
		}
		else return true;
	}
	//根管理员查询所有用户信息
	public List<Map<String, Object>> vo_adminSelectUsers(){
		
		String sql="select *from client order by user_id desc";
		
		List<Map<String, Object>> result=JDBC.doQuery(sql);
		return result;
	}
	//删除用户
	public boolean vo_deleteUser(String user_name){
		
		String sql="delete from client where user_name='"+user_name+"'";
		int i=JDBC.doUpdate(sql);
		if(i==0){
			return false;
		}
		else return true;
	}
	
}
