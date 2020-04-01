package io.wharfoo.biztier.demo.domain.utils;

/**
 * Created by xuanwei on 2018/11/20.
 */
public class Constants {
    public static final Integer ACCOUNT_STATUS_NORMAL = 1;
    public static final Integer ACCOUNT_STATUS_LOCKED = 2;
    public static final Integer ACCOUNT_STATUS_CANCELED = 3;
    public static final String ACCOUNT_TYPE_USER = "user";
    public static final String ACCOUNT_TYPE_EMPLOYEE = "employee";
    public static final String ACCOUNT_TYPE_CORP = "corp";
    public static final String ACCOUNT_TYPE_BUSINESS = "busi";
    public static final String CORP_TYPE_CORP = "corp";
    public static final String CORP_TYPE_BUSI = "busi";

    public static String getAccoutTypeByCorpType(String corpType) {
        if (corpType == null) {
            return Constants.ACCOUNT_TYPE_CORP;
        }
        if (corpType.equals(Constants.CORP_TYPE_CORP)) {
            return Constants.ACCOUNT_TYPE_CORP;
        } else if (corpType.equals(Constants.CORP_TYPE_BUSI)) {
            return Constants.ACCOUNT_TYPE_BUSINESS;
        } else {
            return Constants.ACCOUNT_TYPE_CORP;
        }
    }
}
