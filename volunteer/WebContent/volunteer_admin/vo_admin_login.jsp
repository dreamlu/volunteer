<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html><head><base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>心青年志愿服务管理平台</title>
<style type="text/css">
body, html, div, a, img, p, span, ul, li, input {
	margin: 0;
	padding: 0;
}
body {
	background: #b8becd;
	font-family: Heiti SC, Droidsansfallback, Dengxian, Helvetica, Segoe, "微软雅黑"
}
.box {
	position: fixed;
	left: 0;
	right: 0;
	bottom: 0;
	top: 0;
	background: url(img/bg3.png) no-repeat center bottom;
	background-size: 100% auto;
	min-width: 1000px;
	min-height: 500px;
}
.main {
	width: 1000px;
	margin: 0 auto;
}
.logo {
	width: 100%;
	float: left;
	font-size: 50px;
	font-weight: bold;
	text-align: center;
	color: #fff;
	padding: 90px 0 0 0;
	line-height: 60px;
}
.bottom {
	position: absolute;
	bottom: 10px;
	font-size: 14px;
	line-height: 18px;
	color: #fff;
	text-align: center;
	left: 0;
	right: 0;
}
.bottom a {
	color: #fff;
}
.loginBox {
	position: absolute;
	width: 600px;
	height: 100px;
	left: 50%;
	margin-left: -300px;
	top: 50%;
	margin-top: -60px;
}
.loginIn {
	width: 558px;
	border-radius: 6px;
	float: left;
	text-align: center;
	border: 1px solid #ccb6a9;
	background: #fffaf9;
	box-shadow: 0 0 6px #ccb6a9;
	padding: 20px;
}
.inputBox {
	width: 43%;
	float: left;
	text-align: left;
	font-size: 14px;
	line-height: 20px;
	color: #666;
}
.inputBox input {
	width: 200px;
	height: 30px;
	background: #fff;
	border: 1px solid #ccc;
	font-size: 14px;
	padding: 0 4px;
	border-radius: 4px;
	line-height: 30px;
	color: #000;
	margin-top: 3px;
}
.btnBox {
	width: 13%;
	float: left;
	font-size: 14px;
	line-height: 20px;
}
.btnBox input {
	width: 60px;
	height: 30px;
	background: #f90;
	border: 1px solid #f60;
	font-size: 14px;
	padding: 0 4px;
	border-radius: 4px;
	line-height: 30px;
	color: #fff;
	text-align: center;
	cursor: pointer;
	margin-top: 3px;
}
.btnBox input:hover {
	background: #f60;
}
.errorDiv {
	color: #ff0000;
	line-height: 30px;
}
.downLoad {
	width: 150px;
	padding: 5px;
	position: fixed;
	text-align: center;
	left: 10px;
	bottom: 10px;
	background: #fff;
	font-size: 12px;
	color: #999;
	line-height: 20px;
	border-radius: 4px;
}
.downLoad img {
	width: 150px;
	height: 150px;
}
.logo_x{
	width:162px;
	height:84;
}
</style>
</head>
<body><div class="box logindiv_x" id="loginDiv">
  <div class="main">
    <div class="logo" style="color:#93b2bf;"><img src="img/logo.png" class="logo_x"></div>
    <div class="loginBox">
      <div class="loginIn">
       <form action="<%=basePath%>admins" method="post" id="loginForm">
        <div class="inputBox">请输入账号：<br>
          <input name="admin_account" id="loginName" type="text">
        </div>
        <div class="inputBox">请输入密码：<br>
          <input name="admin_password" id="loginPWD" type="password">
          <br>
          <div class="errorDiv" id="errorDiv"></div>
        </div>
        
        <div class="btnBox">&nbsp;<br>
          <input name="Submit" value="登录" type="submit">
        </div>
        </form>
      </div>
    </div>
  </div>
</div>

</body></html>