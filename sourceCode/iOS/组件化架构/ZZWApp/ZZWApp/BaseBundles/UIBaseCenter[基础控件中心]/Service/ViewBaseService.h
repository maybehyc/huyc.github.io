//
//  ViewBaseService.h
//  ZZWApp
//
//  Created by apple on 2018/3/21.
//  Copyright © 2018年 Kun. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ViewBaseService <NSObject>

/*获取广告页视图*/
- (UIView *)getFullScreenAdView:(NSString *)imgName;

/*获取顶部切换视图*/
- (UIView *)getSegmentView:(id)block titles:(NSArray *)titles;

@end
