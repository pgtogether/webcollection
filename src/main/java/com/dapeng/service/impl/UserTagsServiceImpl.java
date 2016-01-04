package com.dapeng.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dapeng.dao.UserTagsMapper;
import com.dapeng.service.UserTagsService;
import com.depeng.web.bo.TagsMiniBO;

/**
 * 
 * @Description
 * @author jiangdp
 * @date 2016年1月4日 下午9:56:14
 */
@Service
public class UserTagsServiceImpl implements UserTagsService {

    @Autowired
    private UserTagsMapper userTagsDao;

    @Override
    public List<TagsMiniBO> getAllTagsByUserId(String userid) {
        return userTagsDao.getAllTagsByUserId(userid);
    }

}
