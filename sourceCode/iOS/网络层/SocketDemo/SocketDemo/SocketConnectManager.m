//
//  SocketConnectManager.m
//  SocketDemo
//
//  Created by apple on 2018/1/22.
//  Copyright © 2018年 com.huyc. All rights reserved.
//

#import "SocketConnectManager.h"

@implementation SocketConnectManager

- (IBAction)connectToHost:(id)sender {
    
    //1.建立连接
    
    NSString *host =@"127.0.0.1";
    
    int port =12345;
    
    //定义C语言输入输出流
    
    CFReadStreamRef readStream;
    
    CFWriteStreamRef writeStream;
    
    CFStreamCreatePairWithSocketToHost(NULL, (__bridge CFStringRef)host, port, &readStream, &writeStream);
    
    //把C语言的输入输出流转化成OC对象
    
    _inputStream = (__bridge NSInputStream *)(readStream);
    
    _outputStream = (__bridge NSOutputStream *)(writeStream);
    
    //设置代理
    
    _inputStream.delegate=self;
    
    _outputStream.delegate=self;
    
    //把输入输入流添加到主运行循环
    
    //不添加主运行循环 代理有可能不工作
    
    [_inputStream scheduleInRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    
    [_outputStream scheduleInRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    
    //打开输入输出流
    
    [_inputStream open];
    
    [_outputStream open];
    
}

#pragma mark - delegate
-(void)stream:(NSStream *)aStream handleEvent:(NSStreamEvent)eventCode{
    
    NSLog(@"%@",[NSThread currentThread]);
    
    //NSStreamEventOpenCompleted = 1UL << 0,//输入输出流打开完成
    //NSStreamEventHasBytesAvailable = 1UL << 1,//有字节可读
    //NSStreamEventHasSpaceAvailable = 1UL << 2,//可以发放字节
    //NSStreamEventErrorOccurred = 1UL << 3,//连接出现错误
    //NSStreamEventEndEncountered = 1UL << 4//连接结束
    
    switch(eventCode) {
            
        case NSStreamEventOpenCompleted:
            
            NSLog(@"输入输出流打开完成");
            
            break;
            
        case NSStreamEventHasBytesAvailable:
            
            NSLog(@"有字节可读");
            
            [self readData];
            
            break;
            
        case NSStreamEventHasSpaceAvailable:
            
            NSLog(@"可以发送字节");
            
            break;
            
        case NSStreamEventErrorOccurred:
            
            NSLog(@"连接出现错误");
            
            break;
            
        case NSStreamEventEndEncountered:
            
            NSLog(@"连接结束");
            
            //关闭输入输出流
            
            [_inputStream close];
            
            [_outputStream close];
            
            //从主运行循环移除
            
            [_inputStream removeFromRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
            
            [_outputStream removeFromRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
            
            break;
            
        default:
            
            break;
            
    }
    
}

@end
