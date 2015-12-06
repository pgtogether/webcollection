/**   
 * @Title: CategoryPermission.java 
 * @Package: com.dapeng.constants 
 * @Description: TODO
 * @author jiangdp  
 * @date 2015年12月6日 下午5:36:49 
 */

package com.dapeng.constants;

/**
 * @Description
 * @author jiangdp
 * @date 2015年12月6日 下午5:36:49
 */

public enum CategoryTypeEnum {

    FIRST_CATEGORY_TYPE("1", "一级分类"), SECOND_CATEGORY_TYPE("2", "二级分类"), DEFAULT_CATEGORY_TYPE("2", "默认是二级分类");

    private String id;

    private String name;

    CategoryTypeEnum(String id, String name) {
        this.id = id;
        this.name = name;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}
