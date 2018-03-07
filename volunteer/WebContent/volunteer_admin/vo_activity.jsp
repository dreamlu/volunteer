<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="UTF-8">
		<title></title>
		<link type="text/css" rel="stylesheet" href="<%=basePath%>css/reset.css">
		<link type="text/css" rel="stylesheet" href="<%=basePath%>css/detail.css">
		<link type="text/css" rel="stylesheet" href="<%=basePath%>css/vo_admin.css">
	</head>
	<body>
		<div id="guanli_wrap">
			<div id="banner">
			<%
				String admin_name=(String)session.getAttribute("admin"); 
				if(admin_name==null)admin_name="管理员，请重新登陆";
				else admin_name="欢迎您，管理员: "+admin_name;
			%>
			<img src ='<%=basePath%>img/logo.png'>
			<a href="<%=basePath%>volunteer_admin/vo_admin_login.jsp" style="font-size:16px;color:black;"><%=admin_name %></a>
			</div>
			<div id="wrap">	
				<div id="detail" >
				<%
				  String volunteer_picture = null;//(String)session.getAttribute("volunteer_picture");
				  String volunteer_name="";
			      String volunteer_time="";
			      String volunteer_place="";
			      String activity_volunteer_number="";
			      String activity_introduce="";
			      String activity_content="";
			      
				  List<Map<String,Object>> re=(List<Map<String,Object>>)session.getAttribute("detail_activity");
					
			      if(re!=null&&re.size()!=0)
			      {
				      Map<String,Object> info=re.get(0);
				      if(info!=null)
				      {
				    	  volunteer_name=(String)info.get("volunteer_name");
					      volunteer_time=(String)info.get("volunteer_time");
					      volunteer_place=(String)info.get("volunteer_place");
					      activity_volunteer_number=(String)info.get("activity_volunteer_number");
					      activity_introduce=(String)info.get("activity_introduce");
					      activity_content=(String)info.get("activity_content");
				    	  
					      volunteer_picture=(String)info.get("volunteer_picture_path");
					      int i = volunteer_picture.indexOf("upload");
					      volunteer_picture = volunteer_picture.substring(0,i+6)+"\\"+volunteer_picture.substring(i+6);
				      }
				  }
		    	 %>
						<div id="detail_title">
							<ul>
								<li><b>活动详细信息</b></li>
							</ul>	
						</div>
						
						<div id="detail_introduce">
							<h2><%=volunteer_name %></h2>
							<h3>组织介绍：</h3>
						    <p class="detail_fontstyle1">&nbsp;&nbsp;&nbsp;&nbsp;
						    <%=activity_introduce %></p>
							<br>
							<br />
							<br />
							<p class="detail_fontstyle2"><span>活动时间：</span>
							<%=volunteer_time %></p>
							<p class="detail_fontstyle2"><span>活动地点：</span>
							<%=volunteer_place %></p>
							<p class="detail_fontstyle2"><span>活动人数：</span>
							<%=activity_volunteer_number %></p>
							<p class="detail_fontstyle2"><span>服务内容：</span>
							<%=activity_content %></p>
							<!-- <p class="detail_fontstyle2"><span>志愿者需求：</span>
							有才艺特长优先</p>
							<p class="detail_fontstyle2"><span>福利：</span>报销车费，包中饭</p> -->		
						</div>
						
						<div id="detail_join">
							<button onclick="javascript:location.href='<%=basePath%>volunteer_admin/vo_publish.jsp'">编辑</button>
						</div>		
	
				</div>
				<div class="fanwei">
					<ul>
						<li><b>效果图</b></li>
					</ul>
					<div class="detail_right">
						<img src="<%=volunteer_picture %>" class="activity_picture_3"/>
						<p class="bold"><%=volunteer_name %></p>
						<p>报名截止日期：<%=volunteer_time %></p>
						<span>加入</span>
						<span>收藏</span>
					</div>
				</div>
				
			<div class="m"></div>
			
		</div>
		</div>
	</body>
	</body>
</html>
