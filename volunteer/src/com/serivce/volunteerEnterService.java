package com.serivce;

import java.util.List;
import java.util.Map;

import com.dao.volunteerEnterDao;

public class volunteerEnterService {
	private volunteerEnterDao vo = new volunteerEnterDao();
	
	public boolean volunteerright(String name,String volunteer_name,String select_time) {
		
		return vo.volunteerright(name, volunteer_name,select_time);
	}
	
	//admin查询报名信息
	public List<Map<String, Object>> volunteerselect(String volunteer_name){
		
		return vo.volunteerselect(volunteer_name);
	}
	/*//活动的报名人数
	public int volunteerNumber(String volunteer_name){
		
		return vo.volunteerNumber(volunteer_name);
	}*/
	//client查询报名信息
	public List<Map<String, Object>> volunteerselectClient(String name){
			
		return vo.volunteerselectClient(name);
	}
	//client收藏信息
	public boolean volunteerCollection(String name,String volunteer_name) {
		
		return vo.volunteerCollection(name, volunteer_name);
	}
	//查询client收藏信息
	public List<Map<String, Object>> volunteerSelectCollection(String name) {
		
		return vo.volunteerSelectCollection(name);
	}
	//client收藏项目信息
		public boolean volunteerCollectionProject(String name,String project_name) {
			
			return vo.volunteerCollectionProject(name, project_name);
		}
		//查询client收藏项目信息
		public List<Map<String, Object>> volunteerSelectCollectionProject(String name) {
			
			return vo.volunteerSelectCollectionProject(name);
		}
	//活动展示信息查询
	public List<Map<String,Object>> volunteerDetailService(String volunteer_name){
		
		return vo.volunteerDetail(volunteer_name);
			
	}
	
	//浏览量
	public boolean volunteerAddlook(String volunteer_name){
		
		return vo.volunteerAddlook(volunteer_name);
			
	}
	//查看宣传总结
	public List<Map<String, Object>> volunteerSelectPublishAndSum(String volunteer_name){
		
		return vo.volunteerSelectPublishAndSum(volunteer_name);
	}
	/*//查看宣传总结
		public List<Map<String, Object>> volunteerSelectPublishAndSum(){
			
			return vo.volunteerSelectPublishAndSum();
		}*/
}
