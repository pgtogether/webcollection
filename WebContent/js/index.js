$(function() {
	// 随机背景颜色
	var $titlelist = $("body").find(".head-style");
	for (var i = 0, len = $titlelist.length; i < len; i++) {
		var rand = parseInt(Math.random() * 20, 10);
		$titlelist.eq(i).css("background",randomColor[rand]);
	}

	// 加载数据
	initLoadFunc.init(function(){
		// 数据加载完成后，通过回调函数激活操作网址的功能
		// 开启sortable功能
		openSortableFunc.initSortable();
		// 初始化操作分类的功能
		categoryOperateFunc.init();
		// 初始化操作网址的功能
		bookmarkOperateFunc.init();
	});
	// 初始化模块导航功能
	moduleNavBar.init();
	// 初始化分类导航功能
	categoryTabsOperateFunc.init();
	// 初始化添加功能
	newCategoryOrBookMarkFunc.init();
	// 加载验证默认规则
	formValidateFunc.init();
	// 侧边栏功能
	sideBannerFunc.init();
	// 提示框功能
	alertUtilsFunc.init();
	// 滚动条插件
	scrollBarFunc.init();
	// 编辑专题功能
	editSubjectFunc.init();
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
			items : ".block:not(.block-disabled)",
			cancel : ".block-disabled",
			distance : 5,
			dropOnEmpty : true,
			placeholder : "block-placeholder",
			tolerance : "pointer",
			delay : 100,
			zIndex : 100,
			update : function(event, ui){
				// 获取移动后的栏目下的所有分类顺序
				var $wrapBox = ui.item.parents(".wrap-box");
				var sortArray = $wrapBox.sortable("toArray");
				// 获取当前栏位
				var columnValue = $wrapBox.attr("value");
				// 保存到DB
				$.ajax({
					type : "post",
					url : CONTEXT_PATH + "/doSaveCategorySort",
					data : {
						categorySorts : sortArray.join(","),
						columnValue : columnValue
					},
					success : function(json) {
						if (json.result == "OK") {
						} else {
							alert(json.msg);
						}
					},
					error : function(e) {
					}
				});
			}
		});
	},
	urlSortable : function(index) {
		var $urlList;
		if (index) {
			$urlList = $(".content-item:eq("+ index +")").find(".url-list");
		} else {
			$urlList = $(".url-list");
		}
		$urlList.sortable({
			connectWith : ".url-list",
			items : "li:not(.li-disabled)",
			cancel : ".li-disabled",
			dropOnEmpty : true,
			tolerance : "pointer",
			distance : 5,
			placeholder : "url-list-placeholder",
			update : function(event, ui){
				// 获取移动后所属分类的ID
				var $category = ui.item.parents(".block");
				var categoryno = $category.find(".category-title").attr("value");
				// 获取该分类下网址的排序
				var $urlList = ui.item.parents(".url-list");
				var sortArray = $urlList.sortable("toArray");
				// 保存到DB
				$.ajax({
					type : "post",
					url : CONTEXT_PATH + "/doSaveBookmarkSort",
					data : {
						bookmarkSorts : sortArray.join(","),
						categoryno : categoryno
					},
					success : function(json) {
						if (json.result == "OK") {
						} else {
							alert(json.msg);
						}
					},
					error : function(e) {
					}
				});
			}
		});
	}
};

// 新增分类或者网址
var newCategoryOrBookMarkFunc = {
	init : function() {
		this.newCategory();
		this.newBookMark();
		this.confirmNew();
		this.cancelNew();
	},
	newCategory : function() {
		$(".content").on("click", ".categorybtn", function() {
			// 还原到初始状态
			var $pop_category = $(".pop-category");
			$pop_category.find("input:not('#parentcategoryno')").val("");
			$pop_category.find("#normal-permission").prop("checked",true);
			$(".psw").hide();
			$(".mask").fadeIn(300);
			$pop_category.fadeIn(300).find("input[type=text]:eq(0)").focus();
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
			// 首先清空之前的所有输入值
			var $pop_bookmark = $(".pop-bookmark");
			$pop_bookmark.find("input").val("");
			// 显示添加网址浮动层之前,筛选出本页所有的分类
			var categoryHtml = "";
			$(".category-title").each(function(index){
				var categoryno = $(this).attr("value");
				var categoryname = $(this).text();
				if (((index+1) % 2) == 0) {
					categoryHtml += "<li class='even' ";
				} else {
					categoryHtml += "<li ";
				}
				categoryHtml += "value="+categoryno+">"+categoryname+"</li>";
			});
			$pop_bookmark.find(".exist-category-list").html(categoryHtml);
			$(".mask").fadeIn(300);
			$pop_bookmark.fadeIn(300).find("input[type=text]:eq(0)").focus();
		});
		$(".pop-bookmark #categoryname").focusin(function(){
			if (!$(this).val()){
				$(".pop-bookmark .exist-category-list").show();
			}
		});
		$(document).bind("click", function(e) {
			var target = $(e.target);
			if (target.closest(".choose-category").length == 0 && target.closest(".exist-category-list").length == 0 ) {
				$(".pop-bookmark .exist-category-list").hide();
			}
		});
		$(".exist-category-list").on("click","li",function(){
			var $this = $(this);
			var categoryname = $this.text();
			var categoryno = $this.attr("value");
			$pop_bookmark = $(".pop-bookmark");
			$pop_bookmark.find("#categoryno").val(categoryno);
			$pop_bookmark.find("#categoryname").val(categoryname).focus();
			$(".pop-bookmark .exist-category-list").hide();
		});
		$(".pop-bookmark #categoryname").bind('input propertychange', function() {
			if (!$(this).val()){
				$(".pop-bookmark .exist-category-list").show();
			} else {
				$(this).siblings("input").val("");
				$(".pop-bookmark .exist-category-list").hide();
			}
		}); 
	},
	confirmNew : function() {
		$(".pop-category .confirm-btn").click(function() {
			// 提交到后台
			doAjaxFunc.doNewcategory(function(newCategoryNo){
				// 保存成功后的回调方法
				var $newcategoryform = $("#newCategoryForm");
				bookmarkOperateFunc.closeAllEditBookmarkTemplate();
				var categoryname = $newcategoryform.find("#categoryname").val();
				var $clone = $(".category-template").clone().removeClass("category-template")
													.prop("id","c_"+newCategoryNo);
				// 添加新分类模板标题颜色
				var rand = parseInt(Math.random() * 20, 10);
				$clone.find(".block-head").css("background-color",randomColor[rand]);
				$clone.find(".block-head-title").text(categoryname)
						.attr("value",newCategoryNo).prop("id","category_" + newCategoryNo);
				// 放入当前显示大分类的栏位下
				var index = $(".category-tabs").find(".tab-item.selected").index(".tab-item");
				$(".content-item:eq("+ index +")").find(".wrap-box .add-block").after($clone);
				$clone.slideDown();
				openSortableFunc.urlSortable(index);
				$(".mask").hide();
				$(".popbox-for-new").hide();
				var valueObj = {};
				valueObj.categoryno = newCategoryNo;
				valueObj.categoryname = categoryname;
				initLoadFunc.setCacheList(initLoadFunc.CacheTypeEnum.NEW_CATEGORY, valueObj);
			});
		});
		$(".pop-bookmark .confirm-btn").click(function() {
			// 添加网址
			doAjaxFunc.doNewBookmark(function($newBookmarkForm,jsonData){
				// 获取分类ID
				var bookmarkno = "";
				var categoryno = $newBookmarkForm.find("#categoryno").val();
				// 如果分类ID为空，那么需要同时新增一个分类以及一个网址
				if (!categoryno) {
					bookmarkno = jsonData["bookmarkno"];
					categoryno = jsonData["categoryno"]; 
					var categoryname = $newBookmarkForm.find("#categoryname").val();
					var $clone = $(".category-template").clone().removeClass("category-template");
					// 添加新分类模板标题颜色
					var rand = parseInt(Math.random() * 20, 10);
					$clone.prop("id","c_"+categoryno);
					$clone.find(".block-head").css("background-color",randomColor[rand]);
					$clone.find(".block-head-title").text(categoryname)
							.attr("value",categoryno).prop("id","category_" + categoryno);
					$(".wrap-box").eq(0).prepend($clone);
					$clone.slideDown();
					var valueObj = {};
					valueObj.categoryno = categoryno;
					valueObj.categoryname = categoryname;
					initLoadFunc.setCacheList(initLoadFunc.CacheTypeEnum.NEW_CATEGORY, valueObj);
				} else {
					bookmarkno = jsonData;
				}
				// 添加成功后，在指定分类下添加新的网址
				var url = $newBookmarkForm.find("#url").val();
				var name = $newBookmarkForm.find("#bookmarkname").val();
				// 获取网址模板
				var valuesObj = {};
				valuesObj.categoryno = categoryno;
				valuesObj.bookmarkno = bookmarkno;
				valuesObj.url = url;
				valuesObj.bookmarkname = name;
				valuesObj.isDisplay = true;
				var newBookmarkTemplate = bookmarkOperateFunc.getBookmarkTemplate(valuesObj);
				// 筛选出应对的分类
				var $url_list = $(".wrap-box").find("#c_"+categoryno + " .url-list");
				$url_list.prepend(newBookmarkTemplate);
				$url_list.find("li:first").addClass("save-success").slideDown();
				$(".mask").hide();
				$(".popbox-for-new").hide();
				initLoadFunc.setCacheList(initLoadFunc.CacheTypeEnum.NEW_BOOKMARK, valuesObj);
			});
		});
		// 回车键,ESC监听
		$(".popbox-for-new :input").keydown(function(e){
			var $popbox = $(this).parents(".popbox");
			if(e.keyCode == 13){
				$popbox.find(".confirm-btn").click();
			} else if(e.keyCode == 27) {
				$popbox.find(".cancel-btn").click();
			}
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
// 模块导航的操作
var moduleNavBar = {
		init : function(){
			this.clickBar();
		},
		clickBar : function(){
			$(".func-navs .nav-item").click(function(){
				var $this = $(this);
				$this.addClass("selected").siblings().removeClass("selected");
				var index = $this.index();
				$(".js-module-item").eq(index).show().siblings(".js-module-item").hide();
			});
		}
};


// 操作大分类Tab的功能
var categoryTabsOperateFunc = {
	init : function(){
		$(".category-tabs").on("click", ".tab-item", function(){
			var $this = $(this);
			var index = $this.index(".tab-item");
			var selectedClass = "selected";
			$this.addClass(selectedClass).siblings().removeClass(selectedClass);
			$(".content-item:eq("+ index +")").show().siblings().hide();
			$("#parentcategoryno").val($this.prop("id").replace("pc_",""));
		});
		$(".tab-func").hover(function(){
			$(this).css("overflow","visible");
		},function(){
			$(this).css("overflow","hidden");
		});
		this.addTab();
		this.modifyTab();
		this.deleteTab();
		this.confirm();
	},
	UpdTypeEnum : {
		ADD_TAB : 1,
		UPD_TAB : 2
	},
	// 操作Tab类型：1增加/2修改
	updType : "",
	addTab : function(){
		var _this = this;
		$(".category-tabs .tab-func .add").click(function(){
			_this.tabType = _this.UpdTypeEnum.ADD_TAB;
			var $pop_parentcategory = $(".pop-parentcategory");
			$pop_parentcategory.find(".popbox-head").text("添加导航");
			$pop_parentcategory.find("input").val("");
			$(".mask").fadeIn(300);
			$pop_parentcategory.fadeIn(300).find("input[type=text]:eq(0)").focus();
		});
	},
	modifyTab : function(){
		var _this = this;
		$(".category-tabs .tab-func .upd").click(function(){
			_this.tabType = _this.UpdTypeEnum.UPD_TAB;
			var $pop_parentcategory = $(".pop-parentcategory");
			$pop_parentcategory.find(".popbox-head").text("修改导航");
			$pop_parentcategory.find("input").val($(".category-tabs").find(".tab-item.selected").text());
			$(".mask").fadeIn(300);
			$pop_parentcategory.fadeIn(300).find("input[type=text]:eq(0)").focus();
		});
	},
	deleteTab : function(){
		$(".category-tabs .tab-func .del").click(function(){
			var $categoryTabs = $(".category-tabs");
			if ($categoryTabs.find(".tab-item").length == 1) {
				alertUtilsFunc.alert("请至少保留一个导航");
				return false;
			}
			var $selectedTab = $(".category-tabs").find(".tab-item.selected");
			var index = $selectedTab.index(".tab-item");
			var $contentItem = $(".content-left-body").find(".content-item:eq("+ index +")");
			// 如果大于1
			if ($contentItem.find(".block").length > 1) {
				alertUtilsFunc.alert("该导航下还有分类，不可删除！");
			} else {
				var parentcategoryno = $selectedTab.prop("id").replace("pc_","");
				doAjaxFunc.doDeleteCategory(parentcategoryno, function(){
					$selectedTab.fadeOut(500,function(){
						$(this).remove();
						$contentItem.remove();
						$(".category-tabs").find(".tab-item:eq(0)").addClass("first selected");
						$(".content-left-body").find(".content-item:first").fadeIn();
					});
				});
			}
		});
	},
	confirm : function(){
		var _this = this;
		$(".pop-parentcategory .confirm-btn").click(function(){
			// 确认新增
			if (_this.tabType == _this.UpdTypeEnum.ADD_TAB) {
				doAjaxFunc.doAddParentCategory(function(parentcategoryno,parentcategoryname){
					$("#parentcategoryno").val(parentcategoryno);
					var $tabTemplate = $(".tab-template").clone().removeClass("tab-template");
					$tabTemplate.prop("id","pc_" + parentcategoryno).text(parentcategoryname);
					var $contentItemTemplate = $(".content-item-template").clone().removeClass("content-item-template");
					var $categoryTabs = $(".category-tabs");
					var $tabItems = $categoryTabs.find(".tab-item");
					$tabItems.removeClass("selected").last().after($tabTemplate);
					$tabTemplate.fadeIn();
					// 隐藏其他分类导航
					var $contentLeftBody = $(".content-left-body");
					$contentLeftBody.find(".content-item").hide();
					$contentLeftBody.append($contentItemTemplate);
					$(".mask").hide();
					$(".pop-parentcategory").hide();
					$tabTemplate.fadeIn();
					$contentItemTemplate.fadeIn();
					_this.tabType = null;
				});
			} else 
			// 确认修改	
			if (_this.tabType == _this.UpdTypeEnum.UPD_TAB) {
				doAjaxFunc.doUpdParentCategory(function(parentcategoryno,parentcategoryname){
					$("#pc_" + parentcategoryno).text(parentcategoryname);
					$(".mask").hide();
					$(".pop-parentcategory").hide();
					_this.tabType = null;
				});
			}
		});
	}
};

// 操作分类标题的功能
var categoryOperateFunc = {
	// 初始化事件
	init : function() {
		this.hoverTitle();
		this.modifyTitle();
		this.confirmModify();
		this.cancelModify();
		this.deleteCategory();
		this.unLockCategory();
	},
	// 鼠标经过标题时候
	hoverTitle : function() {
		var selfFunc = this;
		$(".content-left-body").on("mouseenter mouseleave", ".block-head",function(event) {
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
		$(".content-left-body").on("dblclick",".block-head",function() {
			if (!$(this).hasClass("modify")) {
				selfFunc.closeOtherModifyTitle();
				var $title = $(this).find(".block-head-title");
				var titleText = $title.text();
				var inputHtml = '<input class="updatetitle" type="text" style="background-color:'
						+ $title.css("background-color") + '">';
				$title.html(inputHtml).parent().addClass(
						"modify");
				$title.find("input").focus().val(titleText).data("title",titleText);
				selfFunc.appendBoxTitleUpdateBtn($title);
			}
		});
	},
	// 确定修改标题
	confirmModify : function() {
		var selfFunc = this;
		$(".content-left-body").on("click", ".confirmicon", function() {
			var $this = $(this);
			var $block = $this.parents(".block");
			var categoryno = $block.find(".category-title").attr("value");
			var categoryname = $block.find(".updatetitle").val();
			var updateParams = {
					categoryno : categoryno,
					categoryname : categoryname
			};
			// 保存修改并且回调
			doAjaxFunc.doUpdateCategoryName(updateParams,function(){
				var $headFuncSpan = $this.parent();
				selfFunc.removeBoxTitleUpdateBtn($headFuncSpan);
				initLoadFunc.setCacheList(initLoadFunc.CacheTypeEnum.UPDATE_CATEGORY_NAME, updateParams);
			});
		});
		// 监听回车键
		$(".content-left-body").on("keydown",".updatetitle", function(e){
			if(e.keyCode==13){
				$(".content-left-body").find(".confirmicon").click();
			} else if (e.keyCode == 27) {
				$(".content-left-body").find(".cancelicon").click();
			}
		});
	},
	// 取消修改
	cancelModify : function() {
		var selfFunc = this;
		$(".content-left-body").on("click", ".cancelicon", function() {
			var $this = $(this);
			// 如果没有修改，返回初始值
			var $input = $this.parents(".block").find(".updatetitle");
			$input.val($input.data("title"));
			$input.removeData("title");
			var $headFuncSpan = $this.parent();
			selfFunc.removeBoxTitleUpdateBtn($headFuncSpan);
		});
	},
	// 删除分类
	deleteCategoryNo : "",
	deleteCategory : function(){
		var selfFunc = this;
		// 关闭提示框
		$(".content-left-body").on("click", ".closeicon", function() {
			selfFunc.deleteCategoryNo = $(this).parents(".block").find(".category-title").attr("value");
			var $urlList = $(this).parents(".block").find(".url-list");
			if($urlList.find("li").length > 0) {
				alertUtilsFunc.alert("该分类下还有网址，不可删除！");
			} else {
				$(".popbox-for-confirm").show();
			}
		});
		// 确认删除分类
		$(".popbox-for-confirm .tip-confirm-btn").click(function(){
			$(".popbox-for-confirm").hide();
			doAjaxFunc.doDeleteCategory(selfFunc.deleteCategoryNo, function(){
				$(".wrap-box").find("#c_"+selfFunc.deleteCategoryNo).slideUp(function(){
					$(this).remove();
				});
				// 从缓存中清除数据
				initLoadFunc.setCacheList(initLoadFunc.CacheTypeEnum.DELETE_CATEGORY, selfFunc.deleteCategoryNo);
				selfFunc.deleteCategoryNo = "";
			});
		});
	},
	// 解锁分类
	unLockCategory : function(){
		$(".content-left-body").on("click", ".lock-url", function() {
			var _this = $(this);
			var unlockClass = "unlock";
			if (_this.hasClass(unlockClass)) {
				_this.removeClass(unlockClass);
				_this.next(".unlock-url").remove();
			} else {
				_this.addClass(unlockClass);
				var $unLockTemplate = $(".unlock-category-template").children().clone();
				_this.after($unLockTemplate);
				$unLockTemplate.find("input").focus();
			}
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
	// 插入[删除分类，新增网址]按钮模板
	appendBoxHeadOperateBtn : function($target) {
		if (!$target.hasClass("modify")) {
			var operateHtml = '';
//			operateHtml += '<span title="新增网址" class="addicon"></span>';
			operateHtml += '<span title="删除分类" class="closeicon"></span>';
			$target.find(".block-head-func").append(operateHtml);
		}
	},
	// 移除[删除分类，新增网址]按钮
	removeBoxHeadOperateBtn : function($target) {
		if (!$target.hasClass("modify")) {
			$target.find(".block-head-func").html("");
		}
	}
};

// 操作网址功能
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
	// 鼠标经过网址
	hoverBookmark : function() {
		var selfFunc = this;
		$(".content").on("mouseenter mouseleave", ".url-list li",function(event) {
			var $li = $(this);
			if (event.type == "mouseenter") {
				var color = $li.parent().parent().siblings(
						".head-style").css("background-color");
				$li.css("background-color", color).siblings().attr(
						"style", "");
				var urlOperateBtnTemplate = selfFunc.getUrlOperateBtn($li);
				// 18为图标宽度
				var width = $("<div>"+urlOperateBtnTemplate+"</div>").find("span:not(.staricon)").length * 18;
				var bookmarkNameWith = $li.find("a").width();
				$li.find("a").css("max-width",bookmarkNameWith-width);
				$li.find(".operatebtn").append(urlOperateBtnTemplate);
			} else if (event.type == "mouseleave") {
				$li.attr("style", "").find("a").attr("style", "");
				selfFunc.removeUrlOperateBtn($li);
			}
		});
	},
	// 新增网址
	addBookmark : function() {
		var selfFunc = this;
		$(".content-left-body").on("click", ".addicon", function() {
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
	// 编辑网址
	editBookmark : function() {
		var selfFunc = this;
		$(".content-left-body").on("click", ".editicon", function() {
			// 如果已经存在,不需要再增加一个模板
			var $this = $(this);
			var $thisli = $this.parents("li");
			var $nextli = $thisli.next();
			if ($nextli.find(".editbookmark").length == 0) {
				// 每次打开新的模板之前，先关闭其他开着的模板
				selfFunc.closeAllEditBookmarkTemplate();
				var $li = $this.parents("li").removeClass("save-success").addClass("li-disabled pointto");
				var $a = $li.find("a");
				var values = {};
				values.url = $a.attr("href");
				values.name = $a.text();
				// 编辑网址的时候，需要重新加载标签以及描述
				$.ajax({
					type : "post",
					url : CONTEXT_PATH + "/doGetTagsAndDescByBookmarkNo",
					data : {
						bookmarkno : $thisli.attr("value")
					},
					success : function(json) {
						if(json.result == "OK"){
							var bookmark = json.data;
							if(bookmark){
								values.tags = bookmark.tags;
								values.desc = bookmark.desc;
							}
						}
						// 不管成功与否，直接显示
						selfFunc.appendEditBookmarkTemplate($li, values);
					}
				});
			} else {
				selfFunc.closeAllEditBookmarkTemplate();
			}
		});
	},
	// 删除网址
	delBookmark : function() {
		var selfFunc = this;
		$(".content-left-body").on("click", ".delicon", function() {
			// 如果已经存在,不需要再增加一个模板
			var $this = $(this);
			if ($this.parents("li").next().find(".delbookmark").length == 0) {
				// 每次打开新的模板之前，先关闭其他开着的模板
				selfFunc.closeAllEditBookmarkTemplate();
				var $li = $this.parents("li").removeClass("save-success").addClass("li-disabled pointto");
				selfFunc.appendDelBookmarkTemplate($li);
			} else {
				selfFunc.closeAllEditBookmarkTemplate();
			}
		});
	},
	// 标记为常用网址
	setHotBookmark : function() {
		var selfFunc = this;
		$(".content-left-body").on("click", ".operatebtn .staricon", function() {
			var $this = $(this);
			var $parentLi = $this.parents("li");
			var bookmarkno = $parentLi.attr("value");
			var $hotUrlList = $(".hot-url-list");
			if ($this.hasClass("light")) {
				doAjaxFunc.doCancelHotBookmark(bookmarkno, function(){
					$this.removeClass("light").attr("title", "标记为常用网址");
					$hotUrlList.find("li[value='"+ bookmarkno +"']").fadeOut(function(){
						$(this).remove();
					});
				});
			} else {
				doAjaxFunc.doSetHotBookmark(bookmarkno,function(){
					$this.addClass("light").attr("title", "从常用网址取消");
					var url = $parentLi.find("a").prop("href");
					var name = $parentLi.find("a").text();
					var valuesObj = {};
					valuesObj.bookmarkno = bookmarkno;
					valuesObj.url = url;
					valuesObj.bookmarkname = name;
					valuesObj.isDisplay = true;
					var hotBookmarkTemplate = selfFunc.getBookmarkTemplate(valuesObj);
					$hotUrlList.append(hotBookmarkTemplate);
					new JumpObj($hotUrlList.find("li:last")[0], 15).jump();
				});
			}
		});
	},
	// 确定网址
	confirmEditBookmark : function() {
		selfFunc = this;
		$(".content-left-body").on("click", ".confirmediticon", function() {
			var $thisBtn = $(this);
			// 确认新增网址
			if ($thisBtn.parents(".addbookmark").length > 0) {
				// 保存数据
				doAjaxFunc.doAddbookmark(function(newBookmarkNo,categoryno){
					// 保存数据成功后的回调方法
					bookmarkOperateFunc.closeAllEditBookmarkTemplate();
					var $addbookmarkform = $("#addbookmarkform");
					var url = $addbookmarkform.find("#url").val();
					var name = $addbookmarkform.find("#bookmarkname").val();
					// 获取新增网址的模板
					var valuesObj = {};
					valuesObj.bookmarkno = newBookmarkNo;
					valuesObj.bookmarkname = name;
					valuesObj.url = url;
					var template = selfFunc.getBookmarkTemplate(valuesObj);
					// 添加一个新网址
					var $ul = $addbookmarkform.parents("ul");
					$ul.prepend(template);
					$ul.find("li:eq(0)").addClass("save-success").slideDown();
					// 缓存数据
					valuesObj.categoryno = categoryno;
					initLoadFunc.setCacheList(initLoadFunc.CacheTypeEnum.NEW_BOOKMARK, valuesObj);
				});
			}
			// 确认编辑网址
			else if ($thisBtn.parents(".editbookmark").length > 0) {
				// 保存数据
				doAjaxFunc.doEditBookmark(function(){
					var $editbookmarkform = $("#editbookmarkform");
					bookmarkOperateFunc.closeAllEditBookmarkTemplate();
					// 获取要修改的网址，并修改成新的内容
					var name = $editbookmarkform.find("#bookmarkname").val();
					var url = $editbookmarkform.find("#url").val();
					var $updateli = $editbookmarkform.parents("li").prev(".pointto");
					var $updateli_a = $updateli.find("a");
					$updateli_a.html(name);
					$updateli_a.attr("href",url);
					// 添加更新成功图标
					$updateli.addClass("save-success");
					// 如果更新的网址是常用网址，常用网址也要跟着变化
					var isHotBookmark = $updateli.find(".staricon").hasClass("light");
					var bookmarkno = $updateli.attr("value");
					if (isHotBookmark) {
						var $hotBookmark = $(".hot-url-list").find("li[value='"+ bookmarkno +"']");
						$hotBookmark.find("a").html(name);
						$hotBookmark.find("a").attr("href",url);
					}
					// 缓存数据
					var valuesObj = {};
					valuesObj.bookmarkno = bookmarkno;
					valuesObj.bookmarkname = name;
					valuesObj.url = url;
					initLoadFunc.setCacheList(initLoadFunc.CacheTypeEnum.UPDATE_BOOKMARK, valuesObj);
				});
			}
			// 确认删除网址
			else if ($thisBtn.parents(".delbookmark").length > 0) {
				var $delObj = $thisBtn.parents(".editbookmarktemplate").prev();
				var bookmarkno = $delObj.attr("value");
				var isHotBookmark = $delObj.find(".staricon").hasClass("light");
				flyTool.play($delObj,function(){
					// 删除后的回调，如果删除的网址是常用网址，那么需要从常用上删除
					if (isHotBookmark){
						$(".hot-url-list").find("li[value='"+ bookmarkno +"']").fadeOut(function(){
							$(this).remove();
						});
					}
					// 从缓存中清除数据
					initLoadFunc.setCacheList(initLoadFunc.CacheTypeEnum.DELETE_BOOKMARK, bookmarkno);
				});
				selfFunc.closeAllEditBookmarkTemplate();
			}
		});
		// 监听回车键,ESC键
		$(".content-left-body").on("keydown",".editbookmarktemplate :input",function(e){
			if(e.keyCode==13){
				$(".content-left-body").find(".confirmediticon").click();
			} else if(e.keyCode==27){
				$(".content-left-body").find(".cancelediticon").click();
			}
		});
	},
	// 取消网址
	cancelEditBookmark : function() {
		selfFunc = this;
		$(".content-left-body").on("click", ".cancelediticon", function() {
			selfFunc.closeAllEditBookmarkTemplate();
		});
	},
	// 插入网址操作按钮模板
	getUrlOperateBtn : function($li) {
		var operateHtml = '';
		if ($li.find(".light").length == 0) {
			operateHtml += '<span title="标记为常用网址" class="staricon"></span>';
		}
		operateHtml += '<span title="编辑网址" class="editicon"></span>';
		operateHtml += '<span title="删除网址" class="delicon"></span>';
		return operateHtml;
	},
	// 删除网址操作按钮
	removeUrlOperateBtn : function($li) {
		$li.find(".operatebtn > span").not(".light").remove();
	},
	// 新增网址模板
	appendAddBookmarkTemplate : function($ul) {
		var operateHtml = this.getAddAndEditBookmarkTemplate("addbookmark");
		$ul.append(operateHtml);
		$ul.find(".editbookmarktemplate").slideDown(function(){
			$(this).find("input[type=text]:eq(0)").focus();
		});
	},
	// 编辑网址模板
	appendEditBookmarkTemplate : function($li, values) {
		var operateHtml = this.getAddAndEditBookmarkTemplate("editbookmark",
				values);
		$li.after(operateHtml);
		$li.next().slideDown(function(){
			$(this).find("input[type=text]:eq(0)").focus();
		});
	},
	// 删除网址模板
	appendDelBookmarkTemplate : function($li) {
		var operateHtml = '';
		operateHtml += '<li class="editbookmarktemplate li-disabled" style="display:none;">';
		operateHtml += '<div class="delbookmark">';
		operateHtml += '	<p><span class="delconfirmmsg">您确定删除本网址吗？</span></p>';
		operateHtml += '	<p><span class="deltip">提示:删除后可以到<font color="#000">回收小站</font>找回哦!</span></p>';
		operateHtml += '	<p class="btn">';
		operateHtml += '		<span class="confirmediticon" title="确定"></span>';
		operateHtml += '		<span class="cancelediticon" title="取消"></span>';
		operateHtml += '	</p>';
		operateHtml += '</div>';
		operateHtml += '</li>';
		$li.after(operateHtml);
		$li.next().slideDown();
	},
	// 关闭其他正在编辑的网址模板
	closeAllEditBookmarkTemplate : function() {
		$(".content-left-body").find(".editbookmarktemplate").slideUp(function() {
			var $this = $(this);
			$this.prev(".pointto").removeClass("li-disabled pointto");
			$this.remove();
		});
	},
	// 新增网址与编辑网址公用模板
	getAddAndEditBookmarkTemplate : function(editclass, values) {
		var url = "", name = "", tags = "", desc = "";
		var editTitle = "";
		if (values) {
			url = values.url ? values.url : "";
			name = values.name ? values.name : "";
			tags = values.tags ? values.tags : "";
			desc = values.desc ? values.desc : "";
			editTitle = "编辑书签";
		} else {
			editTitle = "新增书签";
		}
		var operateHtml = '';
		// addbookmarkform or editbookmarkform
		operateHtml += '<li class="editbookmarktemplate li-disabled" style="display:none;">';
		operateHtml += '<form id="' + editclass + 'form">';
		operateHtml += '<div class="' + editclass + '">';
		operateHtml += '	<p class="edit-title">' + editTitle + '</p>';
		operateHtml += '	<p><label>网址</label><input type="text" id="url" name="url" placeholder="例:www.52url.com" value="' + url + '"/></p>';
		operateHtml += '	<p><label>名称</label><input type="text" id="bookmarkname" name="bookmarkname" placeholder="例:网址收藏" value="' + name + '"/></p>';
		operateHtml += '	<p><label>标签</label><input type="text" id="tags" name="tags" placeholder="逗号(,)分隔,最多5个" value="' + tags + '"/></p>';
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
	// 新增网址
	getBookmarkTemplate : function(values) {
		var id="",url="",name="",hot="",tags="",isDisplay = false;
		if (values) {
			id = values.bookmarkno ? values.bookmarkno : "";
			name = values.bookmarkname ? values.bookmarkname : "";
			url = values.url ? values.url : "";
			hot = values.hot ? values.hot : "";
			tags = values.tags ? values.tags : "";
			isDisplay = values.isDisplay ? values.isDisplay : false;
		}
		var operateHtml = '';
		if (isDisplay){
			operateHtml += '<li';	
		} else {
			operateHtml += '<li style="display:none;"';
		}
		operateHtml += ' id="h_'+ id +'" value="'+ id +'" title="'+ name +'" class="filter-item '+ tags +'"><a href="' + url + '" target="_blank">' + name + '</a>';
		operateHtml += '<div class="operatebtn">';
		if (hot == "1") {
			operateHtml += '<span title="从常用网址取消" class="staricon light"></span>';
		}
		operateHtml += '</div></li>';
		return operateHtml;
	}
};

// 放入回收站的飞行动作
var flyTool = {
	play : function($flyer,delCallback) {
		var bookmarkno = $flyer.attr("value");
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
			// 放入回收站后再执行删除处理
			doAjaxFunc.doDeleteBookmark(bookmarkno,delCallback);
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
		//进入回收站页面
		$(".trashcan").click(
			function ()
			{
				window.location.href="recycle";
			});
		//进入意见反馈页面
		$(".fun1").click(
			function ()
			{
				window.location.href="useridea";
			});
		//进入资金赞助页面
		$(".fun2").click(
			function ()
			{
				window.location.href="donate";
			});
	}
};
// scrollBar
var scrollBarFunc = {
		init : function(){
			var bars = '.jspVerticalBar';
			$('.scroll-pane').bind('jsp-initialised', function (event, isScrollable) {
				$(this).find(bars).hide();
			}).jScrollPane().hover(
				function () {
					$(this).find(bars).stop().fadeTo('fast', 0.9);
				},
				function () {
					$(this).find(bars).stop().fadeTo('fast', 0);
				}
			);
		}
};
// 编辑专题
var editSubjectFunc = {
		init:function(){
			var $pop_subject = $(".pop-subjuct");
			$pop_subject.find(".edit-sub-head").click(function(){
				$pop_subject.find(".h-sub").show().next().hide();
			});
			
			$pop_subject.find(".list-item .item").click(function(){
				$pop_subject.find(".l-sub").show().prev().hide();
			});
		},
		// 新增专题
		// 编辑专题
		
		// 添加专题书签
		// 编辑专题书签
		// 删除专题书签
		// 上传专题图片
		// 编辑专题标题/描述
};