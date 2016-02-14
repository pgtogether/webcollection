<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/constants.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Insert title here</title>
<link href="${context_path}/css/base.css" rel="stylesheet"
	type="text/css" />
<link href="${context_path}/css/index.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript">
	var CONTEXT_PATH = '${context_path}';
</script>
</head>
<body>
	<jsp:include page="/include/head.jsp" />
	<div class="content">
		<jsp:include page="setmenu.jsp" />
		<div class="set_main">
			<div class="main_hd">
				<h2><a href="${context_path}/security">安全中心</a>&nbsp;&gt;&nbsp;设置分类密码</h2>
			</div>
			<div class="main_bd">
				<div class="highlight_box">
					<p class="desc">
						1.为了保证分类密码的安全性，请避免与登录密码相同。<br/>
						2.设置了分类密码，您可以创建保密分类，分类中可以收藏私密网址。
					</p>
				</div>
				<form id="setcategorypswform" action="" method="post">
				<div class="setpsw-box">
					<div class="frm_controls">
						<label class="input-label">分类密码</label>
						<div class="frm_input_box">
							<input id="categorypsw" name="categorypsw" type="password" class="frm_input" />
						</div>
					</div>
					<div class="frm_controls">
						<label class="input-label">确认密码</label>
						<div class="frm_input_box">
							<input id="confirmcategorypsw" name="confirmcategorypsw" type="password" class="frm_input" />
						</div>
					</div>
					<div class="frm_controls">
						<div class="frm_submit_box">
							<a class="frm_submit" href="javascript:void(0);">提交</a>
						</div>
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>
	<div class="footer">
		<div class="footer-in"></div>
	</div>
	<script src="${context_path}/js/plugin/jquery-1.8.3.min.js"></script>
	<script src="${context_path}/js/plugin/jquery.validate-1.13.1.min.js"></script>
	<script type="text/javascript">
		$(function(){
			var $form = $("#setcategorypswform");
			$form.validate({
				rules : {
					categorypsw : {
						required : true,
						minlength: 6
					},
					confirmcategorypsw : {
						required : true,
						equalTo : "#categorypsw",
						minlength: 6
					}
				},
				messages : {
					categorypsw : {
						required : "请输入分类密码",
							minlength: "分类密码不能小于6个字符",
					},
					confirmcategorypsw : {
						required : "请输入确认密码",
						minlength: "确认密码不能小于6个字符",
						equalTo: "两次输入密码不一致"
					}
				}
			});
			
			$(".frm_submit").click(function(){
				if (!$form.valid()) {
					return false;
				}
				$.ajax({
					type : "post",
					url : CONTEXT_PATH + "/security/doSetcategorypsw",
					data : $form.serialize(),
					success : function(json) {
						if (json.result == "OK") {
							successCallBack(json.data,parentCategoryName);
						} else {
							validateErrorsUtil.showValidateErrors($newParentCategoryForm, json.errors);
						}
					},
					error : function(e) {
					}
				});
			});
		});
	</script>
</body>
</html>