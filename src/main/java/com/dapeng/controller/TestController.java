package com.dapeng.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/*")
public class TestController {

	@RequestMapping("hello")
	public String hello() {
		return "hello";
	}
	
	@RequestMapping("myweb")
	public String myweb() {
		return "bak/myweb";
	}

}
