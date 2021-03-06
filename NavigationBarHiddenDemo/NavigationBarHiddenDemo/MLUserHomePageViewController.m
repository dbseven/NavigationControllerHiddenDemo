//
//  MLUserHomePageViewController.m
//  NavigationControllerHiddenDemo
//
//  Created by CristianoRLong
//  Copyright © 2016年 CristianoRLong. All rights reserved.
//

#import "MLUserHomePageViewController.h"

@interface MLUserHomePageViewController ()

@end

@implementation MLUserHomePageViewController
#pragma mark - ViewController Life Circle
#pragma mark -
#pragma mark ViewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark ViewWillAppear
- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];
    
    switch (hiddenType) {
        case MLNavigationHiddenTypeNormal:
        {
            [self.navigationController setNavigationBarHidden: YES];
        }
            break;
        case MLNavigationHiddenTypeNoAnimation:
        {
            [self.navigationController setNavigationBarHidden: YES animated: NO];
        }
            break;
        case MLNavigationHiddenTypeAnimation:
        {
            [self.navigationController setNavigationBarHidden: YES animated: YES];
        }
            break;
        case MLNavigationHiddenTypeAutoAnimation:
        case MLNavigationHiddenTypeOnlyViewWillAppear:
        {
            [self.navigationController setNavigationBarHidden: YES animated: animated];
        }
            break;
            
        default:
            break;
    }
}

#pragma mark ViewDidAppear
- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear: animated];
}

#pragma mark ViewWillDisappear
- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear: animated];
    
    switch (hiddenType) {
        case MLNavigationHiddenTypeNormal:
        {
            [self.navigationController setNavigationBarHidden: NO];
        }
            break;
        case MLNavigationHiddenTypeNoAnimation:
        {
            [self.navigationController setNavigationBarHidden: NO animated: NO];
        }
            break;
        case MLNavigationHiddenTypeAnimation:
        {
            [self.navigationController setNavigationBarHidden: NO animated: YES];
        }
            break;
        case MLNavigationHiddenTypeAutoAnimation:
        {
            [self.navigationController setNavigationBarHidden: NO animated: animated];
        }
            break;
            
        case MLNavigationHiddenTypeOnlyViewWillAppear:
        {
            
        }
            break;
            
        default:
            break;
    }
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
    
    [self addNavigationTitle: @"个人主页"];
}

@end
