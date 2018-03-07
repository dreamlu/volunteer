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
		<div id="guanli_wrap">
			<div id="banner">
			<%
				String admin_name=(String)session.getAttribute("admin"); 
				if(admin_name==null)admin_name="管理员，请重新登陆";
				else admin_name="欢迎您，管理员: "+admin_name;
			%>
			<img src ='<%=basePath%>img/logo.png'><a href="<%=basePath%>volunteer_admin/vo_admin_login.jsp" style="font-size:16px;color:black;"><%=admin_name %></a>
			</div>
			<div id="wrap">	
				<div id="detail" >
				<%
				  String volunteer_name="";
				  String picture = null;
				  String title="";
			      String content="";
			      int flag=0;
			      
				  List<Map<String,Object>> re=(List<Map<String,Object>>)session.getAttribute("vo_publishAndSum");
				  System.out.print(re);	
			      if(re!=null&&re.size()!=0)
			      {
				      Map<String,Object> info=re.get(0);
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
						
						<div id="detail_join">
						<%
							if(flag==0)
							{
						%>
							<button onclick="javascript:location.href='<%=basePath%>/volunteer_admin/vo_drumbeating.jsp'">编辑</button>
						<%}else{ %>
							<button onclick="javascript:location.href='<%=basePath%>/volunteer_admin/vo_sum_up.jsp'">编辑</button>
						<%} %>
						</div>		
	
				</div>
				<div class="fanwei">
					<ul>
						<li><b></b></li>
					</ul>
				</div>
				
			<div class="m"></div>
			
		</div>
		</div>
	</body>
	</body>
</html>
