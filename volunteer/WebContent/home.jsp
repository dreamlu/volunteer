<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>个人主页</title>
		<link type="text/css" rel="stylesheet" href="css/reset.css">
		<link type="text/css" rel="stylesheet" href="css/home.css">
		<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" src="js/home.js"></script>
<style type="text/css">
#hasEnter{
	width:146px;
	height:129px;
}		
</style>
	</head>
	<body>
	<script type="text/javascript" color="0,0,255" opacity='0.4' count="166" src="js/canvas-nest.min.js"></script>
	
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
					<%}else{
					%><jsp:forward page="login.jsp"></jsp:forward>
					<!-- <a href="login.jsp">注册/登陆</a> -->
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
						<li class="navstyle"><a href="home.jsp"><b>个人主页</b></a></li>
						<li><a href="home2.jsp"><b>个人信息</b></a></li>
						<li><a href="home3.jsp"><b>我的收藏</b></a></li>
						<!-- <li id="home_nav4"><b>感想与随笔</b></li> -->
					</ul>
				</div>
				<div id="home_right" class="fr">
				<div id="home2_l">
					<div class="title_2 ">
						<span>已报名的活动</span>
					</div>
			<div class="tab-content" style="margin-left:60px;">
            <div class="tab-pane active">
                <div class="flashSaleDeals">
					<div class="v_cont" style="width:490px;overflow: hidden">
						<ul class="flder">
					<%
					  String volunteer_picture = null;//(String)session.getAttribute("volunteer_picture");
				      List<Map<String,Object>> re=(List<Map<String,Object>>)session.getAttribute("clientEn");
						//System.out.print(re);
					  int k = 0,index=0;
					  int relength=0;
			    	  	//System.out.println(relength);

				      if(re!=null){
				    	  relength=re.size();
				      for(int m=0;;m++)
				      {
				    	  Map<String,Object> a_info=null;
				    %>
				    	<li index="<%=index %>">
				    <%
				      	  for(int j=k;j<relength;j++){
				    	  	a_info=re.get(j);
				    	  	k++;
				    	  	//System.out.println(k);
				     		//图片路径
				     		volunteer_picture=(String)a_info.get("volunteer_picture_path");
				     		int i = volunteer_picture.indexOf("upload");
				     		volunteer_picture = volunteer_picture.substring(0,i+6)+"\\"+volunteer_picture.substring(i+6);
			    	 %>
							
								<div class="xsq_deal_wrapper">
									<a class="saleDeal" href="detail_activity?volunteer_name=<%=a_info.get("volunteer_name") %>&user_look=user_look">
										<div class="dealCon">
											<img class="dealImg" src="<%=volunteer_picture%>" id="hasEnter">
										</div>
										<div class="title_new">
											<p class="word"><%=a_info.get("volunteer_name")%></p>
										</div>
									</a>
								</div>
					<%
						//每3个展示一次
						  if(k % 3==0){
				     			index++;
				     			break;
				     		}
						}
				    %>
				    </li>
				    <%
				      if(k==relength) break;
				    }
				  }
				  else{}
				      %>
						</ul>
						<a href="javascript:;" class="zuo trigger"></a>
						<a href="javascript:;" class="you trigger"></a>
					</div>
                </div>
            </div>
        </div>
					
					<div class="title_2">
						<span>我的消息</span>
						<div id="home_xiaoxi">
						<%
							if(re!=null){
							for(Map<String,Object> a_info :re){
								if(a_info.get("user_isselect")!=null&&a_info.get("user_isselect").equals("是"))
								{
						%>
							<input type="text" class="home_xiaoxi" value="您被选中参加 '<%=a_info.get("volunteer_name") %>' 志愿活动"/>
						<%
								}}}
						%>
						</div>
					</div>
					
				</div>
				
				<div id="home2_r" class="fr">
				<%
					String user_info,user_college,user_phone,user_love;
					user_info = (String)session.getAttribute("user_info");
					user_college = (String)session.getAttribute("user_college");
					user_phone = (String)session.getAttribute("user_phone");
					user_love=(String)session.getAttribute("user_love");
					if(user_info == null) user_info = "未登陆，请返回登陆";
					if(user_college == null) user_college = "";
					if(user_phone == null) user_phone = "";
				%>
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
					<p id="home2_xingming"><a href="index.jsp"><%=user_info %></a></p>
					<p>爱心值：<span id="home2_aixinzhi"><%=user_love %></span></p>
					<p id="home2_xueyuan"><%=user_college %></p>
					<p id="home2_call"><%=user_phone%></p>
				</div>
			</div>
			
			</div>
			
			
		</div>
	</body>
</html>
