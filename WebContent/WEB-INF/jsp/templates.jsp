<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/constants.jsp"%>
<div class="templates">
	<!-- 新增分类导航模板 -->
	<span class="tab-template tab-item selected display-none"></span>
	<div class="content-item-template content-item display-none">
		<div class="wrap-box" value="0">
			<div class="block add-block">
				<span class="add-block-btn categorybtn" title="添加分类">+</span>
			</div>
		</div>
		<div class="wrap-box" value="1"></div>
		<div class="wrap-box" value="2"></div>
		<div class="wrap-box" value="3"></div>
	</div>
	<!-- 分类模板 -->
	<div class="category-template block display-none">
		<div class="block-head head-style">
			<div class="block-head-title category-title">默认分类</div>
			<div class="block-head-func"></div>
		</div>
		<div class="block-body">
			<ul class="url-list">
			</ul>
			<div class="add-url">
				<span class="addicon" title="添加网址"></span>
			</div>
		</div>
	</div>
	<!-- 加密分类模板 -->
	<ul class="lock-category-template display-none">
		<li class="li-disabled lock-url"></li>
	</ul>
	<!-- 解密分类模板 -->
	<ul class="unlock-category-template display-none">
		<li class="li-disabled unlock-url">
			<label class="unlocktxt">密码:</label>
			<input name="categorypsw" type="password" class="unlockpsw">
			<span class="unlockbtn" title="开锁"></span>
		</li>
	</ul>
	<!-- 新增书签模板 -->
	<ul class="bookmarktemplate display-none">
		<li class="editbookmarktemplate li-disabled" style="display:none;">
			<form id="form">
			<div class="">
				<p class="edit-title"></p>
				<p><label>网址</label><input type="text" id="url" name="url" placeholder="例:www.52url.com" value=""/></p>
				<p><label>名称</label><input type="text" id="bookmarkname" name="bookmarkname" placeholder="例:网址收藏" value=""/></p>
				<p><label>标签</label><input type="text" id="tags" name="tags" placeholder="逗号(,)分隔,最多5个" value=""/></p>
				<p><label>描述</label><textarea id="desc" name="desc"></textarea></p>
				<p class="btn">
					<span class="confirmediticon" title="确定"></span>
					<span class="cancelediticon" title="取消"></span>
				</p>
			</div>
			</form>
		</li>
	</ul>
	<!-- 编辑书签模板 -->
	
	<!-- 删除书签模板 -->
	
	<!-- 书签操作按钮模板 -->
	
	<!-- 分类操作按钮模板 -->
	<div class="subject-title-template display-none">
		<input class="updatetitle" type="text" value="" />
		<div class="block-head-func">
			<span title="确定" class="confirmicon"></span>
			<span title="取消" class="cancelicon"></span>
		</div>
	</div>
</div>
