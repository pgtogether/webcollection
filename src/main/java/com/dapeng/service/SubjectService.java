package com.dapeng.service;

import com.dapeng.service.bo.BookmarkBO;
import com.dapeng.service.bo.SubjectBO;

/**
 * 专题操作Service
 * 
 * @Description
 * @author jiangdp
 * @date 2015年12月6日 下午5:56:11
 */
public interface SubjectService {

    // 增加专题
    int addSubject(SubjectBO bo);
    
    // 更新专题
    int updateSubjectByUnique(SubjectBO bo);
    
}
