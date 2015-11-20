$(function() {
	// 随机背景颜色
	var $titlelist = $(".content").find(".head-style");
	for (var i = 0, len = $titlelist.length; i < len; i++) {
		var rand = parseInt(Math.random() * 20, 10) + 1;
		$titlelist.eq(i).addClass("randomcolor-" + rand);
	}

	// 开启sortable功能
	openSortableFunc.initSortable();
	// 初始化操作分类的功能
	boxHeadOperateFunc.init();
	// 初始化操作书签的功能
	bookmarkOperateFunc.init();
});


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
	// 修改分类标题
	modifyTitle : function(){
		// 双击修改分类标题
		var selfFunc = this;
		$(".wrap-box").on("dblclick",".block-head", function(){
			if (!$(this).hasClass("modify")) {
				selfFunc.closeOtherModifyTitle();
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
			var $headFuncSpan = $(this).parent();
			selfFunc.removeBoxTitleUpdateBtn($headFuncSpan);
		});
	},
	// 取消修改
	cancelModify : function(){
		var selfFunc = this;
		$(".wrap-box").on("click",".cancelicon",function(){
			var $headFuncSpan = $(this).parent();
			selfFunc.removeBoxTitleUpdateBtn($headFuncSpan);
		});
	},
	// 关闭其他正在编辑标题的操作
	closeOtherModifyTitle : function(){
		var selfFunc = this;
		$(".wrap-box").find(".modify .block-head-func").each(function(){
			selfFunc.removeBoxTitleUpdateBtn($(this));
		});
	},
	// 插入标题操作按钮模板
	appendBoxTitleUpdateBtn : function($target){
		var operateHtml = '';
		operateHtml += '<span title="确定" class="confirmicon"></span>';
		operateHtml += '<span title="取消" class="cancelicon"></span>';
		$target.next().html(operateHtml);
	},
	// 删除标题操作按钮
	removeBoxTitleUpdateBtn : function($target){
		var $head = $target.siblings();
		$head.html($head.children().val());
		$target.html("").parent(".block-head").removeClass("modify");
	},
	// 插入删除分类，新增书签按钮模板
	appendBoxHeadOperateBtn : function($target){
		if (!$target.hasClass("modify")) {
			var operateHtml = '';
			operateHtml += '<span title="新增书签" class="addicon"></span>';
			operateHtml += '<span title="删除分类" class="closeicon"></span>';
			$target.find(".block-head-func").append(operateHtml);
		}
	},
	// 移除[删除分类，新增书签]按钮
	removeBoxHeadOperateBtn : function($target){
		if (!$target.hasClass("modify")) {
			$target.find(".block-head-func").html("");
		}
	}
};

// 操作书签功能
var bookmarkOperateFunc = {
	init : function(){
		this.hoverBookmark();
		this.setHotBookmark();
		this.addBookmark();
		this.confirmAddBookmark();
		this.cancelAddBookmark();
	},
	// 鼠标经过书签	
	hoverBookmark : function() {
		var selfFunc = this;
		$(".content").on("mouseenter mouseleave",".hot-url-list li,.url-list li", function(event){
			 var $li = $(this);
			 if( event.type == "mouseenter"){ 
				var color = $li.parent().parent().siblings(".head-style").css("background-color");
				$li.css("background-color", color).siblings().attr("style", "");
				selfFunc.appendUrlOperateBtn($li);
			 }
			 else if(event.type == "mouseleave"){
				$li.attr("style", "");
				selfFunc.removeUrlOperateBtn($li);
			 }
		});
	},
	// 新增书签
	addBookmark : function(){
		var selfFunc = this;
		$(".wrap-box").on("click",".addicon", function(){
			// 每次打开新的模板之前，先关闭其他开着的模板
			selfFunc.closeAllAddBookmarkTemplate();
			var $ul = $(this).parents(".block").find(".url-list");
			selfFunc.appendAddBookmarkTemplate($ul);
		});
	},
	// 标记为常用书签
	setHotBookmark : function(){
		$(".wrap-box").on("click", ".operatebtn .staricon", function() {
			if ($(this).hasClass("light")) {
				$(this).removeClass("light").attr("title", "标记为常用书签");
			} else {
				$(this).addClass("light").attr("title", "从常用书签取消");
			}
			// 此处应该有上升为常用书签的操作
			// 还需要Ajax 反映到数据库中
			// TODO
		});
	},
	// 插入书签操作按钮模板
	appendUrlOperateBtn : function($li) {
		var operateHtml = '';
		if ($li.find(".light").length == 0) {
			operateHtml += '<span title="标记为常用书签" class="staricon"></span>';
		}
		operateHtml += '<span title="编辑书签" class="editicon"></span>';
		operateHtml += '<span title="删除书签" class="delicon"></span>';
		$li.find(".operatebtn").append(operateHtml);
	},
	// 删除书签操作按钮
	removeUrlOperateBtn : function($li) {
		$li.find(".operatebtn > span").not(".light").remove();
	},
	// 新增书签模板
	appendAddBookmarkTemplate : function($ul){
		var operateHtml = '';
		operateHtml += '<li class="addbookmarktemplate" style="display:none;">';
		operateHtml += '<div class="addbookmark">';
		operateHtml += '	<p><label>网址</label><input type="text" id="url" placeholder="例:www.52url.com"></p>';
		operateHtml += '	<p><label>名称</label><input type="text" id="bookmarkname" placeholder="例:网址收藏"></p>';
		operateHtml += '	<p><label>标签</label><input type="text" id="tags" placeholder="例:生活,美食(以逗号,分隔)"></p>';
		operateHtml += '	<p><label>描述</label><textarea id="desc"></textarea></p>';
		operateHtml += '	<p class="btn">';
		operateHtml += '		<span class="confirmaddicon" title="确定"></span>';
		operateHtml += '		<span class="canceladdicon" title="取消"></span>';
		operateHtml += '	</p>';
		operateHtml += '</div>';
		operateHtml += '</li>';
		$ul.prepend(operateHtml);
		$ul.find(".addbookmarktemplate").slideDown();
	},
	// 确定新增书签
	confirmAddBookmark : function(){
		selfFunc = this;
		$(".wrap-box").on("click", ".confirmaddicon", function() {
			var $this = $(this);
			$this.parents(".addbookmarktemplate").slideUp(function(){
				$(this).remove();
			});
		});
	},
	// 取消新增书签
	cancelAddBookmark : function(){
		selfFunc = this;
		$(".wrap-box").on("click", ".canceladdicon", function() {
			var $this = $(this);
			$this.parents(".addbookmarktemplate").slideUp(function(){
				$(this).remove();
			});
		});
	},
	// 关闭开着的新增书签模板
	closeAllAddBookmarkTemplate : function(){
		selfFunc = this;
		$(".wrap-box").find(".addbookmarktemplate").slideUp(function(){
			$(this).remove();
		});
	}
};