//
//  SocketConnectManager.h
//  SocketDemo
//
//  Created by apple on 2018/1/22.
//  Copyright © 2018年 com.huyc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SocketConnectManager : NSObject<NSStreamDelegate>
{
    NSInputStream *_inputStream;//对应输入流
    NSOutputStream *_outputStream;//对应输出流
}

@end
