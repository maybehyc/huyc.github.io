//
//  HHSocket.m
//  SocketDemo
//
//  Created by apple on 2018/1/22.
//  Copyright © 2018年 com.huyc. All rights reserved.
//

#import "HHSocket.h"

@implementation HHSocket

+ (instancetype)socketWithDelegate:(id<HHSocketDelegate>)delegate
{
    
}

+ (instancetype)socketWithDelegate:(id<HHSocketDelegate>)delegate delegateQueue:(dispatch_queue_t *)delegateQueue
{
    
}

- (instancetype)initWithDelegate:(id<HHSocketDelegate>)delegate delegateQueue:(dispatch_queue_t)delegateQueue
{
    if (!delegate) { return nil; }
    
    if (self = [super init]) {
        const char* delegateQueueLabel = [[NSString stringWithFormat:@"%p_socketDelegateQueue",self] cStringUsingEncoding:NSUTF8StringEncoding];
        
        self.socket = [[GCDAsyncSocket alloc] initWithDelegate:delegate delegateQueue:delegateQueue];
    }
    return self;
}

- (BOOL)isConnectd
{
    
}

- (void)close
{
    
}
- (void)connect
{
    
}
- (void)disconnect
{
    
}
- (void)connectWithRetryTime:(NSUInteger)retryTime
{
    
}

- (void)writeData:(NSData *)data
{
    
}

@end
