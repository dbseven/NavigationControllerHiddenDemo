//
//  MLBaseViewController.m
//  NavigationControllerHiddenDemo
//
//  Created by CristianoRLong on 16/8/23.
//  Copyright © 2016年 CristianoRLong. All rights reserved.
//

#import "MLBaseViewController.h"
#import "MLHomePageViewController.h"
#import "MLMineViewController.h"
#import "MLUserHomePageViewController.h"
#import "MLLoginViewController.h"

@interface MLBaseViewController () <UINavigationControllerDelegate>

@end

@implementation MLBaseViewController
#pragma mark - Override Initialize Methods
#pragma mark -
#pragma mark InitWithCoder
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
        if ([self isKindOfClass: [MLHomePageViewController class]] ||
            [self isKindOfClass: [MLMineViewController class]]) {
            
        } else {
            [self setHidesBottomBarWhenPushed: YES];
        }
    }
    return self;
}
#pragma mark - ViewController Life Circle
#pragma mark -
#pragma mark ViewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1. 导航栏
    [self configureNavigationBar];
}

#pragma mark ViewWillAppear
- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];
    
    // 1. 返回手势代理
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
    
    // 2. 导航控制器代理
    if (hiddenType == MLNavigationHiddenTypeNavigationControllerDelegate) {
        self.navigationController.delegate = self;
    }
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
#pragma mark Awake From Nib
- (void)awakeFromNib {
    [super awakeFromNib];
}

#pragma mark - Public Methods
#pragma mark -
#pragma mark 配置导航栏
- (void) configureNavigationBar {
    
    // 返回按钮
    self.navigationController.viewControllers.count<=1?:[self addBackNavigationBarItem];
}

#pragma mark 添加返回按钮
- (void) addBackNavigationBarItem {
    
    UIButton *button = [[UIButton alloc] initWithFrame: CGRectMake(0, 0, 44, 44)];
    [button setImage: [UIImage imageNamed: @"nav_icon_back_normal"] forState: UIControlStateNormal];
    [button addTarget: self action: @selector(popAction:) forControlEvents: UIControlEventTouchUpInside];
    button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 3, 5);
    UIBarButtonItem *placeHolderItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemFixedSpace target: nil action: nil];
    placeHolderItem.width = -15;
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView: button];
    self.navigationItem.leftBarButtonItems = @[placeHolderItem, backItem];
}

#pragma mark 添加导航栏标题
- (void) addNavigationTitle:(NSString *)title {
    
    //    1. 计算 Label 宽度
    CGFloat labelWidth = [title boundingRectWithSize:CGSizeMake(200, 30) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:20]} context:nil].size.width;
    
    //    2. 创建 TitleLabel
    UILabel *titleLabel = [[UILabel alloc] initWithFrame: CGRectMake(0, 0, labelWidth, 44)];
    titleLabel.font = [UIFont systemFontOfSize:20];
    titleLabel.text = title;
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    
    //    3. 设置导航栏的 TitleView
    self.navigationItem.titleView = titleLabel;
}

#pragma mark 添加导航栏右侧按钮
- (void) addRightNavigationItemWithImage:(UIImage *)image {
    
}

#pragma makr 添加导航栏右侧按钮
- (void) addRightNavigationItemWithTitle:(NSString *)title {
    
    UIButton *button = [[UIButton alloc] initWithFrame: CGRectMake(0, 0, 44, 44)];
    [button setTitle: title forState: UIControlStateNormal];
    [button setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    [button addTarget: self action: @selector(rightNavigationItemAction:) forControlEvents: UIControlEventTouchUpInside];
    CGFloat titleWidth = [title boundingRectWithSize: CGSizeMake(100, 100) options: NSStringDrawingUsesLineFragmentOrigin attributes: @{NSFontAttributeName : button.titleLabel.font} context: nil].size.width;
    CGFloat edgeInsetRight = 44 - titleWidth;
    button.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -edgeInsetRight);
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView: button];
}

#pragma mark - Actions
#pragma mark -
#pragma mark Right Bar Button Item Click Action
- (void) rightNavigationItemAction:(UIButton *)sender {
    NSLog(@"%s", __FUNCTION__);
}

#pragma mark Pop Action
- (void) popAction:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated: YES];
}

#pragma mark - Private Methods
#pragma mark -
#pragma mark Whether need Navigation Bar Hidden
- (BOOL) needHiddenBarInViewController:(UIViewController *)viewController {
    
    BOOL needHideNaivgaionBar = NO;
    
    if ([viewController isKindOfClass: [MLMineViewController class]] ||
        [viewController isKindOfClass: [MLUserHomePageViewController class]] ||
        [viewController isKindOfClass: [MLLoginViewController class]]) {
        needHideNaivgaionBar = YES;
    }
    
    return needHideNaivgaionBar;
}

#pragma mark - UINaivgationController Delegate
#pragma mark -
#pragma mark Will Show ViewController
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    [self.navigationController setNavigationBarHidden: [self needHiddenBarInViewController: viewController]
                        animated: animated];
}

@end
