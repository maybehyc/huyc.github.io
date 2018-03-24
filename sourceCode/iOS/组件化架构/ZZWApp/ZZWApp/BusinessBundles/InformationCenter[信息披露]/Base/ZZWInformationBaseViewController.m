//
//  ZZWInformationViewController.m
//  ZZWApp
//
//  Created by apple on 2018/3/21.
//  Copyright © 2018年 Kun. All rights reserved.
//

#import "ZZWInformationBaseViewController.h"

@interface ZZWInformationBaseViewController ()

@end

@implementation ZZWInformationBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushController:(UIViewController *)viewController
{
    viewController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:viewController animated:YES];
    
    NSString *cName = NSStringFromClass(viewController.class);
    if ([cName isEqualToString:@"ZZWHomeViewController"]
        || [cName isEqualToString:@"ZZWFavorViewController"]
        || [cName isEqualToString:@"ZZWQuoteViewController"]
        || [cName isEqualToString:@"ZZWDiscloseViewController"]
        || [cName isEqualToString:@"ZZWMineViewController"]) {
        viewController.hidesBottomBarWhenPushed = NO;
    }
}

- (void)popController
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
