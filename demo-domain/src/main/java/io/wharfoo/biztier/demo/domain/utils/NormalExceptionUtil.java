package io.wharfoo.biztier.demo.domain.utils;

import io.wharfoo.biztier.core.exception.BizException;
import io.wharfoo.biztier.demo.clientobject.ResCode;
import org.postgresql.util.PSQLException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.IncorrectResultSizeDataAccessException;

import java.util.NoSuchElementException;

/**
 * @Description:
 * @author: xuanwei
 */
public class NormalExceptionUtil {

    public static BizException exceptionPro(Exception e) {
        Logger logger = LoggerFactory.getLogger(NormalExceptionUtil.class);
        logger.error("e {}, cause {}", e.getCause(), e.getClass());
        if (e instanceof BizException) {
            return (BizException) e;
        }

        if (e instanceof NoSuchElementException) {
            return BizExceptionFactoryUtil.bizException(ResCode.BIZ_USER_E0009);
        }

        if (e instanceof IncorrectResultSizeDataAccessException) {
            return BizExceptionFactoryUtil.bizException(ResCode.BIZ_USER_E0005);
        }

        if (e.getCause() instanceof org.hibernate.exception.ConstraintViolationException) {
            return BizExceptionFactoryUtil.bizException(ResCode.BIZ_USER_E0003);
        }

        if (e.getCause() instanceof PSQLException) {
            PSQLException pe = (PSQLException) e.getCause();
            if (pe.getSQLState().equals("23505")) {
                return BizExceptionFactoryUtil.bizException(ResCode.BIZ_USER_E0003);
            } else {
                return BizExceptionFactoryUtil.bizException(ResCode.BIZ_USER_EUNKNOW_DB_EXCEPTION);
            }
        }

        return BizExceptionFactoryUtil.bizException(ResCode.BIZ_USER_EUNKNOW);
    }

}
