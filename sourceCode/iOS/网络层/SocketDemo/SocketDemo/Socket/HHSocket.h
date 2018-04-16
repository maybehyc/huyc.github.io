//
//  HHSocket.h
//  SocketDemo
//
//  Created by apple on 2018/1/22.
//  Copyright © 2018年 com.huyc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCDAsyncSocket.h"

@class HHSocket;
@protocol HHSocketDelegate <NSObject>

- (void)socketCanNotConnectToService:(HHSocket *)sock;
- (void)socket:(HHSocket *)sock didConnectToHose:(NSString *)host port:(uint16_t)port;
- (void)socketDidDisconnect:(HHSocket *)sock error:(NSError *)error;
- (void)socket:(HHSocket *)sock didReadData:(NSData *)data;

@end

@interface HHSocket : NSObject
@property (nonatomic, strong) GCDAsyncSocket *socket;

+ (instancetype)socketWithDelegate:(id<HHSocketDelegate>)delegate;
+ (instancetype)socketWithDelegate:(id<HHSocketDelegate>)delegate delegateQueue:(dispatch_queue_t *)delegateQueue;

- (BOOL)isConnectd;

- (void)close;
- (void)connect;
- (void)disconnect;
- (void)connectWithRetryTime:(NSUInteger)retryTime;

- (void)writeData:(NSData *)data;

//- (void)switchService;
//- (void)switchToService:(HHServiceType)serviceType;

@end
