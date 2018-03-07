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
						<li><a href="<%=basePath%>volunteer_admin/vo_root.jsp"><b>超级管理员</b></a></li>
						<li><a href="<%=basePath%>volunteer_admin/vo_rootpublishproject.jsp"><b>项目发布</b></a></li>
						<li class="navstyle"><a href="<%=basePath%>volunteer_admin/vo_rootpublished.jsp"><b>已发布项目</b></a></li>
						<li ><a href="<%=basePath%>volunteer_admin/vo_rootUser.jsp"><b>用户管理</b></a></li>
					</ul>
				</div>
				<div id="guanli_right" class="fr">
						<table>
						<tr>
							<th><span>项目名</span></th>
							<th>发起组织</th>
							<th>联系人</th>
							<th>活动分类</th>
							<th>删除</th>
						</tr>
						<%
					      List<Map<String,Object>> re=(List<Map<String,Object>>)session.getAttribute("publishedProject");
						  //System.out.print(re);
					      if(re!=null){
					      for(Map<String,Object> info :re){
					     %>
							<tr>
								<td><%=info.get("project_name") %></td>
								<td><%=info.get("project_organization") %></td>
								<td><%=info.get("project_contact") %></td>
								<td><%=info.get("project_classify") %></td>
								<td><a href="<%=basePath%>declc?project_name=<%=info.get("project_name") %>&project=project">删除</a></td>
							</tr>
							<%} }
						      else{}
						    %>							
						</table>
				</div>
		</div>
	</body>
</html>
