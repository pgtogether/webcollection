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
<link href="${context_path}/css/style.css" rel="stylesheet"
	type="text/css" />
<link href="${context_path}/css/index.css" rel="stylesheet"
	type="text/css" />
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="${context_path}/js/plugin/jquery.ui.sortable-animation.js"></script>
</head>
<script>
	$(function() {
		$(".head-style").each(function(){
			var rand = parseInt(Math.random() * 20, 10) + 1;
			$(this).addClass("randomcolor-" + rand);
		});

		$(".hot-url-list").sortable({
			connectWith : ".url-list",
			placeholder : "hot-url-list-placeholder",
			dropOnEmpty : true,
			tolerance : "pointer",
			distance : 5
		}).disableSelection();;
		
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
		}).disableSelection();;

		$(".url-list").sortable({
			connectWith : ".url-list,.hot-url-list",
			dropOnEmpty : true,
			tolerance : "pointer",
			distance : 5,
			placeholder : "url-list-placeholder"
		}).disableSelection();;
		
		$(".hot-url-list li,.url-list li").hover(function(){
			var color = $(this).parent().parent().siblings(".head-style").css("background-color");
			$(this).css("background-color",color).siblings().attr("style","");
		},function(){
			$(this).attr("style","");
		});
	});
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
						<li><a href="###">6666666</a></li>
						<li><a href="###">7777777</a></li>
						<li><a href="###">中文网址测试</a></li>
						<li><a href="###">6666666</a></li>
						<li><a href="###">7777777</a></li>
						<li><a href="###">中文网址测试</a></li>
						<li><a href="###">6666666</a></li>
						<li><a href="###">7777777</a></li>
						<li><a href="###">中文网址测试</a></li>
						<li><a href="###">6666666</a></li>
						<li><a href="###">7777777</a></li>
						<li><a href="###">中文网址测试</a></li>
						<li><a href="###">6666666</a></li>
						<li><a href="###">7777777</a></li>
						<li><a href="###">中文网址测试</a></li>
						<li><a href="###">6666666</a></li>
						<li><a href="###">7777777</a></li>
						<li><a href="###">中文网址测试</a></li>
						<li><a href="###">6666666</a></li>
						<li><a href="###">7777777</a></li>
						<li><a href="###">中文网址测试</a></li>
						<li><a href="###">6666666</a></li>
						<li><a href="###">7777777</a></li>
						<li><a href="###">中文网址测试</a></li>
						<li><a href="###">6666666</a></li>
						<li><a href="###">7777777</a></li>
						<li><a href="###">中文网址测试</a></li>
						<li><a href="###">6666666</a></li>
						<li><a href="###">7777777</a></li>
					</ul>
				</div>
			</div>
			<div class="adv-show">
				广告位招租
			</div>
			<div class="content-left-body">
				<div class="wrap-box">
					<div class="block">
						<div class="block-head head-style">
							<div class="block-head-title">开发用网址1</div>
							<div class="block-head-func"></div>
							<div></div>
						</div>
						<div class="block-body">
							<ul class="url-list">
								<li><a href="###">中文网址测试</a></li>
								<li><a href="###">6666666</a></li>
								<li><a href="###">7777777</a></li>
							</ul>
						</div>
					</div>
					<div class="block">
						<div class="block-head head-style">
							<div class="block-head-title">开发用网址2</div>
							<div class="block-head-func"></div>
							<div></div>
						</div>
						<div class="block-body">
							<ul class="url-list">
								<li><a href="###">中文网址测试</a></li>
								<li><a href="###">2222222</a></li>
								<li><a href="###">3333333</a></li>
								<li><a href="###">4444444</a></li>
								<li><a href="###">中文网址测试</a></li>
								<li><a href="###">2222222</a></li>
								<li><a href="###">3333333</a></li>
								<li><a href="###">4444444</a></li>
								<li><a href="###">5555555</a></li>
								<li><a href="###">6666666</a></li>
								<li><a href="###">7777777</a></li>
							</ul>
						</div>
					</div>
					<div class="block">
						<div class="block-head head-style">
							<div class="block-head-title">开发用网址3</div>
							<div class="block-head-func"></div>
							<div></div>
						</div>
						<div class="block-body">
							<ul class="url-list">
								<li><a href="###">中文网址测试</a></li>
								<li><a href="###">6666666</a></li>
								<li><a href="###">7777777</a></li>
							</ul>
						</div>
					</div>
					<div class="block">
						<div class="block-head head-style">
							<div class="block-head-title">开发用网址1</div>
							<div class="block-head-func"></div>
							<div></div>
						</div>
						<div class="block-body">
							<ul class="url-list">
								<li><a href="###">中文网址测试</a></li>
								<li><a href="###">6666666</a></li>
								<li><a href="###">7777777</a></li>
							</ul>
						</div>
					</div>
					<div class="block">
						<div class="block-head head-style">
							<div class="block-head-title">开发用网址2</div>
							<div class="block-head-func"></div>
							<div></div>
						</div>
						<div class="block-body">
							<ul class="url-list">
								<li><a href="###">中文网址测试</a></li>
								<li><a href="###">2222222</a></li>
								<li><a href="###">7777777</a></li>
							</ul>
						</div>
					</div>
					<div class="block">
						<div class="block-head head-style">
							<div class="block-head-title">开发用网址3</div>
							<div class="block-head-func"></div>
							<div></div>
						</div>
						<div class="block-body">
							<ul class="url-list">
								<li><a href="###">中文网址测试</a></li>
								<li><a href="###">6666666</a></li>
								<li><a href="###">7777777</a></li>
							</ul>
						</div>
					</div>
					<div class="block">
						<div class="block-head head-style">
							<div class="block-head-title">开发用网址1</div>
							<div class="block-head-func"></div>
							<div></div>
						</div>
						<div class="block-body">
							<ul class="url-list">
								<li><a href="###">中文网址测试</a></li>
								<li><a href="###">6666666</a></li>
								<li><a href="###">7777777</a></li>
							</ul>
						</div>
					</div>
					<div class="block">
						<div class="block-head head-style">
							<div class="block-head-title">开发用网址2</div>
							<div class="block-head-func"></div>
							<div></div>
						</div>
						<div class="block-body">
							<ul class="url-list">
								<li><a href="###">中文网址测试</a></li>
								<li><a href="###">2222222</a></li>
								<li><a href="###">3333333</a></li>
								<li><a href="###">4444444</a></li>
								<li><a href="###">中文网址测试</a></li>
								<li><a href="###">2222222</a></li>
								<li><a href="###">3333333</a></li>
								<li><a href="###">4444444</a></li>
								<li><a href="###">5555555</a></li>
								<li><a href="###">6666666</a></li>
								<li><a href="###">7777777</a></li>
							</ul>
						</div>
					</div>
					<div class="block">
						<div class="block-head head-style">
							<div class="block-head-title">开发用网址3</div>
							<div class="block-head-func"></div>
							<div></div>
						</div>
						<div class="block-body">
							<ul class="url-list">
								<li><a href="###">中文网址测试</a></li>
								<li><a href="###">6666666</a></li>
								<li><a href="###">7777777</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="wrap-box">
					<div class="block">
						<div class="block-head head-style">
							<div class="block-head-title">开发用网址1</div>
							<div class="block-head-func"></div>
							<div></div>
						</div>
						<div class="block-body">
							<ul class="url-list">
								<li><a href="###">中文网址测试</a></li>
								<li><a href="###">6666666</a></li>
								<li><a href="###">7777777</a></li>
							</ul>
						</div>
					</div>
					<div class="block">
						<div class="block-head head-style">
							<div class="block-head-title">开发用网址1</div>
							<div class="block-head-func"></div>
							<div></div>
						</div>
						<div class="block-body">
							<ul class="url-list">
								<li><a href="###">中文网址测试</a></li>
								<li><a href="###">6666666</a></li>
								<li><a href="###">2222222</a></li>
								<li><a href="###">2222222</a></li>
								<li><a href="###">2222222</a></li>
								<li><a href="###">2222222</a></li>
								<li><a href="###">3333333</a></li>
								<li><a href="###">4444444</a></li>
								<li><a href="###">7777777</a></li>
							</ul>
						</div>
					</div>
					<div class="block">
						<div class="block-head head-style">
							<div class="block-head-title">开发用网址1</div>
							<div class="block-head-func"></div>
							<div></div>
						</div>
						<div class="block-body">
							<ul class="url-list">
								<li><a href="###">中文网址测试</a></li>
								<li><a href="###">6666666</a></li>
								<li><a href="###">7777777</a></li>
							</ul>
						</div>
					</div>
					<div class="block">
						<div class="block-head head-style">
							<div class="block-head-title">开发用网址2</div>
							<div class="block-head-func"></div>
							<div></div>
						</div>
						<div class="block-body">
							<ul class="url-list">
								<li><a href="###">中文网址测试</a></li>
								<li><a href="###">2222222</a></li>
								<li><a href="###">3333333</a></li>
								<li><a href="###">4444444</a></li>
								<li><a href="###">中文网址测试</a></li>
								<li><a href="###">2222222</a></li>
								<li><a href="###">3333333</a></li>
								<li><a href="###">7777777</a></li>
							</ul>
						</div>
					</div>
					<div class="block">
						<div class="block-head head-style">
							<div class="block-head-title">开发用网址1</div>
							<div class="block-head-func"></div>
							<div></div>
						</div>
						<div class="block-body">
							<ul class="url-list">
								<li><a href="###">中文网址测试</a></li>
								<li><a href="###">6666666</a></li>
								<li><a href="###">7777777</a></li>
							</ul>
						</div>
					</div>
					<div class="block">
						<div class="block-head head-style">
							<div class="block-head-title">开发用网址1</div>
							<div class="block-head-func"></div>
							<div></div>
						</div>
						<div class="block-body">
							<ul class="url-list">
								<li><a href="###">中文网址测试</a></li>
								<li><a href="###">6666666</a></li>
								<li><a href="###">7777777</a></li>
							</ul>
						</div>
					</div>
					<div class="block">
						<div class="block-head head-style">
							<div class="block-head-title">开发用网址3</div>
							<div class="block-head-func"></div>
							<div></div>
						</div>
						<div class="block-body">
							<ul class="url-list">
								<li><a href="###">中文网址测试</a></li>
								<li><a href="###">6666666</a></li>
								<li><a href="###">7777777</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="wrap-box">
					<div class="block">
						<div class="block-head head-style">
							<div class="block-head-title">开发用网址1</div>
							<div class="block-head-func"></div>
							<div></div>
						</div>
						<div class="block-body">
							<ul class="url-list">
								<li><a href="###">中文网址测试</a></li>
								<li><a href="###">2222222</a></li>
								<li><a href="###">2222222</a></li>
								<li><a href="###">2222222</a></li>
								<li><a href="###">2222222</a></li>
								<li><a href="###">3333333</a></li>
								<li><a href="###">4444444</a></li>
								<li><a href="###">4444444</a></li>
								<li><a href="###">5555555</a></li>
								<li><a href="###">6666666</a></li>
								<li><a href="###">7777777</a></li>
							</ul>
						</div>
					</div>
					<div class="block">
						<div class="block-head head-style">
							<div class="block-head-title">开发用网址2</div>
							<div class="block-head-func"></div>
							<div></div>
						</div>
						<div class="block-body">
							<ul class="url-list">
								<li><a href="###">中文网址测试</a></li>
								<li><a href="###">7777777</a></li>
							</ul>
						</div>
					</div>
					<div class="block">
						<div class="block-head head-style">
							<div class="block-head-title">开发用网址1</div>
							<div class="block-head-func"></div>
							<div></div>
						</div>
						<div class="block-body">
							<ul class="url-list">
								<li><a href="###">中文网址测试</a></li>
								<li><a href="###">4444444</a></li>
								<li><a href="###">5555555</a></li>
								<li><a href="###">6666666</a></li>
								<li><a href="###">7777777</a></li>
							</ul>
						</div>
					</div>
					<div class="block">
						<div class="block-head head-style">
							<div class="block-head-title">开发用网址2</div>
							<div class="block-head-func"></div>
							<div></div>
						</div>
						<div class="block-body">
							<ul class="url-list">
								<li><a href="###">中文网址测试</a></li>
								<li><a href="###">7777777</a></li>
							</ul>
						</div>
					</div>
					<div class="block">
						<div class="block-head head-style">
							<div class="block-head-title">开发用网址3</div>
							<div class="block-head-func"></div>
							<div></div>
						</div>
						<div class="block-body">
							<ul class="url-list">
								<li><a href="###">中文网址测试</a></li>
								<li><a href="###">2222222</a></li>
								<li><a href="###">3333333</a></li>
								<li><a href="###">5555555</a></li>
								<li><a href="###">6666666</a></li>
								<li><a href="###">7777777</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="wrap-box">
					<div class="block">
						<div class="block-head head-style">
							<div class="block-head-title">开发用网址1</div>
							<div class="block-head-func"></div>
							<div></div>
						</div>
						<div class="block-body">
							<ul class="url-list">
								<li><a href="###">中文网址测试</a></li>
								<li><a href="###">2222222</a></li>
								<li><a href="###">3333333</a></li>
								<li><a href="###">4444444</a></li>
								<li><a href="###">5555555</a></li>
								<li><a href="###">6666666</a></li>
								<li><a href="###">7777777</a></li>
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
								<li><a href="###">中文网址测试</a></li>
								<li><a href="###">2222222</a></li>
								<li><a href="###">442244</a></li>
							</ul>
						</div>
					</div>
					<div class="block">
						<div class="block-head head-style">
							<div class="block-head-title">开发用网址3</div>
							<div class="block-head-func"></div>
							<div></div>
						</div>
						<div class="block-body">
							<ul class="url-list">
								<li><a href="###">中文网址测试</a></li>
								<li><a href="###">2222222</a></li>
								<li><a href="###">3333333</a></li>
								<li><a href="###">4444444</a></li>
								<li><a href="###">2222222</a></li>
								<li><a href="###">2222222</a></li>
								<li><a href="###">2222222</a></li>
								<li><a href="###">2222222</a></li>
								<li><a href="###">3333333</a></li>
								<li><a href="###">4444444</a></li>
								<li><a href="###">5555555</a></li>
								<li><a href="###">6666666</a></li>
								<li><a href="###">7777777</a></li>
							</ul>
						</div>
					</div>
					<div class="block">
						<div class="block-head head-style">
							<div class="block-head-title">开发用网址1</div>
							<div class="block-head-func"></div>
							<div></div>
						</div>
						<div class="block-body">
							<ul class="url-list">
								<li><a href="###">中文网址测试</a></li>
								<li><a href="###">2222222</a></li>
								<li><a href="###">3333333</a></li>
								<li><a href="###">4444444</a></li>
								<li><a href="###">5555555</a></li>
								<li><a href="###">6666666</a></li>
								<li><a href="###">7777777</a></li>
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
								<li><a href="###">中文网址测试</a></li>
								<li><a href="###">2222222</a></li>
								<li><a href="###">442244</a></li>
							</ul>
						</div>
					</div>
					<div class="block">
						<div class="block-head head-style">
							<div class="block-head-title">开发用网址3</div>
							<div class="block-head-func"></div>
							<div></div>
						</div>
						<div class="block-body">
							<ul class="url-list">
								<li><a href="###">中文网址测试</a></li>
								<li><a href="###">2222222</a></li>
								<li><a href="###">3333333</a></li>
								<li><a href="###">4444444</a></li>
								<li><a href="###">5555555</a></li>
								<li><a href="###">6666666</a></li>
								<li><a href="###">7777777</a></li>
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