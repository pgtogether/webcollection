package com.dapeng.dao;

import java.util.List;

import com.dapeng.domain.UserTags;
import com.depeng.web.bo.TagsMiniBO;

public interface UserTagsMapper {
    int deleteByPrimaryKey(Integer tagid);

    int insert(UserTags record);

    int insertSelective(UserTags record);

    UserTags selectByPrimaryKey(Integer tagid);

    int updateByPrimaryKeySelective(UserTags record);
    
    int updateByUniqueKey(UserTags record);

    int updateByPrimaryKey(UserTags record);
    
    UserTags selectUserTagsByTagName(UserTags record);
    
    int selectMaxTagNo(String userid);
    
    // 标签关联次数减-1
    int minusTagNum(UserTags record);
    
    // 删除标签关联书签的次数为0的记录
    int deleteTagNumEqualsZero(String userid);
    
    // 获取用户下所有的标签
    List<TagsMiniBO> getAllTagsByUserId(String userid);
}