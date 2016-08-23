//
//  MLNavigationController.m
//  NavigationControllerHiddenDemo
//
//  Created by CristianoRLong on 16/8/23.
//  Copyright © 2016年 CristianoRLong. All rights reserved.
//

#import "MLNavigationController.h"

@interface MLNavigationController ()

@end

@implementation MLNavigationController

#pragma mark - ViewController Life Circle
#pragma mark -
#pragma mark ViewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1. 导航栏透明度
    self.navigationBar.translucent = NO;
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

@end
