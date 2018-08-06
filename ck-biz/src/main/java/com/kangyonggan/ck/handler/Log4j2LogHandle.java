package com.kangyonggan.ck.handler;

import com.alibaba.fastjson.JSON;
import com.github.ofofs.jca.annotation.Handler;
import com.github.ofofs.jca.handler.LogHandler;
import lombok.extern.log4j.Log4j2;

/**
 * @author kangyonggan
 * @date 2017/11/5 0005
 */
@Log4j2
@Handler(Handler.Type.LOG)
public class Log4j2LogHandle implements LogHandler {

    @Override
    public void logBefore(String packageName, String className, String methodName, Object... args) {
        log.info(String.format("[%s.%s]<%s>: method args：%s", packageName, className, methodName, JSON.toJSONString(args)));
    }

    @Override
    public Object logAfter(String packageName, String className, String methodName, long startTime, Object returnValue) {
        log.info(String.format("[%s.%s]<%s>: method return：%s", packageName, className, methodName, JSON.toJSONString(returnValue)));
        log.info(String.format("[%s.%s]<%s>: method used time：%s", packageName, className, methodName, System.currentTimeMillis() - startTime));
        return returnValue;
    }

}
