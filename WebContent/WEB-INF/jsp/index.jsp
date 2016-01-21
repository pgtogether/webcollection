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
<link href="${context_path}/css/operate.css" rel="stylesheet"
	type="text/css" />
<script src="${context_path}/js/plugin/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
	var CONTEXT_PATH = '${context_path}';
</script>
</head>
<body>
	<div class="header">
		<div class="header-in">
			<div class="head-logo">
				<a href="${context_path}/"><img src="${context_path}/img/logo.png" /></a>
			</div>
			<div class="head-fun-nav">
				<ul>
					<li>个性设置</li>
					<li>网址插件</li>
					<li>淘淘看</li>
					<li>我的主页</li>
					<li>首页</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="content">
		<div class="content-left">
			<div class="content-left-top">
				<div class="content-left-top-title head-style">
					<span>常用网址</span>
				</div>
				<div class="content-left-top-body">
					<ul class="hot-url-list">
					<c:if test="${not empty hotBookmarkList}">
						<c:forEach items="${hotBookmarkList}" var="bookmark">
							<li value="${bookmark.i}" title="${bookmark.n}"><a href="${bookmark.u}" target="_blank">${bookmark.n}</a></li>
						</c:forEach>
					</c:if>
					</ul>
				</div>
			</div>
			<div class="adv-show">占位</div>
			<div class="category-tabs">
				<c:choose>
					<c:when test="${not empty parentCategoryList}">
						<c:forEach items="${parentCategoryList}" var="pc" varStatus="index">
							<c:if test="${index.first}">
								<input type="hidden" id="parentcategoryno" name="parentcategoryno" value="${pc.categoryno}" />
								<span id="pc_${pc.categoryno}" class="tab-item first selected">${pc.categoryname}</span>
							</c:if>	
							<c:if test="${!index.first}">
								<span id="pc_${pc.categoryno}" class="tab-item">${pc.categoryname}</span>
							</c:if>
						</c:forEach>
					</c:when>
				</c:choose>
				<span class="tab-func">
					<a class="btn menu"></a>
					<a class="btn add" title="新增大分类"></a>
					<a class="btn upd" title="修改大分类"></a>
					<a class="btn del" title="删除大分类"></a>
				</span>
			</div>
			<!-- 网址主体 -->
			<div class="content-left-body">
				<c:choose>
					<c:when test="${not empty parentCategoryList}">
						<c:forEach items="${parentCategoryList}" var="parentcategoryname" varStatus="index">
							<c:if test="${index.first}">
								<div class="content-item">
							</c:if>	
							<c:if test="${!index.first}">
								<div class="content-item display-none">
							</c:if>
								<div class="wrap-box" value="0">
									<div class="block block-disabled add-block">
										<span class="add-block-btn categorybtn" title="添加分类">+</span>
									</div>
								</div>
								<div class="wrap-box" value="1"></div>
								<div class="wrap-box" value="2"></div>
								<div class="wrap-box" value="3"></div>
							</div>
						</c:forEach>
					</c:when>
				</c:choose>
			</div>
		</div>
		<div class="content-right">
			<div class="newbtnsbox">
				<div class="newbtns floatLeft">
					<span class="newbtn categorybtn">添加分类</span> 
					<span class="count categorycount"><label>${categoryCnt}</label></span>
					<span class="desc">分类个数</span>
				</div>
				<div class="newbtns floatRight">
					<span class="newbtn bookmarkbtn">添加网址</span> 
					<span class="count bookmarkcount"><label>${bookmarkCnt}</label></span>
					<span class="desc">网址个数</span>
				</div>
			</div>
			<!-- 快速查询 -->
			<jsp:include page="module/fastsearchmodule.jsp" />
			<!-- 标签 -->
			<jsp:include page="module/tagmodule.jsp" />
			<div class="block">
				<div class="block-head head-style">
					<div class="block-head-title">最热门网址</div>
					<div class="block-head-func"></div>
				</div>
				<div class="block-body">
					<ul class="">
						<li><a href="###">中文网址测试</a>
							<div class="operatebtn"></div></li>
						<li><a href="###">中文网址测试</a>
							<div class="operatebtn"></div></li>
						<li><a href="###">中文网址测试</a>
							<div class="operatebtn"></div></li>
						<li><a href="###">中文网址测试</a>
							<div class="operatebtn"></div></li>
						<li><a href="###">中文网址测试</a>
							<div class="operatebtn"></div></li>
						<li><a href="###">中文网址测试</a>
							<div class="operatebtn"></div></li>
						<li><a href="###">中文网址测试</a>
							<div class="operatebtn"></div></li>
						<li><a href="###">中文网址测试</a>
							<div class="operatebtn"></div></li>
						<li><a href="###">中文网址测试</a>
							<div class="operatebtn"></div></li>
					</ul>
				</div>
			</div>
			<div class="block">
				<div class="block-head head-style">
					<div class="block-head-title">网友推荐网址</div>
					<div class="block-head-func"></div>
				</div>
				<div class="block-body">
					<ul class="">
						<li><a href="###">中文网址测试</a>
							<div class="operatebtn"></div></li>
						<li><a href="###">中文网址测试</a>
							<div class="operatebtn"></div></li>
						<li><a href="###">测试分支</a>
							<div class="operatebtn"></div></li>
					</ul>
				</div>
			</div>
			<div class="users">
				<div class="users-head head-style">
					<div class="users-head-title">活跃用户</div>
				</div>
				<div class="users-body">
					<ul>
						<li><span>张三</span></li>
						<li><span>李四</span></li>
						<li><span>张三</span></li>
						<li><span>李四</span></li>
						<li><span>张三sa</span></li>
						<li><span>扫风</span></li>
						<li><span>见见我的药</span></li>
						<li><span>张三</span></li>
						<li><span>李四</span></li>
						<li><span>张三sa</span></li>
						<li><span>小a米</span></li>
						<li><span>张三</span></li>
						<li><span>李d四</span></li>
						<li><span>张三sa</span></li>
						<li><span>好早上的就</span></li>
						<li><span>小米</span></li>
					</ul>
				</div>
			</div>
			<div class="modules">
				<span class="addmodules" title="添加模块">+</span>
			</div>
		</div>
	</div>
	<div class="footer">
		<div class="footer-in"></div>
	</div>
	<div class="sideBanner ie">
		<div class="fun1">
			<span>意见反馈</span>
		</div>
		<div class="fun2">
			<span>资金赞助</span>
		</div>
		<div class="trashcan">
			<span>回收小站</span>
		</div>
		<div class="scrolltop" style="display: none;">
			<span>回到顶部</span>
		</div>
	</div>
	<jsp:include page="pop.jsp" />
	<!-- 未来会把各种模板放到这里 -->
	<jsp:include page="templates.jsp" />
	<jsp:include page="/js/dynamic/plugin.js.jsp"></jsp:include>
	<jsp:include page="/js/dynamic/index.js.jsp"></jsp:include>
	<jsp:include page="/js/dynamic/common.js.jsp"></jsp:include>
</body>
</html>