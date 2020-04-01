package io.wharfoo.biztier.demo.domain.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.lang.reflect.Method;
import java.util.Map;

/**
 * @Description:
 * @author: xuanwei
 */
public class Condition2Criteria {
    private static Logger logger = LoggerFactory.getLogger(Condition2Criteria.class);
    public static String dynamicMethodName(String condition) {
        String name = "and";
        String[] conditionKeys = condition.split("_");
        for (int i = 0; i < conditionKeys.length; i++) {
            name = name + conditionKeys[i];
        }
        return name + "EqualTo";
    }

    public static void getCriteria(Object example, Map<String, Object> conditions) {
        try {
            Class exampleClass = example.getClass();
            Method[] methods = exampleClass.getDeclaredMethods();
            for (int i = 0; i < methods.length; i++) {
                String methodName = methods[i].getName();
                for (String key : conditions.keySet()) {
                    Object value = conditions.get(key);
                    String dMethodName = dynamicMethodName(key);
                    if (methodName.equals(dMethodName)) {
                        methods[i].invoke(example, value);
                    }
                }
            }
        } catch (Exception e) {
            logger.error("criteria exception,",e);
        }

    }


}
