# Weex入门

## 搭建开发环境

安装Node.js
brew install node

安装weex-toolkit
npm install -g weex-toolkit

## 创建或初始化项目

weex create awesome-project

启动
npm run serve

打开浏览器输入http://127.0.0.1:8080，即可看到Weex欢迎页面

## 开发
打开项目根目录，可以看到：
源码文件夹：src
打包文件夹：dist

## 调试
调试使用weex-toolkit工具，详情见官网教程https://weex.apache.org/cn/guide/tools/toolkit.html，这里介绍weex-toolkit的预览功能。
首先，请用手机下载安装WeexPlayground工具，下载地址https://weex.apache.org/cn/playground.html。
然后，使用以下命令生成调试页面：
    weex src/index.vue//这里以index.vue页面为例

该命令执行完后，会自动在浏览器打开一个页面，使用WeexPlayground工具扫描该界面的二维码，即可在手机上预览该页面的效果。

##  Android集成

Android集成请参考官方文档，文档地址https://weex.apache.org/cn/guide/integrate-to-your-app.html

样例工程：https://github.com/xkli/WXSample

weex_sdk最新版本0.16.0

    compile 'com.taobao.android:weex_sdk:0.16.0'//可以不加@aar

Android中加载weex页面主要使用以下代码：

    private val TEST_URL = "http://192.168.73.1:8080/dist/index.js"//对应项目根目录下dist文件夹下的js文件
    mWXSDKInstance.renderByUrl("WXSample", TEST_URL, options, null, WXRenderStrategy.APPEND_ONCE)

如果页面代码有改动，使用以下命令重新打包：

    weex compile src dist

然后在Android App中重新打开该页面即可看到效果。

## iOS集成

请参考官方文档：https://weex.apache.org/cn/guide/integrate-to-your-app.html
