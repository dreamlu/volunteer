<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link type="text/css" rel="stylesheet" href="css/reset.css">
		<link type="text/css" rel="stylesheet" href="css/detail.css" />
		<script type="text/javascript" src="js/img.js"></script>
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
					<%}else{%>
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
				  String volunteer_picture = null;//(String)session.getAttribute("volunteer_picture");
			      List<Map<String,Object>> re=(List<Map<String,Object>>)session.getAttribute("detail_activity");

			      if(re!=null) ;
			      Map<String,Object> info=re.get(0);
			      if(info==null);
			      volunteer_picture=(String)info.get("volunteer_picture_path");
			      int i = volunteer_picture.indexOf("upload");
			      volunteer_picture = volunteer_picture.substring(0,i+6)+"\\"+volunteer_picture.substring(i+6);
		    	 %>
						<div id="detail_title">
							<img  src="img/newActivity.jpg"/>	
						</div>
						
						<div id="detail_introduce">
							<h2><%=info.get("volunteer_name") %></h2>
							<h3>组织介绍：</h3>
						    <p class="detail_fontstyle1">&nbsp;&nbsp;&nbsp;&nbsp;
						    <%=info.get("activity_introduce") %></p>
							<br>
							<br />
							<br />
							<p class="detail_fontstyle2"><span>活动时间：</span>
							<%=info.get("volunteer_time") %></p>
							<p class="detail_fontstyle2"><span>活动地点：</span>
							<%=info.get("volunteer_place") %></p>
							<p class="detail_fontstyle2"><span>活动人数：</span>
							<%=info.get("activity_volunteer_number") %></p>
							<p class="detail_fontstyle2"><span>服务内容：</span>
							<%=info.get("activity_content") %></p>
							<!-- <p class="detail_fontstyle2"><span>志愿者需求：</span>
							有才艺特长优先</p>
							<p class="detail_fontstyle2"><span>福利：</span>报销车费，包中饭</p> -->		
						</div>
						<%
							if(user_name==null) user_name="$";
							//System.out.print(user_name);
						%>
						<div id="detail_join">
						    <span>请选择时间段：</span>
							<input type="text" name="select_time" value="<%=info.get("volunteer_time") %>">
							<button onclick="javascript:location.href='volunteerEnter?volunteer_name=<%=info.get("volunteer_name") %>&select_time=<%=info.get("volunteer_time") %>'">立即加入</button>
							
						</div>		
	
				</div>
				<div class="fanwei">
					<div class="detail_right">
					
						<img src="<%=volunteer_picture %>" class="activity_picture_3"/>
						<p class="bold"><%=info.get("volunteer_name") %></p>
						<p>活动时间：<%=info.get("volunteer_time") %></p>
						<%-- <span><a href="javascript:clickImgEnter('<%=info.get("volunteer_name")%>',
        					 '<%=user_name %>','hasEnter')">加入</a></span>
						<span><a href="javascript:void(0)" onclick="clickImg('<%=info.get("volunteer_name") %>',
        					'<%=user_name %>')">收藏</a></span> --%>
					</div>
				</div>
				
			<div class="m"></div>
			
		</div>
	</body>
	  <!-- Include jQuery and jquery.pin -->
    <!-- <script src="/jquery.1.9.1.min.js"></script> -->
    <script src="js/jquery.pin.js"></script>
    <script>
      $(".detail_right").pin({containerSelector: ".fanwei", minWidth: 940});
    </script>
	
</html>

