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
						<button id="button3"><a href="#">活动宣传</a></button>
					</div>
					<div id="content_xuanchuan" class="fl">
				<%
				
				  //相联系的活动名称
				  String volunteer_name=request.getParameter("volunteer_name");
				  session.setAttribute("volunteer_name", volunteer_name);
				
				  String picture = null;
				  String title="";
			      String content="";
			      
				  List<Map<String,Object>> re=(List<Map<String,Object>>)session.getAttribute("vo_publishAndSum");
					
			      if(re!=null&&re.size()!=0)
			      {
				      Map<String,Object> info=re.get(0);
				      if(info!=null)
				      {
				    	  title=(String)info.get("vo_title");
					      content=(String)info.get("vo_content");
					      
					      picture=(String)info.get("vo_picture_path");
					      int i = picture.indexOf("upload");
					      picture = picture.substring(0,i+6)+"\\"+picture.substring(i+6);
				      }
				  }
		    	 %>
						<form action="<%=basePath%>vo_publishAndSum" method="post" enctype="multipart/form-data" >
							<span>标题</span><input class="no1" name="vo_title" type="text" value="<%=title%>"><br />
							<span>选择图片</span><input type="file" name="fileName" ><br />
							<span>内容</span><br/><textarea id="content_xuanchuan" name="vo_content"><%=content%></textarea><br />
							<button class="fr" id="lanch" name="lanch">发布</button>
						</form>
					</div>
				</div>
		</div>
	</body>
</html>