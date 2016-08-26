//
//  MLNavigationController.m
//  NavigationControllerHiddenDemo
//
//  Created by CristianoRLong
//  Copyright © 2016年 CristianoRLong. All rights reserved.
//

#import "MLNavigationController.h"

@interface MLNavigationController () <UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIPanGestureRecognizer *popPanGesture;
@property (nonatomic, strong) id popGestureDelegate;

@end

@implementation MLNavigationController

#pragma mark - ViewController Life Circle
#pragma mark -
#pragma mark ViewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1. 导航栏透明度
    self.navigationBar.translucent = NO;
    
    // 2. Fullscreen Pop Gesture
    !fullscreenPopGestureRecognizer?:[self addFullScreenPopGestureAction];
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


#pragma mark - Private Methods
#pragma mark -
#pragma mark Add Fullscreen Pop Gesture
- (void)addFullScreenPopGestureAction
{
    self.popGestureDelegate = self.interactivePopGestureRecognizer.delegate;
    SEL action = NSSelectorFromString(@"handleNavigationTransition:");
    self.popPanGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self.popGestureDelegate action:action];
    self.popPanGesture.maximumNumberOfTouches = 1;
    self.popPanGesture.delegate = self;
    [self.view addGestureRecognizer: self.popPanGesture];
}

#pragma mark - UIGesture Delegate
#pragma mark -
#pragma mark Should Begin
- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer
{
    // Prevent Pan Gesture From Right To Left
    CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view];
    if (translation.x <= 0) return NO;
    
    // Root View Controller Can Not Begin The Pop Gesture
    if (self.viewControllers.count <= 1) return NO;
    
    return YES;
}

@end
