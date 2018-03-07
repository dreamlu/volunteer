<%@ page language="java" contentType="text/html; charset=UTF-8"
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
		<link type="text/css" rel="stylesheet" href="css/reset.css">
		<link type="text/css" rel="stylesheet" href="css/home.css">
		<script  src="js/home.js"></script>
	</head>
	<body>
	<script type="text/javascript" color="0,0,255" opacity='0.4' count="199" src="js/canvas-nest.min.js"></script>
	
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
        
			<div id="home">	
				<div id="home_left" class="fl">
					<ul>
						<li><a href="home.jsp"><b>个人主页</b></a></li>
							<li class="navstyle"><a href="home2.jsp"><b>个人信息</b></a></li>
							<li><a href="home3.jsp"><b>我的收藏</b></a></li>
						<!-- <li><a href="#"><b>感想与随笔</b></a></li> -->
					</ul>
				</div>
				
				<div id="home_right" class="fr">
					<div id="home_1">
						<%
							String user_info,user_realname,user_identify,user_phone,
							user_college,user_college_sdept,user_classroom,user_introduce;
							user_info = (String)session.getAttribute("user_info");
							user_realname = (String)session.getAttribute("user_realname");
							user_identify = (String)session.getAttribute("user_identify");
							user_phone = (String)session.getAttribute("user_phone");
							user_college = (String)session.getAttribute("user_college");
							user_college_sdept=(String)session.getAttribute("user_college_sdept");
							//System.out.print(user_college_sdept);
							user_classroom = (String)session.getAttribute("user_classroom");
							user_introduce = (String)session.getAttribute("user_introduce");
							if(user_info == null) user_info = "";
							if(user_identify == null) user_identify = "";
							if(user_phone == null) user_phone = "";
							if(user_college == null) user_college = "";
							if(user_college_sdept == null) user_college_sdept = "";
							if(user_classroom == null) user_classroom = "";
							if(user_introduce == null) user_introduce = "";
							if(user_realname == null) user_realname = "";
						%>
						<form method="post" action="updcl">
							<div class="text"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>姓名：</b></span>
							<input type="text" name="user_realname" class="text_1" value=<%=user_realname %>></div><br />
							<div class="text"><span>&nbsp;&nbsp;&nbsp;&nbsp;<b>证件号：</b></span>
							<input type="text" name="zhengjian" class="text_1"  value=<%=user_identify %>></div><br />
							<div class="text"><span><b>联系方式：</b></span>
							<input type="text" name="call" class="text_1"  value=<%=user_phone %>></div><br />
							
							<div class="text"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>学校：</b></span>
							<input type="text" name="college" class="text_2" value=<%=user_college %>><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>学院：</b></span>
							<select class="text_2" name="user_college_sdept">
									<option value="<%=user_college_sdept %>"><%=user_college_sdept %></option>
									<option value="国际文化传播学院">国际文化传播学院</option>
									<option value="播音学院">播音学院</option>
									<option value="新媒体学院">新媒体学院</option>
									<option value="电子信息学院">电子信息学院</option>
									<option value="国际文化传播学院">国际文化传播学院</option>
									<option value="电影学院">电影学院</option>
								</select>	
							<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>班级：</b></span><input type="text" name="class" class="text_2" value=<%=user_classroom %>>
							</div><br />
					
							<div class="text"><span><b>个人简介：</b></span><br />
							<textarea name="jianjie"><%=user_introduce %></textarea></div><br>
							<button name="form" type="submit">保存</button>
						</form>
						
						<div id="touxiang">
						<%
							String user_picture;
							user_picture = (String)session.getAttribute("user_picture");
							//System.out.println(user_picture);
							if(user_picture == null)
							{
						%>
							<img src="img/home/touxiang.jpg"/>
							<%} 
							else{
							%>
							<img src="<%=user_picture %>" id="user_picture" />
							<%} %>
							<p><form action="<%=basePath%>upLoad" method="post" enctype="multipart/form-data">
								修改:<input type="file" name="fileName" size="0px" style="border:0px">
								<br><input type="submit" value="上传"/>
								</form>
							</p>				
						</div>
					</div>
				
				</div>
			
			</div>
		</div>
	</body>
</html>
