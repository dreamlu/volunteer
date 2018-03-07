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
			<div id="wrap">
				<div class="header">
				<div id="top">
					
					<span class="fr"><a href="volunteer_admin/vo_admin_login.jsp">管理中心</a></span>
					<span class="fr">
					<%
						String user_name=(String)session.getAttribute("user_info");
						if(user_name!=null)
						{
					%><a href="home.jsp" style="color:blue"><%=user_name %></a>&nbsp;&nbsp;<a href="loginlc?exit=exit" style="color:green">退出</a>
					<%}else{ %>
					<a href="login.jsp">注册/登陆</a>
					<%}	 %>
					</span>
					
				</div>
				<div class="topNav">
					<img src="img/logo.png" class="fl"/>
					<ul>
						<li class="borderNav"><a href="index.jsp">首页</a></li>
						<li class="borderNav"><a href="activity.jsp">志愿活动</a></li>
						<li class="borderNav"><a href="item.jsp">志愿项目</a></li>
						<li><a href="home.jsp">个人主页</a></li>
					</ul>
				</div>	
			</div>
				<div id="detail" >
				<%
				  String volunteer_name="";
				  String picture = null;
				  String title="";
			      String content="";
			      int flag=0;
			      
				  List<Map<String,Object>> re=(List<Map<String,Object>>)session.getAttribute("publishAndSum");
				  //System.out.print(re);	
			      if(re!=null&&re.size()!=0)
			      {
			    	  
				      Map<String,Object> info=null;
				      Map<String,Object> info2=null;
				      if(re.size()==1)
			    	  	info=re.get(0);
				      else info2=re.get(1);
				      if(info!=null&&(Integer)info.get("vo_flag")==0);
				      if(info2!=null&&(Integer)info2.get("vo_flag")==1)info=info2;
				      if(info!=null)
				      {
				    	  title=(String)info.get("vo_title");
					      content=(String)info.get("vo_content");
					      volunteer_name=(String)info.get("volunteer_name");
					      flag=(int)info.get("vo_flag");
					      picture=(String)info.get("vo_picture_path");
					      int i = picture.indexOf("upload");
					      picture = picture.substring(0,i+6)+"\\"+picture.substring(i+6);
				      }
				  }
		    	 %>
						<div id="detail_title">
							<ul>
								<li><b><%=volunteer_name %></b></li>
							</ul>	
						</div>
						
						<div id="detail_introduce">
							<h2><%=title %></h2>
						    <p class="detail_fontstyle1">&nbsp;&nbsp;&nbsp;&nbsp;
						    <img src="<%=picture %>" class="publishSum"></p>
							<br>
							<p class="detail_fontstyle2">
							<%=content %></p>
						</div>
				</div>
				<div class="fanwei">
					<ul>
						<li><b></b></li>
					</ul>
				</div>
				
			<div class="m"></div>
			
		</div>
	</body>
	</body>
</html>
