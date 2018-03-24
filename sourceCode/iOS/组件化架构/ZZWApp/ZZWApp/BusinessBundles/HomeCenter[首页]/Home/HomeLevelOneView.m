//
//  HomeLevelOneView.m
//  ZZWApp
//
//  Created by apple on 2018/3/22.
//  Copyright © 2018年 Kun. All rights reserved.
//

#import "HomeLevelOneView.h"

@implementation HomeLevelOneView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        UIView *segView = [LDMBusContext performAPI:@"viewBaseService" methodName:@"getSegmentView:titles:" withParam1:^(NSInteger index){
            
        } withParam2:@[@"推荐",@"7*24",@"市场",@"公司",@"视频",@"电子报"]];
        [self addSubview:segView];
        
        UIButton *button2 = [UIButton buttonWithType:UIButtonTypeSystem];
        button2.frame = CGRectMake(100, 140, 180, 40);
        [button2 setTitle:@"调用自选服务" forState:UIControlStateNormal];
        button2.titleLabel.textColor = [UIColor blackColor];
        [button2 addTarget:self action:@selector(clickButton2:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button2];
        
        UIButton *button3 = [UIButton buttonWithType:UIButtonTypeSystem];
        button3.frame = CGRectMake(100, 180, 180, 40);
        [button3 setTitle:@"调用行情服务" forState:UIControlStateNormal];
        button3.titleLabel.textColor = [UIColor blackColor];
        [button3 addTarget:self action:@selector(clickButton3:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button3];
        
        UIButton *button4 = [UIButton buttonWithType:UIButtonTypeSystem];
        button4.frame = CGRectMake(100, 220, 180, 40);
        [button4 setTitle:@"调用信披服务" forState:UIControlStateNormal];
        button4.titleLabel.textColor = [UIColor blackColor];
        [button4 addTarget:self action:@selector(clickButton4:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button4];
        
        UIButton *button5 = [UIButton buttonWithType:UIButtonTypeSystem];
        button5.frame = CGRectMake(100, 260, 180, 40);
        [button5 setTitle:@"调用我的服务" forState:UIControlStateNormal];
        button5.titleLabel.textColor = [UIColor blackColor];
        [button5 addTarget:self action:@selector(clickButton5:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button5];
        
        UIButton *button6 = [UIButton buttonWithType:UIButtonTypeSystem];
        button6.frame = CGRectMake(100, 300, 180, 40);
        [button6 setTitle:@"调用网络服务" forState:UIControlStateNormal];
        button6.titleLabel.textColor = [UIColor blackColor];
        [button6 addTarget:self action:@selector(clickButton6:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button6];
    }
    return self;
}

- (void)clickButton2:(UIButton*)sender
{
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"服务总线"
                          message:[NSString stringWithFormat:@"我是selfStockService的提供的服务,获取到的数据为: %@",[LDMBusContext performAPI:@"selfStockService" methodName:@"string"]]
                          delegate:self
                          cancelButtonTitle:@"确定"
                          otherButtonTitles:nil, nil];
    [alert show];
}

- (void)clickButton3:(UIButton*)sender
{
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"服务总线"
                          message:[NSString stringWithFormat:@"我是marketService的提供的服务,获取到的数据为: %@",[LDMBusContext performAPI:@"marketService" methodName:@"string"]]
                          delegate:self
                          cancelButtonTitle:@"确定"
                          otherButtonTitles:nil, nil];
    [alert show];
}

- (void)clickButton4:(UIButton*)sender
{
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"服务总线"
                          message:[NSString stringWithFormat:@"我是informationService的提供的服务,获取到的数据为: %@",[LDMBusContext performAPI:@"informationService" methodName:@"string"]]
                          delegate:self
                          cancelButtonTitle:@"确定"
                          otherButtonTitles:nil, nil];
    [alert show];
}

- (void)clickButton5:(UIButton*)sender
{
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"服务总线"
                          message:[NSString stringWithFormat:@"我是mineService的提供的服务,获取到的数据为: %@",[LDMBusContext performAPI:@"mineService" methodName:@"string"]]
                          delegate:self
                          cancelButtonTitle:@"确定"
                          otherButtonTitles:nil, nil];
    [alert show];
}

- (void)clickButton6:(UIButton *)sender
{
    [LDMBusContext performAPI:@"netWorkService" methodName:@"get:param:progress:success:failture:" withParam1:@"https://www.baidu.com" withParam2:nil withParam3:nil withParam4:^(id resopnse){
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"服务总线"
                              message:[NSString stringWithFormat:@"我是netWorkService的提供的服务,获取到的数据为: %@",resopnse]
                              delegate:self
                              cancelButtonTitle:@"确定"
                              otherButtonTitles:nil, nil];
        [alert show];
    } withParam5:^(id error){
        
    }];
}

@end
