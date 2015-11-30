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
	
	$(function(){
		$("#recyclebtn").click( 
				function ()
				{
					//window.location.href="../jsp/recycle.jsp";
					window.location.href="recycle";
				});
	});
	

	$(function() {
	 		$.ajax({
				type : "post",
				url : "${context_path}/doSelectBookmarkList",
				dataType:"json",
				success : function(json) {
					//alert(json[0].url);
					 for(var i=0;i<json.length;i++){  
					   //alert(json); 
					  $("#ddd").val(json[i].bookmarkid + json[i].bookmarkname+json[i].url);
					  $("#hotlist").append("<li><a href="+json[i].url+">"+json[i].bookmarkname+"</a></li>");
					}    
				},
				error : function(e) {
					alert(e);
				}
			});
	 		
	 		$.ajax({
				type : "post",
				url : "${context_path}/doSelectCategoryList",
				dataType:"json",
				success : function(json) {
					//alert(json[0].url);
					 for(var i=0;i<json.length;i++){  
					   //alert(json); 
					  $("#categorylist").append("<li>"+json[i].categoryname+"</li>");
					}    
				},
				error : function(e) {
					alert(e);
				}
			});
	
	}
	); 
	
	function addbookmark(){
		$.ajax({
			data:$("#addform").serialize(),
			type : "post",
			url : "${context_path}/doAddBookmark",
			success : function(json) {
				if(json>0){
					alert("插入成功");
				}else{
					alert("插入失败");
				}
			},
			error : function(e) {
				alert(e);
			}
		});
	}

	function deletebookmark(){
		$.ajax({
			data:'bookmarkid='+$("#inputbookmarkid").val(),
			type : "post",
			url : "${context_path}/doDeleteBookmark",
			success : function(json) {
				if(json>0){
					alert("删除成功");
				}else{
					alert("删除失败");
				}
			},
			error : function(e) {
				alert(e);
			}
		});
	}
	function editbookmark(){
			$.ajax({
				data:$("#editform").serialize(),
				type : "post",
				url : "${context_path}/doUpdateBookmark",
				success : function(json) {
					if(json>0){
						alert("更新成功");
					}else{
						alert("更新失败");
					}
				},
				error : function(e) {
					alert(e);
				}
			});
		}
	function addcategory(){
		
		//alert($('input:radio[name=myradio]:checked').val());
		$.ajax({
			data:"categoryname="+$("#categoryname1").val()+"&categorypermission="+$('input:radio[name=myradio]:checked').val(),
			type:"post",
			url : "${context_path}/doAddCategory",
			success : function(json) {
				if(json>0){
					alert("类别插入成功");
				}else{
					alert("类别插入失败");
				}
			},
			error : function(e) {
				alert(e);
			}
		});
	}
	
	function deletecategory(){
		$.ajax({
			data:'categoryid='+$("#inputcategoryid").val(),
			type : "post",
			url : "${context_path}/doDeleteCategory",
			success : function(json) {
				if(json>0){
					alert("删除分类成功");
				}else{
					alert("删除分类失败");
				}
			},
			error : function(e) {
				alert(e);
			}
		});
	}
	
	function editcategory(){
		$.ajax({
			data:'categoryname='+$("#inputcategoryname").val()+'&categoryid=2',
			type : "post",
			url : "${context_path}/doUpdateCategory",
			success : function(json) {
				if(json>0){
					alert("分类更新成功");
				}else{
					alert("分类更新失败");
				}
			},
			error : function(e) {
				alert(e);
			}
		});
	}
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
			<div>
				<input type="button" id="recyclebtn" value="回收站">
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
					<ul class="hot-url-list" id="hotlist">
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

						<div class="block-body">
							<ul class="url-list">
								<li><a href="###">中文网址测试</a></li>
								<li><a href="###">2222222</a></li>
								<li><a href="###">442244</a></li>
							</ul>
						</div>
					</div>
		</div>
		<div class="content-right">
			<div class=""></div>
		</div>
	
		<input type="text" id="ddd"/><br/>
		<div >
			<form id="addform">
				网站名：<input type="text" id="bookmarkname1" name="bookmarkname"/>
				网址：<input type="text" id="bookmarkurl1" name="url"/>
				<input type="button" id="addbookmarkbtn" value="添加" onClick="addbookmark()"><br/>
			</form>
		</div>
		<div >
		<form id="deleteform">
			<input type="text" id="inputbookmarkid">
			<input type="button" id="deletebookmarkbtn" value="删除" onClick="deletebookmark()"><br>
		</form>
		</div>
		<div >
		<form id="editform">
			<input type="text" id="editbookmarkid" name="bookmarkid">
			<input type="text" id="editbookmarkname" name="bookmarkname">
			<input type="text" id="editbookmarkurl" name="url">
			<input type="button" id="updatebookmark" value="编辑" onClick="editbookmark()"><br>
		</form>
		</div>
		<div >
			<form id="addcategoryform">
				分类名：<input type="text" id="categoryname1" name="categoryname"/><br>
				  <label><input type="radio" name="myradio" id="radiobtn1" value="0" checked="checked" >普通</label>
				    <label><input type="radio" name="myradio" id="radiobtn2" value="1"  >保密</label>
				<input type="button" id="addcategorybtn" value="添加" onClick="addcategory()"><br/>
			</form>
		</div>
			<div >
				<form id="deletecategoryform">
					分类id：<input type="text" id="inputcategoryid" />
					<input type="button" id="deletecategorybtn" value="删除分类" onClick="deletecategory()"><br/>
				</form>
			</div>
		
			<div >
				<form id="editcategoryform">
					修改分类名称：<input type="text" id="inputcategoryname" />
					<input type="button" id="editcategorybtn" value="修改名称" onClick="editcategory()"><br/>
				</form>
				<ul id="categorylist"></ul>
			</div>
	<div class="footer">
		<div class="footer-in"></div>
	</div>
</body>
</html>