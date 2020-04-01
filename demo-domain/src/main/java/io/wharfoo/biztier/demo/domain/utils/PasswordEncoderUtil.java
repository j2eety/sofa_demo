package io.wharfoo.biztier.demo.domain.utils;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * @Description:
 * @author: xuanwei
 */
@Component
public class PasswordEncoderUtil {
    @Value("${biztier.encodeAlg:md5}")
    private String alg;

    public String encode(String pwd) {
        return this.encode(pwd, this.alg);
    }

    public String encode(String pwd, String alg) {
        if (alg.equals("md5")) {
            return MD5Util.md5(pwd);
        } else if (alg.equals("test")) {
            return new StringBuilder(pwd).reverse().toString();
        } else {
            return MD5Util.md5(pwd);
        }
    }

    public String getAlg() {
        return alg;
    }
}
