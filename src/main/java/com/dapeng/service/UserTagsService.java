/**
 * 
 */
package com.dapeng.service;

import java.util.List;

import com.depeng.web.bo.TagsMiniBO;

/**
 * @author jiangdp
 * 
 */
public interface UserTagsService {
    
    List<TagsMiniBO> getAllTagsByUserId(String userid);
}
