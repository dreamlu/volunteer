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
			<img src ='<%=basePath%>img/logo.png'><a href="<%=basePath%>volunteer_admin/vo_admin_login.jsp" style="font-size:16px;color:black;"><%=admin_name %></a>
			</div>
				<div id="guanli_left" class="fl">
					<ul>
						<li><a href="<%=basePath%>volunteer_admin/vo_admin.jsp"><b>管理主页</b></a></li>
						<li class="navstyle"><a href="<%=basePath%>volunteer_admin/vo_publish.jsp"><b>内容发布</b></a></li>
						<li><a href="<%=basePath%>volunteerAdmin"><b>志愿者筛选</b></a></li>
						<li><a href="#"><b>交流与评价</b></a></li>
					</ul>
				</div>
				<div id="guanli_right2" class="fr">
					<div class="content_header">
						<button id="button1" onclick="javascript:location.href='<%=basePath%>volunteer_admin/vo_publish.jsp'">志愿招募</button>
						<button id="button2" onclick="javascript:location.href='<%=basePath%>volunteer_admin/vo_published.jsp'">已发布内容</button>
					</div>
					<div id="content" class="fl">
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
						<form action="<%=basePath%>adminUpload" method="post" enctype="multipart/form-data" >
							<span>标题</span><input class="input1" type="text" name="title" value="<%=volunteer_name%>"/><br />
							<span>选择所属项目(可选)</span>
							<select class="text_2" name="project_name">
							<option value="">无</option>
							<%
								List<Map<String,Object>> reP=(List<Map<String,Object>>)session.getAttribute("publishedProject");
								if(reP!=null)
									for(Map<String,Object> pro_info:reP)
									{
							%>
									<option value="<%=pro_info.get("project_name") %>"><%=pro_info.get("project_name") %></option>
							<%} %>
							</select>
							<br /><br>
							
							<span>时间</span><input type="text" name="time" value="<%=volunteer_time%>"/>
							<span>地点</span><input name="place" type="text" value="<%=volunteer_place%>"/>
							<span>人数</span><input type="text" name="number" value="<%=activity_volunteer_number%>"/>
							
							<span>上传图片</span><input type="file" name="fileName"><br />
							<span>组织介绍</span><br/><textarea name="introduce"><%=activity_introduce%></textarea><br />
							<span>服务内容</span><br/><textarea  name="content"><%=activity_content %></textarea><br />
							<button class="fr" id="lanch" type="submit">发布</button>							
						</form>
					</div>
				</div>
		</div>
	</body>
</html>
