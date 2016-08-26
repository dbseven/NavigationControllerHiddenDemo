//
//  MLBaseViewController.h
//  NavigationControllerHiddenDemo
//
//  Created by CristianoRLong
//  Copyright © 2016年 CristianoRLong. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  导航栏隐藏类型: 通过设置这个属性, 控制整个工程导航栏隐藏的方式
 */
typedef NS_ENUM(NSInteger, MLNavigationHiddenType) {
    /**
     *  普通模式: [self.navigationController setNavigationBarHidden: YES];
     */
    MLNavigationHiddenTypeNormal = 0,
    /**
     *  无动画模式: [self.navigationController setNavigationBarHidden: YES animated: NO];
     */
    MLNavigationHiddenTypeNoAnimation = 1,
    /**
     *  有动画模式: [self.navigationController setNavigationBarHidden: YES animated: YES];
     */
    MLNavigationHiddenTypeAnimation = 2,
    /**
     *  自动动画模式: [self.navigationController setNavigationBarHidden: YES animated: animated];
     */
    MLNavigationHiddenTypeAutoAnimation = 3,
    /**
     *  导航控制器代理模式: self.navigationController.delegate = self;
     */
    MLNavigationHiddenTypeNavigationControllerDelegate = 4,
    /**
     *  在 ViewWillAppear 中 设置导航栏的隐藏.
     */
    MLNavigationHiddenTypeOnlyViewWillAppear = 5,
    
};


/**
 *  全局控制导航栏隐藏的模式
 */
static MLNavigationHiddenType hiddenType = MLNavigationHiddenTypeOnlyViewWillAppear;


@interface MLBaseViewController : UIViewController

/**
 *  添加导航栏标题
 *
 *  @param image 标题
 */
- (void) addNavigationTitle:(NSString *)title;

/**
 *  添加导航栏右侧按钮
 *
 *  @param image 按钮图片
 */
- (void) addRightNavigationItemWithImage:(UIImage *)image;

/**
 *  添加导航栏右侧按钮
 *
 *  @param title 按钮标题
 */
- (void) addRightNavigationItemWithTitle:(NSString *)title;

/**
 *  添加返回按钮
 */
- (void) addBackNavigationBarItem;

/**
 *  配置导航栏
 */
- (void) configureNavigationBar;

@end
