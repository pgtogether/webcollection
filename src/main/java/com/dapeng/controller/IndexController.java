/**
 * @Title: IndexController.java
 * @Package com.dapeng.controller
 * @Description: TODO
 * @Copyright: Copyright (c) 2015
 * @Company: J&&S工作室
 *  
 * @author J&&S jiangdp
 * @date 2015年11月12日 下午7:34:32
 * @version V1.0
 */
package com.dapeng.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dapeng.domain.Bookmark;
import com.dapeng.domain.Category;
import com.dapeng.service.BookmarkService;

/**
 * 类的功能描述
 * 
 * @Copyright: Copyright (c) 2015
 * @Company: J&&S工作室
 * @author J&&S jiangdp
 * @date 2015年11月12日 下午7:34:32
 * @version V1.0
 */
@Controller
@RequestMapping("/*")
public class IndexController {

	@Autowired
	private BookmarkService bookmarkService;
	/**
	 * 默认主页
	 * 
	 * @param @return
	 * @return String
	 */
	@RequestMapping(value = "index", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String index() {
		return "index";
	}
	
	@RequestMapping(value = "index1", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String index1() {
		return "index1";
	}
	
	@RequestMapping(value = "recycle", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String recycle1() {
		return "recycle";
	}
	
	@RequestMapping(value = "doSelectBookmarkList", method = { RequestMethod.GET,
			RequestMethod.POST })
	@ResponseBody
	public List<Bookmark> doSelectBookmarkList() {
		List<Bookmark> bookmarkList = bookmarkService.selectBookmarkList();
		return bookmarkList;
	}
	
	/**
	 * 回收站
	 * @return
	 */
	@RequestMapping(value = "doSelectRecycleBookmarkList", method = { RequestMethod.GET,
			RequestMethod.POST })
	@ResponseBody
	public List<Bookmark> doSelectRecycleBookmarkList() {
		List<Bookmark> bookmarkList = bookmarkService.selectrecycleList();
		return bookmarkList;
	}
	/**
	 * 从回收站恢复
	 * @param bookmarkid
	 * @return
	 */
	@RequestMapping(value = "doRecoverBookmark", method = { RequestMethod.GET,
			RequestMethod.POST })
	@ResponseBody
	public int doRecoverBookmark(String bookmarkid) {
		System.out.println("从回收站恢复----->  "+bookmarkid);
		String[] bookmarkidarr = bookmarkid.split(";");
		int result= -1;
		try {
			for (int i = 0; i < bookmarkidarr.length; i++) {
				 result = bookmarkService.doRecoverBookmark(Integer.parseInt(bookmarkidarr[i]));
				 if (result<0) {
					break;
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	@RequestMapping(value = "doAddBookmark", method = { RequestMethod.GET,
			RequestMethod.POST })
	@ResponseBody
	public int doAddBookmark(Bookmark bookmark) {
		Bookmark bmdto = new Bookmark();
		bmdto.setBookmarkname(bookmark.getBookmarkname());
		bmdto.setUrl(bookmark.getUrl());
		bmdto.setPermission("1");
		bmdto.setCategoryid("111");
		bmdto.setCreatetime(new Date());
		bmdto.setDeleteflg("0");
		int result = bookmarkService.insertBookmark(bmdto);
		return result;
	}
	
	/**
	 * 标签逻辑删除    点击删除-》flg='1'
	 * @param bookmarkid
	 * deleteflg 是否删除 0否 1逻辑删除 2物理删除
	 * @return
	 */
	@RequestMapping(value = "doDeleteBookmark", method = { RequestMethod.GET,
			RequestMethod.POST })
	@ResponseBody
	public int doDeleteBookmark(String bookmarkid) {
		int result= -1;
		try {
			 result = bookmarkService.deleteBookmarkById(Integer.parseInt(bookmarkid));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	/**
	 * 物理删除
	 * @param bookmarkid
	 * @return
	 */
	@RequestMapping(value = "doPhysicsDelBookmark", method = { RequestMethod.GET,
			RequestMethod.POST })
	@ResponseBody
	public int doPhysicsDelBookmark(String bookmarkid) {
		System.out.println("物理删除----->  "+bookmarkid);
		String[] bookmarkidarr = bookmarkid.split(";");
		int result= -1;
		try {
			for (int i = 0; i < bookmarkidarr.length; i++) {
				result = bookmarkService.deletePhysicsBookmarkById(Integer.parseInt(bookmarkidarr[i]));
				if (result<0) {
					break;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@RequestMapping(value = "doUpdateBookmark", method = { RequestMethod.GET,
			RequestMethod.POST })
	@ResponseBody
	public int doUpdateBookmark(Bookmark bookmark) {
		int result= -1;
		try {
			Bookmark bmdto = new Bookmark();
			bmdto.setBookmarkname(bookmark.getBookmarkname());
			bmdto.setUrl(bookmark.getUrl());
			 result = bookmarkService.updateBookmarkBySlected(bookmark);
			 System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@RequestMapping(value = "doAddCategory", method = { RequestMethod.GET,
			RequestMethod.POST })
	@ResponseBody
	public int doAddCategory(Category category) {
		int result= -1;
		try {
			Category cgdto = new Category();
			cgdto.setCategoryname(category.getCategoryname());
			cgdto.setCategorypermission("0");
			cgdto.setCategorypsw("1111");
			cgdto.setCategorytype("1");
			cgdto.setParentcategoryid(3);
			 result = bookmarkService.addCategory(cgdto);
			 System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@RequestMapping(value = "doDeleteCategory", method = { RequestMethod.GET,
			RequestMethod.POST })
	@ResponseBody
	public int doDeleteCategory(String categoryid) {
		int result= -1;
		try {
			 result = bookmarkService.deleteCategoryById(Integer.parseInt(categoryid));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@RequestMapping(value = "doUpdateCategory", method = { RequestMethod.GET,
			RequestMethod.POST })
	@ResponseBody
	public int doUpdateCategory(Category category) {
		int result= -1;
		try {
			Category cgdto = new Category();
			cgdto.setCategoryid(category.getCategoryid());
			cgdto.setCategoryname(category.getCategoryname());
			result = bookmarkService.updateCategoryBySlected(category);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@RequestMapping(value = "doSelectCategoryList", method = { RequestMethod.GET,
			RequestMethod.POST })
	@ResponseBody
	public List<Category> doSelectCategoryList() {
		List<Category> categoryList = bookmarkService.selectCategoryList();
		return categoryList;
	}
}
