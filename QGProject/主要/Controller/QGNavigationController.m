//
//  QGNavigationController.m
//  QGProject
//
//  Created by QG on 2019/3/31.
//  Copyright © 2019年 xinxianzhizao. All rights reserved.
//

#import "QGNavigationController.h"

@implementation QGNavigationController

// - MARK: <-- 跳转 -->
/** present 跳转 */
- (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion{
    // 添加返回
    [super presentViewController:viewControllerToPresent animated:flag completion:completion];
    QGNavigationController *nav = (QGNavigationController *)viewControllerToPresent;
    UIButton *dismissBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    dismissBtn.bounds = CGRectMake(0, 0, 40, 40);
    [dismissBtn setImageEdgeInsets:UIEdgeInsetsMake(10, 0, 10, 0)];
    [dismissBtn setImage:[UIImage imageNamed:@"nav_dis"] forState:UIControlStateNormal];
    [dismissBtn addTarget:self action:@selector(dismissBtnPress:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *dismissItem = [[UIBarButtonItem alloc] initWithCustomView:dismissBtn];
    nav.topViewController.navigationItem.rightBarButtonItem = dismissItem;
}

/** push 跳转 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    [super pushViewController:viewController animated:animated];
    if ([self.viewControllers count] >1){
        UIButton *backBtton = [UIButton buttonWithType:UIButtonTypeCustom];
        backBtton.bounds = CGRectMake(0, 0, 40, 40);
        [backBtton setImageEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 0)];
        [backBtton setImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateNormal];
        [backBtton addTarget:self action:@selector(backBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtton];
        viewController.navigationItem.leftBarButtonItem = backItem;
    }
}

// - MARK: <-- 事件处理 -->
/** present 跳转的按钮事件 */
-(void)dismissBtnPress:(UIButton *)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

/** push 跳转的按钮事件 */
-(void)backBtnPressed:(UIButton *)sender{
    [self popViewControllerAnimated:YES];
}

@end
