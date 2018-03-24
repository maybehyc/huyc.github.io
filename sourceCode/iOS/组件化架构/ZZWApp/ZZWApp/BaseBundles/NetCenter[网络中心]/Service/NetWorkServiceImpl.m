//
//  NetWorkServiceImpl.m
//  ZZWApp
//
//  Created by apple on 2018/3/22.
//  Copyright © 2018年 Kun. All rights reserved.
//

#import "NetWorkServiceImpl.h"
#import "AFHTTPSessionManager.h"

@implementation NetWorkServiceImpl

- (id)get:(NSString *)url
      param:(NSDictionary *)params
   progress:(void (^)(id))progressBlock
    success:(void (^)(id))successBlock
   failture:(void (^)(id))failtureBlock
{
    //1.创建会话管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //3.发送GET请求
    /*
     第一个参数:请求路径(NSString)+ 不需要加参数
     第二个参数:发送给服务器的参数数据
     第三个参数:progress 进度回调
     第四个参数:success  成功之后的回调(此处的成功或者是失败指的是整个请求)
     task:请求任务
     responseObject:注意!!!响应体信息--->(json--->oc))
     task.response: 响应头信息
     第五个参数:failure 失败之后的回调
     */
    [manager GET:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (successBlock) {
            successBlock(responseObject);
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failtureBlock) {
            failtureBlock(error);
        }
    }];
    return nil;
}

- (id)post:(NSString *)url
     param:(NSDictionary *)params
  progress:(void (^)(id))progressBlock
   success:(void (^)(id))successBlock
  failture:(void (^)(id))failtureBlock
{
    //1.创建会话管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //3.发送GET请求
    /*
     第一个参数:请求路径(NSString)+ 不需要加参数
     第二个参数:发送给服务器的参数数据
     第三个参数:progress 进度回调
     第四个参数:success  成功之后的回调(此处的成功或者是失败指的是整个请求)
     task:请求任务
     responseObject:注意!!!响应体信息--->(json--->oc))
     task.response: 响应头信息
     第五个参数:failure 失败之后的回调
     */
    [manager POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (successBlock) {
            successBlock(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failtureBlock) {
            failtureBlock(error);
        }
    }];
    return nil;
}

@end
