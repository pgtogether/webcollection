<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/constants.jsp"%>
<div class="mask"></div>
<div class="popbox popbox-for-new pop-bookmark">
	<form id="newBookmarkForm">
	<div class="popbox-head">新增网址</div>
	<div class="popbox-body">
		<p>
			<label>网址</label><input type="text" id="url"
				placeholder="例:www.52url.com" />
		</p>
		<p>
			<label>名称</label><input type="text" id="bookmarkname"
				placeholder="例:网址收藏" />
		</p>
		<p>
			<label>分类</label><input type="text" id="category" placeholder="例:菜谱" />
		</p>
		<p>
			<label>标签</label><input type="text" id="tags"
				placeholder="例:生活,美食(以逗号,分隔)" />
		</p>
		<p>
			<label>描述</label>
			<textarea id="desc"></textarea>
		</p>
		<p>
			<span class="btn"> <a class="confirm-btn">确定</a><a
				class="cancel-btn">取消</a>
			</span>
		</p>
	</div>
	</form>
</div>
<div class="popbox popbox-for-new pop-category">
	<form id="newCategoryForm">
	<div class="popbox-head">新增分类</div>
	<div class="popbox-body">
		<p>
			<label>名称</label>
			<input type="hidden" id="categoryid" name="categoryid" value="" />
			<input type="text" id="categoryname" name="categoryname" placeholder="网址所属分类" value="默认分类" />
		</p>
		<p>
			<label>权限</label> 
			<span class="permission">
				<input id="normal-permission" type="radio" name="categorypermission" checked="checked" value="1">普通(可自由查看)
			</span> 
			<span class="permission">
				<input id="psw-permission" type="radio" name="categorypermission" value="2">保密(查看需要密码)
			</span>
		</p>
		<p class="psw">
			<label>密码</label><input type="password" name="categorypsw" />
		</p>
		<p class="psw">
			<label>确认密码</label><input type="password" name="categorypswagain" />
		</p>
		<p>
			<span class="btn"> <a class="confirm-btn">确定</a><a
				class="cancel-btn">取消</a>
			</span>
		</p>
	</div>
	</form>
</div>
<div class="popbox pop-callback">
	<div class="popbox-body">
		<p>
			<img alt="success" src="${context_path}/img/success.png">
		</p>
		<p>
			<span class="callbackmsg">保存成功</span>
		</p>
	</div>
</div>
