<%@ page language="java" import="java.util.*,com.control.detail_activity" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%><!DOCTYPE html>
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8" />
		<title>首页</title>
		<link type="text/css" rel="stylesheet" href="css/reset.css">
		<link type="text/css" rel="stylesheet" href="css/main.css">
		<script type="text/javascript" src="js/img.js"></script>
		
		<script src="lib/jquery-1.10.2.js"></script>
		<link rel="stylesheet" href="css/ui-dialog.css">
		<script src="dist/dialog-min.js"></script>
		<!--弹出框-->
		<link rel="stylesheet" href="css/jquery.dialogbox-1.0.css"/>
		<script src="js/jquery.dialogbox-1.0.js" .dialogbox-1.0.js"></script>
				
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
			
			<!--视图部分加登陆-->
			<div class="header2 comwidth">
				<div id="slide">
				<ul class="list">
					<li><a href="javascript:;"><img src="img/banner/banner_1.png" alt=""></a></li>
					<li><a href="javascript:;"><img src="img/banner/banner_2.png" alt=""></a></li>
					<li><a href="javascript:;"><img src="img/banner/banner_3.png" alt=""></a></li>
				</ul>
				</div>
			</div>
			<script src="js/Mds.onePic.1.0.js" type="text/javascript"></script>
			<link type="text/css" rel="stylesheet" href="css/mdsSlide.css">
			<script>
			$('#slide').MdsSlideFade({
				pageNum: true,time: '3000'
			});
	
			</script>
        	<div class="newActivity">
        		<div class="comwidth">
        			<div class="title fl">
        				<img  src="img/newActivity.jpg" class="fl">
        				<div class="more fr"><a href="activity.jsp">>>查看更多</a></div>
        			</div>
        			
	        		<%
	        		//用户名
	        		  //String user_name=(String)session.getAttribute("user_info");
	        		  if(user_name==null)user_name="$";
	        		  //是否收藏
		        	  String isCollect="";
	        		  //收藏信息
					  List<Map<String, Object>> result = (List<Map<String, Object>>)session.getAttribute("collection_info");
					  //是否报名
	        		  String isEnter="";
					  //报名信息
					  List<Map<String, Object>> reEnter = (List<Map<String, Object>>)session.getAttribute("clientEn");
	        		  //志愿活动信息
					  String volunteer_picture = null;//(String)session.getAttribute("volunteer_picture");
				      List<Map<String,Object>> re=(List<Map<String,Object>>)application.getAttribute("activity_info");
				      
						//System.out.print(re);
					  int k = 0;
				      if(re!=null){
				      for(Map<String,Object> a_info :re){
				    	    k++;
				     		if(k > 4)break;
				     		volunteer_picture=(String)a_info.get("volunteer_picture_path");
				     		if(volunteer_picture!=null){
					     		int i = volunteer_picture.indexOf("upload");
					     		volunteer_picture = volunteer_picture.substring(0,i+6)+"\\"+volunteer_picture.substring(i+6);
				     		}
			    	 %>
        			
        			
        			<div class="activity_1 fl margin_r">
        				<div class="activity_img">
        					<img class="activity_picture" src="<%=volunteer_picture%>"/>
        				</div>
        				<h3><a href="<%=basePath%>detail_activity?volunteer_name=<%=a_info.get("volunteer_name") %>&user_look=user_look">
        				<%=a_info.get("volunteer_name") %></a></h3>
        				<p class="font_act">地点：<%=a_info.get("volunteer_place") %></p>
        				<p class="font_act">时间：<%=a_info.get("volunteer_time") %></p>
        				<div class="tubiao">
        					<!-- 宣传总结图标 -->
        					<%
	        					//尝试新的方式，改进性能
	      					    detail_activity de=new detail_activity();
        						List<Map<String,Object>> pubsum=de.publishAndSum((String)a_info.get("volunteer_name"));
        						//System.out.println("发布总结 ："+a_info.get("volunteer_name")+" hhh "+pubsum);
        						//pubsum.size()!=0一定要判断，可能从数据库中取出来的结果
        						//没有值，但是对象不为空
        						if(pubsum!=null&&pubsum.size()!=0)
        						{
        							Map<String,Object> pu_info=null;
        							Map<String,Object> pu_info2=null;
        							if(pubsum.size()==1)
        							{
        								pu_info	= pubsum.get(0);
        								System.out.print(pu_info);
        								if(pu_info!=null&&(Integer)pu_info.get("vo_flag")==0)
            						    {
            						    	%><img src="img/activity_2.gif" title="活动宣传"><%
            						    }
            						    else if(pu_info2!=null&&(Integer)pu_info2.get("vo_flag")==1)
            						    {
            						    	%><img src="img/activity_3.jpg" title="活动总结"><%
            						    }
        							}
        							else  
        							{
        								pu_info2=pubsum.get(1);
        								System.out.print(pu_info2);
        								if(pu_info2!=null&&(Integer)pu_info2.get("vo_flag")==1)
            						    {
            						    	%><img src="img/activity_3.jpg" title="活动总结"><%
            						    }
        							}

        						}
        						else
    						    {
    						    	%><img src="img/activity_1.gif" title="志愿招募"><%
    						    }
        					%>
        					<!-- 显示收藏图标 -->
        					<% 
        						if(result==null);
        						else for(Map<String,Object> obj:result)
        						{
        							//System.out.println(obj.get("volunteer_name"));
        							if(obj.containsValue(a_info.get("volunteer_name")))
        							{
        								isCollect="collect";
        								break;
        							}
        							else isCollect="";
        						}
        						if(isCollect.equals("collect"))
        						{
        					%>
        					<img src="img/like.gif" title="收藏" class="like" 
        					onclick="clickImg('<%=a_info.get("volunteer_name") %>',
        					'<%=user_name %>')">
        					<%
        						}
        						else
        						{
        					%>
        					 <img src="img/noLike.gif" title="收藏"  class="like" 
        					 onclick="clickImg('<%=a_info.get("volunteer_name") %>',
        					 '<%=user_name %>')">
        					<%
        						}
        					%>
        					
        					<!-- 显示报名图标 -->
        					<%
    						//System.out.println(reEnter);

        						if(reEnter==null);
        						else for(Map<String,Object> obj:reEnter)
        						{
        							if(obj.containsValue(a_info.get("volunteer_name")))
        							{
        								//System.out.println("呵呵 "+obj.get("volunteer_name"));
        								isEnter="Enter";
        								break;
        							}
        							else isEnter="";
        						}
        						if(isEnter.equals("Enter"))
        						{
        					%>
        					<%-- <a href="volunteerEnter?volunteer_name=<%=a_info.get("volunteer_name") %>"> --%>
        					<img src="img/baoming.gif" title="报名" class="baoming"
        					 onclick="clickImgEnter('<%=a_info.get("volunteer_name")%>',
        					 '<%=user_name %>','noHasEnter')">
        					<!-- </a> -->
        					<%
        						}
        						else
        						{
        					%>
        					<%-- <a href="volunteerEnter?volunteer_name=<%=a_info.get("volunteer_name") %>"> --%>
        					<img src="img/nobaoming.jpg" title="报名" class="baoming" 
        					onclick="clickImgEnter('<%=a_info.get("volunteer_name")%>',
        					'<%=user_name %>','hasEnter')">
        					<!-- </a> -->
        					<%		
        						}
        					%>
        				</div>
        			</div>
        			
        			 <%} }
				      else{}
				      %>
        		</div>
        	</div>
        <div class="hotItem comwidth">
        
        	<div class="title fl">
        		<img  src="img/hotItem.jpg" class="fl"">
        		<div class="more fr"><a href="item.jsp">>>查看更多</a></div>
        	</div>
        	<!-- 志愿活动 项目 -->
        	<% 
        		String picture=null;
        		List<Map<String,Object>> pro = (List<Map<String,Object>>)application.getAttribute("project_info");
        		//System.out.print(pro);
        		k = 0;
		        if(pro!=null){
		        for(Map<String,Object> pro_info :pro){			    	  	
		        	k++;
		     		if(k > 4)break;
		     		picture=(String)pro_info.get("project_logo_path");
		     		if(picture!=null){
			     		int i = picture.indexOf("upload");
			     		//这里其实应该加个判断,其他地方类似
			     		//如：if(i==-1)return;
			     		picture = picture.substring(0,i+6)+"\\"+picture.substring(i+6);
		     		}
        	%>
			<div class="activity_2 fl margin_r">
        		<a href="detail_project?project_name=<%=pro_info.get("project_name") %>">
        			<img src="<%=picture %>" height="195px" width="214px"/>
        		</a>
        		<p><a href="detail_project?project_name=<%=pro_info.get("project_name") %>"><%=pro_info.get("project_name") %></a></p>
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
        						%><img src="img/like.gif" title="收藏" class="like" 
        		onclick="clickImgProject('<%=pro_info.get("project_name") %>',
        		'<%=user_name %>')"><%
        					}
        					else
        					{
        						%><img src="img/noLike.gif" title="收藏" class="like" 
        		onclick="clickImgProject('<%=pro_info.get("project_name") %>',
        		'<%=user_name %>')"><%
        					}
        		%>
        		
        		<%} 
        		else{
        			%><img src="img/noLike.gif" title="收藏" class="noLike" 
        			onclick="clickImgProject('<%=pro_info.get("project_name") %>',
        		'<%=user_name %>')"><%
        		}%>
        	</div>
        	<%}}else{
        	} %>
        	
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
		
		</div>
	</body>
</html>
