//
//  ViewBaseServiceImpl.m
//  ZZWApp
//
//  Created by apple on 2018/3/21.
//  Copyright © 2018年 Kun. All rights reserved.
//

#import "ViewBaseServiceImpl.h"
#import "FullScreenAdView.h"
#import "HsSegmentView.h"

@implementation ViewBaseServiceImpl

- (UIView *)getFullScreenAdView:(NSString *)imgName;
{
    FullScreenAdView *adView = [[FullScreenAdView alloc] init];
    adView.duration = 5;
    adView.waitTime = 5;
    adView.skipType = SkipButtonTypeNormalTimeAndText;
    adView.adImageTapBlock = ^(NSString *content) {
    };
    [adView reloadAdImageWithName:imgName];
    return adView;
}

- (UIView *)getSegmentView:(id)block titles:(NSArray *)titles;
{
    HsSegmentView *segmentView = [[HsSegmentView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 40)
                                                 titles:titles
                                             clickBlick:block];
    return segmentView;
}

@end
