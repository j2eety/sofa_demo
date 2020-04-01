package io.wharfoo.biztier.demo.common;

import java.util.Random;

/**
 * @ClassName IdGenerator
 * @Description TODO
 * @Author weizhong
 * @Date 2018/8/14
 * @Version v1.0
 **/
public class IdGenerator {
    private static Random rd = new Random();
    public static int getId() {
        int temp = rd.nextInt(10000000);
        return temp;
    }
}
