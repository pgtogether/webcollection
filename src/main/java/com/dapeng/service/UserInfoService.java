package com.dapeng.service;

import com.dapeng.service.bo.UserInfoBO;

public interface UserInfoService {

    /**
     * 设置分类密码
     */
    public int setCategoryPsw(UserInfoBO bo);

    /**
     * 验证分类密码
     */
    public boolean checkCategoryPsw(String categorypsw, String userid);

}
