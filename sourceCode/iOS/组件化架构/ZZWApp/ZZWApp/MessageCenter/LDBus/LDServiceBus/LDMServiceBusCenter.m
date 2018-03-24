//
//  LDMServiceBusCenter.m
//  LDBusBundle
//
//  Created by 庞辉 on 12/5/14.
//  Copyright (c) 2014 庞辉. All rights reserved.
//

#import "LDMServiceBusCenter.h"
#import "LDMBusContext.h"
#import "LDMServiceConfigurationItem.h"
#import <objc/message.h>

#define TITLE_SERVICEBUSCLASS @"servicebus_implclass"
#define TITLE_SERVICEBUSOBJECT @"servicebus_implobject"

static LDMServiceBusCenter *servicebusCenter = nil;
@interface LDMServiceBusCenter () {
    NSMutableDictionary *_serviceMap;
}

@end

@implementation LDMServiceBusCenter


+ (LDMServiceBusCenter *)servicebusCenter
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        servicebusCenter = [[self alloc] init];
    });
    return servicebusCenter;
}


- (id)init
{
    self = [super init];
    if (self) {
        _serviceMap = [[NSMutableDictionary alloc] initWithCapacity:2];
    }
    return self;
}

/**
 * 从服务总线中获取某个服务的实现
 */
- (id)getServiceImpl:(NSString *)serviceName
{
    //根据serviceName获取在服务总线上的注册
    NSMutableDictionary *dic = [NSMutableDictionary
        dictionaryWithDictionary:[_serviceMap objectForKey:[serviceName lowercaseString]]];

    //如果服务存在，检查服务是否启动，如果未启动，马上启动，并返回service实例
    id serviceImpl = nil;
    if (dic) {
        if ([dic objectForKey:TITLE_SERVICEBUSOBJECT] == [NSNull null]) {
            Class serviceClass = [dic objectForKey:TITLE_SERVICEBUSCLASS];
            if (serviceClass != nil) {
                serviceImpl = [[serviceClass alloc] init];
                [dic setObject:serviceImpl forKey:TITLE_SERVICEBUSOBJECT];
                [_serviceMap setObject:dic forKey:[serviceName lowercaseString]];
            }
        } else {
            serviceImpl = [dic objectForKey:TITLE_SERVICEBUSOBJECT];
        }
    }

    return serviceImpl;
}


/**
 * 通过map数组给服务总线中注册服务
 */
- (BOOL)registerServiceToBusBatchly:(NSArray *)serviceConfigurationList
{
    if (serviceConfigurationList && serviceConfigurationList.count > 0) {
        for (int i = 0; i < serviceConfigurationList.count; i++) {
            LDMServiceConfigurationItem *serviceItem = [serviceConfigurationList objectAtIndex:i];
            [self registerServiceToBus:serviceItem.serviceName
                                 class:serviceItem.classString
                              protocol:serviceItem.protocolString];
        }
    }

    return YES;
}


/**
 * 通过key-value给服务总线注册服务
 *
 */
- (BOOL)registerServiceToBus:(NSString *)serviceName
                       class:(NSString *)serviceClassString
                    protocol:(NSString *)serviceProtocolString
{
    BOOL success = NO;
    Class serviceClass = nil;
    if (serviceClassString && ![serviceClassString isEqualToString:@""]) {
        serviceClass = NSClassFromString(serviceClassString);
    }

    Protocol *serviceProtocol = nil;
    if (serviceProtocolString && ![serviceProtocolString isEqualToString:@""]) {
        serviceProtocol = NSProtocolFromString(serviceProtocolString);
    }

    //如果serviceClass 在bundle中不存在，不注册该服务
    if (serviceClass && serviceProtocol && [serviceClass conformsToProtocol:serviceProtocol]) {
        if ([_serviceMap objectForKey:[serviceName lowercaseString]] != nil) {
//注册的时候给予提醒，不允许相同服务名称进行注册，不区分大小写，有重复不予覆盖
#ifdef DEBUG
            NSAssert(NO, @"service: %@ duplicate register in service bus", serviceName);
#endif
        } else {
            [_serviceMap setObject:@{
                TITLE_SERVICEBUSCLASS : serviceClass,
                TITLE_SERVICEBUSOBJECT : [NSNull null]
            } forKey:[serviceName lowercaseString]];
            success = YES;
        }
    }

    // debug阶段给予提示
    else {
#ifdef DEBUG
        NSAssert(NO, @"service: %@ invalid, reason is serviceImpl(%@) is not impleamted or not "
                     @"conform to protocol (%@)",
                 serviceName, serviceClassString, serviceProtocolString);
#endif
    }

    return success;
}


/**
 * 批量注销服务
 */
- (BOOL)unRegisterServiceFromBusBatchly:(NSArray *)serviceNames;
{
    if (serviceNames && serviceNames.count > 0) {
        for (int i = 0; i < serviceNames.count; i++) {
            [self unRegisterServiceFromBus:[serviceNames objectAtIndex:i]];
        }
    }

    return YES;
}


/**
 * 按service名称注销服务
 */
- (BOOL)unRegisterServiceFromBus:(NSString *)serviceName
{
    if ([_serviceMap objectForKey:[serviceName lowercaseString]] != nil) {
        [_serviceMap removeObjectForKey:[serviceName lowercaseString]];
    }

    return YES;
}


@end


/**
 * 实现service总线供外界调用的方法
 */
@implementation LDMBusContext (LDMServiceBusCenter)
+ (id)getService:(NSString *)serviceName
{
    return [[LDMServiceBusCenter servicebusCenter] getServiceImpl:serviceName];
}

+ (id)performAPI:(NSString *)serviceName methodName:(NSString *)methodName
{
    return [LDMBusContext performAPI:serviceName methodName:methodName withParam1:nil];
}

+ (id)performAPI:(NSString *)serviceName methodName:(NSString *)methodName withParam1:(id)param1
{
    return [LDMBusContext performAPI:serviceName methodName:methodName withParam1:param1 withParam2:nil];
}

+ (id)performAPI:(NSString *)serviceName methodName:(NSString *)methodName withParam1:(id)param1 withParam2:(id)param2
{
//    return [LDMBusContext performAPI:serviceName methodName:methodName withParam1:param1 withParam2:param2 withParam3:nil];
    id targetOpenService = [LDMBusContext getService:serviceName];
    SEL targetSelector = NSSelectorFromString(methodName);
    if ([targetOpenService respondsToSelector:targetSelector]) {
        return ((id (*)(id, SEL, id, id))objc_msgSend)(targetOpenService, targetSelector, param1, param2);
    } else {
        NSAssert(NO, @"%@ 找不到对应的方法",methodName);
        return nil;
    }
    return nil;
}

+ (id)performAPI:(NSString *)serviceName methodName:(NSString *)methodName withParam1:(id)param1 withParam2:(id)param2 withParam3:(id)param3
{
    return [LDMBusContext performAPI:serviceName methodName:methodName withParam1:param1 withParam2:param2 withParam3:param3 withParam4:nil];
    
}

+ (id)performAPI:(NSString *)serviceName methodName:(NSString *)methodName withParam1:(id)param1 withParam2:(id)param2 withParam3:(id)param3 withParam4:(id)param4
{
    return [LDMBusContext performAPI:serviceName methodName:methodName withParam1:param1 withParam2:param2 withParam3:param3 withParam4:param4 withParam5:nil];
}

+ (id)performAPI:(NSString *)serviceName methodName:(NSString *)methodName withParam1:(id)param1 withParam2:(id)param2 withParam3:(id)param3 withParam4:(id)param4 withParam5:(id)param5
{
    id targetOpenService = [LDMBusContext getService:serviceName];
    SEL targetSelector = NSSelectorFromString(methodName);
    if ([targetOpenService respondsToSelector:targetSelector]) {
        return ((id (*)(id, SEL, id, id, id, id, id))objc_msgSend)(targetOpenService, targetSelector, param1, param2, param3, param4, param5);
    } else {
        NSAssert(NO, @"%@ 找不到对应的方法",methodName);
        return nil;
    }
    return nil;
}

+ (id)performAPI:(NSString *)serviceName methodName:(NSString *)methodName withObject:(id)object,...NS_REQUIRES_NIL_TERMINATION
{
    SEL targetSelector = NSSelectorFromString(methodName);
    //根据类名以及SEL 获取方法签名的实例
    NSMethodSignature *signature = [[[LDMBusContext getService:serviceName] class] instanceMethodSignatureForSelector:targetSelector];
    if (signature == nil) {
        NSLog(@"--- 使用实例方法调用 为nil ---");
        signature = [self methodSignatureForSelector:targetSelector];
        if (signature == nil) {
            NSLog(@"使用类方法调用 也为nil， 此时return");
            return nil;
        }
    }
    //NSInvocation是一个消息调用类，它包含了所有OC消息的成分：target、selector、参数以及返回值。
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    invocation.target = [LDMBusContext getService:serviceName];
    invocation.selector = targetSelector;
    NSUInteger argCount = signature.numberOfArguments;
    // 参数必须从第2个索引开始，因为前两个已经被target和selector使用
    argCount = argCount > 0 ? argCount : 0;
    NSMutableArray *objs = [NSMutableArray arrayWithCapacity:0];
    if (object) {
        [objs addObject:object];
        va_list args;
        va_start(args, object);
        while ((object = va_arg(args, id))){
            [objs addObject:object];
        }
        va_end(args);
    }
    if (objs.count != argCount){
        NSLog(@"--- objs.count != argCount! please check it! ---");
        return nil;
    }
    //设置参数列表
    for (NSInteger i = 0; i < objs.count; i++) {
        id obj = objs[i];
        if ([obj isKindOfClass:[NSNull class]]) {
            continue;
        }
        [invocation setArgument:&obj atIndex:i+2];
    }
    [invocation invoke];
    //获取返回值
    id returnValue = nil;
    if (signature.methodReturnLength != 0 && signature.methodReturnLength) {
        [invocation getReturnValue:&signature];
    }
    return returnValue;
}

@end
