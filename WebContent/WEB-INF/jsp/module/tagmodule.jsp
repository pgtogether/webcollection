<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/constants.jsp"%>
<div class="notes">
	<div class="notes-head head-style">
		<div class="notes-head-title">标签</div>
		<div class="notes-head-func"></div>
	</div>
	<div class="notes-body load-tags">
		<span class="load"><img src="${context_path}/img/load1.gif"></span>
	</div>
</div>
<div class="popbox popbox-tags">
	<div class="popbox-head">筛选结果</div>
	<div class="popbox-body">
		<span class="filter-load"><img src="${context_path}/img/load1.gif"></span>
		<ul class="filter-url-list">
		</ul>
	</div>
</div>
<script type="text/javascript">
	$(function() {
		loadAllTags();
		$(".content-right").on("click",".notes ul li",function(){
			var $this = $(this);
			var tagid = $this.attr("value");
			$this.addClass("flitered").siblings().removeClass("flitered");
			$(".mask").show();
			var $nowModule = $(this).parents(".notes");
			$nowModule.addClass("filter-tags");
			var backgroungColor = $nowModule.find(".head-style").css("background-color");
			$(".popbox-tags").find(".popbox-head").css("background-color",backgroungColor);
			$(".popbox-tags").show();
			filtetBookmarkList(tagid);
		});
		
		// 点击空白区域隐藏
		$(document).bind("click",function(e){
			var target = $(e.target);
			if ($(".popbox-tags").is(":visible") && target.closest(".popbox-tags,.filter-tags").length == 0) {
				$(".filter-tags").removeClass("filter-tags").find(".flitered").removeClass("flitered");
				$(".mask").fadeOut();
				$(".popbox-tags").hide();
			}
		});
	});
	
	function loadAllTags(){
		$.ajax({
			type : "post",
			url : "${context_path}/loadAllTags",
			success : function(json) {
				if (json.result == "OK") {
					var tags = json.data;
					if (tags && tags.length > 0) {
						var tagsHtml = '<ul>';
						for (var i in tags) {
							tagsHtml += '<li value="'+ tags[i].i +'"><span>'+ tags[i].n +'</span></li>';
						}
						tagsHtml += '</ul>';
						$(".load-tags").html(tagsHtml);
					} else {
						$(".load-tags").html("");
					}
				} else {
					doAjaxFunc.saveErrorAnimate("标签加载失败");
				}
			},
			error : function(e) {
			}
		});
	}
	
	function filtetBookmarkList(tagid){
		$.ajax({
			type : "post",
			url : "${context_path}/doFliterBookmarkByTags",
			data : {
				tagid : tagid
			},
			beforeSend : function(){
				$(".filter-url-list").hide().attr("style","");
// 				$(".filter-load").show();
			},
			success : function(json) {
				if (json.result == "OK") {
					var bookmarkList = json.data;
					var bookmarkHtml = '';
					if (bookmarkList && bookmarkList.length > 0) {
						for (var i in bookmarkList) {
							bookmarkHtml += '<li>';
							bookmarkHtml += '<a href="'+ bookmarkList[i].u +'" target="_blank">'+ bookmarkList[i].n +'</a>';
							bookmarkHtml += '<span>'+ bookmarkList[i].cn +'</span>';
							bookmarkHtml += '</li>';
						}
					} else {
						bookmarkHtml += '<li class="noresult">没有符合的书签</li>';
					}
					$(".filter-load").hide();
					$(".filter-url-list").html(bookmarkHtml).show().animate({
						"opacity":1,
						"marginTop": "0px"
					},800);
				} else {
					doAjaxFunc.saveErrorAnimate("加载失败");
				}
			},
			error : function(e) {
			}
		});
	}
</script>