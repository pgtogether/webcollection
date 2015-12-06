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

public enum CategoryPermissionEnum {

    NORMAL("1", "普通(可直接访问)"), NEEDPSW("2", "访问需要密码");

    private String id;

    private String name;

    CategoryPermissionEnum(String id, String name) {
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
