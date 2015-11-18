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

import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dapeng.domain.Bookmark;
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
	
	@RequestMapping(value = "doSelectBookmarkList", method = { RequestMethod.GET,
			RequestMethod.POST })
	@ResponseBody
	public String doSelectBookmarkList() {
		List<Bookmark> bookmarkList = bookmarkService.selectBookmarkList();
		JSONArray jsonArray =new JSONArray();
		for (Bookmark bookmark : bookmarkList) {
			JSONObject jsonObject = new JSONObject();
			try {
				jsonObject.put("id",bookmark.getBookmarkid());
				jsonObject.put("name", bookmark.getBookmarkname());
				jsonObject.put("url", bookmark.getUrl());
				jsonArray.put(jsonObject);
			} catch (JSONException e) {
				e.printStackTrace();
			}
		}
		return jsonArray.toString();
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
		bmdto.setCreatetime("2016-12-12");
		int result = bookmarkService.insertBookmark(bmdto);
		return result;
	}
	
	@RequestMapping(value = "doDeleteBookmark", method = { RequestMethod.GET,
			RequestMethod.POST })
	@ResponseBody
	public int doDeleteBookmark(String bookmarkid) {
		//System.out.println("doDeleteBookmark>>>"+bookmarkid);
		int result= -1;
		try {
			 result = bookmarkService.deleteBookmarkById(Integer.parseInt(bookmarkid));
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
}
