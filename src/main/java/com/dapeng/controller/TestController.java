package com.dapeng.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dapeng.controller.form.TestForm;
import com.dapeng.service.TestService;
import com.dapeng.service.bo.TestBO;

@Controller
@RequestMapping("/*")
public class TestController {

	@Autowired
	private TestService testService;

	/**
	 * 测试
	 */
	@RequestMapping("hello")
	public String hello() {
		return "hello";
	}

	@RequestMapping("myweb")
	public String myweb() {
		return "bak/myweb";
	}
	
	@RequestMapping("name")
	public String name(){
		return "name";
	}

	@RequestMapping("inserttest")
	public String inserttest(Model model) {
		List<TestBO> testlist = testService.selectTestList();
		model.addAttribute("testlist", testlist);
		return "inserttest";
	}
	
	@RequestMapping(value = "doInsertTest", method = { RequestMethod.GET,
			RequestMethod.POST })
	@ResponseBody
	public String doInsertTest(TestForm form) {
		TestBO bo = new TestBO();
		bo.setId(form.getId());
		bo.setName(form.getName());

		int result = testService.insertTest(bo);

		if (result > 0) {
			return "OK";
		} else {
			return "NG";
		}
	}
}
