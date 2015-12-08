var initLoadFunc = {
	init : function(){
		this.loadAllBookmarkList();
	},
	// 加载所有书签
	loadAllBookmarkList : function(){
		$.ajax({
			type : "post",
			url : CONTEXT_PATH + "/doSelectBookmarkList",
			success : function(json) {
				if(json.result == "OK") {
					if (json.data && json.data.length > 0) {
						for(var i=0; i<json.data.length; i++){
							var categoryno = json.data[i].i;
							var categoryname = json.data[i].n;
							var bookmarklist = json.data[i].list;
							// 复制一个分类模板
							var $clone = $(".category-template").clone().attr("style","").removeClass("category-template");
							// 添加新分类模板标题颜色
							var rand = parseInt(Math.random() * 20, 10);
							$clone.find("input:hidden").attr("id","categoryno_"+categoryno).val(categoryno);
							$clone.find(".block-head").css("background-color",randomColor[rand]);
							$clone.find(".block-head-title").text(categoryname);
							// 绘制分类下的书签列
							if (bookmarklist && bookmarklist.length > 0) {
								var bookmarkHtml = '';
								for (var n in bookmarklist) {
									var id = bookmarklist[n].i;
									var url = bookmarklist[n].u;
									var name = bookmarklist[n].n;
									bookmarkHtml += bookmarkOperateFunc.getBookmarkTemplate(id, url, name, true);
								}
								$clone.find(".url-list").append(bookmarkHtml);
							}
							$(".wrap-box").eq(0).append($clone);
						} 
					}
				}
			},
			error : function(e) {
				alert(e);
			}
		});
	}
};

// 提交数据的Ajax的操作
var doAjaxFunc = {
	// 新增分类
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
		var categoryno = $addbookmarkform.parents(".block").find(".categoryno").val();
		var params = $addbookmarkform.serialize();
		params += "&categoryno=" + categoryno;
		$.ajax({
			data : params,
			type : "post",
			url : CONTEXT_PATH + "/doAddBookmark",
			success : function(json) {
				if (json.result == "OK") {
					successCallBack();
				} else {
					validateErrorsUtil.showValidateErrors($addbookmarkform, json.errors);
				}
			},
			error : function(e) {
			}
		});
	},
	doEditBookmark : function() {
		var doAjaxFuncSelf = this;
		// 表单验证
		var $editbookmarkform = $("#editbookmarkform");
		formValidateFunc.validateBookmarkForm($editbookmarkform);
		if (!$editbookmarkform.valid()) {
			return;
		}
		var url = this.fillUrl($editbookmarkform.find("#url").val());
		$editbookmarkform.find("#url").val(url);
		var name = $editbookmarkform.find("#bookmarkname").val();
		// TODO 还没有完，需要分类ID以及书签ID支持
		
		// 获取要修改的书签，并修改成新的内容
		var $updateli = $editbookmarkform.parents("li").prev(".pointto");
		var $updateli_a = $updateli.find("a");
		$updateli_a.html(name);
		$updateli_a.attr("href",url);
		// 提交后台保存
		$.ajax({
			data : $editbookmarkform.serialize(),
			type : "post",
			url : CONTEXT_PATH + "/doUpdateBookmark",
			success : function(json) {
				if (json.result == "OK") {
					bookmarkOperateFunc.closeAllEditBookmarkTemplate();
					// 添加更新成功图标
					$updateli.addClass("valid-pass");
					// 更新成功提示动作
					doAjaxFuncSelf.saveSuccessAnimate();
				} else {
					validateErrorsUtil.showValidateErrors($editbookmarkform, json.errors);
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
	saveSuccessAnimate : function(){
		$(".pop-callback").animate({
			top : "10px",
			opacity : 1
		}, 500, function() {
			$(this).delay(1000).animate({
				top : "-350px",
				opacity : 0.3
			}, 500);
		});
	}
};

// 表单验证操作
var formValidateFunc = {
	// 验证新增分类
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