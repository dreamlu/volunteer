<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>志愿项目</title>
		<link type="text/css" rel="stylesheet" href="css/reset.css">
		<link type="text/css" rel="stylesheet" href="css/item.css">
		<script type="text/javascript" src="js/activity.js"></script>
		<script type="text/javascript" src="js/img.js"></script>
		<link type="text/css" rel="stylesheet" href="css/paging.css">
		
		<script src="lib/jquery-1.10.2.js"></script>
		<link rel="stylesheet" href="css/ui-dialog.css">
		<script src="dist/dialog-min.js"></script> 
		<!--弹出框-->
		<link rel="stylesheet" href="css/jquery.dialogbox-1.0.css"/>
		<script src="js/jquery.dialogbox-1.0.js" .dialogbox-1.0.js"></script>
	</head>
	<body>
				<script type="text/javascript" color="0,0,255" opacity='0.5' count="199" src="js/canvas-nest.min.js"></script>
	<a id="top"></a>
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
		

        	<div id="item">
        		<div id="item_left">
        			<div class="item_list">
        			<% 
        				if(user_name==null)user_name="$";
		        		String picture=null;
		        		List<Map<String,Object>> pro = (List<Map<String,Object>>)application.getAttribute("project_info");
		        		//System.out.print(pro);
		        		//int k = 0;
				        if(pro!=null){
				        for(Map<String,Object> pro_info :pro){			    	  	
				        	//k++;
				     		//if(k > 4)break;
				     		picture=(String)pro_info.get("project_logo_path");
				     		if(picture!=null){
					     		int i = picture.indexOf("upload");
					     		//这里其实应该加个判断,其他地方类似
					     		//如：if(i==-1)return;
					     		picture = picture.substring(0,i+6)+"\\"+picture.substring(i+6);
				     		}
		        	%>
        				<div class="ite fl" >
        					<figure class="mouse_hover">
        						<img src="<%=picture %>" width="359px" height="230">
        						<%
				        			List<Map<String,Object>> pro2 = (List<Map<String,Object>>)session.getAttribute("collectionProject_info");
				        			//System.out.println("hehe"+pro2);
				        			if(pro2!=null)
				        			{
				        				String b=(String)pro_info.get("project_name");
				        				for(Map<String,Object> info:pro2)
				        				{
				        					String a=(String)info.get("project_name");
				        					
				        					if(b.equals(a))
				        					{
				        						b="collect_project";
				        					}
				        				}
				        					
				        					if(b.equals("collect_project"))
				        					{
				        						%><img class="item_like" src="img/item/item_like.png" 
        						onclick="clickImgProject('<%=pro_info.get("project_name") %>',
        					'<%=user_name %>')"><%
				        					}
				        					else
				        					{
				        						%><img class="item_like" src="img/item/item_nolike.png" 
        						onclick="clickImgProject('<%=pro_info.get("project_name") %>',
        					'<%=user_name %>')"><%
				        					}
				        		%>
				        		
				        		<%} 
				        		else{
				        			%><img class="item_like" src="img/item/item_nolike.png" 
        						onclick="clickImgProject('<%=pro_info.get("project_name") %>',
        					'<%=user_name %>')"><%
				        		}%>
        						
        						<figcaption>
        							<p><a href="detail_project?project_name=<%=pro_info.get("project_name") %>" style="font-size:16px;color:white;margin-left:70px;">
        				<%=pro_info.get("project_name") %></a></p>
        						</figcaption>
        					</figure>
        				<a href="detail_project?project_name=<%=pro_info.get("project_name") %>" style="font-size:16px;color:black;margin-left:70px;">
        				<%=pro_info.get("project_name") %></a>
        				</div>
        			<%}}else{} %>	
        			</div>
      				
        		</div>
        		<div class="clear"></div>
        	</div>
        	 <div id="item_right">
        		<%
					String user_info;
					user_info = (String)session.getAttribute("user_info");
					if(user_info == null) user_info = "未登陆，请返回登陆";
				%>
        					<%
							String user_picture;
							user_picture = (String)session.getAttribute("user_picture");
							if(user_picture == null)
							{
							%>
							<img src="img/activity/touxiang.jpg"/>
							<%} 
							else{
							%>
							<img src="<%=user_picture %>" id="user_picture" />
							<%} %>
        			<p id="item_name"><a href="index.jsp"><%=user_info %></a></p>
        	</div>
        	
			<div class="footer">
	        	<div class="footer_l fl">
	        		<span>栏目</span>
	        		<ul>
	        			<li><a href="index.jsp">首页</a></li>
	        			<li><a href="activity.jsp">志愿活动报名</a></li>
	        			<li><a href="item.jsp">志愿项目介绍</a></li>
	        			<li><a href="home.jsp">个人主页</a></li>
	        		</ul>
	        	</div>
	        	<div class="footer_c fl">
	        		<p>心青年</p>
	        		<p>为校内学生提供一个志愿信息获取、活动报名的平台。</p>
	        		<p><a href="">联系我们</a></p>
	        	</div>
	        	<div class="footer_r fr">
	        		<span>友情链接</span>
	        		<ul>
	        			<li><a href="">公益中国</a></li>
	        			<li><a href="">中国志愿服务联合会</a></li>
	        			<li><a href="">中国青年志愿者网</a></li>
	        			<li><a href="">志愿中国</a></li>
	        		</ul>
	        	</div>
	        </div>
	        		<div id="return" class="fr"><a href="javascript:void(0)" onclick="document.getElementById('top').scrollIntoView();"><img src="img/return2.png"></a></div>
	        
		</div>
		
		
		
		
	</body>
</html>
