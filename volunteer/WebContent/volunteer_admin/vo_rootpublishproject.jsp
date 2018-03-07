<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%
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
						<li ><a href="<%=basePath%>volunteer_admin/vo_root.jsp"><b>超级管理员</b></a></li>
						<li class="navstyle"><a href="<%=basePath%>volunteer_admin/vo_rootpublishproject.jsp"><b>项目发布</b></a></li>
						<li><a href="<%=basePath%>volunteer_admin/vo_rootpublished.jsp"><b>已发布项目</b></a></li>
						<li><a href="<%=basePath%>volunteer_admin/vo_rootUser.jsp"><b>用户管理</b></a></li>
					</ul>
				</div>
				<div id="guanli_right2" class="fr">
					<div id="content" class="fl">
						<form action="<%=basePath%>vo_publishProject" method="post" enctype="multipart/form-data" >
							<span>项目名</span><input class="input1" type="text" name="project_name"/><br />
							<span>发起组织</span><input type="text" name="project_organization"/>
							<span>联系人</span><input name="project_contact" type="text"/>
							<span>活动分类</span><input type="text" name="project_classify"/>
                            <br />
							<span>详情页图片</span><input name="fileName" type="file" />
							<span>首页封面</span><input name="fileName" type="file" />
                            <!-- <span>上传logo</span><input name="logo" type="text"/><span class="liulan"><a href="#">浏览</a></span> -->
                            <br />
							<span>简介</span><br/><textarea name="project_introduce"></textarea>
							<button class="fr" id="fabu" name="fabu" type="submit">发布</button>
							<!-- <button class="fr" id="chakan" name="chakan">查看</button> -->
							
						</form>
					</div>
				</div>
		</div>
	</body>
</html>
