$(function() {
	// 随机背景颜色
	var $titlelist = $(".content").find(".head-style");
	for (var i = 0, len = $titlelist.length; i < len; i++) {
		var rand = parseInt(Math.random() * 20, 10);
		$titlelist.eq(i).css("background",randomColor[rand]);
	}

	// 加载数据
	initLoadFunc.init();
	// 初始化新增功能
	newCategoryOrBookMarkFunc.init();
	// 开启sortable功能
	openSortableFunc.initSortable();
	// 初始化操作分类的功能
	boxHeadOperateFunc.init();
	// 初始化操作书签的功能
	bookmarkOperateFunc.init();
	// 侧边栏功能
	sideBannerFunc.init();
});

// 排序功能
var openSortableFunc = {
	initSortable : function() {
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
		});
	},
	boxSortable : function() {
		$(".wrap-box").sortable({
			connectWith : ".wrap-box",
			handle : ".block-head",
			distance : 5,
			dropOnEmpty : true,
			placeholder : "block-placeholder",
			tolerance : "pointer",
			delay : 100,
			zIndex : 100
		});
	},
	urlSortable : function() {
		$(".url-list").sortable({
			connectWith : ".url-list",
			items : "li:not(.li-disabled)",
			cancel : ".li-disabled",
			dropOnEmpty : true,
			tolerance : "pointer",
			distance : 5,
			placeholder : "url-list-placeholder"
		});
	}
};

// 新增分类或者书签
var newCategoryOrBookMarkFunc = {
	init : function() {
		this.newCategory();
		this.newBookMark();
		this.confirmNew();
		this.cancelNew();
	},
	newCategory : function() {
		$(".categorybtn").click(function() {
			$(".mask").fadeIn(300);
			$(".pop-category").fadeIn(300);
		});
		$("#psw-permission").click(function() {
			$(".psw").show();
		});
		$("#normal-permission").click(function() {
			$(".psw").hide();
		});
	},
	newBookMark : function() {
		$(".bookmarkbtn").click(function() {
			$(".mask").fadeIn(300);
			$(".pop-bookmark").fadeIn(300);
		});
	},
	confirmNew : function() {
		$(".popbox .confirm-btn").click(function() {
			// 如果父标签是pop-category的话，说明是新增分类
			if ($(this).parents(".pop-category").length > 0) {
				// 验证新增分类表单
				var $newCategoryForm = $(this).parents("form");
				formValidateFunc.validateNewCategoryForm($newCategoryForm);
				if (!$newCategoryForm.valid()) {
					return;
				}
				// 提交到后台
				doAjaxFunc.doNewcategory(function(newCategoryNo){
					// 保存成功后的回调方法
					bookmarkOperateFunc.closeAllEditBookmarkTemplate();
					var categoryname = $("#categoryname").val();
					var $clone = $(".category-template").clone().removeClass("category-template");
					// 添加新分类模板标题颜色
					var rand = parseInt(Math.random() * 20, 10);
					$clone.find("input:hidden").attr("id","categoryno_"+newCategoryNo).val(newCategoryNo);
					$clone.find(".block-head").css("background-color",randomColor[rand]);
					$clone.find(".block-head-title").text(categoryname);
					$(".wrap-box").eq(0).prepend($clone);
					$clone.slideDown();
				});
			} else {
				// 新增书签
			}
			openSortableFunc.boxSortable();
			$(".mask").hide();
			$(".popbox-for-new").hide();
		});
	},
	cancelNew : function() {
		$(".popbox .cancel-btn").click(function() {
			$(".mask").hide();
			$(".popbox-for-new").hide();
		});
	},
	callbackShow : function() {
	}
};

// 操作分类标题的功能
var boxHeadOperateFunc = {
	// 初始化事件
	init : function() {
		this.hoverTitle();
		this.modifyTitle();
		this.confirmModify();
		this.cancelModify();
	},
	// 鼠标经过标题时候
	hoverTitle : function() {
		var selfFunc = this;
		$(".wrap-box").on("mouseenter mouseleave", ".block-head",function(event) {
			if (event.type == "mouseenter") {
				selfFunc.appendBoxHeadOperateBtn($(this));
			} else if (event.type == "mouseleave") {
				selfFunc.removeBoxHeadOperateBtn($(this));
			}
		});
	},
	// 修改分类标题
	modifyTitle : function() {
		// 双击修改分类标题
		var selfFunc = this;
		$(".wrap-box").on("dblclick",".block-head",function() {
			if (!$(this).hasClass("modify")) {
				selfFunc.closeOtherModifyTitle();
				var $title = $(this).find(".block-head-title");
				var titleText = $title.text();
				var inputHtml = '<input class="updatetitle" type="text" style="background-color:'
						+ $title.css("background-color") + '">';
				$title.html(inputHtml).parent().addClass(
						"modify");
				$title.find("input").focus().val(titleText);
				selfFunc.appendBoxTitleUpdateBtn($title);
			}
		});
	},
	// 确定修改
	confirmModify : function() {
		var selfFunc = this;
		$(".wrap-box").on("click", ".confirmicon", function() {
			var $headFuncSpan = $(this).parent();
			selfFunc.removeBoxTitleUpdateBtn($headFuncSpan);
		});
	},
	// 取消修改
	cancelModify : function() {
		var selfFunc = this;
		$(".wrap-box").on("click", ".cancelicon", function() {
			var $headFuncSpan = $(this).parent();
			selfFunc.removeBoxTitleUpdateBtn($headFuncSpan);
		});
	},
	// 关闭其他正在编辑标题的操作
	closeOtherModifyTitle : function() {
		var selfFunc = this;
		$(".wrap-box").find(".modify .block-head-func").each(function() {
			selfFunc.removeBoxTitleUpdateBtn($(this));
		});
	},
	// 插入标题操作按钮模板
	appendBoxTitleUpdateBtn : function($target) {
		var operateHtml = '';
		operateHtml += '<span title="确定" class="confirmicon"></span>';
		operateHtml += '<span title="取消" class="cancelicon"></span>';
		$target.next().html(operateHtml);
	},
	// 删除标题操作按钮
	removeBoxTitleUpdateBtn : function($target) {
		var $head = $target.siblings();
		$head.html($head.children().val());
		$target.html("").parent(".block-head").removeClass("modify");
	},
	// 插入删除分类，新增书签按钮模板
	appendBoxHeadOperateBtn : function($target) {
		if (!$target.hasClass("modify")) {
			var operateHtml = '';
			operateHtml += '<span title="新增书签" class="addicon"></span>';
			operateHtml += '<span title="删除分类" class="closeicon"></span>';
			$target.find(".block-head-func").append(operateHtml);
		}
	},
	// 移除[删除分类，新增书签]按钮
	removeBoxHeadOperateBtn : function($target) {
		if (!$target.hasClass("modify")) {
			$target.find(".block-head-func").html("");
		}
	}
};

// 操作书签功能
var bookmarkOperateFunc = {
	init : function() {
		this.hoverBookmark();
		this.setHotBookmark();
		this.addBookmark();
		this.editBookmark();
		this.delBookmark();
		this.confirmEditBookmark();
		this.cancelEditBookmark();
	},
	// 鼠标经过书签
	hoverBookmark : function() {
		var selfFunc = this;
		$(".content").on( "mouseenter mouseleave", ".hot-url-list li,.url-list li",function(event) {
			var $li = $(this);
			if (event.type == "mouseenter") {
				var color = $li.parent().parent().siblings(
						".head-style").css("background-color");
				$li.css("background-color", color).siblings().attr(
						"style", "");
				selfFunc.appendUrlOperateBtn($li);
			} else if (event.type == "mouseleave") {
				$li.attr("style", "");
				selfFunc.removeUrlOperateBtn($li);
			}
		});
	},
	// 新增书签
	addBookmark : function() {
		var selfFunc = this;
		$(".wrap-box").on("click", ".addicon", function() {
			// 如果已经存在,不需要再增加一个模板
			var $this = $(this);
			if ($this.parents(".block").find(".addbookmark").length == 0) {
				// 每次打开新的模板之前，先关闭其他开着的模板
				selfFunc.closeAllEditBookmarkTemplate();
				var $ul = $this.parents(".block").find(".url-list");
				selfFunc.appendAddBookmarkTemplate($ul);
			} else {
				selfFunc.closeAllEditBookmarkTemplate();
			}
		});
	},
	// 编辑书签
	editBookmark : function() {
		var selfFunc = this;
		$(".wrap-box").on("click", ".editicon", function() {
			// 如果已经存在,不需要再增加一个模板
			var $this = $(this);
			var $nextli = $this.parents("li").next();
			if ($nextli.find(".editbookmark").length == 0) {
				// 每次打开新的模板之前，先关闭其他开着的模板
				selfFunc.closeAllEditBookmarkTemplate();
				var $li = $this.parents("li").removeClass("valid-pass").addClass("li-disabled pointto");
				var $a = $li.find("a");
				var values = {};
				values.url = $a.attr("href");
				values.name = $a.text();
				selfFunc.appendEditBookmarkTemplate($li, values);
			} else {
				selfFunc.closeAllEditBookmarkTemplate();
			}
		});
	},
	// 删除书签
	delBookmark : function() {
		var selfFunc = this;
		$(".wrap-box").on("click", ".delicon", function() {
			// 如果已经存在,不需要再增加一个模板
			var $this = $(this);
			if ($this.parents("li").next().find(".delbookmark").length == 0) {
				// 每次打开新的模板之前，先关闭其他开着的模板
				selfFunc.closeAllEditBookmarkTemplate();
				var $li = $this.parents("li").removeClass("valid-pass").addClass("li-disabled pointto");
				selfFunc.appendDelBookmarkTemplate($li);
			} else {
				selfFunc.closeAllEditBookmarkTemplate();
			}
		});
	},
	// 标记为常用书签
	setHotBookmark : function() {
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
	// 确定书签
	confirmEditBookmark : function() {
		selfFunc = this;
		$(".wrap-box").on("click", ".confirmediticon", function() {
			var $thisBtn = $(this);
			// 确认新增书签
			if ($thisBtn.parents(".addbookmark").length > 0) {
				// 保存数据
				doAjaxFunc.doAddbookmark(function(){
					// 保存数据成功后的回调方法
					bookmarkOperateFunc.closeAllEditBookmarkTemplate();
					var $addbookmarkform = $("#addbookmarkform");
					var url = $addbookmarkform.find("#url").val();
					var name = $addbookmarkform.find("#bookmarkname").val();
					// 获取新增书签的模板
					var template = selfFunc.getBookmarkTemplate("", url, name, false);
					// 添加一个新书签
					var $ul = $addbookmarkform.parents("ul");
					$ul.prepend(template);
					$ul.find("li:eq(0)").addClass("valid-pass").slideDown(function() {
						// 成功后的动画效果
						doAjaxFunc.saveSuccessAnimate();
					});
				});
			}
			// 确认编辑书签
			else if ($thisBtn.parents(".editbookmark").length > 0) {
				// TODO
				// 保存数据
				doAjaxFunc.doEditBookmark();
			}
			// 确认删除书签
			else if ($thisBtn.parents(".delbookmark").length > 0) {
				var $delObj = $thisBtn.parents(".editbookmarktemplate").prev();
				flyTool.play($delObj);
				selfFunc.closeAllEditBookmarkTemplate();
			}
		});
	},
	// 取消书签
	cancelEditBookmark : function() {
		selfFunc = this;
		$(".wrap-box").on("click", ".cancelediticon", function() {
			selfFunc.closeAllEditBookmarkTemplate();
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
	appendAddBookmarkTemplate : function($ul) {
		var operateHtml = this.getAddAndEditBookmarkTemplate("addbookmark");
		$ul.prepend(operateHtml);
		$ul.find(".editbookmarktemplate").slideDown();
	},
	// 编辑书签模板
	appendEditBookmarkTemplate : function($li, values) {
		var operateHtml = this.getAddAndEditBookmarkTemplate("editbookmark",
				values);
		$li.after(operateHtml);
		$li.next().slideDown();
	},
	// 删除书签模板
	appendDelBookmarkTemplate : function($li) {
		var operateHtml = '';
		operateHtml += '<li class="editbookmarktemplate li-disabled" style="display:none;">';
		operateHtml += '<div class="delbookmark">';
		operateHtml += '	<p><span class="delconfirmmsg">您确定删除本书签吗？</span></p>';
		operateHtml += '	<p><span class="deltip">提示:可以到<font color="#000">回收站</font>找回删除的书签哦!</span></p>';
		operateHtml += '	<p class="btn">';
		operateHtml += '		<span class="confirmediticon" title="确定"></span>';
		operateHtml += '		<span class="cancelediticon" title="取消"></span>';
		operateHtml += '	</p>';
		operateHtml += '</div>';
		operateHtml += '</li>';
		$li.after(operateHtml);
		$li.next().slideDown();
	},
	// 关闭其他正在编辑的书签模板
	closeAllEditBookmarkTemplate : function() {
		$(".wrap-box").find(".editbookmarktemplate").slideUp(function() {
			var $this = $(this);
			$this.prev(".pointto").removeClass("li-disabled pointto");
			$this.remove();
		});
	},
	// 新增书签与编辑书签公用模板
	getAddAndEditBookmarkTemplate : function(editclass, values) {
		var url = "", name = "", tags = "", desc = "";
		if (values) {
			url = values.url ? values.url : "";
			name = values.name ? values.name : "";
			tags = values.tags ? values.tags : "";
			desc = values.desc ? values.desc : "";
		}
		var operateHtml = '';
		// addbookmarkform or editbookmarkform
		operateHtml += '<li class="editbookmarktemplate li-disabled" style="display:none;">';
		operateHtml += '<form id="' + editclass + 'form">';
		operateHtml += '<div class="' + editclass + '">';
		operateHtml += '	<p><label>网址</label><input type="text" id="url" name="url" placeholder="例:www.52url.com" value="' + url + '"/></p>';
		operateHtml += '	<p><label>名称</label><input type="text" id="bookmarkname" name="bookmarkname" placeholder="例:网址收藏" value="' + name + '"/></p>';
		operateHtml += '	<p><label>标签</label><input type="text" id="tags" name="tags" placeholder="例:生活,美食(以逗号,分隔)" value="' + tags + '"/></p>';
		operateHtml += '	<p><label>描述</label><textarea id="desc" name="desc">' + desc + '</textarea></p>';
		operateHtml += '	<p class="btn">';
		operateHtml += '		<span class="confirmediticon" title="确定"></span>';
		operateHtml += '		<span class="cancelediticon" title="取消"></span>';
		operateHtml += '	</p>';
		operateHtml += '</div>';
		operateHtml += '</form>';
		operateHtml += '</li>';
		return operateHtml;
	},
	// 新增书签
	getBookmarkTemplate : function(id, url, name, isDisplay) {
		var operateHtml = '';
		if (isDisplay){
			operateHtml += '<li';	
		} else {
			operateHtml += '<li style="display:none;"';
		}
		operateHtml += ' value="'+ id +'"><a href="' + url + '" target="_blank">' + name + '</a>';
		operateHtml += '<div class="operatebtn"></div></li>';
		return operateHtml;
	}
};

// 放入回收站的飞行动作
var flyTool = {
	play : function($flyer) {
		var $clone = $flyer.clone().removeClass().addClass("flystyle");
		$flyer.removeClass("pointto").find("a").text("");
		$('body').append($clone);
		$clone.css({
			'top' : $flyer.offset().top + 'px',
			'left' : $flyer.offset().left + 'px',
			'width' : $flyer.width() + 'px',
			'height' : $flyer.height() + 'px'
		});
		$flyer.slideUp(800, function() {
			$(this).remove();
		});
		$clone.animate({
			opacity : 1,
			top : $('.trashcan').offset().top + 20,
			left : $('.trashcan').offset().left + 20,
			width : 10,
			height : 10
		}, 1000, function() {
			$clone.remove();
			new JumpObj($('.trashcan')[0], 10).jump();
		});
	}
};
// 侧边栏
var sideBannerFunc = {
	init : function() {
		$(window).scroll(function() {
			// 滚动到一定高度后，出现回到顶部按钮
			if ($(window).scrollTop() > 100) {
				$(".scrolltop").fadeIn(500);
			} else {
				$(".scrolltop").slideUp(500);
			}
			// 当侧边框距离底部与footer齐平时，停止跟随
			var $sideBanner = $(".sideBanner");
			var footerHeight = $(".footer").height();
			// 文档高度-滚动上去的高度-显示的页面高度
			var scrollBottom = $(document).height()
					- $(document).scrollTop() - $(window).height();
			if (scrollBottom < footerHeight) {
				$sideBanner.css("bottom", footerHeight - scrollBottom);
			} else {
				$sideBanner.css("bottom", 15);
			}
		});
		// 当点击跳转链接后，回到页面顶部位置
		$(".scrolltop").click(function() {
			$('body,html').animate({
				scrollTop : 0
			}, 500);
			return false;
		});
	}
};
