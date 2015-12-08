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

public enum BookmarkDeleteEnum {

    LOGIC_DELETE("0", "逻辑删除，放入回收站"), PHYSICS_DELETE("1", "彻底删除");

    private String id;

    private String name;

    BookmarkDeleteEnum(String id, String name) {
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
