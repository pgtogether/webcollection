package com.dapeng.service;

import java.util.List;

import com.depeng.web.bo.TagsMiniBO;

/**
 * 分类操作Service
 * 
 * @Description
 * @author jiangdp
 * @date 2015年12月6日 下午5:56:11
 */
public interface TagsService {

    // 加载用户下的所有标签
    List<TagsMiniBO> getAllTagsByUserId(String userid);
}
