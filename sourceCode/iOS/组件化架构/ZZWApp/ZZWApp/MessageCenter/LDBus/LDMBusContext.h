//
//  LDMBusContext.h
//  LDBusBundle
//
//  Created by 庞辉 on 12/10/14.
//  Copyright (c) 2014 庞辉. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class TTURLAction;
@interface LDMBusContext : NSObject
/**
 * 初始化bundleContainer，管理各个bundle的容器
 * 如果自行决定rootViewController,  则传入self.rootViewController， 否则传入nil
 */
+ (void)initialBundleContainerWithWindow:(UIWindow *)window
                   andRootViewController:(UIViewController *)rootViewController;
+ (void)initialBundleContainerWithRootViewController:(UIViewController *)rootViewController;

@end


/**
 * @Category LDMUIBusCenter
 * 调用UIBus总线注册特殊scheme的handler
 */
@interface LDMBusContext (LDMUIBusCenter)

/**
 * 向其管理的UIBus总线，注册特殊scheme的处理handler
 * @param scheme 为webURL的scheme
 * @param routePattern 指给scheme添加routePattern
 * @param handleControllerClassString 为指定打开webURL的容器的类
 * @default webController打开方式默认是为Modal，如果需要Push，调用下一个接口；
 */
+ (void)registerSpecialScheme:(NSString *)scheme
                    addRoutes:(NSString *)routePattern
             handleController:(NSString *)handleControllerClassString;


/**
 * 设置以非Modal的方式打开web Controller
 */
+ (void)registerSpecialScheme:(NSString *)scheme
                    addRoutes:(NSString *)routePattern
             handleController:(NSString *)handleControllerClassString
                      isModal:(BOOL)isModal;

@end


/**
 * @Category LDMUIBusConnector
 * UI总线的调用，通过UIConnetor调用，具体的UI总线透明
 */
@interface LDMBusContext (LDMUIBusConnector)
/**
 * 向当前bundle的connector 发送action消息
 */
+ (BOOL)openURLWithAction:(TTURLAction *)action;

/**
 * 向当前bundle的Connetor 发送URL消息
 */
+ (BOOL)openURL:(NSString *)url;

/**
 * 向当前bundle的connector 发送url和query组装消息
 */
+ (BOOL)openURL:(NSString *)url query:(NSDictionary *)query;

/**
 * 向当前bundle的connetor 申请某个url对应的ctrl；
 */
+ (UIViewController *)controllerForURL:(NSString *)url;
+ (UIViewController *)controllerForURL:(NSString *)url query:(NSDictionary *)query;

/**
 * 向UIBus请求当前是否能够处理该URL
 */
+ (BOOL)canOpenURL:(NSString *)url;

@end


/**
 * @Category LDMServiceBusCenter
 * 服务总线的调用
 */
@interface LDMBusContext (LDMServiceBusCenter)

/**
 * 从服务总线获取服务的实例
 */
+ (id)getService:(NSString *)serviceName;

/**
 * 根据服务名称、方法、参数 调用服务
 */
+ (id)performAPI:(NSString *)serviceName methodName:(NSString *)methodName;
+ (id)performAPI:(NSString *)serviceName methodName:(NSString *)methodName withParam1:(id)param1;
+ (id)performAPI:(NSString *)serviceName methodName:(NSString *)methodName withParam1:(id)param1 withParam2:(id)param2;
+ (id)performAPI:(NSString *)serviceName methodName:(NSString *)methodName withParam1:(id)param1 withParam2:(id)param2 withParam3:(id)param3;
+ (id)performAPI:(NSString *)serviceName methodName:(NSString *)methodName withParam1:(id)param1 withParam2:(id)param2 withParam3:(id)param3 withParam4:(id)param4;
+ (id)performAPI:(NSString *)serviceName methodName:(NSString *)methodName withParam1:(id)param1 withParam2:(id)param2 withParam3:(id)param3 withParam4:(id)param4 withParam5:(id)param5;
+ (id)performAPI:(NSString *)serviceName methodName:(NSString *)methodName withObject:(id)object,...NS_REQUIRES_NIL_TERMINATION;

@end


/**
 * @Category LDMMessageBusCenter
 * 消息总线的调用
 */
@interface LDMBusContext (LDMMessageBusCenter)
/**
 * 向消息总线的所有观察者发送消息
 */
+ (void)postMessage:(NSString *)message;
+ (void)postMessage:(NSString *)message object:(id)object;
+ (void)postMessage:(NSString *)message userInfo:(NSDictionary *)aUserInfo;
+ (void)postNotification:(NSNotification *)notification;


@end
