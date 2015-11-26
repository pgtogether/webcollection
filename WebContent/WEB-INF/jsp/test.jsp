<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/constants.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${context_path}/css/base.css" rel="stylesheet"
	type="text/css" />
<link href="${context_path}/css/theme1.css" rel="stylesheet"
	type="text/css" />
<style type="text/css">
.mask {
	position: absolute; left: 0; top: 0; width: 100%; height: 100%; z-index: 9000; background-color: #E2E2E2; opacity: 0.5;
}

.popbox {
	position: absolute; left: 40%; top: 25%; z-index: 9999; width: 350px; background: #fff; height: auto;
}

.popbox-head {
	width: 100%; height: 40px; float: left; line-height: 45px; font-size: 17px; border-bottom: 1px solid #000; text-indent: 10px; background: #00C9D4; text-indent: 10px; color: #FFF;
}

.popbox-body {
	width: 100%; float: left; padding-top: 10px;
}

.popbox-body p {
	width: 100%; float: left; line-height: 40px; text-align: center;
}

.popbox-body p label {
	width: 10%; float: left; margin-left: 2.5%; margin-right: 2.5%; text-align: center;
}

.popbox-body p input {
	width: 78%; float: left; text-indent: 5px; height: 25px; margin-top: 5px;
}

.popbox-body p textarea {
	width: 78%; max-width: 78%; float: left; text-indent: 5px; line-height: 30px; margin-top: 5px;
}

.popbox-body p .btn {
	width: 100%;
}

.popbox-body p .btn  a {
	display: inline-block; width: 100px; height: 40px; background: #00C9D4; margin: 15px 0px 15px 25px; text-decoration: none; cursor: pointer; border-radius: 5px; font-size: 14px; color: #fff;
}

.popbox-body p .btn  a:hover {
	display: inline-block; width: 100px; height: 40px; background: #FF8A35; margin: 15px 0px 15px 25px; text-decoration: none; cursor: pointer; color: #fff; -webkit-transition: color .2s linear, background-color .2s linear; transition: color .2s linear, background-color .2s linear;
}
</style>
</head>
<script type="text/javascript">
	$(function() {
		// 		$("#insertBtn").click(function() {
		// 			$.ajax({
		// 				type : "post",
		// 				url : "${context_path}/doInsertTest",
		// 				data : $("#testform").serialize(),
		// 				success : function(json) {
		// 					alert(json);
		// 				},
		// 				error : function() {
		// 				}
		// 			});
		// 		});
	});
</script>
<body>
	<form id="testform">
		<input type="text" id="id" name="id"> <input type="text"
			id="name" name="name"> <input type="button" id="insertBtn"
			value="测试DB">
	</form>
	<div>
		<ul>
			<c:forEach items="${testlist}" var="test">
				<li id="${test.id}">${test.name}</li>
			</c:forEach>
		</ul>
	</div>

	<div class="mask"></div>
	<div class="popbox">
		<div class="popbox-head">新增网址</div>
		<div class="popbox-body">
			<p>
				<label>网址</label><input type="text" id="url"
					placeholder="例:www.52url.com" />
			</p>
			<p>
				<label>名称</label><input type="text" id="bookmarkname"
					placeholder="例:网址收藏" />
			</p>
			<p>
				<label>标签</label><input type="text" id="tags"
					placeholder="例:生活,美食(以逗号,分隔)" />
			</p>
			<p>
				<label>描述</label>
				<textarea id="desc"></textarea>
			</p>
			<p>
				<span class="btn"> <a>确定</a><a>取消</a>
				</span>
			</p>
		</div>
	</div>
</body>


</html>