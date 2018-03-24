//
//  NetWorkService.h
//  ZZWApp
//
//  Created by apple on 2018/3/22.
//  Copyright © 2018年 Kun. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NetWorkService <NSObject>

/*
 **************************************  说明  **********************************************
 *
 * 在一开始设计接口的时候就想着方法接口越少越好,越简单越好,只有GET,POST,上传,下载,监测网络状态就够了.
 *
 **************************************  说明  **********************************************
 */

/* GET
 第一个参数:请求路径(NSString)+ 不需要加参数
 第二个参数:发送给服务器的参数数据
 第三个参数:progress 进度回调
 第四个参数:success  成功之后的回调(此处的成功或者是失败指的是整个请求)
 task:请求任务
 responseObject:注意!!!响应体信息--->(json--->oc))
 task.response: 响应头信息
 第五个参数:failure 失败之后的回调
 */
- (id)get:(NSString *)url
      param:(NSDictionary *)params
   progress:(void (^)(id))progressBlock
    success:(void (^)(id))successBlock
   failture:(void (^)(id))failtureBlock;

/* POST
 第一个参数:请求路径(NSString)+ 不需要加参数
 第二个参数:发送给服务器的参数数据
 第三个参数:progress 进度回调
 第四个参数:success  成功之后的回调(此处的成功或者是失败指的是整个请求)
 task:请求任务
 responseObject:注意!!!响应体信息--->(json--->oc))
 task.response: 响应头信息
 第五个参数:failure 失败之后的回调
 */
- (id)post:(NSString *)url
    param:(NSDictionary *)params
 progress:(void (^)(id))progressBlock
  success:(void (^)(id))successBlock
 failture:(void (^)(id))failtureBlock;

@end
