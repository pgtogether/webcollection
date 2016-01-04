package com.dapeng.dao;

import java.util.List;

import com.dapeng.domain.UserTags;
import com.dapeng.service.bo.UserTagsBO;
import com.depeng.web.bo.TagsMiniBO;

public interface UserTagsTempMapper {
    int deleteByPrimaryKey(Integer tagno);

    int insert(UserTags record);

    int insertSelective(UserTags record);

    UserTags selectByPrimaryKey(Integer tagno);

    int updateByPrimaryKeySelective(UserTags record);

    int updateByPrimaryKey(UserTags record);
    
    List<TagsMiniBO> getAllTagsByUserId(String userid);
    
    int getLastInsertId();
    
    String convertTagIdListToTagNos(UserTagsBO bo);
}