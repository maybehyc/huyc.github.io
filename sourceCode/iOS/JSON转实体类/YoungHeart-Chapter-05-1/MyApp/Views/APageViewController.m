//
//  APageViewController.m
//  MyApp
//
//  Created by jax on 13-9-2.
//  Copyright (c) 2013年 Bao. All rights reserved.
//

#import "APageViewController.h"
#import "SBJsonParser.h"
#import "NSString+SBJSON.h"
#import "ASIHTTPRequest.h"
#import "ObjectMappingLoader.h"
#import "WeatherEntity.h"

@interface APageViewController () {
    UILabel* nameLabel;
    UILabel* ageLabel;
    UIButton* getInfoButton;
    UIButton* clearInfoButton;
}

@end

@implementation APageViewController

- (void)createFields {

}

- (void)destroyFields {
    
}

- (void)createViews {
    //1.从xib中获取View
    NSArray* list = [[NSBundle mainBundle] loadNibNamed: @"APageView" owner: self options: nil];
    self.view = list.lastObject;
    
    nameLabel = (UILabel*)[self.view viewWithTag: 100];
    nameLabel.text = @"";
    
    ageLabel = (UILabel*)[self.view viewWithTag: 200];
    ageLabel.text = @"";
    
    getInfoButton = (UIButton*)[self.view viewWithTag: 300];    
    clearInfoButton = (UIButton*)[self.view viewWithTag: 400];
}

- (void)destroyViews {
    
}

- (void)createEvents {
    [getInfoButton addTarget: self action: @selector(getInfo) forControlEvents:UIControlEventTouchUpInside];
    [clearInfoButton addTarget: self action: @selector(clearInfo) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)destroyEvents {
    
}

- (void)loadData {
    NSURL *url = [NSURL URLWithString:@"http://www.weather.com.cn/data/sk/101010100.html"];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request setDelegate:self];    
    [request startAsynchronous];
}

- (void)requestFinished:(ASIHTTPRequest *)request {
    NSString *jsonStr  =[request responseString];
    id jsonValue = [jsonStr JSONValue];
    id result = [ObjectMappingLoader loadObjectWithClassName: @"WeatherWrapEntity" andData:jsonValue];
    WeatherWrapEntity* weatherEntity = (WeatherWrapEntity*)result;
    
}

- (void)requestFailed:(ASIHTTPRequest *)request {
    UIAlertView* alertView = [[UIAlertView alloc]initWithTitle: @"粗锉啦" message: @"Network Error" delegate: self cancelButtonTitle: @"OK" otherButtonTitles: nil];
    [alertView show];
    [alertView release];
}

- (void) getInfo {
    nameLabel.text = @"包小强";
    ageLabel.text = @"31.6";
}

- (void) clearInfo {
    nameLabel.text = @"";
    ageLabel.text = @"";
}

@end
