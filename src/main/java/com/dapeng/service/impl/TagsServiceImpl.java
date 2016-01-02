package com.dapeng.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dapeng.dao.UserBindTagsMapper;
import com.dapeng.service.TagsService;
import com.depeng.web.bo.TagsMiniBO;

@Service
public class TagsServiceImpl implements TagsService {

    @Autowired
    private UserBindTagsMapper userBindTagsDao;

    @Override
    public List<TagsMiniBO> getAllTagsByUserId(String userid) {
        return userBindTagsDao.getAllTagsByUserId(userid);
    }

}
