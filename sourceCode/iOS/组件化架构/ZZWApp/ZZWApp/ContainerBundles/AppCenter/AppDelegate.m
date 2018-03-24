//
//  AppDelegate.m
//  ZZWApp
//
//  Created by Kun on 3/14/18.
//  Copyright © 2018 Kun. All rights reserved.
//

#import "AppDelegate.h"


@interface MyTabController : UITabBarController

@end

@implementation MyTabController
//如果没有定义Selector，则默认调用init的方法去启动程序应用
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setTabURLs:@[ @"netescaipiao://home", @"netescaipiao://selfstock",@"netescaipiao://market",@"netescaipiao://information",@"netescaipiao://mine" ]];
    
    for (int i = 0; i < self.viewControllers.count; i++) {
        UINavigationController *navigationController = self.viewControllers[i];
        navigationController.tabBarItem = [self tabBarItemAtIndex:i];
    }
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor redColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UITabBar appearance] setTintColor:[UIColor redColor]];
    
}


- (void)setTabURLs:(NSArray *)URLs
{
    NSMutableArray *controllers = [NSMutableArray array];
    for (NSString *URL in URLs) {
        UIViewController *controller = [LDMBusContext controllerForURL:URL];
        if (controller) {
            UIViewController *tabController = [self rootControllerForController:controller];
            tabController.tabBarItem.title = URL;
            [controllers addObject:tabController];
        }
    }
    self.viewControllers = controllers;
}


- (UIViewController *)rootControllerForController:(UIViewController *)controller
{
    if ([controller canContainControllers]) {
        return controller;
        
    } else {
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:controller];
        return navigationController;
    }
}

- (UITabBarItem*)tabBarItemAtIndex:(NSInteger)index{
    NSString *title = nil;
    UIImage *image = nil;
    switch (index) {
        case 0:
            title = @"首页";
            break;
        case 1:
            title = @"自选";
            break;
        case 2:
            title = @"行情";
            break;
        case 3:
            title = @"信披";
            break;
        case 4:
            title = @"我的";
            break;
        default:
            break;
    }
    UITabBarItem *tabbarItem = [[UITabBarItem alloc] initWithTitle:title image:image  tag:index];
    
    return tabbarItem;
}

@end

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    // bus容器初始化
    [LDMBusContext initialBundleContainerWithWindow:self.window andRootViewController:nil];
    
    //打开一个初始ViewController
    NSString *url = @"netescaipiao163://mainTab1";
    UIViewController *rootViewController = [LDMBusContext controllerForURL:url];
    if (rootViewController) {
        self.window.rootViewController = rootViewController;
    }
    [self.window makeKeyAndVisible];
    
    [self addADView];       // 添加广告图
    return YES;
}

/** 添加广告图 */
- (void)addADView
{
    UIView *adView = [LDMBusContext performAPI:@"viewBaseService" methodName:@"getFullScreenAdView:" withParam1:@"adLunch"];
    [self.window addSubview:adView];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
