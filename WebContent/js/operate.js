var initLoadFunc = {
	init : function(activeBookmarkFunc){
		this.loadAllBookmarkList(activeBookmarkFunc);
	},
	// 本地书签缓存
	CacheList : "",
	// 更新本地缓存的方式枚举
	CacheTypeEnum : {
		// 新增分类
		NEW_CATEGORY : "NC",
		// 编辑分类名称
		UPDATE_CATEGORY_NAME : "UC",
		// 删除分类
		DELETE_CATEGORY : "DC",
		// 新增书签
		NEW_BOOKMARK : "NB",
		// 编辑书签名称
		UPDATE_BOOKMARK : "UB",
		// 删除书签
		DELETE_BOOKMARK : "DB"
	},
	// 加载所有书签
	loadAllBookmarkList : function(activeBookmarkFunc){
		var _this = this;
		$.ajax({
			type : "post",
			url : CONTEXT_PATH + "/doSelectBookmarkList",
			success : function(json) {
				if(json.result == "OK") {
					if (json.data && json.data.length > 0) {
						_this.CacheList = json.data;
						for(var i=0; i<json.data.length; i++){
							var categoryno = _this.CacheList[i].i;
							var categoryname = _this.CacheList[i].n;
							var categorycolno = _this.CacheList[i].c;
							var bookmarklist = _this.CacheList[i].list;
							// 复制一个分类模板
							var $clone = $(".category-template").clone().attr("style","").removeClass("category-template");
							// 添加新分类模板标题颜色
							var rand = parseInt(Math.random() * 20, 10);
							$clone.prop("id","c_"+categoryno);
							$clone.find(".block-head").css("background-color",randomColor[rand]);
							$clone.find(".block-head-title").text(categoryname)
									.attr("value",categoryno).prop("id","category_" + categoryno);
							// 绘制分类下的书签列
							if (bookmarklist && bookmarklist.length > 0) {
								var bookmarkHtml = '';
								for (var n in bookmarklist) {
									var id = bookmarklist[n].i;
									var url = bookmarklist[n].u;
									var name = bookmarklist[n].n;
									var hot = bookmarklist[n].h;
									var valueObj = {};
									valueObj.bookmarkno = id;
									valueObj.bookmarkname = name;
									valueObj.url = url;
									valueObj.hot = hot;
									valueObj.isDisplay = true;
									bookmarkHtml += bookmarkOperateFunc.getBookmarkTemplate(valueObj);
									
									// 书签名称转成拼音
									var bookmarkpinyin = PinyinUtil.getFullChars(name).toUpperCase();
									var bookmarkpinyinhead = PinyinUtil.getCamelChars(name).toUpperCase();
									bookmarklist[n].py = bookmarkpinyin;
									bookmarklist[n].pyh = bookmarkpinyinhead;
								}
								$clone.find(".url-list").append(bookmarkHtml);
							}
							$(".wrap-box").eq(categorycolno).append($clone);
							// 分类名称转成拼音
							var categorypinyin = PinyinUtil.getFullChars(categoryname).toUpperCase();
							var categorypinyinhead = PinyinUtil.getCamelChars(categoryname).toUpperCase();
							_this.CacheList[i].py = categorypinyin;
							_this.CacheList[i].pyh = categorypinyinhead;
						} 
					}
				}
				// 激活操作书签的各种功能
				activeBookmarkFunc();
			},
			error : function(e) {
				alert(e);
			}
		});
	},
	setCacheList : function(cacheType , valueObj){
		if (!valueObj) {
			return;
		}
		switch(cacheType){
			case this.CacheTypeEnum.NEW_CATEGORY :
				commonUtilsFunc.calCategoryCnt(1);
				this._addCategory(valueObj);
				break;
			case this.CacheTypeEnum.UPDATE_CATEGORY_NAME :
				this._updateCategory(valueObj);
				break;
			case this.CacheTypeEnum.DELETE_CATEGORY :
				commonUtilsFunc.calCategoryCnt(-1);
				this._removeCategory(valueObj);
				break;
			case this.CacheTypeEnum.NEW_BOOKMARK :
				commonUtilsFunc.calBookmarkCnt(1);
				this._addBookmark(valueObj);
				break;
			case this.CacheTypeEnum.UPDATE_BOOKMARK :
				this._updateBookmark(valueObj);
				break;
			case this.CacheTypeEnum.DELETE_BOOKMARK :
				commonUtilsFunc.calBookmarkCnt(-1);
				this._removeBookmark(valueObj);
				break;
		}
	},
	_getCategory : function(categoryno){
		if (!categoryno){
			return;
		}
		var category = null;
		var list = this.CacheList;
		for(var i in list) {
			var cacheCategory = list[i];
			if (cacheCategory.i == categoryno) {
				category = cacheCategory;
				break;
			}
		}
		return category;
	},
	_addCategory : function(valueObj){
		var setCategory = {};
		setCategory.i = valueObj.categoryno;
		var categoryname = valueObj.categoryname;
		setCategory.n = categoryname;
		setCategory.py = PinyinUtil.getFullChars(categoryname).toUpperCase();
		setCategory.pyh = PinyinUtil.getCamelChars(categoryname).toUpperCase();
		this.CacheList.push(setCategory);
	},
	_updateCategory : function(valueObj){
		if(!valueObj.categoryno){
			return;
		}
		var category = this._getCategory(valueObj.categoryno);
		if(category){
			var categoryname = valueObj.categoryname;
			category.n = categoryname;
			category.py = PinyinUtil.getFullChars(categoryname).toUpperCase();
			category.pyh = PinyinUtil.getCamelChars(categoryname).toUpperCase();
		}
	},
	_removeCategory : function(categoryno){
		if(!categoryno){
			return;
		}
		var list = this.CacheList;
		var i = -1;
		for(i in list) {
			var cacheCategory = list[i];
			if (cacheCategory.i == categoryno) {
				break;
			}
		}
		if (i >= 0) {
			list.splice(i,1);
		}
	},
	_addBookmark : function(valueObj){
		if (!valueObj.categoryno) {
			return;
		}
		var category = this._getCategory(valueObj.categoryno);
		if (category) {
			var bookmark = {};
			bookmark.i = valueObj.bookmarkno;
			bookmark.u = valueObj.url;
			var bookmarkname = valueObj.bookmarkname;
			bookmark.n = bookmarkname;
			bookmark.py = PinyinUtil.getFullChars(bookmarkname).toUpperCase();
			bookmark.pyh = PinyinUtil.getCamelChars(bookmarkname).toUpperCase();
			var list = category.list;
			// 如果该分类存在书签
			if (list) {
				list.push(bookmark);
			} else {
				var list = [];
				list.push(bookmark);
				category.list = list;
			}
		}
	},
	_updateBookmark : function(valueObj){
		if(!valueObj.bookmarkno){
			return;
		}
		var bookmark = null;
		var list = this.CacheList;
		outerLoop : 
		for(var i in list) {
			var booklist = list[i].list;
			if (!booklist) {
				continue;
			}
			for (var n in booklist) {
				if (booklist[n].i == valueObj.bookmarkno) {
					bookmark = booklist[n];
					break outerLoop;
				}
			}
		}
		if(bookmark){
			bookmark.u = valueObj.url;
			var bookmarkname = valueObj.bookmarkname;
			bookmark.n = bookmarkname;
			bookmark.py = PinyinUtil.getFullChars(bookmarkname).toUpperCase();
			bookmark.pyh = PinyinUtil.getCamelChars(bookmarkname).toUpperCase();
		}
	},
	_removeBookmark : function(bookmarkno){
		if(!bookmarkno){
			return;
		}
		var list = this.CacheList;
		outerLoop : 
		for(var i in list) {
			var booklist = list[i].list;
			if (!booklist) {
				continue;
			}
			for (var n in booklist) {
				if (booklist[n].i == bookmarkno) {
					booklist.splice(n,1);
					break outerLoop;
				}
			}
		}
	}
};

// 提交数据的Ajax的操作
var doAjaxFunc = {
	// 添加分类
	doNewcategory : function(successCallBack){
		var $newcategoryform = $("#newCategoryForm");
		formValidateFunc.validateNewCategoryForm($newcategoryform);
		if (!$newcategoryform.valid()) {
			return;
		}
		$.ajax({
			data : $newcategoryform.serialize(),
			type : "post",
			url : CONTEXT_PATH + "/doAddCategory",
			success : function(json) {
				if (json.result == "OK") {
					var newCategoryNo = json.data;
					successCallBack(newCategoryNo);
				} else {
					validateErrorsUtil.showValidateErrors($newcategoryform, json.errors);
				}
			},
			error : function(e) {
			}
		});
	},
	// 删除书签
	doDeleteCategory : function(categoryno,successCallback){
		// 提交后台保存
		$.ajax({
			type : "post",
			url : CONTEXT_PATH + "/doDeleteCategory",
			data : {
				categoryno : categoryno
			},
			success : function(json) {
				if (json.result == "OK") {
					successCallback();
				} else {
					alert(json.msg);
				}
			},
			error : function(e) {
			}
		});
	},
	// 添加书签
	doNewBookmark : function(successCallBack){
		var $newBookmarkForm = $("#newBookmarkForm");
		formValidateFunc.validateNewBookmarkForm($newBookmarkForm);
		if (!$newBookmarkForm.valid()) {
			return;
		}
		// 补足URL的HTTP前缀
		var url = this.fillUrl($newBookmarkForm.find("#url").val());
		$newBookmarkForm.find("#url").val(url);
		$.ajax({
			data : $newBookmarkForm.serialize(),
			type : "post",
			url : CONTEXT_PATH + "/doAddBookmark",
			success : function(json) {
				if (json.result == "OK") {
					successCallBack($newBookmarkForm,json.data);
				} else {
					validateErrorsUtil.showValidateErrors($newBookmarkForm, json.errors);
				}
			},
			error : function(e) {
			}
		});
	},
	// 新增书签
	doAddbookmark : function(successCallBack) {
		var $addbookmarkform = $("#addbookmarkform");
		formValidateFunc.validateBookmarkForm($addbookmarkform);
		if (!$addbookmarkform.valid()) {
			return;
		}
		// 补足URL的HTTP前缀
		var url = this.fillUrl($addbookmarkform.find("#url").val());
		$addbookmarkform.find("#url").val(url);
		var categoryno = $addbookmarkform.parents(".block").find(".block-head-title").attr("value");
		var params = $addbookmarkform.serialize();
		params += "&categoryno=" + categoryno;
		$.ajax({
			data : params,
			type : "post",
			url : CONTEXT_PATH + "/doAddBookmark",
			success : function(json) {
				if (json.result == "OK") {
					// 返回新增的书签编号
					var newBookmarkNo = json.data;
					successCallBack(newBookmarkNo,categoryno);
				} else {
					validateErrorsUtil.showValidateErrors($addbookmarkform, json.errors);
				}
			},
			error : function(e) {
			}
		});
	},
	// 编辑书签
	doEditBookmark : function(successCallBack) {
		// 表单验证
		var $editbookmarkform = $("#editbookmarkform");
		formValidateFunc.validateBookmarkForm($editbookmarkform);
		if (!$editbookmarkform.valid()) {
			return;
		}
		var url = this.fillUrl($editbookmarkform.find("#url").val());
		$editbookmarkform.find("#url").val(url);
		var bookmarkno = $editbookmarkform.parents("li").prev(".pointto").attr("value");
		var params = $editbookmarkform.serialize();
		params += "&bookmarkno=" + bookmarkno;
		// 提交后台保存
		$.ajax({
			type : "post",
			url : CONTEXT_PATH + "/doUpdateBookmark",
			data : params,
			success : function(json) {
				if (json.result == "OK") {
					successCallBack();
				} else {
					validateErrorsUtil.showValidateErrors($editbookmarkform, json.errors);
				}
			},
			error : function(e) {
			}
		});
	},
	// 删除书签
	doDeleteBookmark : function(bookmarkno,successCallback){
		// 提交后台保存
		$.ajax({
			type : "post",
			url : CONTEXT_PATH + "/doDeleteBookmark",
			data : {
				bookmarkno : bookmarkno
			},
			success : function(json) {
				if (json.result == "OK") {
					successCallback();
				} else {
					alert(json.msg);
				}
			},
			error : function(e) {
			}
		});
	},
	// 设置常用书签
	doSetHotBookmark : function(bookmarkno,successCallBack){
		$.ajax({
			type : "post",
			url : CONTEXT_PATH + "/doSetHotBookmark",
			data : {
				bookmarkno : bookmarkno
			},
			success : function(json) {
				if (json.result == "OK") {
					successCallBack();
				} else {
					alert(json.msg);
				}
			},
			error : function(e) {
			}
		});
	},
	// 取消常用书签
	doCancelHotBookmark : function(bookmarkno,successCallBack){
		$.ajax({
			type : "post",
			url : CONTEXT_PATH + "/doCancelHotBookmark",
			data : {
				bookmarkno : bookmarkno
			},
			success : function(json) {
				if (json.result == "OK") {
					successCallBack();
				} else {
					alert(json.msg);
				}
			},
			error : function(e) {
			}
		});
	},
	// 修改分类标题
	doUpdateCategoryName : function(updateParams,successCallBack){
		$.ajax({
			type : "post",
			url : CONTEXT_PATH + "/doUpdateCategoryName",
			data : updateParams,
			success : function(json) {
				if (json.result == "OK") {
					successCallBack();
				} else {
					alert(json.msg);
				}
			},
			error : function(e) {
			}
		});
	},
	// 补足完整的Url
	fillUrl : function(url){
		// 判断是不是带有Http或者ftp前缀
		if (url.indexOf("http") == 0 || url.indexOf("ftp") == 0 ) {
		} else {
			url = "http://" + url;
		}
		return url;
	},
	// 保存成功后的动画提示
	saveSuccessAnimate : function(msg){
		var $popCallBack = $(".pop-callback-success");
		$popCallBack.find(".callbackmsg").html(msg);
		$popCallBack.animate({
			top : "10px",
			opacity : 1
		}, 800, function() {
			$(this).delay(800).animate({
				top : "-350px",
				opacity : 0.3
			}, 500);
		});
	},
	saveErrorAnimate : function(msg){
		var $popCallBack = $(".pop-callback-error");
		$popCallBack.find(".callbackmsg").html(msg);
		$popCallBack.animate({
			top : "5px",
			opacity : 1
		}, 800, function() {
			$(this).delay(800).animate({
				top : "-350px",
				opacity : 0.3
			}, 500);
		});
	}
};

// 表单验证操作
var formValidateFunc = {
	init : function(){
		$.validator.setDefaults({
			focusCleanup : true
		});
	},
	// 验证添加分类
	validateNewCategoryForm : function($form){
		$form.validate({
			rules : {
				categoryname : {
					required : true
				}
			},
			messages : {
				categoryname : {
					required : "请输入名称"
				}
			}
		});
	},
	// 验证添加书签
	validateNewBookmarkForm : function($form){
		return $form.validate({
			rules : {
				url : {
					required : true,
					isUrl : true
				},
				bookmarkname : {
					required : true
				},
				categoryname : {
					required : true
				}
			},
			messages : {
				url : {
					required : "请输入网址",
					isUrl : "请输入合法的网址"
				},
				bookmarkname : {
					required : "请输入名称"
				},
				categoryname : {
					required : "请输入分类"
				}
			}
		});
	},
	// 验证新增书签或者编辑书签表单
	validateBookmarkForm : function($form) {
		return $form.validate({
			rules : {
				url : {
					required : true,
					isUrl : true
				},
				bookmarkname : {
					required : true
				}
			},
			messages : {
				url : {
					required : "请输入网址",
					isUrl : "请输入合法的网址"
				},
				bookmarkname : {
					required : "请输入名称"
				}
			}
		});
	}
};

var commonUtilsFunc = {
	// 分类数目计算
	calCategoryCnt : function(cnt){
		var $categoryCnt = $(".categorycount label");
		this.scrollAnimate($categoryCnt,cnt);
	},
	// 书签数目计算
	calBookmarkCnt : function(cnt){
		var $bookmarkCnt = $(".bookmarkcount label");
		this.scrollAnimate($bookmarkCnt,cnt);
	},
	// 滚动效果
	scrollAnimate : function($obj,cnt){
		var top = (cnt/Math.abs(cnt))* 40;
		$obj.animate({
			"top" : top + "px"
		},400,function(){
			$obj.text(parseInt($obj.text()) + cnt);
			$obj.css("top", ((-1) * top) + "px").animate({
				"top" : "0px"
			},400);
		});
	}
};