//
//  MLHomePageViewController.m
//  NavigationControllerHiddenDemo
//
//  Created by CristianoRLong on 16/8/23.
//  Copyright © 2016年 CristianoRLong. All rights reserved.
//

#import "MLHomePageViewController.h"

@interface MLHomePageViewController ()

@end

@implementation MLHomePageViewController
#pragma mark - ViewController Life Circle
#pragma mark -
#pragma mark ViewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark ViewWillAppear
- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated]; 
}

#pragma mark ViewDidAppear
- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear: animated];
}

#pragma mark ViewWillDisappear
- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear: animated];
}

#pragma mark ViewDidDisappear
- (void) viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear: animated];
}

#pragma mark - Override Methods
#pragma mark -
#pragma mark Configure NavigationBar
- (void)configureNavigationBar {
    [super configureNavigationBar];
    
    [self addNavigationTitle: @"首页"];
}

@end
