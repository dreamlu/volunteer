<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>导出信息表</title>
</head>
<body>
<%

		String exportToExcel = request.getParameter("exportToExcel");

		if (exportToExcel != null

				&& exportToExcel.toString().equalsIgnoreCase("YES")) {

			response.setContentType("application/vnd.ms-excel");

			response.setHeader("Content-Disposition", "attachment; filename=" + "excel.xls");



		}

	%>
	<table id="toExcel" class="show" border="1" align=center >
									<thead>
									<tr>
										<th class="td1">证件号</th>
										<th class="td2">姓名</th>
										<th class="td3">联系方式</th>
										<th class="td4">时间段</th>
										<th class="td5">学院</th>
										<th class="td6">爱心值</th>
										<th class="td7">个人介绍</th>
										<th class="td8">标签</th>
									</tr>
									</thead>
									<tbody>
									<%
										List<Map<String,Object>> result=(List<Map<String,Object>>)session.getAttribute("volunteerInfo");

										String exc = request.getParameter("exc");
										if(exc==null)exc="";
										if(exc.equals("all"))
										{
										if(result!=null)
										{
											for(Map<String,Object> info:result)
											{
										
									%>
									<tr>
										<td><%=info.get("user_identify") %></td>
										<td class="td2"><%=info.get("user_realname") %></td>
										<td class="td3"><%=info.get("user_phone") %></td>
										<td class="td4"><%=info.get("user_select_time") %></td>
										<td class="td5"><%=info.get("user_college") %></td>
										<td class="td6"></td>
										<td class="td7"><%=info.get("user_introduce") %></td>
										<td class="td8"></td>
									</tr>
									<%}}%>
							<%}
							else if(exc.equals("select"))
							{
								if(result!=null)
								{
									for(Map<String,Object> info:result)
									{
										if(info.get("user_isselect")!=null&&info.get("user_isselect").equals("是"))
										{
							%>
									<tr>
										<td class="td1"><%=info.get("user_identify") %></td>
										<td class="td2"><%=info.get("user_realname") %></td>
										<td class="td3"><%=info.get("user_phone") %></td>
										<td class="td4"><%=info.get("user_select_time") %></td>
										<td class="td5"><%=info.get("user_college") %></td>
										<td class="td6"><%=info.get("user_love") %></td>
										<td class="td7"><%=info.get("user_introduce") %></td>
										<td class="td7"></td>
									</tr>
									<%}}}%>
					
					<%} %>
					</tbody>
					</table>
					<%
						//System.out.println(exportToExcel);
						if (exportToExcel == null) {
				
					%>
					
					<a href="vo_UserInfoExcel.jsp?exportToExcel=YES" style="width:100%;margin-left:50%;">导出 Excel</a>
					<%} %>					
</body>
</html>