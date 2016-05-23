<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/constants.jsp"%>
<div class="mask"></div>
<div class="popbox popbox-for-new pop-bookmark">
	<form id="newBookmarkForm">
	<div class="popbox-head">添加书签</div>
	<div class="popbox-body">
		<div class="pop-item">
			<label class="name">网址</label>
			<div class="pop-input">
				<input type="text" id="url" name="url" placeholder="例:www.52url.com" />
			</div>
		</div>
		<div class="pop-item">
			<label class="name">名称</label>
			<div class="pop-input">
			<input type="text" id="bookmarkname" name="bookmarkname"
				placeholder="例:网址收藏" />
			</div>
		</div>
		<div class="pop-item choose-category">
			<label class="name">分类</label>
			<div class="pop-input">
			<input type="hidden" id="categoryno" name="categoryno" />
			<input type="text" id="categoryname" name="categoryname" placeholder="例:菜谱(输入分类名可创建新分类)" />
			<ul class="exist-category-list">
			</ul>
			</div>
		</div>
		<div class="pop-item">
			<label class="name">标签</label>
			<div class="pop-input">
			<input type="text" id="tags" name="tags"
				placeholder="例:生活,美食(以逗号,分隔)" />
			</div>
		</div>
		<div class="pop-item">
			<label class="name">描述</label>
			<div class="pop-input">
			<textarea id="desc" name="desc"></textarea>
			</div>
		</div>
		<div class="pop-item">
			<span class="btn"> <a class="confirm-btn">确定</a><a
				class="cancel-btn">取消</a>
			</span>
		</div>
	</div>
	</form>
</div>
<div class="popbox popbox-for-new pop-category">
	<form id="newCategoryForm">
	<div class="popbox-head">添加分类</div>
	<div class="popbox-body">
		<div class="pop-item">
			<label class="name">名称</label>
			<div class="pop-input">
				<input type="hidden" id="categoryid" name="categoryid" value="" />
				<input type="text" id="categoryname" name="categoryname" placeholder="网址所属分类" />
			</div>
		</div>
		<div class="pop-item">
			<label class="name">权限</label> 
			<div class="pop-input">
				<span class="permission">
					<input id="normal-permission" type="radio" name="categorypermission" checked="checked" value="1">普通分类
				</span> 
				<span class="permission">
					<input id="psw-permission" type="radio" name="categorypermission" value="2">加密分类
				</span>
			</div>
		</div>
		<div class="pop-item psw">
			创建加密分类，需要输入密码才能访问。
		</div>
		<div class="pop-item">
			<span class="btn"> <a class="confirm-btn">确定</a><a
				class="cancel-btn">取消</a>
			</span>
		</div>
	</div>
	</form>
</div>
<div class="popbox popbox-for-new pop-subject">
	<form id="newSubjectForm">
	<div class="popbox-head">添加专题</div>
	<div class="popbox-body">
		<div class="pop-item">
			<label class="name">名称</label>
			<div class="pop-input">
			<input type="text" id="subjectname" name="subjectname"
				placeholder="专题名称" />
			</div>
		</div>
		<div class="pop-item">
			<label class="name">描述</label>
			<div class="pop-input">
			<textarea id="subjectdesc" name="subjectdesc"></textarea>
			</div>
		</div>
		<div class="pop-item">
			<span class="btn"> <a class="confirm-btn">确定</a><a
				class="cancel-btn">取消</a>
			</span>
		</div>
	</div>
	</form>
</div>
<div class="popbox popbox-for-new pop-parentcategory">
	<form id="newParentCategoryForm">
	<div class="popbox-head">添加导航</div>
	<div class="popbox-body">
		<div class="pop-item">
			<label class="name">名称</label>
			<div class="pop-input">
				<input type="text" id="parentcategoryname" name="parentcategoryname" placeholder="导航名称" />
			</div>
		</div>
		<div class="pop-item">
			<span class="btn"> <a class="confirm-btn">确定</a><a
				class="cancel-btn">取消</a>
			</span>
		</div>
	</div>
	</form>
</div>
<div class="popbox popbox-tip popbox-for-alert">
	<div class="popbox-head">提示</div>
	<div class="popbox-body">
		<div class="tipimg">
			<img alt="success" src="${context_path}/img/warning.png">
		</div>
		<div class="tipmsg">
			<span></span>
		</div>
		<div class="tipbtn">
			<span class="btn">
				<a class="tip-confirm-btn">确定</a>
			</span>
		</div>
	</div>
</div>
<div class="popbox popbox-tip popbox-for-confirm">
	<div class="popbox-head">确认</div>
	<div class="popbox-body">
		<div class="tipimg">
			<img alt="success" src="${context_path}/img/confirm.png">
		</div>
		<div class="tipmsg">
			<span>您确定删除本分类吗？ </span>
		</div>
		<div class="tipbtn">
			<span class="btn">
				<a class="tip-confirm-btn">确定</a>
				<a class="tip-cancel-btn">取消</a>
			</span>
		</div>
	</div>
</div>
<div class="popbox pop-callback-success" style="display: block;">
	<div class="popbox-body">
		<div>
			<img alt="success" src="${context_path}/img/dosuccess.png">
		</div>
		<div>
			<span class="callbackmsg">保存成功</span>
		</div>
	</div>
</div>
<div class="popbox pop-callback-error">
	<div class="popbox-body">
		<div>
			<img alt="error" src="${context_path}/img/execption.png">
		</div>
		<div>
			<span class="callbackmsg">保存异常</span>
		</div>
	</div>
</div>