package com.huyc.learn.bridge;

/**
 * <与Bridge模块一一对应，用以在BridgeFactory获取某个Bridge对应的Key>
 *
 * @author caoyinfei
 * @version [版本号, 2016/6/6]
 * @see [相关类/方法]
 * @since [V1]
 */
public class Bridges {
    /**
     * 本地缓存(sd卡存储和手机内部存储)
     */
    public static final String LOCAL_FILE_STORAGE = "com.huyc.learn.LOCAL_FILE_STORAGE";

    /**
     * SharedPreference缓存
     */
    public static final String SHARED_PREFERENCE = "com.huyc.learn.SHARED_PREFERENCE";

    /**
     * 安全
     */
    public static final String SECURITY = "com.huyc.learn.SECURITY";

    /**
     * 用户Session
     */
    public static final String USER_SESSION = "com.huyc.learn.USER_SESSION";

    /**
     * CoreService，主要维护功能模块
     */
    public static final String CORE_SERVICE = "com.huyc.learn.CORE_SERVICE";


    /**
     * 数据库模块
     */
    public static final String DATABASE = "com.huyc.learn.DATABASE";

    /**
     * http请求
     */
    public static final String HTTP = "com.huyc.learn.HTTP";

}
