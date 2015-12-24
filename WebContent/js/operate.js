var initLoadFunc = {
	init : function(activeBookmarkFunc){
		this.loadAllBookmarkList(activeBookmarkFunc);
	},
	// 加载所有书签
	loadAllBookmarkList : function(activeBookmarkFunc){
		$.ajax({
			type : "post",
			url : CONTEXT_PATH + "/doSelectBookmarkList",
			success : function(json) {
				if(json.result == "OK") {
					if (json.data && json.data.length > 0) {
						for(var i=0; i<json.data.length; i++){
							var categoryno = json.data[i].i;
							var categoryname = json.data[i].n;
							var categorycolno = json.data[i].c;
							var bookmarklist = json.data[i].list;
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
									bookmarkHtml += bookmarkOperateFunc.getBookmarkTemplate(id, url, name, hot, true);
								}
								$clone.find(".url-list").append(bookmarkHtml);
							}
							$(".wrap-box").eq(categorycolno).append($clone);
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
					successCallBack(newBookmarkNo);
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