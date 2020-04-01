package io.wharfoo.biztier.demo.domain.utils;

/**
 * @Description:
 * @author: xuanwei
 */

import io.wharfoo.biztier.util.IdWorker;

/**
 * @program: biz-stockcenter
 * @description: TODO
 * @author: Smarain
 * @create: 2018/12/6 14:24
 * @version: 1.0
 **/
public class IdWorkerUtil {
    public static String getIdWithPrefix(String prefix) {
        IdWorker idWorker = new IdWorker();
        return prefix + String.valueOf(idWorker.getId());
    }

    public static long getId() {
        IdWorker idWorker = new IdWorker();
        return idWorker.getId();
    }
}
