<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
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
		<link type="text/css" rel="stylesheet" href="css/reset.css">
		<link type="text/css" rel="stylesheet" href="css/vo_admin.css">
		<link type="text/css" rel="stylesheet" href="css/manage_select.css">
		<script type="text/javascript" src="<%=basePath%>js/manage_select.js"></script>
	</head>
	<body>
	<%

		String exportToExcel = request.getParameter("exportToExcel");

		if (exportToExcel != null

				&& exportToExcel.toString().equalsIgnoreCase("YES")) {

			response.setContentType("application/vnd.ms-excel");

			response.setHeader("Content-Disposition", "inline; filename="

					+ "excel.xls");



		}

	%>
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
						<li><a href="<%=basePath%>volunteer_admin/vo_admin.jsp"><b>管理主页</b></a></li>
						<li><a href="<%=basePath%>volunteer_admin/vo_publish.jsp"><b>内容发布</b></a></li>
						<li class="navstyle"><a href="<%=basePath%>volunteerAdmin"><b>志愿者筛选</b></a></li>
						<li><a href="#"><b>交流与评价</b></a></li>
					</ul>
				</div>
				<div id="guanli_right3" class="fr">
					<div class="title">
						<p class="title1">报名情况</p>
						<div class="guanli_kong"></div>
					</div>
					<div id="output1">
							<table>
								<caption>报名志愿者
									<span class="ad_sub fr">
										<img class="ad" src="img/admin/add.jpg" />
										<img class="sub" src="img/admin/sub.jpg" />
									</span>
								</caption>
							<form method="post" action="selectVolunteer">
								
								<table id="toExcel" class="show">
									<tr class="xuanze">
										<td align="center" id="total">全选 
											<input type="checkbox" id="qx" /> 
										</td>
										<td class="td1">证件号</td>
										<td class="td2">姓名</td>
										<td class="td3">联系方式</td>
										<td class="td4">时间段</td>
										<td class="td5">学院</td>
										<td class="td6">爱心值</td>
										<td class="td7">个人介绍</td>
										<td class="td8">标签</td>
									</tr>
									<%
										List<Map<String,Object>> result=(List<Map<String,Object>>)session.getAttribute("volunteerInfo");
										//System.out.print(result);
										if(result!=null)
										{
											for(Map<String,Object> info:result)
											{
										
									%>
									<tr class="xuanze">
										<td ><div class="check" ><input name="productId" type="checkbox" value="<%=info.get("user_name") %>$<%=info.get("volunteer_name") %>"></div></td>
										<td class="td1"><%=info.get("user_identify") %></td>
										<td class="td2"><%=info.get("user_realname") %></td>
										<td class="td3"><%=info.get("user_phone") %></td>
										<td class="td4"><%=info.get("user_select_time") %></td>
										<td class="td5"><%=info.get("user_college") %></td>
										<td class="td6"><% %></td>
										<td class="td7"><%=info.get("user_introduce") %></td>
										<td class="td8"><% %></td>
									</tr>
									<%}}else{} %>
								</table>
								<button id="zhaomu" class="fr" type="submit" >招募</button>
							</form>
								<button id="daochu1" class="fr" onclick="javascript:location.href='<%=basePath%>volunteer_admin/vo_UserInfoExcel.jsp?exc=all'">一键导出</button>
							
						</table>
					</div>
						<div id="output2">
							<table>
								<caption>招募志愿者
								<div class="ad_sub fr">
										<img class="ad" src="img/admin/add.jpg" />
										<img class="sub" src="img/admin/sub.jpg" />
									</div>
								</caption>
							<form method="post" action="selectVolunteer?add=add">
								<table class="show">
									<tr class="xuanze2">
									<td align="center" id="total2">全选 
											<input type="checkbox" id="qx2" /> 
										</td>
										<td class="td1">证件号</td>
										<td class="td2">姓名</td>
										<td class="td3">联系方式</td>
										<td class="td4">时间段</td>
										<td class="td5">学院</td>
										<td class="td6">爱心值</td>
										<td class="td7">个人介绍</td>
										<td class="td8">标签</td>
									</tr>
							<%
								if(result!=null)
								{
									for(Map<String,Object> info:result)
									{
										if(info.get("user_isselect")!=null&&info.get("user_isselect").equals("是"))
										{
							%>
									<tr class="xuanze2">
										<td ><div class="check" ><input name="productId2" type="checkbox" value="<%=info.get("user_name") %>"></div></td>
										<td class="td1"><%=info.get("user_identify") %></td>
										<td class="td2"><%=info.get("user_realname") %></td>
										<td class="td3"><%=info.get("user_phone") %></td>
										<td class="td4"><%=info.get("user_select_time") %></td>
										<td class="td5"><%=info.get("user_college") %></td>
										<td class="td6"><%=info.get("user_love") %></td>
										<td class="td7"><%=info.get("user_introduce") %></td>
										<td class="td7"></td>
									</tr>
									<%}}}else{} %>
									</table>
									<button id="daochu2" class="fr" type="submit">增加爱心值</button>
								</form>
									<button id="increase" class="fr" onclick="location.href='<%=basePath%>volunteer_admin/vo_UserInfoExcel.jsp?exc=select'">一键导出</button>
							</table>
							
						</div>
				</div>
		</div>
	</body>
</html>
