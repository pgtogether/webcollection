package com.dapeng.dao;

import java.util.List;

import com.dapeng.domain.UserBindTags;
import com.dapeng.service.bo.UserBindTagsBO;
import com.depeng.web.bo.TagsMiniBO;

public interface UserBindTagsMapper {
    int deleteByPrimaryKey(Integer tagno);

    int insert(UserBindTags record);

    int insertSelective(UserBindTags record);

    UserBindTags selectByPrimaryKey(Integer tagno);

    int updateByPrimaryKeySelective(UserBindTags record);

    int updateByPrimaryKey(UserBindTags record);
    
    List<TagsMiniBO> getAllTagsByUserId(String userid);
    
    int getLastInsertId();
    
    String convertTagIdListToTagNos(UserBindTagsBO bo);
}