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
<div class="popbox pop-callback-success">
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
<div class="popbox popbox-for-new pop-subjuct" style="display: block;">
	<form id="newBookmarkForm">
	<div class="popbox-head">编辑专题</div>
	<div class="popbox-body">
		<div class="list-subject">
			<div class="subject">
				<div class="item">
					<div class="img">
						<img src="${context_path}/img/demoimg.jpg"  />
					</div>
					<div class="bg"></div>
					<div class="mt">这是这个专题的标题这是这个专题的标题这是这个专题的标题</div>
				</div>
				<div class="list-item scroll-pane">
					<div class="item">
						<div class="con">
							<i class="dot"></i>
							<a href="#" class="title">对新型城镇化建设作指示  主持中央深改领导小组会议  国平  这三年</a>
						</div>
					</div>
					<div class="item">
						<div class="con">
							<i class="dot"></i>
							<a href="#" class="title">丈夫装窃听器监听妻子和情夫车震 法院:不违法</a>
						</div>
					</div>
					<div class="item">
						<div class="con">
							<i class="dot"></i>
							<a href="###" class="title">今日Apps：潮汐 置身万物平和 让你保持专注</a>
						</div>
					</div>
					<div class="item">
						<div class="con">
							<i class="dot"></i>
							<a href="###" class="title">安徽男子因赡养纠纷砍死母亲弟媳 遭警方击伤跳楼</a>
						</div>
					</div>
					<div class="item">
						<div class="con">
							<i class="dot"></i>
							<a href="###" class="title">国产、欧美等手机盘点 从MWC看全球智能手机市场兴衰</a>
						</div>
					</div>
					<div class="item">
						<div class="con">
							<i class="dot"></i>
							<a href="###" class="title">今日Apps：潮汐 置身万物平和 让你保持专注</a>
						</div>
					</div>
					<div class="item">
						<div class="con">
							<i class="dot"></i>
							<a href="###" class="title">安徽男子因赡养纠纷砍死母亲弟媳 遭警方击伤跳楼</a>
						</div>
					</div>
					<div class="item">
						<div class="con">
							<i class="dot"></i>
							<a href="###" class="title">国产、欧美等手机盘点 从MWC看全球智能手机市场兴衰</a>
						</div>
					</div>
					<div class="item">
						<div class="con">
							<i class="dot"></i>
							<a href="###" class="title">今日Apps：潮汐 置身万物平和 让你保持专注</a>
						</div>
					</div>
					<div class="item">
						<div class="con">
							<i class="dot"></i>
							<a href="###" class="title">安徽男子因赡养纠纷砍死母亲弟媳 遭警方击伤跳楼</a>
						</div>
					</div>
					<div class="item">
						<div class="con">
							<i class="dot"></i>
							<a href="###" class="title">国产、欧美等手机盘点 从MWC看全球智能手机市场兴衰</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="edit-subject">
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
			<div class="pop-item subject-btns">
				<span class="btn"> <a class="confirm-btn">新增</a><a
					class="cancel-btn">取消</a>
				</span>
			</div>
		</div>
	</div>
	</form>
</div>