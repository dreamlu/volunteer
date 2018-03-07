<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%
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
		<link type="text/css" rel="stylesheet" href="<%=basePath%>css/vo_admin_2.css">
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
						<li><a href="<%=basePath%>volunteer_admin/vo_root.jsp"><b>超级管理员</b></a></li>
						<li><a href="<%=basePath%>volunteer_admin/vo_rootpublishproject.jsp"><b>项目发布</b></a></li>
						<li><a href="<%=basePath%>volunteer_admin/vo_rootpublished.jsp"><b>已发布项目</b></a></li>
						<li class="navstyle"><a href="<%=basePath%>volunteer_admin/vo_rootUser.jsp"><b>用户管理</b></a></li>
					</ul>
				</div>
				<div id="guanli_right" class="fr">
						<table>
						<tr>
							<th>昵称</th>
							<th>真实姓名</th>
							<th>手机号</th>
							<th>证件号</th>
							<th>学校</th>
							<th>自我介绍</th>
							<th>删除</th>
						</tr>
						<%
					      List<Map<String,Object>> re=(List<Map<String,Object>>)session.getAttribute("rootUsers");
						  //System.out.print(re);
					      if(re!=null){
					      for(Map<String,Object> info :re){
					    	  String user_name=(String)info.get("user_name");
					    	  if(user_name==null) user_name="无";
					    	  String user_realname=(String)info.get("user_realname");
					    	  if(user_realname==null) user_realname="无";
					    	  String user_phone=(String)info.get("user_phone");
					    	  if(user_phone==null) user_phone="无";
					    	  String user_identify=(String)info.get("user_identify");
					    	  if(user_identify==null) user_identify="无";
					    	  String user_college=(String)info.get("user_college");
					    	  if(user_college==null) user_college="无";
					    	  String user_introduce=(String)info.get("user_introduce");
					    	  if(user_introduce==null) user_introduce="无";
					     %>
							<tr>
								<td><%=user_name %></td>
								<td><%=user_realname %></td>
								<td><%=user_phone %></td>
								<td><%=user_identify %></td>
								<td><%=user_college %></td>
								<td><%=user_introduce %></td>
								<td><a href="<%=basePath%>admins?user_name=<%=info.get("user_name") %>&&decl=decl">删除</a></td>
							</tr>
							<%} }
						      else{}
						    %>							
						</table>
				</div>
		</div>
	</body>
</html>
