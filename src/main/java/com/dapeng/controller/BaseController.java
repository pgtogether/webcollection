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

import java.util.HashMap;
import java.util.Map;

import org.springframework.validation.BindingResult;

/**
 * 基类Controller，用于统一Ajax返回的数据结构
 * 
 * @Copyright: Copyright (c) 2015
 * @Company: J&&S工作室
 * @author J&&S jiangdp
 * @date 2015年11月12日 下午7:34:32
 * @version V1.0
 */
public class BaseController {

    public Map<String, Object> ajaxSuccess() {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("result", "OK");
        map.put("data", "");
        map.put("msg", "OK");
        return map;
    }

    public Map<String, Object> ajaxSuccess(String msg) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("result", "OK");
        map.put("data", "");
        map.put("msg", msg);
        return map;
    }

    public Map<String, Object> ajaxSuccess(Object obj) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("result", "OK");
        map.put("data", obj);
        return map;
    }

    public Map<String, Object> ajaxFail() {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("result", "NG");
        map.put("data", "");
        return map;
    }

    public Map<String, Object> ajaxFail(String msg) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("result", "NG");
        map.put("data", "");
        map.put("msg", msg);
        return map;
    }

    public Map<String, Object> ajaxFail(Object obj) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("result", "NG");
        map.put("data", "");
        return map;
    }

    public Map<String, Object> ajaxValidateError(BindingResult result) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("result", "NG");
        map.put("data", "");
        map.put("errors", result.getAllErrors());
        return map;
    }

    public Map<String, Object> ajaxExecption(Exception e) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("result", "NG");
        map.put("data", "");
        map.put("msg", e.getMessage());
        return map;
    }
}
