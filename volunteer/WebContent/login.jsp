<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录界面</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function() {
		$('#login').click(function() {
			var name_state = $('#name');
			var psd_state = $('#psd');
			var name = $('#name').val();
			var psd = $('#psd').val();
			if (name == '') {
				name_state.parent().next().next().css("display", "block");
				return false;
			} else if (psd == '') {
				name_state.parent().next().next().css("display", "none");
				psd_state.parent().next().next().css("display", "block");
				return false;
			} else {
				name_state.parent().next().next().css("display", "none");
				psd_state.parent().next().next().css("display", "none");
				$('.login').submit();
			}
		});
		$('#register').click(function() {
			var name_r_state = $('#name_r');
			var psd_r_state = $('#psd_r');
			var affirm_psd_state = $('#affirm_psd');
			var name_r = $('#name_r').val();
			var psd_r = $('#psd_r').val();
			var affirm_psd = $('#affirm_psd').val();
			if (name_r == '') {
				name_r_state.parent().next().next().css("display", "block");
				return false;
			} else if (psd_r == '') {
				psd_r_state.parent().next().next().css("display", "block");
				return false;
			} else if (affirm_psd == '') {
				affirm_psd_state.parent().next().next().css("display", "block");
				return false;
			} else if (psd_r != affirm_psd) {
				return false;
			} else {
				$('.register').submit();
			}
		})
	})
	function ok_or_errorBylogin(l) {
		var content = $(l).val();
		if (content != "") {
			$(l).parent().next().next().css("display", "none");
		}
	}
	function ok_or_errorByRegister(r) {
		var affirm_psd = $("#affirm_psd");
		var psd_r = $("#psd_r");
		var affirm_psd_v = $("#affirm_psd").val();
		var psd_r_v = $("#psd_r").val();
		var content = $(r).val();
		if (content == "") {
			$(r).parent().next().next().css("display", "block");
			return false;
		} else {
			$(r).parent().next().css("display", "block");
			$(r).parent().next().next().css("display", "none");
			if (psd_r_v == "") {
				$(psd_r).parent().next().css("display", "none");
				$(psd_r).parent().next().next().css("display", "none");
				$(psd_r).parent().next().next().css("display", "block");
				return false;
			}
			if (affirm_psd_v == "") {
				$(affirm_psd_v).parent().next().css("display", "none");
				$(affirm_psd_v).parent().next().next().css("display", "none");
				$(affirm_psd_v).parent().next().next().css("display", "block");
				return false;
			}
			if (psd_r_v == affirm_psd_v) {
				$(affirm_psd).parent().next().css("display", "none");
				$(affirm_psd).parent().next().next().css("display", "none");
				$(psd_r).parent().next().css("display", "none");
				$(psd_r).parent().next().next().css("display", "none");
				$(affirm_psd).parent().next().css("display", "block");
				$(psd_r).parent().next().css("display", "block");
			} else {
				$(affirm_psd).parent().next().css("display", "none");
				$(affirm_psd).parent().next().next().css("display", "none");
				$(psd_r).parent().next().css("display", "none");
				$(psd_r).parent().next().next().css("display", "none");
				$(psd_r).parent().next().css("display", "block");
				$(affirm_psd).parent().next().next().css("display", "block");
				return false;
			}
		}
	}
	function barter_btn(bb) {
		$(bb).parent().parent().fadeOut(1000);
		$(bb).parent().parent().siblings().fadeIn(2000);
	}
</script>
</head>
<body class="login_body">
<div class="login_div">
	<div class="col-xs-12 login_title">登录</div>
			<%
				String user_login = (String)request.getAttribute("user_register");
				if(user_login==null) user_login="";
			%>
	<form action="loginlc" class="login" method="post">
		<div class="nav">
			<div class="nav login_nav">
				<div class="col-xs-4 login_username">
					昵称:
				</div>
				<div class="col-xs-6 login_usernameInput">
					<input type="text" name="user" id="name" value="<%=user_login %>" placeholder="&nbsp;&nbsp;用户名/手机号"  onblur="javascript:ok_or_errorBylogin(this)" />
				</div>
				<div class="col-xs-1 ok_gou">
					√
				</div>
				<div class="col-xs-1 error_cuo">
					×
				</div>
			</div>
			<div class="nav login_psdNav">
				<div class="col-xs-4">
					密&nbsp;&nbsp;&nbsp;码:
				</div>
				<div class="col-xs-6">
					<input type="password" name="password" id="psd" value="" placeholder="&nbsp;&nbsp;密码" onBlur="javascript:ok_or_errorBylogin(this)" />
				</div>
				<div class="col-xs-1 ok_gou">
					√
				</div>
				<div class="col-xs-1 error_cuo">
					×
				</div>
			</div>
			<div class="col-xs-12 login_btn_div">
				<button type="submit" class="sub_btn" name="Submit" value="login" id="login" >登录</button>
			</div>
		</div>
	</form>
	<div class="col-xs-12 barter_btnDiv">
		<button class="barter_btn" onClick="javascript:barter_btn(this)">没有账号?前往注册</button>
	</div>
</div>
<div class="register_body">
	<div class="col-xs-12 register_title">注册</div>
	<form action="loginlc" class="register" method="post">
		<div class="nav">
			<div class="nav register_nav">
				<div class="col-xs-4">
					呢称:
				</div>
				<div class="col-xs-6">
					<input type="text" name="user" id="name_r" value="<%=user_login %>" placeholder="&nbsp;&nbsp;用户名/手机号" onBlur="javascript:ok_or_errorByRegister(this)" />
				</div>
				<div class="col-xs-1 ok_gou">
					√
				</div>
				<div class="col-xs-1 error_cuo">
					×
				</div>
			</div>
			<div class ="nav register_psdnav">
				<div class="col-xs-4">
					学校:
				</div>
				<div class="sel"> 
					<select name="college">
						<option value="浙江大学">浙江大学</option>
						<option value="杭州电子科技大学">杭州电子科技大学</option>
						<option value="杭州师范大学">杭州师范大学</option>
						<option value="中国传媒大学">中国传媒大学</option>
						<option value="复旦大学">复旦大学</option>
						<option value="浙江传媒学院">浙江传媒学院</option>
						<option value="浙江理工大学">浙江理工大学</option>
						<option value="同济大学">同济大学</option>
					</select>
				</div>
			</div>
			<div class="nav register_psdnav">
				<div class="col-xs-4">
					密&nbsp;&nbsp;&nbsp;码:
				</div>
				<div class="col-xs-6">
					<input type="password" name="password" id="psd_r" value="" placeholder="&nbsp;&nbsp;密码" onBlur="javascript:ok_or_errorByRegister(this)" />
				</div>
				<div class="col-xs-1 ok_gou">
					√
				</div>
				<div class="col-xs-1 error_cuo">
					×
				</div>
			</div>
			<div class="nav register_affirm">
				<div class="col-xs-4">
					确认密码:
				</div>
				<div class="col-xs-6">
					<input type="password" name="" id="affirm_psd" value="" placeholder="&nbsp;&nbsp;确认密码" onBlur="javascript:ok_or_errorByRegister(this)" />
				</div>
				<div class="col-xs-1 ok_gou">
					√
				</div>
				<div class="col-xs-1 error_cuo">
					×
				</div>
			</div>
			<div class="col-xs-12 register_btn_div">
				<button type="submit" class="sub_btn" name="Submit" value="register" id="register" >注册</button>
			</div>
		</div>
	</form>
	<div class="col-xs-12 barter_register">
		<button class="barter_registerBtn" onClick="javascript:barter_btn(this)" style="">已有秘籍?返回登录</button>
	</div>
</div>
</body>
</html>