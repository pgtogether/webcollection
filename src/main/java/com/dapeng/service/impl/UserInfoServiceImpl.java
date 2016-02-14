package com.dapeng.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dapeng.dao.UserInfoMapper;
import com.dapeng.domain.UserInfo;
import com.dapeng.service.UserInfoService;
import com.dapeng.service.bo.UserInfoBO;

@Service
public class UserInfoServiceImpl implements UserInfoService {

    @Autowired
    private UserInfoMapper userInfoDao;

    /**
     * 设置分类密码
     */
    @Override
    public int setCategoryPsw(UserInfoBO bo) {
        UserInfo userinfo = new UserInfo();
        userinfo.setUserid(bo.getUserid());
        userinfo.setCategorypsw(bo.getCategorypsw());
        return userInfoDao.updateByPrimaryKeySelective(userinfo);
    }

}
