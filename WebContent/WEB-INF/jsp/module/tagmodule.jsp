<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="notes">
	<div class="notes-head head-style">
		<div class="notes-head-title">标签</div>
		<div class="notes-head-func"></div>
	</div>
	<div class="notes-body">
		<ul class="">
			<li data-filter="*"><span>海外网</span></li>
			<li data-filter=".tool"><span>工具</span></li>
			<li data-filter=".gouwu"><span>购物C</span></li>
			<li><span>mama</span></li>
			<li><span>哈哈利利</span></li>
			<li><span>asd</span></li>
			<li><span>海外网</span></li>
			<li><span>我单位民</span></li>
			<li><span>这个事ABVC</span></li>
			<li><span>mama</span></li>
			<li><span>哈哈利利</span></li>
			<li><span>asd</span></li>
			<li><span>海外网</span></li>
			<li><span>我单位民</span></li>
			<li><span>这个事ABVC</span></li>
			<li><span>mama</span></li>
			<li><span>哈哈利利</span></li>
			<li><span>asd</span></li>
			<li><span>海外网</span></li>
			<li><span>我单位民</span></li>
			<li><span>这个事ABVC</span></li>
			<li><span>mama</span></li>
			<li><span>哈哈利利</span></li>
			<li><span>asd</span></li>
			<li><span>海外网</span></li>
			<li><span>我单位民</span></li>
			<li><span>这个事ABVC</span></li>
			<li><span>mama</span></li>
			<li><span>哈哈利利</span></li>
			<li><span>asd</span></li>
		</ul>
	</div>
</div>
<script type="text/javascript">
	$(function() {
		$(".content-right").on("click",".notes ul li",function(){
			$(".mask").show();
			var $nowModule = $(this).parents(".notes");
			$nowModule.addClass("filter-tags");
			var backgroungColor = $nowModule.find(".head-style").css("background-color");
			$(".popbox-tags").find(".popbox-head").css("background-color",backgroungColor);
			$(".popbox-tags").show();
		});
		
		// 点击空白区域隐藏
		$(document).bind("click",function(e){
			var target = $(e.target);
			if (target.closest(".popbox-tags,.filter-tags").length == 0) {
				$(".filter-tags").removeClass("filter-tags");
				$(".mask").hide();
				$(".popbox-tags").hide();
			}
		});
		
	});
</script>