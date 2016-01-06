/**   
 * @Title: StringUtils.java 
 * @Package: com.dapeng.util 
 * @Description: TODO
 * @author jiangdp  
 * @date 2015年12月22日 下午8:59:03 
 */

package com.dapeng.util;

/**
 * @Description
 * @author jiangdp
 * @date 2015年12月22日 下午8:59:03
 */

public class StringUtils {

    public static boolean isEmpty(String str) {
        if (str == null || str.trim().equals("")) {
            return true;
        } else {
            return false;
        }
    }

    public static boolean isNotEmpty(String str) {
        return !isEmpty(str);
    }

}
