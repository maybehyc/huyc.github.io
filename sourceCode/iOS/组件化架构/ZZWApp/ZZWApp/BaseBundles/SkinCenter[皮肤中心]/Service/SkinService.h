//
//  SkinService.h
//  ZZWApp
//
//  Created by apple on 2018/3/22.
//  Copyright © 2018年 Kun. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SkinService <NSObject>

/**************************颜色**************************/
/*主题色 导航栏颜色*/
- (UIColor *)navBgColor;
- (UIColor *)navBgFontColor;

/*默认页面背景色*/
- (UIColor *)viewBgColor;
/*次级字色*/
- (UIColor *)fontColor1;
/*再次级字色*/
- (UIColor *)fontColor2;

/*************************字体****************************/
/*一级字体*/
- (UIColor *)fontLevel1;

@end
