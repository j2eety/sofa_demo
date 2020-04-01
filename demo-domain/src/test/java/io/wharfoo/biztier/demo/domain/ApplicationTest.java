package io.wharfoo.biztier.demo.domain;

import com.alibaba.fastjson.serializer.JSONSerializer;
import com.alibaba.fastjson.serializer.ObjectSerializer;
import com.alibaba.fastjson.serializer.SerializeConfig;
import com.alibaba.fastjson.serializer.SerializeWriter;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import java.io.IOException;
import java.lang.reflect.Type;
import java.util.Objects;

//import org.springframework.boot.autoconfigure.web.HttpMessageConverters;

/**
 * @Description:
 * @author: xuanwei
 */
@SpringBootApplication
@ComponentScan("io.wharfoo.biztier")
public class ApplicationTest {
//    @Bean//使用@Bean注入fastJsonHttpMessageConvert
//    public HttpMessageConverters fastJsonHttpMessageConverters() {
//        //1.需要定义一个Convert转换消息的对象
//        FastJsonHttpMessageConverter fastConverter = new FastJsonHttpMessageConverter();
//        HttpMessageConverter<?> converter = fastConverter;
//        return new HttpMessageConverters(converter);
//    }


    public static void main(String[] args) {

        SerializeConfig.getGlobalInstance().put(Long.class, new ObjectSerializer() {
            @Override
            public void write(JSONSerializer serializer, Object object, Object fieldName,
                              Type fieldType, int features)
                    throws IOException {
                SerializeWriter out = serializer.getWriter();

                if (fieldType == long.class || fieldType == Long.class) {
                    out.writeString(Objects.toString(object, null));
                }
            }
        });
        SpringApplication.run(ApplicationTest.class, args);
    }
}
