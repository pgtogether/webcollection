<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/constants.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${context_path}/css/base.css" rel="stylesheet"
	type="text/css" />
<link href="${context_path}/css/index.css" rel="stylesheet"
	type="text/css" />
<link href="${context_path}/css/operate.css" rel="stylesheet"
	type="text/css" />
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="${context_path}/js/plugin/jquery.ui.sortable-animation.js"></script>
</head>
<script>
	$(function() {
		// 随机背景颜色
		$(".head-style").each(function() {
			var rand = parseInt(Math.random() * 20, 10) + 1;
			$(this).addClass("randomcolor-" + rand);
		});

		// 开启sortable功能
		openSortableFunc.initSortable();
		
		boxHeadOperateFunc.init();

		$(".hot-url-list li,.url-list li").hover(function() {
			var $this = $(this);
			var color = $this.parent().parent().siblings(".head-style").css("background-color");
			$this.css("background-color", color).siblings().attr("style", "");
			appendUrlOperateBtn($this);
		}, function() {
			var $this = $(this);
			$this.attr("style", "");
			removeUrlOperateBtn($this);
		});
		
		$(".operatebtn").on("click", ".staricon", function() {
			if ($(this).hasClass("light")) {
				$(this).removeClass("light").attr("title", "标记为常用书签");
			} else {
				$(this).addClass("light").attr("title", "从常用书签取消");
			}
			// 此处应该有上升为常用书签的操作
			// 还需要Ajax 反映到数据库中
			// TODO
		});
	});
	
	function appendUrlOperateBtn($li) {
		var operateHtml = '';
		if ($li.find(".light").length == 0) {
			operateHtml += '<span title="标记为常用书签" class="staricon"></span>';
		}
		operateHtml += '<span title="编辑书签" class="editicon"></span>';
		operateHtml += '<span title="删除书签" class="delicon"></span>';
		$li.find(".operatebtn").append(operateHtml);
	}

	function removeUrlOperateBtn($li) {
		$li.find(".operatebtn > span").not(".light").remove();
	}
	
	// 排序功能
	var openSortableFunc = {
		initSortable : function(){
			this.hotUrlSortable();
			this.boxSortable();
			this.urlSortable();
		},
		hotUrlSortable : function() {
			$(".hot-url-list").sortable({
				placeholder : "hot-url-list-placeholder",
				dropOnEmpty : true,
				tolerance : "pointer",
				distance : 5
			}).disableSelection();
		},
		boxSortable : function() {
			$(".wrap-box").sortable({
				connectWith : ".wrap-box",
				handle : ".block-head",
				distance : 5,
				dropOnEmpty : true,
				opacity : 1,
				placeholder : "block-placeholder",
				tolerance : "pointer",
				delay : 100,
				zIndex : 100
			}).disableSelection();
		},
		urlSortable : function() {
			$(".url-list").sortable({
				connectWith : ".url-list",
				dropOnEmpty : true,
				tolerance : "pointer",
				distance : 5,
				placeholder : "url-list-placeholder"
			}).disableSelection();
		}
	};
	
	// 操作分类标题的功能
	var boxHeadOperateFunc = {
		// 初始化事件
		init : function(){
			this.hoverTitle();
			this.modifyTitle();
			this.confirmModify();
			this.cancelModify();
		},
		// 鼠标经过标题时候
		hoverTitle : function(){
			var selfFunc = this;
			$(".wrap-box").on("mouseenter mouseleave",".block-head", function(event){
				 if( event.type == "mouseenter"){ 
					 selfFunc.appendBoxHeadOperateBtn($(this));
				 }
				 else if(event.type == "mouseleave" ){
					 selfFunc.removeBoxHeadOperateBtn($(this));
				 }
			});
		},
		// 防止多次双击
		avoidNextDblClick : false,
		// 修改分类标题
		modifyTitle : function(){
			// 双击修改分类标题
			var selfFunc = this;
			$(".wrap-box").on("dblclick",".block-head", function(){
				if (!selfFunc.avoidNextDblClick) {
					selfFunc.avoidNextDblClick = true;
					var $title = $(this).find(".block-head-title");
					var titleText = $title.text();
					var inputHtml = '<input class="updatetitle" type="text" style="background-color:'+$title.css("background-color")+'">';
					$title.html(inputHtml).parent().addClass("modify");
					$title.find("input").focus().val(titleText);
					selfFunc.appendBoxTitleUpdateBtn($title);
				}
			});
		},
		// 确定修改
		confirmModify : function(){
			var selfFunc = this;
			$(".wrap-box").on("click",".confirmicon",function(){
				var $head = $(this).parent().siblings();
				$head.html($head.children().val());
				$(this).parent().html("").parent(".block-head").removeClass("modify");
				selfFunc.avoidNextDblClick = false;
			});
		},
		// 取消修改
		cancelModify : function(){
			var selfFunc = this;
			$(".wrap-box").on("click",".cancelicon",function(){
				var $head = $(this).parent().siblings();
				$head.html($head.children().val());
				$(this).parent().html("").parent(".block-head").removeClass("modify");
				selfFunc.avoidNextDblClick = false;
			});
		},
		// 插入标题操作按钮
		appendBoxTitleUpdateBtn : function($target){
			var operateHtml = '';
			operateHtml += '<span title="确定" class="confirmicon"></span>';
			operateHtml += '<span title="取消" class="cancelicon"></span>';
			$target.next().html(operateHtml);
		},
		// 删除标题操作按钮
		removeBoxTitleUpdateBtn : function($target){
			$target.next().html("");
		},
		// 插入删除分类，新增书签按钮
		appendBoxHeadOperateBtn : function($target){
			if (!$target.hasClass("modify")) {
				var operateHtml = '';
				operateHtml += '<span title="新增书签" class="addicon"></span>';
				operateHtml += '<span title="删除分类" class="closeicon"></span>';
				$target.find(".block-head-func").append(operateHtml);
			}
		},
		// 移除删除分类，新增书签按钮
		removeBoxHeadOperateBtn : function($target){
			if (!$target.hasClass("modify")) {
				$target.find(".block-head-func").html("");
			}
		}
	};
</script>
<body>
	<div class="header">
		<div class="header-in">
			<div class="head-logo">
				<a href="${context_path}/">WEB-BASKET</a>
			</div>
			<div class="head-fun-nav">
				<ul>
					<li>设置</li>
					<li>插件</li>
					<li>我的空间</li>
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
						<li><a href="###">中文网址测试</a></li>
						<li><a href="###">6666666</a></li>
						<li><a href="###">7777777</a></li>
						<li><a href="###">中文网址测试</a></li>
						<li><a href="###">6666666</a></li>
						<li><a href="###">7777777</a></li>
						<li><a href="###">中文网址测试</a></li>
					</ul>
				</div>
			</div>
			<div class="adv-show">广告位招租</div>
			<div class="content-left-body">
				<div class="wrap-box">
					<div class="block">
						<div class="block-head head-style">
							<div class="block-head-title">开发用网址1</div>
							<div class="block-head-func">
							</div>
						</div>
						<div class="block-body">
							<ul class="url-list">
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
							<div class="block-head-title">开发用网址2</div>
							<div class="block-head-func"></div>
						</div>
						<div class="block-body">
							<ul class="url-list">
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
							<div class="block-head-title">开发用网址3</div>
							<div class="block-head-func"></div>
						</div>
						<div class="block-body">
							<ul class="url-list">
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
							<div class="block-head-title">开发用网址1</div>
							<div class="block-head-func"></div>
							
						</div>
						<div class="block-body">
							<ul class="url-list">
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
							<div class="block-head-title">开发用网址2</div>
							<div class="block-head-func"></div>
							
						</div>
						<div class="block-body">
							<ul class="url-list">
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
							<div class="block-head-title">开发用网址3</div>
							<div class="block-head-func"></div>
							
						</div>
						<div class="block-body">
							<ul class="url-list">
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
							<div class="block-head-title">开发用网址1</div>
							<div class="block-head-func"></div>
							
						</div>
						<div class="block-body">
							<ul class="url-list">
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
							<div class="block-head-title">开发用网址2</div>
							<div class="block-head-func"></div>
							
						</div>
						<div class="block-body">
							<ul class="url-list">
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
							<div class="block-head-title">开发用网址3</div>
							<div class="block-head-func"></div>
							
						</div>
						<div class="block-body">
							<ul class="url-list">
								<li><a href="###">中文网址测试</a>
									<div class="operatebtn"></div></li>
								<li><a href="###">中文网址测试</a>
									<div class="operatebtn"></div></li>
								<li><a href="###">中文网址测试</a>
									<div class="operatebtn"></div></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="wrap-box">
					<div class="block">
						<div class="block-head head-style">
							<div class="block-head-title">开发用网址1</div>
							<div class="block-head-func"></div>
							
						</div>
						<div class="block-body">
							<ul class="url-list">
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
							<div class="block-head-title">开发用网址1</div>
							<div class="block-head-func"></div>
							
						</div>
						<div class="block-body">
							<ul class="url-list">
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
							<div class="block-head-title">开发用网址1</div>
							<div class="block-head-func"></div>
							
						</div>
						<div class="block-body">
							<ul class="url-list">
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
							<div class="block-head-title">开发用网址2</div>
							<div class="block-head-func"></div>
							
						</div>
						<div class="block-body">
							<ul class="url-list">
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
							<div class="block-head-title">开发用网址1</div>
							<div class="block-head-func"></div>
							
						</div>
						<div class="block-body">
							<ul class="url-list">
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
							<div class="block-head-title">开发用网址1</div>
							<div class="block-head-func"></div>
							
						</div>
						<div class="block-body">
							<ul class="url-list">
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
							<div class="block-head-title">开发用网址3</div>
							<div class="block-head-func"></div>
							
						</div>
						<div class="block-body">
							<ul class="url-list">
								<li><a href="###">中文网址测试</a>
									<div class="operatebtn"></div></li>
								<li><a href="###">中文网址测试</a>
									<div class="operatebtn"></div></li>
								<li><a href="###">中文网址测试</a>
									<div class="operatebtn"></div></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="wrap-box">
					<div class="block">
						<div class="block-head head-style">
							<div class="block-head-title">开发用网址1</div>
							<div class="block-head-func"></div>
							
						</div>
						<div class="block-body">
							<ul class="url-list">
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
							<div class="block-head-title">开发用网址2</div>
							<div class="block-head-func"></div>
							
						</div>
						<div class="block-body">
							<ul class="url-list">
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
							<div class="block-head-title">开发用网址1</div>
							<div class="block-head-func"></div>
							
						</div>
						<div class="block-body">
							<ul class="url-list">
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
							<div class="block-head-title">开发用网址2</div>
							<div class="block-head-func"></div>
							
						</div>
						<div class="block-body">
							<ul class="url-list">
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
							<div class="block-head-title">开发用网址3</div>
							<div class="block-head-func"></div>
							
						</div>
						<div class="block-body">
							<ul class="url-list">
								<li><a href="###">中文网址测试</a>
									<div class="operatebtn"></div></li>
								<li><a href="###">中文网址测试</a>
									<div class="operatebtn"></div></li>
								<li><a href="###">中文网址测试</a>
									<div class="operatebtn"></div></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="wrap-box">
					<div class="block">
						<div class="block-head head-style">
							<div class="block-head-title">开发用网址1</div>
							<div class="block-head-func"></div>
							
						</div>
						<div class="block-body">
							<ul class="url-list">
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
							<div class="block-head-title">开发用网址2</div>
							<div class="block-head-func"></div>
							<div>1</div>
						</div>
						<div class="block-body">
							<ul class="url-list">
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
							<div class="block-head-title">开发用网址3</div>
							<div class="block-head-func"></div>
							
						</div>
						<div class="block-body">
							<ul class="url-list">
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
							<div class="block-head-title">开发用网址1</div>
							<div class="block-head-func"></div>
							
						</div>
						<div class="block-body">
							<ul class="url-list">
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
							<div class="block-head-title">开发用网址2</div>
							<div class="block-head-func"></div>
							<div>1</div>
						</div>
						<div class="block-body">
							<ul class="url-list">
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
							<div class="block-head-title">开发用网址3</div>
							<div class="block-head-func"></div>
							
						</div>
						<div class="block-body">
							<ul class="url-list">
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
				</div>
			</div>
		</div>
		<div class="content-right">
			<div class=""></div>
		</div>
	</div>
	<div class="footer">
		<div class="footer-in"></div>
	</div>
</body>
</html>