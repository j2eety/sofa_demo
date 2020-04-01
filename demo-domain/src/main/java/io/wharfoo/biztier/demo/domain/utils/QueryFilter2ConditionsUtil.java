package io.wharfoo.biztier.demo.domain.utils;

import com.alibaba.fastjson.JSONObject;

import java.util.HashMap;
import java.util.Iterator;

/**
 * @Description:
 * @author: xuanwei
 */
public class QueryFilter2ConditionsUtil {
    public static HashMap getConditions(JSONObject filter) {
        HashMap keysMap = new HashMap();
        Iterator<String> keys = filter.keySet().iterator();
        while(keys.hasNext()){
            String key = keys.next();
            keysMap.put(key, filter.get(key));
        }
        return keysMap;
    }

}
