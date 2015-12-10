<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/constants.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>
</head>
<body>
	<!-- <div>
	<form id="registform">
		用户名：<input id="usernametxt" type="text" name="username">
		密码：<input id="pwd" type="password" name="password">
		邮箱：<input id="emailtxt" type="text" name="email">
		性别：<input id="sexradio" type="radio" name="sex">
		生日：
		手机号：<input id="phonetxt" type="text" name="phone">
		<input id="registbtn" type="button" value="立即注册">
	</form>
	</div> -->

	<center>
		<h1>注册</h1>
	</center>
	<div align="center">
		<form id="registform">
			<table>
				<tbody>
					<tr>
						<td><label for="t1">用户名：</label></td>
						<td class="right"><input type="text" id="t1" name="username"></td>
					</tr>
					<tr>
						<td><label for="Password1">密 码：</label></td>
						<td class="right"><input id="pwd" type="password"
							name="password" /></td>
					</tr>
					<tr>
						<td><label for="e1">邮 箱：</label></td>
						<td class="right"><input type="text" id="emailtxt"
							name="email"></td>
					</tr>
					<!-- <tr>
						<td><label for="1">性 别：</label></td>
						<td class="right"><input type="radio" id="r1" name="sex"
							value="1" checked />男 <input type="radio"
							id="r2" name="sex" value="2" />女</td>
					</tr>
					<tr>
						<td>密保问题：</td>
						<td><select id="pswquestionselect" name="pswquestion">
								<option value="你爸爸的名字">你爸爸的名字</option>
								<option value="你妈妈的名字">你妈妈的名字</option>
								<option value="你最喜欢的动物">你最喜欢的动物</option>
						</select></td>
					</tr>
					<tr>
						<td>密保答案：</td>
						<td><input type="text" id="pswanswertxt" name="pswanswer">
						</td>
					</tr>
					<tr>
						<td><label for="birthtxt">生 日：</label></td>
						<td><input id="birthtxt" type="text" name="birthday" /></td>
					</tr>
					<tr>
						<td><label for="phonetxt">手机号：</label></td>
						<td><input id="phonetxt" type="text" name="phone"></input></td>
					</tr> -->
					<tr>
						<td rowspan=2><input id="registbtn" type="button"
							value="立即注册" /></td>
						<td><input id="resetbtn" type="reset" value="重 置" /></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<jsp:include page="/js/dynamic/plugin.js.jsp"></jsp:include>
</body>
<script>
$(function() {
    $('#registbtn').click(function () {
        if ($('#usernametxt').val() == "" || $('#pwd').val() == "") {
            alert("用户名或密码不能为空！");
        }
        else {
        	$.ajax({
        		type : "post",
        		data: $("#registform").serialize(), 
        		url: "${context_path}/doRegist",
        		success : function(json) {
        			if(json.result=="OK"){
        				alert("注册成功");
        			}else{
        				alert("用户名或密码错误！");
        			}
        		},
        		error : function(e) {
        			alert("服务器错误！");
        		}
        	});
        }
    });

});
</script>
</html>