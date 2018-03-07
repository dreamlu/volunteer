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
				<div id="guanli_right" class="fr">
					<div class="content_header">
						<button id="button1" onclick="javascript:location.href='<%=basePath%>volunteer_admin/vo_publish.jsp'">志愿招募</button>
						<button id="button2" onclick="javascript:location.href='<%=basePath%>volunteer_admin/vo_published.jsp'">已发布内容</button>
					</div>
					<div id="content" class="fl">
						<table id="content_table">
						<%
						  String volunteer_picture = null;//(String)session.getAttribute("volunteer_picture");
					      List<Map<String,Object>> re=(List<Map<String,Object>>)session.getAttribute("admin_info");
						  //System.out.print(re);
					      if(re!=null){
					      for(Map<String,Object> info :re){
					     		volunteer_picture=(String)info.get("volunteer_picture_path");
					     		int i = volunteer_picture.indexOf("upload");
					     		volunteer_picture = volunteer_picture.substring(0,i+6)+"\\"+volunteer_picture.substring(i+6);
					     		//System.out.print(info.get("volunteer_picture_path"));
					     %>
							<tr>
								<td class="t1"><%=info.get("volunteer_name") %></td>
								<td class="t2"><a href="<%=basePath%>volunteer_admin/vo_drumbeating.jsp?volunteer_name=<%=info.get("volunteer_name") %>">发布宣传</a></td>
								<td class="t3"><a href="<%=basePath%>volunteer_admin/vo_sum_up.jsp?volunteer_name=<%=info.get("volunteer_name") %>">发布总结</a></td>
							</tr>
						<%} }
					      else{}
					     %>
						</table>
					</div>
				</div>
		</div>
	</body>
</html>
