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
<link href="${context_path}/css/common.css" rel="stylesheet"
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
	<jsp:include page="/include/head.jsp" />
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
			<div class="func-navs-bar">
				<div class="func-navs">
					<div class="nav-item selected">书签</div>
					<div class="nav-item">专题</div>
					<div class="nav-item">喜爱</div>
					<div class="nav-item">关注</div>
					<div class="nav-item">粉丝</div>
				</div>
			</div>
			<div class="module-item bookmark-item">
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
			<!-- 专题 -->
			<div class="module-item display-none">
				<!-- 网址主体 -->
					<div class="subject-item">
						<div class="subject-box ui-sortable">
							<div class="block" id="c_21">
								<div class="block-head">
									<div class="img">
										<img src="/webcollection/img/demoimg.jpg" />
									</div>
									<div class="bg"></div>
									<div class="mt">这是这个专题的标题这是这个专题的标题这是这个专题的标题</div>
								</div>
								<div class="block-body">
									<ul class="url-list ui-sortable">
									<li id="h_3" value="3" title="123" class="filter-item" style=""><a href="http://nj.58.com/yizizhuanyi/0/?ispic=1&amp;selpic=2&amp;PGTID=180391126189489863003811786&amp;ClickID=1" target="_blank" style="">123</a><div class="operatebtn"></div></li><li id="h_4" value="4" title="123123123123123123123123123123123" class="filter-item" style=""><a href="http://nj.58.com/yizizhuanyi/0/?ispic=1&amp;selpic=2&amp;PGTID=180391126189489863003811786&amp;ClickID=1" target="_blank" style="">123123123123123123123123123123123</a><div class="operatebtn"><span title="从常用网址取消" class="staricon light"></span></div></li></ul>
									<div class="add-url">
										<span class="addicon" title="添加网址"></span>
									</div>
								</div>
							</div>
							<div class="block" id="c_21">
								<div class="block-head">
									<div class="img">
										<img src="/webcollection/img/demoimg.jpg" />
									</div>
									<div class="bg"></div>
									<div class="mt">这是这个专题的标题这是这个专题的标题这是这个专题的标题</div>
								</div>
								<div class="block-body">
									<ul class="url-list ui-sortable">
									<li id="h_3" value="3" title="123" class="filter-item" style=""><a href="http://nj.58.com/yizizhuanyi/0/?ispic=1&amp;selpic=2&amp;PGTID=180391126189489863003811786&amp;ClickID=1" target="_blank" style="">123</a><div class="operatebtn"></div></li><li id="h_4" value="4" title="123123123123123123123123123123123" class="filter-item" style=""><a href="http://nj.58.com/yizizhuanyi/0/?ispic=1&amp;selpic=2&amp;PGTID=180391126189489863003811786&amp;ClickID=1" target="_blank" style="">123123123123123123123123123123123</a><div class="operatebtn"><span title="从常用网址取消" class="staricon light"></span></div></li></ul>
									<div class="add-url">
										<span class="addicon" title="添加网址"></span>
									</div>
								</div>
							</div>
							<div class="block" id="c_21">
								<div class="block-head">
									<div class="img">
										<img src="/webcollection/img/demoimg.jpg" />
									</div>
									<div class="bg"></div>
									<div class="mt">这是这个专题的标题这是这个专题的标题这是这个专题的标题</div>
								</div>
								<div class="block-body">
									<ul class="url-list ui-sortable">
									<li id="h_3" value="3" title="123" class="filter-item" style=""><a href="http://nj.58.com/yizizhuanyi/0/?ispic=1&amp;selpic=2&amp;PGTID=180391126189489863003811786&amp;ClickID=1" target="_blank" style="">123</a><div class="operatebtn"></div></li><li id="h_4" value="4" title="123123123123123123123123123123123" class="filter-item" style=""><a href="http://nj.58.com/yizizhuanyi/0/?ispic=1&amp;selpic=2&amp;PGTID=180391126189489863003811786&amp;ClickID=1" target="_blank" style="">123123123123123123123123123123123</a><div class="operatebtn"><span title="从常用网址取消" class="staricon light"></span></div></li></ul>
									<div class="add-url">
										<span class="addicon" title="添加网址"></span>
									</div>
								</div>
							</div>
							<div class="block" id="c_21">
								<div class="block-head">
									<div class="img">
										<img src="/webcollection/img/demoimg.jpg" />
									</div>
									<div class="bg"></div>
									<div class="mt">这是这个专题的标题这是这个专题的标题这是这个专题的标题</div>
								</div>
								<div class="block-body">
									<ul class="url-list ui-sortable">
									<li id="h_3" value="3" title="123" class="filter-item" style=""><a href="http://nj.58.com/yizizhuanyi/0/?ispic=1&amp;selpic=2&amp;PGTID=180391126189489863003811786&amp;ClickID=1" target="_blank" style="">123</a><div class="operatebtn"></div></li><li id="h_4" value="4" title="123123123123123123123123123123123" class="filter-item" style=""><a href="http://nj.58.com/yizizhuanyi/0/?ispic=1&amp;selpic=2&amp;PGTID=180391126189489863003811786&amp;ClickID=1" target="_blank" style="">123123123123123123123123123123123</a><div class="operatebtn"><span title="从常用网址取消" class="staricon light"></span></div></li></ul>
									<div class="add-url">
										<span class="addicon" title="添加网址"></span>
									</div>
								</div>
							</div>
						</div>
						<div class="subject-box ui-sortable">
							<div class="block" id="c_21">
								<div class="block-head">
									<div class="img">
										<img src="/webcollection/img/demoimg.jpg" />
									</div>
									<div class="bg"></div>
									<div class="mt">这是这个专题的标题这是这个专题的标题这是这个专题的标题</div>
								</div>
								<div class="block-body">
									<ul class="url-list ui-sortable">
									<li id="h_3" value="3" title="123" class="filter-item" style=""><a href="http://nj.58.com/yizizhuanyi/0/?ispic=1&amp;selpic=2&amp;PGTID=180391126189489863003811786&amp;ClickID=1" target="_blank" style="">123</a><div class="operatebtn"></div></li><li id="h_4" value="4" title="123123123123123123123123123123123" class="filter-item" style=""><a href="http://nj.58.com/yizizhuanyi/0/?ispic=1&amp;selpic=2&amp;PGTID=180391126189489863003811786&amp;ClickID=1" target="_blank" style="">123123123123123123123123123123123</a><div class="operatebtn"><span title="从常用网址取消" class="staricon light"></span></div></li></ul>
									<div class="add-url">
										<span class="addicon" title="添加网址"></span>
									</div>
								</div>
							</div>
							<div class="block" id="c_21">
								<div class="block-head">
									<div class="img">
										<img src="/webcollection/img/demoimg.jpg" />
									</div>
									<div class="bg"></div>
									<div class="mt">这是这个专题的标题这是这个专题的标题这是这个专题的标题</div>
								</div>
								<div class="block-body">
									<ul class="url-list ui-sortable">
									<li id="h_3" value="3" title="123" class="filter-item" style=""><a href="http://nj.58.com/yizizhuanyi/0/?ispic=1&amp;selpic=2&amp;PGTID=180391126189489863003811786&amp;ClickID=1" target="_blank" style="">123</a><div class="operatebtn"></div></li><li id="h_4" value="4" title="123123123123123123123123123123123" class="filter-item" style=""><a href="http://nj.58.com/yizizhuanyi/0/?ispic=1&amp;selpic=2&amp;PGTID=180391126189489863003811786&amp;ClickID=1" target="_blank" style="">123123123123123123123123123123123</a><div class="operatebtn"><span title="从常用网址取消" class="staricon light"></span></div></li></ul>
									<div class="add-url">
										<span class="addicon" title="添加网址"></span>
									</div>
								</div>
							</div>
							<div class="block" id="c_21">
								<div class="block-head">
									<div class="img">
										<img src="/webcollection/img/demoimg.jpg" />
									</div>
									<div class="bg"></div>
									<div class="mt">这是这个专题的标题这是这个专题的标题这是这个专题的标题</div>
								</div>
								<div class="block-body">
									<ul class="url-list ui-sortable">
									<li id="h_3" value="3" title="123" class="filter-item" style=""><a href="http://nj.58.com/yizizhuanyi/0/?ispic=1&amp;selpic=2&amp;PGTID=180391126189489863003811786&amp;ClickID=1" target="_blank" style="">123</a><div class="operatebtn"></div></li><li id="h_4" value="4" title="123123123123123123123123123123123" class="filter-item" style=""><a href="http://nj.58.com/yizizhuanyi/0/?ispic=1&amp;selpic=2&amp;PGTID=180391126189489863003811786&amp;ClickID=1" target="_blank" style="">123123123123123123123123123123123</a><div class="operatebtn"><span title="从常用网址取消" class="staricon light"></span></div></li></ul>
									<div class="add-url">
										<span class="addicon" title="添加网址"></span>
									</div>
								</div>
							</div>
							<div class="block" id="c_21">
								<div class="block-head">
									<div class="img">
										<img src="/webcollection/img/demoimg.jpg" />
									</div>
									<div class="bg"></div>
									<div class="mt">这是这个专题的标题这是这个专题的标题这是这个专题的标题</div>
								</div>
								<div class="block-body">
									<ul class="url-list ui-sortable">
									<li id="h_3" value="3" title="123" class="filter-item" style=""><a href="http://nj.58.com/yizizhuanyi/0/?ispic=1&amp;selpic=2&amp;PGTID=180391126189489863003811786&amp;ClickID=1" target="_blank" style="">123</a><div class="operatebtn"></div></li><li id="h_4" value="4" title="123123123123123123123123123123123" class="filter-item" style=""><a href="http://nj.58.com/yizizhuanyi/0/?ispic=1&amp;selpic=2&amp;PGTID=180391126189489863003811786&amp;ClickID=1" target="_blank" style="">123123123123123123123123123123123</a><div class="operatebtn"><span title="从常用网址取消" class="staricon light"></span></div></li></ul>
									<div class="add-url">
										<span class="addicon" title="添加网址"></span>
									</div>
								</div>
							</div>
						</div>
						<div class="subject-box ui-sortable">
							<div class="block" id="c_21">
								<div class="block-head">
									<div class="img">
										<img src="/webcollection/img/demoimg.jpg" />
									</div>
									<div class="bg"></div>
									<div class="mt">这是这个专题的标题这是这个专题的标题这是这个专题的标题</div>
								</div>
								<div class="block-body">
									<ul class="url-list ui-sortable">
									<li id="h_3" value="3" title="123" class="filter-item" style=""><a href="http://nj.58.com/yizizhuanyi/0/?ispic=1&amp;selpic=2&amp;PGTID=180391126189489863003811786&amp;ClickID=1" target="_blank" style="">123</a><div class="operatebtn"></div></li><li id="h_4" value="4" title="123123123123123123123123123123123" class="filter-item" style=""><a href="http://nj.58.com/yizizhuanyi/0/?ispic=1&amp;selpic=2&amp;PGTID=180391126189489863003811786&amp;ClickID=1" target="_blank" style="">123123123123123123123123123123123</a><div class="operatebtn"><span title="从常用网址取消" class="staricon light"></span></div></li></ul>
									<div class="add-url">
										<span class="addicon" title="添加网址"></span>
									</div>
								</div>
							</div>
							<div class="block" id="c_21">
								<div class="block-head">
									<div class="img">
										<img src="/webcollection/img/demoimg.jpg" />
									</div>
									<div class="bg"></div>
									<div class="mt">这是这个专题的标题这是这个专题的标题这是这个专题的标题</div>
								</div>
								<div class="block-body">
									<ul class="url-list ui-sortable">
									<li id="h_3" value="3" title="123" class="filter-item" style=""><a href="http://nj.58.com/yizizhuanyi/0/?ispic=1&amp;selpic=2&amp;PGTID=180391126189489863003811786&amp;ClickID=1" target="_blank" style="">123</a><div class="operatebtn"></div></li><li id="h_4" value="4" title="123123123123123123123123123123123" class="filter-item" style=""><a href="http://nj.58.com/yizizhuanyi/0/?ispic=1&amp;selpic=2&amp;PGTID=180391126189489863003811786&amp;ClickID=1" target="_blank" style="">123123123123123123123123123123123</a><div class="operatebtn"><span title="从常用网址取消" class="staricon light"></span></div></li></ul>
									<div class="add-url">
										<span class="addicon" title="添加网址"></span>
									</div>
								</div>
							</div>
							<div class="block" id="c_21">
								<div class="block-head">
									<div class="img">
										<img src="/webcollection/img/demoimg.jpg" />
									</div>
									<div class="bg"></div>
									<div class="mt">这是这个专题的标题这是这个专题的标题这是这个专题的标题</div>
								</div>
								<div class="block-body">
									<ul class="url-list ui-sortable">
									<li id="h_3" value="3" title="123" class="filter-item" style=""><a href="http://nj.58.com/yizizhuanyi/0/?ispic=1&amp;selpic=2&amp;PGTID=180391126189489863003811786&amp;ClickID=1" target="_blank" style="">123</a><div class="operatebtn"></div></li><li id="h_4" value="4" title="123123123123123123123123123123123" class="filter-item" style=""><a href="http://nj.58.com/yizizhuanyi/0/?ispic=1&amp;selpic=2&amp;PGTID=180391126189489863003811786&amp;ClickID=1" target="_blank" style="">123123123123123123123123123123123</a><div class="operatebtn"><span title="从常用网址取消" class="staricon light"></span></div></li></ul>
									<div class="add-url">
										<span class="addicon" title="添加网址"></span>
									</div>
								</div>
							</div>
							<div class="block" id="c_21">
								<div class="block-head">
									<div class="img">
										<img src="/webcollection/img/demoimg.jpg" />
									</div>
									<div class="bg"></div>
									<div class="mt">这是这个专题的标题这是这个专题的标题这是这个专题的标题</div>
								</div>
								<div class="block-body">
									<ul class="url-list ui-sortable">
									<li id="h_3" value="3" title="123" class="filter-item" style=""><a href="http://nj.58.com/yizizhuanyi/0/?ispic=1&amp;selpic=2&amp;PGTID=180391126189489863003811786&amp;ClickID=1" target="_blank" style="">123</a><div class="operatebtn"></div></li><li id="h_4" value="4" title="123123123123123123123123123123123" class="filter-item" style=""><a href="http://nj.58.com/yizizhuanyi/0/?ispic=1&amp;selpic=2&amp;PGTID=180391126189489863003811786&amp;ClickID=1" target="_blank" style="">123123123123123123123123123123123</a><div class="operatebtn"><span title="从常用网址取消" class="staricon light"></span></div></li></ul>
									<div class="add-url">
										<span class="addicon" title="添加网址"></span>
									</div>
								</div>
							</div>
						</div>
					</div>
			</div>
			<!-- 关注 -->
			<div class="module-item display-none">
				<div class="fans-item">
					<ul class="list-fans">
						<li class="fans">
							<div class="box">
								<p class="headimg"><a><img src="${context_path}/img/demoimg.jpg" /></a></p>
								<p class="username"><a class="txtellipsis">这是网名这是网名这是网名这是网名</a></p>
								<p class="infos short">
									<span class="">100书签</span>
									<span class="">100专题</span>
									<span class="">50关注</span>
									<span class="">100粉丝</span>
								</p>
								<p class="btn"><a>关注</a></p>
							</div>
						</li>
						<li class="fans">
							<div class="box">
								<p class="headimg"><a><img src="${context_path}/img/demoimg.jpg" /></a></p>
								<p class="username"><a class="txtellipsis">这是网名这是网名这是网名这是网名</a></p>
								<p class="infos short">
									<span class="">100书签</span>
									<span class="">100专题</span>
									<span class="">50关注</span>
									<span class="">100粉丝</span>
								</p>
								<p class="btn"><a>关注</a></p>
							</div>
						</li>
						<li class="fans">
							<div class="box">
								<p class="headimg"><a><img src="${context_path}/img/demoimg.jpg" /></a></p>
								<p class="username"><a class="txtellipsis">这是网名这是网名这是网名这是网名</a></p>
								<p class="infos short">
									<span class="">100书签</span>
									<span class="">100专题</span>
									<span class="">50关注</span>
									<span class="">100粉丝</span>
								</p>
								<p class="btn"><a>关注</a></p>
							</div>
						</li>
						<li class="fans">
							<div class="box">
								<p class="headimg"><a><img src="${context_path}/img/demoimg.jpg" /></a></p>
								<p class="username"><a class="txtellipsis">这是网名这是网名这是网名这是网名</a></p>
								<p class="infos short">
									<span class="">100书签</span>
									<span class="">100专题</span>
									<span class="">50关注</span>
									<span class="">100粉丝</span>
								</p>
								<p class="btn"><a>关注</a></p>
							</div>
						</li>
						<li class="fans">
							<div class="box">
								<p class="headimg"><a><img src="${context_path}/img/demoimg.jpg" /></a></p>
								<p class="username"><a class="txtellipsis">这是网名这是网名这是网名这是网名</a></p>
								<p class="infos short">
									<span class="">100书签</span>
									<span class="">100专题</span>
									<span class="">50关注</span>
									<span class="">100粉丝</span>
								</p>
								<p class="btn"><a>关注</a></p>
							</div>
						</li>
						<li class="fans">
							<div class="box">
								<p class="headimg"><a><img src="${context_path}/img/demoimg.jpg" /></a></p>
								<p class="username"><a class="txtellipsis">这是网名这是网名这是网名这是网名</a></p>
								<p class="infos short">
									<span class="">100书签</span>
									<span class="">100专题</span>
									<span class="">50关注</span>
									<span class="">100粉丝</span>
								</p>
								<p class="btn"><a>关注</a></p>
							</div>
						</li>
						<li class="fans">
							<div class="box">
								<p class="headimg"><a><img src="${context_path}/img/demoimg.jpg" /></a></p>
								<p class="username"><a class="txtellipsis">这是网名这是网名这是网名这是网名</a></p>
								<p class="infos short">
									<span class="">100书签</span>
									<span class="">100专题</span>
									<span class="">50关注</span>
									<span class="">100粉丝</span>
								</p>
								<p class="btn"><a>关注</a></p>
							</div>
						</li>
					</ul>
				</div>
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