package io.wharfoo.biztier.demo.domain.utils;

import com.alibaba.fastjson.JSONObject;

/**
 * @Description:
 * @author: xuanwei
 */
public class FilterJsonUtils {
    public static int getOffset(JSONObject filter) {
        if (filter != null && filter.containsKey("offset")) {
            return filter.getInteger("offset");
        }
        return 0;
    }

    public static int getLimit(JSONObject filter) {
        if (filter != null && filter.containsKey("limit")) {
            return filter.getInteger("limit");
        }
        return 100;
    }
}
