<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/constants.jsp"%>
<div class="notes fast-search-note">
	<div class="notes-head head-style">快速搜索</div>
	<div class="notes-body">
		<div class="fast-search">
			<input id="fastSearchKey" type="text" class="fast-search-input" placeholder="输入名称/拼音/首字母/url"/><span
				class="fast-search-btn">搜索</span>
		</div>
		<div class="fast-search-list">
			<ul class="filter-ul">
				<li class="parent-li">
					<span class="catetory-name">测试书签</span>
					<ul class="child-ul">
						<li><a>|-测试书签A</a></li>
						<li><a>|-测试书签A</a></li>
						<li><a>|-测试书签A</a></li>
						<li><a>|-测试书签A</a></li>
					</ul>
				</li>
				<li><a>测试书签</a></li>
				<li><a>测试书签</a></li>
			</ul>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function(){
	fastSearchFunc.init();
});
//快速查询功能
var fastSearchFunc = {
	init : function(){
		$("#fastSearchKey").bind('input propertychange', function() {
			var $thisInput = $(this); 
			var searchKey = $thisInput.val();
			// 获取缓存的书签列表
			var cacheList = initLoadFunc.CacheList;
			if (searchKey && cacheList) {
				searchKey = searchKey.toUpperCase();
				var matchedNum = 0;
				var filterResultHtml = '';
				for(var i in cacheList){
					if (matchedNum >= 20){
						break;
					}
					var category = cacheList[i];
					var bookmarklist = category.list;
					// 逐层筛选符合条件的记录
					// 看是否有符合的分类
					var checkCategoryFlg = false;
					// 当输入一个字符时，判断是否以这个字符开头
					// 当输入两个以上字符时，判断是否包含这个字符
					if (searchKey.length > 1) {
						if (category.n.toUpperCase().indexOf(searchKey) >= 0
								|| category.py.indexOf(searchKey) >= 0
								|| category.pyh.indexOf(searchKey) >= 0){
							checkCategoryFlg = true;
						}
					} else {
						if (category.n.toUpperCase().indexOf(searchKey) == 0
								|| category.py.indexOf(searchKey) == 0
								|| category.pyh.indexOf(searchKey) == 0){
							checkCategoryFlg = true;
						}
					}
					// 如果有符合的分类并且包含一个以上书签
					if (checkCategoryFlg && bookmarklist){
						filterResultHtml += '<li class="parent-li">';
						filterResultHtml += '<span class="catetory-name">'+category.n+'</span>';
						filterResultHtml += '<ul class="child-ul">';
						for(var n in bookmarklist) {
							var bookmark = bookmarklist[n];
							filterResultHtml += '<li><a href="'+ bookmark.u +'" target="_blank">|--'+ bookmark.n +'</a></li>';
							matchedNum++;
							if (matchedNum >= 20){
								break;
							}
						}
						filterResultHtml += '</ul>';
						filterResultHtml += '</li>';
						continue;
					} else {
						// 如果分类不符合，再看该分类下书签是否符合
						for(var n in bookmarklist) {
							var bookmark = bookmarklist[n];
							// 名称满足
							var checkBookmarkFlg = false;
							if (searchKey.length > 1) {
								if (bookmark.n.toUpperCase().indexOf(searchKey) >= 0
										|| bookmark.py.indexOf(searchKey) >= 0
										|| bookmark.pyh.indexOf(searchKey) >= 0
										|| bookmark.u.toUpperCase().indexOf(searchKey) >= 0){
									checkBookmarkFlg = true;
								}
							} else {
								if (bookmark.n.toUpperCase().indexOf(searchKey) == 0
										|| bookmark.py.indexOf(searchKey) == 0
										|| bookmark.pyh.indexOf(searchKey) == 0
										|| bookmark.u.toUpperCase().indexOf(searchKey) == 0){
									checkBookmarkFlg = true;
								}
							}
							if (checkBookmarkFlg) {
								filterResultHtml += '<li><a href="'+ bookmark.u +'" target="_blank">'+ bookmark.n +'</a></li>';
								matchedNum++;
							}
						}
					}
				}
				if (filterResultHtml){
					filterResultHtml = '<ul class="filter-ul">'+ filterResultHtml +'</ul>';
					$(".fast-search-list").html(filterResultHtml).show();
				}
			} else {
				$(".fast-search-list").html("").hide();
			}
		});
		// 方向键选中
		$(".fast-search-note").keydown(function(e){
			var keyCode = e.keyCode;
			if (keyCode == 38 || keyCode == 40) {
				fastSearchFunc.selectNextLi(keyCode);
			} else if (keyCode == 13){
				var $selectedLi = $(this).find("li.selected");
				if ($(this).find("li.selected").length > 0){
					$selectedLi.find("a")[0].click();
				}
			}
		});
	},
	// 方向键上下选中
	selectNextLi : function(keyCode){
		var $fastSearchList = $(".fast-search-list");
		var defaultIndex = 0;
		var skipIndex = 1;
		if (keyCode == 38) {
			defaultIndex = $fastSearchList.length - 1;
			skipIndex = -1;
		}
		if($fastSearchList.is(":visible")){
			var $bookmarkLiList = $fastSearchList.find("li:not('.parent-li')");
			var $selectLi = $fastSearchList.find(".selected");
			if ($selectLi.length > 0) {
				var index = $bookmarkLiList.index($selectLi);
				var nextIndex = index + skipIndex;
				if (nextIndex == $bookmarkLiList.length || nextIndex == 0){
					$bookmarkLiList.removeClass("selected").eq(defaultIndex).addClass("selected");
				} else {
					$bookmarkLiList.removeClass("selected").eq(nextIndex).addClass("selected");
				}
			} else {
				$bookmarkLiList.eq(defaultIndex).addClass("selected");
			}
		}
	}
};
</script>