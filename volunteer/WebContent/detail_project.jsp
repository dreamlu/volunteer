<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link type="text/css" rel="stylesheet" href="css/reset.css">
		<link type="text/css" rel="stylesheet" href="css/main.css">
<title>志愿详情</title>
		
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
            <%
            	List<Map<String,Object>> re=(List<Map<String,Object>>)session.getAttribute("project_info");
            	//System.out.print(re);
            	if(re==null)return ;
            	Map<String,Object> info=re.get(0);
            	
            	String pro_picture=(String)info.get("project_picture_path");
	     		if(pro_picture!=null){
		     		int i = pro_picture.indexOf("upload");
		     		pro_picture = pro_picture.substring(0,i+6)+"\\"+pro_picture.substring(i+6);
	     		}
            %>   
            <div class="xinxm">
            	<img src="<%=pro_picture %>" width="534px" height="273px"/>
            </div>
            <div class="xinxi">
                <img src="img/item_xq/2.gif"/>
                <br />
                <br />
                <p style="font-size:22px;font-weight:bold;text-align:center;"><%=info.get("project_name") %></p>
                <br />
                <p style="font-size:18px;text-align:center;">发起组织：<%=info.get("project_organization") %></p>
                <p style="font-size:18px;text-align:center;">联系人：<%=info.get("project_contact") %></p> 
                <p style="font-size:18px;text-align:center;">活动分类：<%=info.get("project_classify") %></p>         
            </div>
     
              
           <div>
                 <img src="img/item_xq/3.png" />
            </div>
            
            <div>            
            <br />
            <br />
            <p style="font-size:20px;font-weight:bold;text-align:center;font-family:Arial, Helvetica, sans-serif">简介</p>
            <br />
            <br />           
            <p style="font-size:16px">&nbsp;&nbsp;&nbsp;&nbsp; <%=info.get("project_introduce") %></p>
            </div>
            
            
            <div class="newActivity">
        		<div class="comwidth">
        			<div class="title fl">
        				<img  src="img/item_xq/activity.png" class="fl">
        				<div class="more fr"><a href="">>>查看更多</a></div>
        			</div>
        			
        			<%
        			String volunteer_picture;
        			List<Map<String,Object>> reP=(List<Map<String,Object>>)session.getAttribute("project_actvity");
        			if(reP!=null)
                		for(Map<String,Object> V_info:reP)
                		{
                			volunteer_picture=(String)V_info.get("volunteer_picture_path");
				     		if(volunteer_picture!=null){
					     		int i = volunteer_picture.indexOf("upload");
					     		volunteer_picture = volunteer_picture.substring(0,i+6)+"\\"+volunteer_picture.substring(i+6);
				     		}
        			%>
        			<div class="activity_1 fl margin_r">
        				<div class="activity_img">
        					<img src="<%=volunteer_picture %>" width="210px" height="206px"/>
        				</div>
        				<h3><a href="detail_activity?volunteer_name=<%=V_info.get("volunteer_name") %>&user_look=user_look">
        				<%=V_info.get("volunteer_name") %></a></h3>
        				<p class="font_act">地点：<%=V_info.get("volunteer_place") %></p>
        				<p class="font_act">时间：<%=V_info.get("volunteer_time") %></p>
        			
        			</div>
        			<%} %>
        		</div>
            </div>

            
            </div>
            
</body>
</html>    
