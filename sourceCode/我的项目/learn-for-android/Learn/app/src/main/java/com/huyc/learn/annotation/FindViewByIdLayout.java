package com.huyc.learn.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * Created by apple on 2018/3/19.
 */

@Target(ElementType.TYPE)//ElementType.TYPE只能在类中使用此注解
@Retention(RetentionPolicy.RUNTIME)// @Retention(RetentionPolicy.RUNTIME) 注解可以在运行时通过反射获取一些信息
@Documented
public @interface FindViewByIdLayout {
    int value();
}
