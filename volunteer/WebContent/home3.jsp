<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link type="text/css" rel="stylesheet" href="css/reset.css">
		<link type="text/css" rel="stylesheet" href="css/home.css">
		<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" src="js/home.js"></script>
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
						<li><a href="home2.jsp"><b>个人信息</b></a></li>
						<li class="navstyle"><a href="home3.jsp"><b>我的收藏</b></a></li>
						<!-- <li><a href="home.jsp"><b>感想与随笔</b></a></li> -->
					</ul>
				</div>
				<div id="home_right" class="fr">
				
					<div id="home3">
						<div class="title_3 ">
							<span>收藏活动</span>
						</div>
						<div class="tab-content" style="margin-left:60px;">
            <div class="tab-pane active">
                <div class="flashSaleDeals">
					<div class="v_cont1" style="width:490px;overflow: hidden">
						<ul class="flder1">
					<%
					  String volunteer_picture = null;//(String)session.getAttribute("volunteer_picture");
				      List<Map<String,Object>> re=(List<Map<String,Object>>)session.getAttribute("collection_info");
						//System.out.print(rePro);
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
											<img class="dealImg" src="<%=volunteer_picture %>" id="hasEnter">
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
									<a href="javascript:;" class="zuo1 trigger"></a>
									<a href="javascript:;" class="you1 trigger"></a>
								</div>
			                </div>
			            </div>
			        </div>	
						<div class="title_3">
							<span>收藏项目</span>
						</div>
						<div class="home_3_bo">
			<div class="tab-content" style="margin-left:60px;">
            <div class="tab-pane active">
                <div class="flashSaleDeals">
					<div class="v_cont" style="width:490px;overflow: hidden">
						<ul class="flder">
					<%
					  String project_picture = null;//(String)session.getAttribute("volunteer_picture");
				      //System.out.println(project_picture);
					  List<Map<String,Object>> rePro=(List<Map<String,Object>>)session.getAttribute("collectionProject_info");
						//System.out.println("hehe"+rePro);
					  k = 0;
					  index=0;
					  relength=0;
			    	  	//System.out.println(relength);

				      if(rePro!=null){
				    	  relength=rePro.size();
				      for(int m=0;;m++)
				      {
				    	  Map<String,Object> a_info=null;
				    %>
				    	<li index="<%=index %>">
				    <%
				      	  for(int j=k;j<relength;j++){
				    	  	a_info=rePro.get(j);
				    	  	k++;
				    	  	//System.out.println(a_info);
				     		//图片路径
				     		if(a_info==null)return ;
				     		project_picture=(String)a_info.get("project_logo_path");
				     		int i = project_picture.indexOf("upload");
				     		project_picture = project_picture.substring(0,i+6)+"\\"+project_picture.substring(i+6);
			    	 %>
							
								<div class="xsq_deal_wrapper">
									<a class="saleDeal" href="detail_project?project_name=<%=a_info.get("project_name") %>">
										<div class="dealCon">
											<img class="dealImg" src="<%=project_picture %>" id="hasEnter">
										</div>
										<div class="title_new">
											<p class="word"><%=a_info.get("project_name")%></p>
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
						</div>
					</div>
			</div>
			
			
		</div>
		
		</div>
	</body>
</html>
